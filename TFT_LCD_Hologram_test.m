
clc             %Clears the command window
close(gcf)      %Closes open figures
Nx = 1920               ; % number of pixels
Ny = 1080;
dx = 5.4e-6               ; % size of each pixel
dy = sqrt(2)*5.4e-6;
[X,Y,Rho,Phi] = optics.Grid(Nx,Ny,dx,dy);
[x,y,rho,phi] = optics.Grid(Nx/2,Ny,dx,dy);
Ly = Ny*dy;

%% 

phase = 0;
gxA = 2e3;
gyA = 2e3;
gxB = 2e3;
gyB = 2e3;

UA(:,:) = 1;
UA(:,960:1920) =1*exp(1j*phase*pi/20);

HolA = optics.DMD_Hol(UA(:,1:960), x, y, gxA, gyA, 0, 1)';
HolB = optics.DMD_Hol(UA(:,961:1920), x, y, gxB, gyB, 0, 1)';
Hol =  optics.DMD_Hol(UA, X, Y, gxA, gyA, 0, 1)';
Hol(:,1:960) = HolA;
Hol(:,961:1920) = HolB;




% Display
figure; 
imshow((Hol));
title('Grating (HolA | HolB)');

%%

% ----- SETTINGS -----
port = "COM5";  % Change this to your Arduino COM port
baud = 1000000;

W = 280; % Width of TFT
H = 240; % Height of TFT

% ----- OPEN SERIAL PORT -----
arduino = serialport(port, baud);
pause(2); % let Arduino reset


% ----- GENERATE YOUR HOLOGRAM -----


% ----- RESIZE HOLOGRAM TO TFT RESOLUTION -----
HolSmall = imresize(Hol, [H W]);   % output is HxW (240×320)

HolArd = uint8(HolSmall .* 255);   % convert to 8-bit grayscale

% ----- FLATTEN FOR SERIAL SEND -----
data = reshape(HolArd.', 1, W*H);  % Now the sizes match perfectly


% % ----- FLATTEN IMAGE -----
% data = reshape(HolArd.', 1, W*H);  % column-major to row-major

% ----- SEND HEADER -----
write(arduino, "START", "string");   % sync header

% ----- SEND SIZE -----
write(arduino, W, "uint16");
write(arduino, H, "uint16");

% ----- SEND PIXEL DATA -----
write(arduino, data, "uint8");


clc

% ----- WAIT FOR ACK -----
ack = readline(arduino);
disp("Arduino says: " + ack);

clear arduino;




%%
% 
% 
% % Connect to Arduino
% arduino = serialport("COM5", 115200);
% 
% % -------------------------------
% % Generate a hologram matrix
% % -------------------------------
% 
% N = 240;
% M = 320;
% 
% [X, Y] = meshgrid(1:M, 1:N);
% 
% holo = mod(X.^2 + Y.^2, 256);  % goofy quadratic phase pattern
% 
% % Convert hologram to 8-bit grayscale
% img = uint16(holo);
% 
% % Promote to 3-channel RGB
% img = repmat(img, 1, 1, 3);
% 
% % -------------------------------
% % Convert to RGB565
% % -------------------------------
% r = bitshift(uint16(img(:,:,1)), -3);
% g = bitshift(uint16(img(:,:,2)), -2);
% b = bitshift(uint16(img(:,:,3)), -3);
% 
% rgb565 = bitor(bitshift(r,11), bitor(bitshift(g,5), b));
% 
% w = size(img,2);
% h = size(img,1);
% 
% % -------------------------------
% % Send to Arduino
% % -------------------------------
% write(arduino, uint8([170 85]), "uint8");
% write(arduino, uint16(w), "uint16");
% write(arduino, uint16(h), "uint16");
% 
% write(arduino, typecast(rgb565(:), "uint8"), "uint8");
% clear arduino 
clc