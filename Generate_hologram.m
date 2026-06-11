classdef Generate_hologram
    methods (Static = true)
        function Parameters(Mode_type, index1, index2)
            MODE = Mode_type;
            n = index1;
            m = index2;

            p = index1;
            l = index2;

            if MODE == "SUPER"
                super_list = { {MODE, index2, index1, 1}, {MODE, index1, index2, 1} };
            end
            
            SLM_params = SLM_Params.Parameters();
            
            switch upper(MODE)
                case 'HG'
                    % single Hermite‑Gauss mode
                    U = SL_Mode_Functions.HG_field(n, m, SLM_params.X, SLM_params.Y, SLM_params.w, SLM_params.R, SLM_params.z, SLM_params.k, SLM_params.gouy, SLM_params.w0);
                case 'LG'
                    % single Laguerre‑Gauss mode
                    U = SL_Mode_Functions.LG_field(p, l, SLM_params.X, SLM_params.Y, SLM_params.w, SLM_params.R, SLM_params.z, SLM_params.k, SLM_params.gouy, SLM_params.w0);
                case 'SUPER'
                    % superposition of several modes (HG and/or LG)
                    U = zeros(size(X));
                    for idx = 1:length(super_list)
                        type  = super_list{idx}{1};   % 'HG' or 'LG'
                        ind1  = super_list{idx}{2};   % n or p
                        ind2  = super_list{idx}{3};   % m or l
                        coeff = super_list{idx}{4};   % complex weight
                        switch type
                            case 'HG'
                                U = U + coeff * SL_Mode_Functions.HG_field(ind1, ind2, SLM_params.X, SLM_params.Y, SLM_params.w, SLM_params.R, SLM_params.z, SLM_params.k, SLM_params.gouy, SLM_params.w0);
                            case 'LG'
                                U = U + coeff * SL_Mode_Functions.LG_field(ind1, ind2, SLM_params.X, SLM_params.Y, SLM_params.w, SLM_params.R, SLM_params.z, SLM_params.k, SLM_params.gouy, SLM_params.w0);
                        end
                    end
                otherwise
                    error('MODE must be ''HG'', ''LG'' or ''SUPER''.');
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
            x_shift = -25;   
            y_shift = 22;  

            % Apply the shift using DisplaceHologram
            centered_hologram = optics.DisplaceHologram(SLM_hologram, x_shift, y_shift);
            % to uint8 (DisplaceHologram returns double)
            centered_hologram = uint8(max(0, min(255, centered_hologram)));
            % Send the centered hologram to the SLM
            optics.Fullscreen(centered_hologram, 2);
        end
    end
end