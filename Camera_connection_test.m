% # Datacosmos
% 
% gentec-eo BEAMAGE-3.0 MATLAB usage
% 
% 
% ---------------------- MATLAB CODE for using ------------------

%% Define Object
beamage3 = BSDK_functions;
%View Methodes
methods(beamage3);

%% initiate CAM
beamage3.initiateCAM;

%% Start Image Acquisition
beamage3.Start;
pause(0.5);

%% Capture Image
% image1 = beamage3.grap_image; %#ok<NASGU>
% %or
% beamage3.grap_image;
% image1 = beamage3.image_si;
% %display image
% image(image1);

%% Change Exposure Time
% beamage3.set_autoexptime(false);
beamage3.set_exptime(5);
pause(0.5);

%Capture and display image
image1 = beamage3.grap_image;
% img_scaled = mat2gray(image1);  % Normalize to [0,1]
% img  = uint8(255 * img_scaled); % Convert to uint8
image(image1);

%% Stop Image Acquisition
pause(0.2);
beamage3.Stop;

%% Disconnect CAM
pause(1);
beamage3.Disconnect;
