%% ========================================================================
%  COMPLETE HOLOGRAM GENERATOR FOR HG, LG MODES & SUPERPOSITIONS
%  For LC2012 transmissive SLM  (1024x768, 36 µm pixel)
%  He‑Ne laser  λ = 633 nm,  w0 = chosen waist of the mode
%
%  Based on:
%  "How to Shape Light with Spatial Light Modulators"
%  (Rosales‑Guzmán & Forbes), SPIE Spotlight, 2017.
%  and the LC2012 lab guide (html.html)
% =========================================================================

clear; close all; clc;

        
% ----------------------- USER PARAMETERS ---------------------------------
% Mode type and indices (edit this block to switch between examples)
% 1) Single HG mode:   MODE = 'HG';  n = 2; m = 0;
% 2) Single LG mode:   MODE = 'LG';  p = 0; l = 2;
% 3) Superposition:    MODE = 'SUPER';  (define list below)

% -- Choose one example (uncomment the one you want) --
% Example 1: Hermite‑Gauss HG₂₀
% if i<=10 
% MODE = 'LG';  p = 10;  l = 10;

% end
MODE = 'HG';  n = 2;  m = 2;

% if i>10 && i<
% MODE = 'SUPER';
% super_list = { {'HG', nums, i, j}, {'HG', nums, i, j+1} }; 
% super_list = { {'HG', i, nums, j}, {'HG', nums, i, j} }; 

% end

% Example 3: Superposition: HG₀₁ + HG₁₀  (45° rotated Hermite‑Gauss)
% MODE = 'SUPER';
% super_list = { {'HG',2,1,1}, {'HG',1,2,1} };   % equal weights

% Example 4: Superposition: LG₀⁺² + LG₀⁻²  (petal pattern)
% MODE = 'SUPER';
% super_list = { {'LG',1,-3,1}, {'LG',1,3,1} };
% 
% ------------------- SLM & OPTICAL PARAMETERS ----------------------------
Nx   = 1024;               % SLM horizontal pixels
Ny   = 768;                % SLM vertical pixels
pix  = 36e-6;              % pixel pitch [m] for LC2012
lambda = 633e-9;           % He‑Ne wavelength [m]
w0   = 0.4e-3;             % waist (1/e² radius) of the mode [m]
                           % Adjust to fit the mode inside the SLM active area
                           %   (36.9 x 27.6 mm)

% ---- Grating parameters to separate the +1 diffraction order -------------
nx_grating = 400;           % number of grating lines across width
ny_grating = 100;           % number across height  (use 0 for horizontal only)
% Grating period = 36.9 mm / 50 ≈ 0.74 mm  >> 4·pix = 0.144 mm  (safe)

% ---- Z distance (propagation distance of the mode) -----------------------
z = 1e-5;                  % practically zero – mode in the SLM plane

% ----- Derived parameters -------------------------------------------------
Gx = nx_grating / (Nx * pix);    % grating spatial frequency [m⁻¹]
Gy = ny_grating / (Ny * pix);    % grating spatial frequency [m⁻¹]

k  = 2*pi / lambda;              % wave number [m⁻¹]
zR = pi * w0^2 / lambda;         % Rayleigh range [m]
w  = w0 * sqrt(1 + (z/zR)^2);    % beam radius at distance z
R  = z * (1 + (zR/z)^2);         % wavefront curvature radius
gouy = atan(z/zR);               % Gouy phase

% ---- Coordinate mesh (in metres, centered) -------------------------------
x = (-(Nx-1)/2 : (Nx-1)/2) * pix;
y = (-(Ny-1)/2 : (Ny-1)/2) * pix;
[X, Y] = meshgrid(x, y);         % X: columns vary along x-direction
rho   = sqrt(X.^2 + Y.^2);       % radial coordinate
phi   = atan2(Y, X);             % azimuth angle

% ---- Build the complex field of the desired mode(s) ----------------------

switch upper(MODE)
    case 'HG'
        % single Hermite‑Gauss mode
        U = HG_field(n, m, X, Y, w, R, z, k, gouy, w0);
    case 'LG'
        % single Laguerre‑Gauss mode
        U = LG_field(p, l, X, Y, w, R, z, k, gouy, w0);
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
                    U = U + coeff * HG_field(ind1, ind2, X, Y, w, R, z, k, gouy, w0);
                case 'LG'
                    U = U + coeff * LG_field(ind1, ind2, X, Y, w, R, z, k, gouy, w0);
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

%% ------- Amplitude‑to‑phase‑depth LUT (J₁ inversion) -------------------
% The first diffraction order from a sinusoidal phase grating
%   exp(i * F * sin(θ))  has complex amplitude  J₁(F) * exp(iθ).
% We want J₁(F) ∝ A_norm.  The maximum of J₁(x) is J₁_max ≈ 0.5819 at x≈1.8412.
% Therefore the achievable amplitude range is [0, J₁_max].
% We build a look‑up table:  A_target -> F_value using root-finding.

