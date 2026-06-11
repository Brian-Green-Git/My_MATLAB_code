classdef SLM_Params
    methods(Static = true)
        function params = Parameters()
            Nx   = 1024;               % SLM horizontal pixels
            Ny   = 768;                % SLM vertical pixels
            pix  = 36e-6;              % pixel pitch [m] for LC2012
            lambda = 633e-9;           % He‑Ne wavelength [m]
            w0   = 0.4e-3;             % waist (1/e² radius) of the mode [m]
            nx_grating = 400;           % number of grating lines across width
            ny_grating = 100;           % number across height  (use 0 for horizontal only)
            z = 1e-5;                  % practically zero – mode in the SLM plane
            Gx = nx_grating / (Nx * pix);    % grating spatial frequency [m⁻¹]
            Gy = ny_grating / (Ny * pix);    % grating spatial frequency [m⁻¹]
            k  = 2*pi / lambda;              % wave number [m⁻¹]
            zR = pi * w0^2 / lambda;         % Rayleigh range [m]
            w  = w0 * sqrt(1 + (z/zR)^2);    % beam radius at distance z
            R  = z * (1 + (zR/z)^2);         % wavefront curvature radius
            gouy = atan(z/zR);               % Gouy phase
            x = (-(Nx-1)/2 : (Nx-1)/2) * pix;
            y = (-(Ny-1)/2 : (Ny-1)/2) * pix;
            [X, Y] = meshgrid(x, y);         
            params.Nx = Nx;
            params.Ny = Ny;
            params.z = z;
            params.pix = pix;
            params.lambda = lambda;
            params.w0 = w0;
            params.Gx = Gx;
            params.Gy = Gy;
            params.k  = k;
            params.zR = zR;
            params.w  = w;
            params.R  = R;
            params.gouy = gouy;
            params.x  = x;
            params.y  = y;
            params.X  = X;
            params.Y  = Y;
        end
    end
end