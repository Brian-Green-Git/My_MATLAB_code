classdef optics
    methods (Static = true)
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        % % % % % % % % % % % % % Grid Code % % % % % % % % % % % % % % 
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

        function [X,Y,Rho,Phi] = Grid(H,V,dx,dy)
            % This function creates the Cartesian and Polar coordinate
            % grids for plotting

            % H - number of horizontal pixels
            % V - number of vertical points
            % dx, dy - pixel sizes in the H and V directions
            
            x = linspace(-(H/2),(H/2)-1,H).*dx; % defines x spacing
            y = linspace(-(V/2),(V/2)-1,V).*dy; % define y spacing           
            [X,Y] = meshgrid(x,y)   ; % creates cartesian coordinates            
            [Phi,Rho]=cart2pol(X,Y) ; % creates polar coordinates
        end
        function [X,Y,Rho,Phi] = Moving_Grid(H,V,xshift,yshift,dx,dy)
            % This function creates the Cartesian and Polar coordinate
            % grids for plotting

            % H - number of horizontal pixels
            % V - number of vertical points
            % dx, dy - pixel sizes in the H and V directions
            
            x = linspace(-(H/2),(H/2)-1,H).*dx; % defines x spacing
            y = linspace(-(V/2),(V/2)-1,V).*dy; % define y spacing           
            [X,Y] = meshgrid(x,y)   ; % creates cartesian coordinates            
            [Phi,Rho]=cart2pol(X-xshift*dx,Y-yshift*dy) ; % creates polar coordinates
        end


        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        % % % % % % % % % % % % % Aperture Code % % % % % % % % % % % % % % 
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
         function U = LG(X,Y,L,P,weights,w0)
             [Phi,R] = cart2pol(X,Y);

            % This function computes a superposition of LG mode at the plane z=0
            % R,Phi are coordinate matrices
            % "weights" is a weight vector for the coefficients in the superposition
            % E.g. generate mode U = 5*LG_0^-5 + I*LG_0^3 - LG_1^4 + 2*LG_3^4 then,
            % x = -1:0.01:1, y = -1:0.01:1, [X,Y] = meshgrid(x,y); [Phi,R] = cart2pol(X,Y);
            % P = [0,0,1,3], L = [-5,3,4,4], weights = [5,I,-1,2]; w0 = 1;
            % U = LG(R,Phi,P,L,weights,w0);
            
            U = zeros(size(R)); % initialise field e
            
            for i = 1:length(weights)
                U = U + weights(i).*(sqrt(2*factorial(P(i))/(pi*factorial(P(i)+abs(L(i))))).*(1/w0).*(sqrt(2).*R./w0).^(abs(L(i))) .* exp(-R.^2./w0^2).*sl.Laguerre(P(i),abs(L(i)),2.*R.^2./(w0.^2)).* exp(1i.*L(i).*Phi));
            end
            %  function U = LG(R,Phi,P,L,weights,w0)
            % 
            % % This function computes a superposition of LG mode at the plane z=0
            % % R,Phi are coordinate matrices
            % % "weights" is a weight vector for the coefficients in the superposition
            % % E.g. generate mode U = 5*LG_0^-5 + I*LG_0^3 - LG_1^4 + 2*LG_3^4 then,
            % % x = -1:0.01:1, y = -1:0.01:1, [X,Y] = meshgrid(x,y); [Phi,R] = cart2pol(X,Y);
            % % P = [0,0,1,3], L = [-5,3,4,4], weights = [5,I,-1,2]; w0 = 1;
            % % U = LG(R,Phi,P,L,weights,w0);
            % 
            % U = zeros(size(R)); % initialise field e
            % 
            % for i = 1:length(weights)
            %     U = U + weights(i).*(sqrt(2*factorial(P(i))/(pi*factorial(P(i)+abs(L(i))))).*(1/w0).*(sqrt(2).*R./w0).^(abs(L(i))) .* exp(-R.^2./w0^2).*sl.Laguerre(P(i),abs(L(i)),2.*R.^2./(w0.^2)).* exp(1i.*L(i).*Phi));
            % end

            %   function y = Laguerre(p,l,x)
            % % computes associated Laguerre polynomials 
            % if p == 0
            %     y = ones(size(x));
            % elseif p == 1
            %     y = 1 + l - x;
            % else
            %     y = ((2*p+l-1-x)./p).*Laguerre(p-1,l,x) - ((p+l-1)./p).*Laguerre(p-2,l,x);
            % end
            % end
            
         end  
         function U = HG(X,Y,N,M,weights,w0)

            % This function computes a superposition of HG mode at the plane z=0
            % X,Y are matrices, e.g. x = -1:0.1:1, y = -1:0.1:1, [X,Y] = meshgrid(x,y)
            % "weights" is a weight vector for the coefficients in the superposition
            % E.g. generate mode U = 5*HG_0^-5 + I*HG_0^3 - HG_1^4 + 2*HG_3^4 then,
            % p = [0,0,1,3], l = [-5,3,4,4], weights = [5,I,-1,2]
            
            U = zeros(size(X)); %initialise electric field
             
            for i = 1:length(weights)
                U = U + weights(i).*(1./w0).*(sqrt(2.^(1-N(i)-M(i))./(pi.*factorial(N(i)).*factorial(M(i)))).*sl.Hermite(N(i),sqrt(2).*X./w0).*sl.Hermite(M(i),sqrt(2).*Y./w0).*exp(-(X.^2+Y.^2)./w0.^2));
            end
        end

        function aperture =  CircularAperture(rad,dx,Rho)
            % This function creates a circular mask with a radius = rad

            % rad - radius of the mask in pixels
            % N - side length of grid in pixels (i.e. resolution is NxN)
            % dx - pixel size of grid
            % Rho - radial polar coordinate generated by Grid function

            aperture_rad = rad*dx    ; 
            aperture     = ones(size(Rho)) ;
            aperture(Rho>aperture_rad) = 0;
        end

        function aperture = RectangularAperture(xlen,ylen,N,dx,X,Y)
            xlen = xlen*dx/2;
            ylen = ylen*dx/2;
            aperture = ones(N,N);
            aperture(X < -xlen) = 0;
            aperture(X > xlen) = 0;
            aperture(Y < -ylen) = 0;
            aperture(Y > ylen) = 0;
        end
        
        function aperture = TriangularAperture(xwidth,ywidth,N)
            xCoords = [N/2-xwidth N/2 N/2+xwidth];
            yCoords = [N/2-ywidth N/2+ywidth/2 N/2-ywidth];
            aperture = poly2mask(xCoords, yCoords, N, N);
        end 
        function y = SquareAp(N, M, len)
        % This function generates a square aperture, with sides of length 
        % len*(smallest dimension of array), thus it is always between 0 and 1.
        % for example, if the DMD resolution (array size) is 1920x1080 pixels,
        % then len = 0.3 gives a square aperture with sides of length 1080*0.3 = 324 pixels
        % Note that matlab functions must be placed at the end of the code.
        
            mask = zeros(M,N);
        
            a = floor(min(N,M)*len*0.5);
        
            mask(floor(M/2-a):floor(M/2+a),floor(N/2-a):floor(N/2+a))=1;
        
            y = mask;
        
        end
        function y = TriAp(N, M, l)
            U = zeros(M,N);
        
            for b = 0:M*l
                a = round( (1/sqrt(3))*b );
                for a = 0:a
                    i = round(b + M/2 - M*l/2);
                    U(i, round(N/2+a))=1;
                    U(i, round(N/2-a))=1;
                end 
            end
        
            y = U;
        end

        function DoubleSlit = CircularDoubleSlit(sep,rad,Nx,Ny,X,Y,dx,theta) 
            x0right  = sep*dx/2;
            x0left   = sep*dx/2; % slit radius in pixels
            slit_rad = rad*dx; % slit radius in pixels
            slit1    = ones(Nx,Ny);
            slit2    = ones(Nx,Ny).*exp(-1j*theta);
            slit1(sqrt((X- x0right ).^2 + (Y).^2) > slit_rad) = 0;
            slit2(sqrt((X+ x0left).^2 + (Y).^2) > slit_rad) = 0;
            DoubleSlit = slit1+slit2;
        end
         function DoubleSlit = DCircularDoubleSlit(sep,rad,Nx,Ny,X,Y,dx,theta) 
            x0right  = sep*dx/2;
            x0left   = sep*dx/2; % slit radius in pixels
            slit_rad = rad*dx; % slit radius in pixels
            slit1    = ones(Nx,Ny);
            slit2    = ones(Nx,Ny).*exp(-1j*theta);
            slit1(sqrt((X- x0right ).^2 + (Y+ x0right).^2) > slit_rad) = 0;
            slit2(sqrt((X+ x0left).^2 + (Y- x0left).^2) > slit_rad) = 0;
            DoubleSlit = slit1+slit2;
        end

        function CircularSlits = CircularNSlits(sep, rad, num_slits, Ny,Nx, X, Y, dx)
            % Creates an N-slit aperture arranged in a circular pattern
            % sep: radius of the circle on which the slits are arranged (scaled by dx)
            % rad: radius of each slit (scaled by dx)
            % num_slits: number of slits to arrange in a circle
            % N: grid size
            % X, Y: coordinate matrices
            % dx: scaling factor
            
            circle_radius = sep * dx; % Radius of the circle containing slits
            slit_radius = rad * dx;   % Radius of each slit
            CircularSlits = zeros(Ny, Nx); % Initialize slit pattern
            
            for k = 1:num_slits
                % Compute angle for the current slit position
                theta = (2 * pi / num_slits) * (k - 1);
                
                % Compute slit center coordinates
                x0 = circle_radius * cos(theta);
                y0 = circle_radius * sin(theta);
                
                % Create circular slit at (x0, y0)
                CircularSlits(sqrt((X - x0).^2 + (Y - y0).^2) <= slit_radius) = 1;
            end
        end



        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        % % % % % % % % % % % % % Propagation Code % % % % % % % % % % % % 
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        function [out] = DFT(U,f,dx,wl)
            % Computes Fourier transform matrix but scales to keep spatial coordinates
            % Outputs Fourier matrix and its inverse, then FT = F'*mode*F;

            L = size(U,1)*dx; % physical side length of image
            x = -L/2:dx:L/2-dx; % x coordinate system

            Lk = wl*f/dx; % side "length" at Fourier plane (inverse length)
            dk = wl*f/L; % sample "size" at Fourier plane (inverse length)
            k = -Lk/2:dk:Lk/2-dk; % spatial frequency coordinate system
            k = k./dk^2; %empirical

            F = exp(-1i*2*pi/size(U,1)).^(k'*x); %Fourier transform matrix: exp(-1i 2pi/d)^(k x')
            out = F'*U*F;
    %         Finv = conj(F); %Inverse Fourier transform matrix: exp(1i 2pi/d)^(k x')
        end

        function [out] = IDFT(U,f,dx,wl)
            % Computes Fourier transform matrix but scales to keep spatial coordinates
            % Outputs Fourier matrix and its inverse, then FT = F'*mode*F;

            L = size(U,1)*dx; % physical side length of image
            x = -L/2:dx:L/2-dx; % x coordinate system

            Lk = wl*f/dx; % side "length" at Fourier plane (inverse length)
            dk = wl*f/L; % sample "size" at Fourier plane (inverse length)
            k = -Lk/2:dk:Lk/2-dk; % spatial frequency coordinate system
            k = k./dk^2; %empirical

            IF = conj(exp(-1i*2*pi/H).^(k'*x)); %Fourier transform matrix: exp(-1i 2pi/d)^(k x')
            out = IF*U*IF';
        end
        function [u2] = PropagateTF(u1,Lx,Ly,lambda,z)

            % u1 is the original field
            % L is length of original plane
            % lambda is the wavelength
            % z is the propagation distance
            
            % Create coordinate grids
            
            Mx = size(u1,2); % get size of original field
            My= size(u1,1); % get size of original field
            
            dx = Lx/Mx; % spacing of the starting spatial grid
            dy = Ly/My; % spacing of the starting spatial grid
            fx = -1/(2*dx):1/Lx:1/(2*dx)-1/Lx;
            fy = -1/(2*dy):1/Ly:1/(2*dy)-1/Ly;% frequency coordinates
            [Fx,Fy] = meshgrid(fx,fy);
            
            % Create propogation phase in freqeucnyy domain
            
            H = exp(-1i*pi*lambda*z*(Fx.^2+Fy.^2)); % define porpagation pahse
            H = fftshift(H); % shift the propagation phase for Matlab's fft function
            
            % Propagate field
            
            U1 = fft2(fftshift(u1)); % Fourier transform original function into frequency domain
            U2 = U1.*H; % add propagation phase
            u2 = ifftshift(ifft2(U2)); % Shift function back from frequency domain to spatial domain
        end
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        % % % % % % % % % % % % % % Hologram Code % % % % % % % % % % % % %
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        function [h] = DisplaceHologram(Hologram, Xdisplacement, Ydisplacement)
            Ydisplacement = -1*Ydisplacement;
            [Ny,Nx] = size(Hologram);
            h = zeros(Ny,Nx);
            if (Xdisplacement >= 0 && Ydisplacement >= 0)
                Xdisplacement = Xdisplacement + 1;
                Ydisplacement = Ydisplacement + 1;
                h(Ydisplacement:end,Xdisplacement:end) = Hologram(1:end-Ydisplacement+1, 1:end-Xdisplacement+1);
                
            elseif (Ydisplacement >= 0 && Xdisplacement < 0)
                Ydisplacement = Ydisplacement + 1;
                Xdisplacement = -1*Xdisplacement;
                Xdisplacement = Xdisplacement + 1;
                h(Ydisplacement:end,1:end-Xdisplacement+1) = Hologram(1:end-Ydisplacement+1,Xdisplacement:end);
                
            elseif (Ydisplacement < 0 && Xdisplacement >= 0)
                Ydisplacement  = -1*Ydisplacement;
                Ydisplacement = Ydisplacement+1;
                Xdisplacement = Xdisplacement + 1;
                h(1:end-Ydisplacement+1,Xdisplacement:end) = Hologram(Ydisplacement:end,1:end-Xdisplacement+1);
                
            else
                Xdisplacement = -1*Xdisplacement+1;
                Ydisplacement = -1*Ydisplacement+1;
                h(1:end-Ydisplacement+1,1:end-Xdisplacement+1) = Hologram(Ydisplacement:end,Xdisplacement:end);
                
            end
        end

        function [out] = DMD_Hol(U, X, Y, gx, gy, rot, weight)
            if rot == 0
                A = abs(U); % correction factors
                A = (A*weight)./max(A(:));
                A = asin(A)/pi; % amplitude term for hologram
                Phi = angle(U); Phi = Phi/pi; % phase term for hologram
                h = 0.5+0.5*sign(cos(2*pi*(gx*X+gy*Y)+pi*Phi)-cos(pi*A)); % generates complex amplitude hologram
                % h = 0.5+0.5*sign(cos(2*pi)-cos(pi*A)); % generates amplitude only hologram
                % h = 0.5+0.5*sign(cos(2*pi*(gx*X+gy*Y)+pi*Phi)); % generates phase only hologram
        
                h(h==0.5) = 0; % binarises hologram
                normh = h/max(h(:));
                normh = normh';
            else
                U0 = U;
                U = imrotate(U,rot);
                U = U(size(U,1)/2 - size(U0,1)/2:size(U,1)/2 + size(U0,1)/2 - 1, ...
                      size(U,2)/2 - size(U0,2)/2:size(U,2)/2 + size(U0,2)/2 - 1);
                A = abs(U); % correction factors
                A = (A*weight)./max(A(:));
                A = asin(A)/pi; % amplitude term for hologram
                Phi = angle(U); Phi = Phi/pi; % phase term for hologram
                h = 0.5+0.5*sign(cos(2*pi*(gx*X+gy*Y)+pi*Phi)-cos(pi*A)); % generates hologram
                % h = 0.5+0.5*sign(cos(2*pi)-cos(pi*A)); % generates amplitude only hologram
                % h = 0.5+0.5*sign(cos(2*pi*(gx*X+gy*Y)+pi*Phi)); % generates phase only hologram
        
                h(h==0.5) = 0; % binarises hologram
                normh = h/max(h(:));
                normh = normh';
            end
            out = normh;
        
        end

        function [out] = SLM_Hol(U, X, Y, gx, gy, rot, weight)

            % Optional rotation (keep your logic intact)
            if rot ~= 0
                U0 = U;
                U = imrotate(U,rot);
                U = U(size(U,1)/2 - size(U0,1)/2 : size(U,1)/2 + size(U0,1)/2 - 1, ...
                      size(U,2)/2 - size(U0,2)/2 : size(U,2)/2 + size(U0,2)/2 - 1);
            end
        
            % Extract phase ONLY (SLM is phase device)
            Phi = angle(U);
        
            % Add carrier grating (same idea as your gx, gy)
            carrier = 2*pi*(gx*X + gy*Y);
        
            % Final phase hologram
            H = Phi + carrier;
        
            % Wrap phase to [0, 2pi]
            H = mod(H, 2*pi);
        
            % Normalize for SLM (0 → 1 grayscale)
            out = H / (2*pi);
        
        end
        
        function Fullscreen(image, device_number)
            ge = java.awt.GraphicsEnvironment.getLocalGraphicsEnvironment();
            gds = ge.getScreenDevices();
            height = gds(device_number).getDisplayMode().getHeight();
            width = gds(device_number).getDisplayMode().getWidth();

            if ~isequal(size(image,1),height)
                error(['Image must have vertical resolution of ' num2str(height)]);
            elseif ~isequal(size(image,2),width)
                error(['Image must have horizontal resolution of ' num2str(width)]);
            end

            try
                imwrite(image,[tempdir 'display.bmp']);
            catch
                error('Image must be compatible with imwrite()');
            end

            buff_image = javax.imageio.ImageIO.read(java.io.File([tempdir 'display.bmp']));

            if ~exist('fullscreenData','var')
                global fullscreenData;
            end

            if (length(fullscreenData) >= device_number)
                frame_java = fullscreenData(device_number).frame_java;
                icon_java = fullscreenData(device_number).icon_java;
                device_number_java = fullscreenData(device_number).device_number_java;
            else
                frame_java = {};
                icon_java = {};
                device_number_java = {};
            end

            if ~isequal(device_number_java, device_number)
                try frame_java.dispose(); end
                frame_java = [];
                device_number_java = device_number;
            end

            if ~isequal(class(frame_java), 'javax.swing.JFrame')
                frame_java = javax.swing.JFrame(gds(device_number).getDefaultConfiguration());
                bounds = frame_java.getBounds(); 
                frame_java.setUndecorated(true);
                frame_java.setAlwaysOnTop(true); % MC: should stop minimizing on lost focus. See: http://stackoverflow.com/questions/32048428/keep-the-jframe-open-on-a-dual-monitor-configuration-in-java
                icon_java = javax.swing.ImageIcon(buff_image); 
                label = javax.swing.JLabel(icon_java); 
                frame_java.getContentPane.add(label);
                % gds(device_number).setFullScreenWindow(frame_java); % MC: this is a problem
                frame_java.setSize(width, height);
                frame_java.setLocation( bounds.x, bounds.y ); 
            else
                icon_java.setImage(buff_image);
            end
            frame_java.pack
            frame_java.repaint
            frame_java.show

            fullscreenData(device_number).frame_java = frame_java;
            fullscreenData(device_number).icon_java = icon_java;
            fullscreenData(device_number).device_number_java = device_number_java;
        end

    %     function Fullscreen(image, device_number)
    %         % Ensure Java is available
    %         if ~usejava('jvm')
    %             error('Java is required to run this function.');
    %         end
    % 
    %         % Get screen dimensions from Java AWT
    %         ge = java.awt.GraphicsEnvironment.getLocalGraphicsEnvironment();
    %         gds = ge.getScreenDevices();
    % 
    %         if device_number > length(gds) || device_number < 1
    %             error('Invalid device number.');
    %         end
    % 
    %         height = gds(device_number).getDisplayMode().getHeight();
    %         width = gds(device_number).getDisplayMode().getWidth();
    % 
    %         % Check image resolution
    %         if size(image, 1) ~= height
    %             error(['Image must have vertical resolution of ' num2str(height)]);
    %         elseif size(image, 2) ~= width
    %             error(['Image must have horizontal resolution of ' num2str(width)]);
    %         end
    % 
    %         % Try writing image to temporary BMP file
    %         try
    %             tempFile = fullfile(tempdir, 'display.bmp');
    %             imwrite(image, tempFile);
    %         catch
    %             error('Image must be compatible with imwrite().');
    %         end
    % 
    %         % Read image back into Java
    %         buff_image = javax.imageio.ImageIO.read(java.io.File(tempFile));
    % 
    %         % Ensure fullscreenData is declared global
    %         global fullscreenData;
    % 
    %         % Initialize fullscreenData if necessary
    %         if isempty(fullscreenData)
    %             fullscreenData = struct([]);
    %         end
    % 
    %         % Retrieve or initialize frame/icon/device
    %         if length(fullscreenData) >= device_number && isfield(fullscreenData(device_number), 'frame_java')
    %             frame_java = fullscreenData(device_number).frame_java;
    %             icon_java = fullscreenData(device_number).icon_java;
    %             device_number_java = fullscreenData(device_number).device_number_java;
    %         else
    %             frame_java = [];
    %             icon_java = [];
    %             device_number_java = [];
    %         end
    % 
    %         % If device number changed, dispose old frame
    %         if ~isequal(device_number_java, device_number) && ~isempty(frame_java)
    %             try
    %                 frame_java.dispose();
    %             catch
    %             end
    %             frame_java = [];
    %         end
    % 
    %         % Create new frame if needed
    %         if isempty(frame_java) || ~isa(frame_java, 'javax.swing.JFrame')
    %             frame_java = javax.swing.JFrame(gds(device_number).getDefaultConfiguration());
    %             bounds = frame_java.getBounds();
    %             frame_java.setUndecorated(true);
    %             frame_java.setAlwaysOnTop(true);
    %             icon_java = javax.swing.ImageIcon(buff_image);
    %             label = javax.swing.JLabel(icon_java);
    %             frame_java.getContentPane().add(label);
    %             frame_java.setSize(width, height);
    %             frame_java.setLocation(bounds.x, bounds.y);
    %         else
    %             icon_java.setImage(buff_image);
    %         end
    % 
    %         % Show frame
    %         frame_java.pack();
    %         frame_java.repaint();
    %         frame_java.setVisible(true);
    % 
    %         % Save state
    %         fullscreenData(device_number).frame_java = frame_java;
    %         fullscreenData(device_number).icon_java = icon_java;
    %         fullscreenData(device_number).device_number_java = device_number;
    % end

        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        % % % % % % % % % % % % % % Zernike Code % % % % % % % % % % % % %% 
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

        function [Z] = Zernike2_sterling(n,m,rho,theta,rho_max)
            % Computes the zernike polynomial Z_n^m 
            % n>=0 and n>=|m|
            rho = rho./rho_max;
            R = zeros(size(rho));
            
            m1 = abs(m);
            
            if mod(n-m1,2) == 1
                R = zeros(size(rho));
            else
                for k = 0:((n-m1)/2)
                    R = R + (-1)^k*factorial(n-k)/(factorial(k)*factorial((n+m1)/2-k)*factorial((n-m1)/2-k)).*rho.^(n-2*k); 
                end
            end
            
            if m >= 0
                Z = sqrt(2*(n+1)).*R.*cos(m.*theta);
                %Z = R.*cos(m.*theta);
            else
                Z = sqrt(2*(n+1)).*R.*sin(m.*theta);
            end
            
            Z(rho>1) = 0;

            % indices = {[2 0],[2 2],[2 -2],[3 1],[3 -1],[3 3],[3 -3],[4 2],[4 -2],[4 0]};
            % scoeff = [0 0.75 -2.5 0 0 0 0 0 0 0];
            % scorr = zeros(1080,1920);
            % 
            % for kz = 1:length(scoeff)
            %     nz = indices{1,kz}(1);
            %     mz = indices{1,kz}(2);
            %     scorr = scorr + scoeff(kz).*Zernike2_sterling(nz,mz,Rho,Phi,(M.*dx)/2);
            % end
            
        end

    end
end