% Find the first maximum of J₁(x) (the first peak after zero)
f_max = fminbnd(@(x) -besselj(1,x), 1.5, 2.5);  % should be ≈1.8412
J1_max = besselj(1, f_max);  % maximum value ≈ 0.5819

fprintf('f_max = %.4f,  J1_max = %.4f\n', f_max, J1_max);

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
        % Find the root in [0, f_max] where J1(F) = target
        % The function J1(F)-target crosses zero exactly once in [0, f_max]
        % because J1(0)=0, J1(f_max)=J1_max > target
        F_lut(ii) = fzero(@(f) besselj(1,f) - target, [0, f_max]);
    end
end

% Verify the LUT is monotonic
if any(diff(F_lut) < 0)
    warning('LUT is not monotonic – check the inversion');
end

% Interpolate to get F for every pixel
F = interp1(A_target, F_lut, A_norm, 'linear', 0);

%% ------- Compose the hologram phase --------------------------------------
% Grating phase ramp
grating = 2*pi * (Gx * X + Gy * Y);

% Hologram:  Φ_SLM = F * sin( desired phase + grating )
Hol = F .* sin(Phi_desired + grating);

% Shift and scale to 8‑bit grey levels [0,255]
Hol = Hol - min(Hol(:));
SLM_hologram = uint8(256 * Hol / max(Hol(:)));
% SLM_hologram = SLM_hologram - uint8(0)

%% ------- Display the hologram -------------------------------------------
% figure('Name', 'LC2012 Hologram', 'NumberTitle','off');
% imshow(SLM_hologram, 'Border','tight');
% title(sprintf('Hologram  (Mode: %s,  1024x768  λ=%d nm)', ...
%               MODE, lambda*1e9), 'Interpreter','none');
% colormap(gray);
% colorbar;

%% ===== Display the expected beam intensity (what you see on the CCD) =====
% The desired optical field U is formed in the first diffraction order.
% Its intensity is |U|^2 (scaled by the overall efficiency).
% We plot it here for comparison with the experiment.

% Create a figure for the expected intensity
% figure('Name','Expected Structured Beam Intensity','NumberTitle','off');

% Show intensity (normalised to 1 for clarity)
intensity = abs(U).^2;              % |U|^2
intensity = intensity / max(intensity(:));  % normalize to [0,1]

% imagesc(x*1e3, y*1e3, intensity);   % axes in millimetres
% axis image;                          % correct aspect ratio
% colormap hot;                        % hot colormap (bright = high intensity)
% colorbar;
% xlabel('x (mm)'); ylabel('y (mm)');
% title(sprintf('Expected Intensity – %s mode', MODE));
img = uint8(255 * mat2gray(intensity));  % scale to [0,255] and convert
% 
% % Create a figure for the expected phase
% figure('Name','Expected Phase','NumberTitle','off');
% image_show = imagesc(x*1e3, y*1e3, angle(U));     % wrapped phase [-π,π]
% % imagesc(x*1e3, y*1e3, angle(U));     % wrapped phase [-π,π]
% axis image; colormap hsv; colorbar;
% xlabel('x (mm)'); ylabel('y (mm)');
% title(sprintf('Expected Phase – %s mode', MODE));

% imshow(img)
% outputFolder = "C:\Users\Photonics LAB\Documents\GitHub\My_Python_code\CNN_test\Training_images\Super modes HG";
% if ~exist(outputFolder, 'dir')
%     mkdir(outputFolder);
% end
% % Base name for files
% baseFileName = 'I';
% 
% fileName = fullfile(outputFolder, sprintf('%s_%s.png', baseFileName, (MODE + "_LG_" + nums + "_" + i + "_" + j)));
% imwrite(img, fileName);  % Save image as PNG
% fprintf('Saved image %d to %s\n', 1, fileName);
% 

%% ===== APPLY CENTERING OFFSETS ===========================================

x_shift = -25;   
y_shift = 22;  

% Apply the shift using DisplaceHologram
centered_hologram = optics.DisplaceHologram(SLM_hologram, x_shift, y_shift);

% to uint8 (DisplaceHologram returns double)
centered_hologram = uint8(max(0, min(255, centered_hologram)));

% Send the centered hologram to the SLM

for change_in_pixels = 0:5:0
    change_in_pixels = change_in_pixels^1;
    centered_hologram = centered_hologram - uint8(change_in_pixels/1);
    optics.Fullscreen(centered_hologram, 2);

    fprintf('Hologram displayed with shifts: x=%+d px, y=%+d px\n', x_shift, y_shift);

    disp(change_in_pixels)
    pause(1);
end

%% ========================================================================
%  LOCAL FUNCTIONS
%  ========================================================================

