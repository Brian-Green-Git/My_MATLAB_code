classdef SL_Mode_Functions
    methods (Static = true)
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
            Hx = SL_Mode_Functions.hermite(n, sqrt(2)*X/w);
            Hy = SL_Mode_Functions.hermite(m, sqrt(2)*Y/w);
            
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
            L = SL_Mode_Functions.laguerre(p, abs_l, 2 * (r/w).^2);
            
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
    end
end