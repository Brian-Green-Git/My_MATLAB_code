classdef Generate_hologram
    methods (Static = true)
        function Parameters(Mode_type, index1, index2, pixel_value, type_change, Shift_x, Shift_y)
            MODE = Mode_type;
            
            SLM_params = SLM_Params.Parameters();
            
            switch upper(MODE)
                case 'HG'
                    % Single Hermite‑Gauss mode: index1=n, index2=m
                    U = SL_Mode_Functions.HG_field(index1, index2, ...
                        SLM_params.X, SLM_params.Y, SLM_params.w, SLM_params.R, ...
                        SLM_params.z, SLM_params.k, SLM_params.gouy, SLM_params.w0);
                    
                case 'LG'
                    % Single Laguerre‑Gauss mode: index1=p, index2=l
                    U = SL_Mode_Functions.LG_field(index1, index2, ...
                        SLM_params.X, SLM_params.Y, SLM_params.w, SLM_params.R, ...
                        SLM_params.z, SLM_params.k, SLM_params.gouy, SLM_params.w0);
                    
                case 'SUPER HG'
                    % Superposition of HG modes
                    % index1 and index2 define the pair: HG(index1,index2) + HG(index2,index1)
                    U = zeros(size(SLM_params.X));
                    super_list = { {'HG', index1, index2, 1}, ...
                                   {'HG', index2, index1, 1} };
                    for idx = 1:length(super_list)
                        ind1  = super_list{idx}{2};   % n
                        ind2  = super_list{idx}{3};   % m
                        coeff = super_list{idx}{4};   % weight
                        U = U + coeff * SL_Mode_Functions.HG_field(ind1, ind2, ...
                            SLM_params.X, SLM_params.Y, SLM_params.w, SLM_params.R, ...
                            SLM_params.z, SLM_params.k, SLM_params.gouy, SLM_params.w0);
                    end
                    
                case 'SUPER LG'
                    % Superposition of LG modes
                    % For petal patterns, use opposite topological charges
                    % index1 = p (radial index), index2 = |l| (absolute topological charge)
                    % Creates LG(p, +l) + LG(p, -l)
                    p_val = index1;
                    l_val = abs(index2);  % ensure positive, then use ±l
                    
                    U = zeros(size(SLM_params.X));
                    super_list = { {'LG', p_val, +l_val, 1}, ...
                                   {'LG', p_val, -l_val, 1} };
                    for idx = 1:length(super_list)
                        ind1  = super_list{idx}{2};   % p
                        ind2  = super_list{idx}{3};   % l (now with sign)
                        coeff = super_list{idx}{4};   % weight
                        U = U + coeff * SL_Mode_Functions.LG_field(ind1, ind2, ...
                            SLM_params.X, SLM_params.Y, SLM_params.w, SLM_params.R, ...
                            SLM_params.z, SLM_params.k, SLM_params.gouy, SLM_params.w0);
                    end                
                otherwise
                    error('MODE must be ''HG'', ''LG'', ''SUPER HG'', or ''SUPER LG''.');
            end
            
            % Normalise field power to 1 (arbitrary – just for consistent amplitude scaling)
            U = U / sqrt(sum(sum(abs(U).^2)));
            
            % ---- Extract amplitude and phase of the desired output field -------------
            A_desired = abs(U);
            Phi_desired = angle(U);
            
            % Normalise amplitude to its maximum (the encoding will rescale later)
            A_norm = A_desired / max(A_desired(:));
            
            
            % Find the first maximum of J₁(x) (the first peak after zero)
            f_max = fminbnd(@(x) -besselj(1,x), 1.5, 2.5);  % should be ≈1.8412
            J1_max = besselj(1, f_max);  % maximum value ≈ 0.5819
            
            
            % Build LUT by solving J1(F) = target for many target values
            N_lut = 1000;                     % number of sample points
            A_target = linspace(0, 1, N_lut); % desired amplitude (normalised)
            F_lut = zeros(1, N_lut);          % pre-allocate solution array
            
            for ii = 1:N_lut
                target = A_target(ii) * J1_max;   % desired J1 value
                
                if target == 0
                    F_lut(ii) = 0;               % trivial case
                elseif target >= J1_max
                    F_lut(ii) = f_max;           % clip to maximum (saturation)
                else
                    F_lut(ii) = fzero(@(f) besselj(1,f) - target, [0, f_max]);
                end
            end
            
            % Verify the LUT is monotonic
            if any(diff(F_lut) < 0)
                warning('LUT is not monotonic – check the inversion');
            end
            
            % Interpolate to get F for every pixel
            F = interp1(A_target, F_lut, A_norm, 'linear', 0);
            
            % Grating phase ramp
            grating = 2*pi * (SLM_params.Gx * SLM_params.X + SLM_params.Gy * SLM_params.Y);
            
            % Hologram:  Φ_SLM = F * sin( desired phase + grating )
            Hol = F .* sin(Phi_desired + grating);
            
            % Shift and scale to 8‑bit grey levels [0,255]
            Hol = Hol - min(Hol(:));
            SLM_hologram = uint8(256 * Hol / max(Hol(:)));
            
            % Shift the center position of the hologram on the SLM
            x_shift = Shift_x;   
            y_shift = Shift_y;  

            % Apply the shift using DisplaceHologram
            centered_hologram = optics.DisplaceHologram(SLM_hologram, x_shift, y_shift);
            % to uint8 (DisplaceHologram returns double)
            centered_hologram = uint8(max(0, min(255, centered_hologram)));
            % change the greyscale value of the hologram
            change_in_pixels = pixel_value;

            if type_change == "+"
                centered_hologram = centered_hologram + uint8(change_in_pixels);
                % Send the centered hologram to the SLM
                optics.Fullscreen(centered_hologram, 2);
            elseif type_change == "-"
                centered_hologram = centered_hologram - uint8(change_in_pixels);
                % Send the centered hologram to the SLM
                optics.Fullscreen(centered_hologram, 2);
            end

        end
    end
end