% ---------- Hermite‑Gauss field (complex) --------------------------------
function U = HG_field(n, m, X, Y, w, R, z, k, gouy, w0)
    % Generate complex Hermite‑Gauss mode HG_{nm}
    % n, m: mode indices (non‑negative integers)
    % X, Y: coordinate matrices [m]
    % w: beam radius at distance z [m]
    % R: wavefront curvature radius [m]
    % z: propagation distance [m]
    % k: wave number [m⁻¹]
    % gouy: Gouy phase [rad]
    % w0: beam waist at z=0 [m] (used for normalisation)
    
    % Normalisation factor for HG_nm
    norm_coeff = sqrt( 2^(1-n-m) / (pi * factorial(n) * factorial(m)) ) / w;
    
    % Hermite polynomials evaluated at sqrt(2)*x/w, sqrt(2)*y/w
    Hx = hermite(n, sqrt(2)*X/w);
    Hy = hermite(m, sqrt(2)*Y/w);
    
    % Gaussian envelope and phase terms
    envelope = exp(- (X.^2 + Y.^2) / w^2);
    curvature = exp(-1i * k * (X.^2 + Y.^2) / (2*R));
    gouy_phase = exp(1i * (n + m + 1) * gouy);
    prop_phase = exp(-1i * k * z);
    
    U = norm_coeff * Hx .* Hy .* envelope .* curvature .* gouy_phase .* prop_phase;
end

% ---------- Laguerre‑Gauss field (complex) -------------------------------
function U = LG_field(p, l, X, Y, w, R, z, k, gouy, w0)
    % Generate complex Laguerre‑Gauss mode LG_p^l
    % p: radial index (≥0 integer)
    % l: azimuthal index (topological charge, integer, can be negative)
    % X, Y: coordinate matrices [m]
    % w: beam radius at distance z [m]
    % R: wavefront curvature radius [m]
    % z: propagation distance [m]
    % k: wave number [m⁻¹]
    % gouy: Gouy phase [rad]
    % w0: beam waist at z=0 [m] (used for normalisation)
    
    abs_l = abs(l);
    
    % Normalisation factor for LG_p^l
    % Note: uses factorial(abs_l + p) which requires abs_l + p ≤ 170 (approx.)
    norm_coeff = w0 / w * sqrt( 2*factorial(p) / (pi * factorial(abs_l + p)) ) ...
                 * (sqrt(2)/w)^abs_l;
    
    % Radial coordinate
    r = sqrt(X.^2 + Y.^2);
    rho_scaled = sqrt(2) * r / w;
    
    % Associated Laguerre polynomial L_p^{|l|}
    L = laguerre(p, abs_l, 2 * (r/w).^2);
    
    % Envelope and phase factors
    envelope = exp(- (r/w).^2);
    curvature = exp(-1i * k * r.^2 / (2*R));
    azimuth = exp(-1i * l * atan2(Y, X));   % note: negative sign (standard convention)
    gouy_phase = exp(1i * (2*p + abs_l + 1) * gouy);
    prop_phase = exp(-1i * k * z);
    
    U = norm_coeff * (rho_scaled.^abs_l) .* L .* envelope .* ...
        curvature .* azimuth .* gouy_phase .* prop_phase;
end

% ---------- Hermite polynomial evaluation (vectorised) -------------------
function H = hermite(n, x)
    % Returns H_n(x) for matrix x using recurrence relation
    % H_0(x) = 1, H_1(x) = 2x
    % H_{k+1}(x) = 2x·H_k(x) - 2k·H_{k-1}(x)
    switch n
        case 0
            H = ones(size(x));
        case 1
            H = 2*x;
        otherwise
            H_prev = ones(size(x));   % H0
            H_curr = 2*x;             % H1
            for k = 2:n
                H_next = 2*x .* H_curr - 2*(k-1) * H_prev;
                H_prev = H_curr;
                H_curr = H_next;
            end
            H = H_curr;
    end
end

% ---------- Associated Laguerre polynomial L_p^l(x) (vectorised) ----------
function L = laguerre(p, l, x)
    % Returns L_p^l(x), the associated Laguerre polynomial
    % p: degree (non‑negative integer)
    % l: order (non‑negative integer)
    % x: argument matrix
    %
    % Formula: L_p^l(x) = Σ_{k=0}^p (-1)^k · (p+l)! / [(p-k)!·(l+k)!·k!] · x^k
    
    if nargin < 2 || isempty(l), l = 0; end  % default to ordinary Laguerre if l omitted
    
    L = zeros(size(x));
    for k = 0:p
        % Coefficient for term x^k
        coeff = (-1)^k * factorial(p+l) / ...
                ( factorial(p-k) * factorial(l+k) * factorial(k) );
        L = L + coeff * x.^k;
    end
end