%Title: ELL14.m
%Date of Creation(YYYY-MM-DD): 2024-02-08
%Date of Last Modification on Github: 2024-02-08
%Version of Matlab used for Testing: R2023b
%Version of the Thorlabs SDK used: ELLO 1.5.0
%Example Description

clc;
clear;
%% Connection to Thorlabs ELLO motors

% Add assembly
ELLO = NET.addAssembly('C:\Program Files\Thorlabs\Elliptec\Thorlabs.Elliptec.ELLO_DLL.dll');

% Connect to the correct COM port (using ELLO is the easiest way)
Thorlabs.Elliptec.ELLO_DLL.ELLDevicePort.Connect("COM5");

% Addresses to scan between
min_address = char("0");
max_address = char("F");

ellDevices = Thorlabs.Elliptec.ELLO_DLL.ELLDevices();
devices = ellDevices.ScanAddresses(min_address, max_address);

fprintf("Found %d devices.\n", devices.Count());

motors = struct(); % Struct to hold the available motors

for k = 1:1:devices.Count() % Loops through the number of available devices
    device = devices.Item(k - 1);
    ellDevices.Configure(device);
    Device_ID= char(device);
    Device_address = ellDevices.AddressedDevice(Device_ID(1));
    info = Device_address.DeviceInfo;

    fprintf("%s connected on address: %s\n", string(info.DeviceType), string(info.Address));

    % Store each motor reference by address
    motors.(sprintf("A%s", info.Address)) = Device_address; % Stores the motor address in motors struct

    % Home each device
    direction_enum_handle = ELLO.AssemblyHandle.GetType('Thorlabs.Elliptec.ELLO_DLL.ELLBaseDevice+DeviceDirection');
    direction_enum = direction_enum_handle.GetEnumValues();
    fprintf("Homing device %s...\n", info.Address);
    Device_address.Home(direction_enum(1));
    Device_address.MoveAbsolute(90); % Move +90 degrees from 0 to allow for calibration
    Device_address.SetHomeOffset(90); % Set new home +90 from 0
    Device_address.Home();
    pause(1);
end
% Motors now contains all the available addresses for the connected motors
motors.A1.Home();
motors.A2.Home();
disp("Motors moved to home postion");
pause(2);

motors.A1.SetJogstepSize(1); % A1 is the address of the first motor
motors.A2.SetJogstepSize(1); % A2 is the address of the second motor

%% Camera Connection

vid = videoinput('pointgrey', 1, 'F7_Mono12_1928x1448_Mode0');  % Adjust based on your format and camera
src = getselectedsource(vid);

% Initial exposure and gain values
src.Exposure = 0;  % Adjust starting value for your camera
src.Gain = 0;
vid.FramesPerTrigger = 1; % Set image resolution
triggerconfig(vid, 'manual');
start(vid);
max_saturation_percent = 1; % Define saturation threshold (percent)
saturated_percent = 100; % Initialize saturation
while saturated_percent > max_saturation_percent % Loop: adjust exposure to reduce saturation
    trigger(vid);
    img = getdata(vid, 1);
    saturated_pixels = sum(img(:) >= 255); % Check saturation (assuming 8-bit image)
    saturated_percent = 100 * saturated_pixels / numel(img);
    fprintf('Exposure: %.2f | Saturated Pixels: %.2f%%\n', src.Exposure, saturated_percent);
    if saturated_percent > max_saturation_percent % Reduce exposure if too saturated
        src.Exposure = src.Exposure - 1;
        pause(0.2);  % Allow camera to settle
    end
end

%% Create output folders

outputFolder = 'C:\Users\Admin\Documents\Cathy\Data\Thorlabs Rotation device\';  % Change path
if ~exist(outputFolder, 'dir')
    mkdir(outputFolder);
end

%% 180 degree rotation of each motor - calibration.
choice = input('Enter 1, for calibration\nEnter 2, for Stokes measurements\n-->');

if choice == 1
    outputFolder1 = 'C:\Users\Admin\Documents\Cathy\Data\Thorlabs Rotation device\Calibration\';  % Change path
    if ~exist(outputFolder1, 'dir')
        mkdir(outputFolder1);
    end
    disp("Calibration Mode.\nChecking motors...\As each motor rotates, please identify which motor contains the HWP.");
    disp("Moving Motor 1...");
    pause(1);
    motors.A1.MoveAbsolute(359);
    disp("Motor 1 Done.");
    pause(2);
    disp("Moving Motor 2...");
    pause(1);
    motors.A2.MoveAbsolute(359);
    disp("Motor 2 Done.");
    plate_ID = input('Emter 1, if motor 1 contains the HWP\nEnter 2, if motor 2 contains the HWP.\n-->');
    Locations = {'HWP\', "QWP\"};
    namefile = 'I';
    if plate_ID == 1
        disp("Motor 1 contains the HWP.\nBeginning calibration rotation...");
        Determine_HWP = 1;
        for i = 0:5:180
            outputFolder2 = fullfile(outputFolder1,Locations{1});
            if ~exist(outputFolder2, 'dir')
                mkdir(outputFolder2);
            end
            motors.A1.MoveAbsolute(i)
            pause(0.1);
            img = getsnapshot(vid);  % Capture a frame
            img_scaled = mat2gray(img);           % Normalize to [0,1]
            img  = uint8(255 * img_scaled); % Convert to uint8
            fileName = fullfile(outputFolder2, sprintf('%s_%03d.png',namefile ,i));
            imwrite(img, fileName);  % Save image as PNG
            fprintf('Saved image %d to %s\n', i, fileName);
        end
        for i = 0:5:90
            outputFolder2 = fullfile(outputFolder1,Locations{2});
            if ~exist(outputFolder2, 'dir')
                mkdir(outputFolder2);
            end
            motors.A2.MoveAbsolute(i);
            pause(0.1);
            img = getsnapshot(vid);  % Capture a frame
            img_scaled = mat2gray(img);           % Normalize to [0,1]
            img  = uint8(255 * img_scaled); % Convert to uint8
            fileName = fullfile(outputFolder2, sprintf('%s_%03d.png',namefile ,i));
            imwrite(img, fileName);  % Save image as PNG
            fprintf('Saved image %d to %s\n', i, fileName);
        end
    elseif plate_ID == 2
        disp("Motor 2 contains the HWP.\nBeginning calibration rotation...");
        Determine_HWP = 2;
        for i = 0:5:180
            outputFolder2 = fullfile(outputFolder1,Locations{1});
            if ~exist(outputFolder2, 'dir')
                mkdir(outputFolder2);
            end
            motors.A2.MoveAbsolute(i);
            pause(0.1);
            img = getsnapshot(vid);  % Capture a frame
            img_scaled = mat2gray(img);           % Normalize to [0,1]
            img  = uint8(255 * img_scaled); % Convert to uint8
            fileName = fullfile(outputFolder2, sprintf('%s_%03d.png',namefile ,i));
            imwrite(img, fileName);  % Save image as PNG
            fprintf('Saved image %d to %s\n', i, fileName);
        end
        for i = 0:5:90
            outputFolder2 = fullfile(outputFolder1,Locations{2});
            if ~exist(outputFolder2, 'dir')
                mkdir(outputFolder2);
            end
            motors.A1.MoveAbsolute(i)
            pause(0.1);
            img = getsnapshot(vid);  % Capture a frame
            img_scaled = mat2gray(img);           % Normalize to [0,1]
            img  = uint8(255 * img_scaled); % Convert to uint8
            fileName = fullfile(outputFolder2, sprintf('%s_%03d.png',namefile ,i));
            imwrite(img, fileName);  % Save image as PNG
            fprintf('Saved image %d to %s\n', i, fileName);
        end
    else 
        disp("Error, Invalid input!");
end
end
disp("rotations complete...");
disp("Run file analysis for HWP and QWP in python and input values For Zero postions of HWP and QWP here.");

HWP_Zero = input('Input value of Zero postion for HWP.\n-->');
QWP_Zero = input('Input value of Zero postion for QWP.\n-->');

HWP_Zero = 90 + HWP_Zero;
QWP_Zero = 90 + QWP_Zero;

motors.A1.Home();
motors.A2.Home();
pause(1);

motors.A1.SetHomeOffset(HWP_Zero);
motors.A2.SetHomeOffset(QWP_Zero);

motors.A1.Home();
motors.A2.Home();

disp("New calibrated Home set for HWP and QWP.\nQuiting calibration.");
continue_to_stokes = input("Continue to stokes?\nEnter 1, to continue\n-->");
if continue_to_stokes == 1
    choice = 2;
    Determine_HWP = input('Emter 1, if motor 1 contains the HWP\nEnter 2, if motor 2 contains the HWP.\n-->');
end
if choice == 2
    outputFolder1 = 'C:\Users\Admin\Documents\Cathy\Data\Thorlabs Rotation device\Stokes\';  % Change path
    if ~exist(outputFolder1, 'dir')
        mkdir(outputFolder1);
    end
    disp("Stokes Motion.")
    Motion_list_HWP = [0, 45, 22.5, 67.5];
    Paths = {'I_H\','I_V\','I_D\','I_A\','I_R','I_L'};
    baseFileName = 'I';
    names = {'H','V','D','A','R','L'};

    if Determine_HWP == 1
        motors.A2.MoveAbsolute(0); %QWP at 0 

        for i = 1:1:4
             outputFolder2 = fullfile(outputFolder1,Paths{i});
            if ~exist(outputFolder2, 'dir')
                mkdir(outputFolder2);
            end
            motors.A1.MoveAbsolute(Motion_list_HWP(i));
            pause(0.1);
            img = getsnapshot(vid);  % Capture a frame
            img_scaled = img;           % Normalize to [0,1]
            img  = uint8(1* img_scaled); % Convert to uint8
            fileName = fullfile(outputFolder2, sprintf('%s_%s.png', baseFileName, names{i}));
            imwrite(img, fileName);  % Save image as PNG
            fprintf('Saved image %d to %s\n', i, fileName);
        end
        motors.A2.MoveAbsolute(45); %QWP at 45
        for i = 1:1:2
             outputFolder2 = fullfile(outputFolder1,Paths{i+4});
            if ~exist(outputFolder2, 'dir')
                mkdir(outputFolder2);
            end
            motors.A1.MoveAbsolute(Motion_list_HWP(i));
            pause(0.1);
            img = getsnapshot(vid);  % Capture a frame
            img_scaled = img;           % Normalize to [0,1]
            img  = uint8(1* img_scaled); % Convert to uint8
            fileName = fullfile(outputFolder2, sprintf('%s_%s.png', baseFileName, names{i+4}));
            imwrite(img, fileName);  % Save image as PNG
            fprintf('Saved image %d to %s\n', i, fileName);
        end
        disp("rotations complete...");   
    elseif Determine_HWP == 2
        motors.A1.MoveAbsolute(0); %QWP at 0 

        for i = 1:1:4
             outputFolder2 = fullfile(outputFolder1,Paths{i});
            if ~exist(outputFolder2, 'dir')
                mkdir(outputFolder2);
            end
            motors.A2.MoveAbsolute(Motion_list_HWP(i));
            pause(0.1);
            img = getsnapshot(vid);  % Capture a frame
            img_scaled = img;           % Normalize to [0,1]
            img  = uint8(1* img_scaled); % Convert to uint8
            fileName = fullfile(outputFolder2, sprintf('%s_%s.png', baseFileName,names{i}));
            imwrite(img, fileName);  % Save image as PNG
            fprintf('Saved image %d to %s\n', i, fileName);
        end
        motors.A2.MoveAbsolute(45); %QWP at 45
        for i = 1:1:2
             outputFolder2 = fullfile(outputFolder1,Paths{i+4});
            if ~exist(outputFolder2, 'dir')
                mkdir(outputFolder2);
            end
            motors.A2.MoveAbsolute(Motion_list_HWP(i));
            pause(0.1);
            img = getsnapshot(vid);  % Capture a frame
            img_scaled = img;           % Normalize to [0,1]
            img  = uint8(1* img_scaled); % Convert to uint8
            fileName = fullfile(outputFolder2, sprintf('%s_%s.png', baseFileName, names{i+4}));
            imwrite(img, fileName);  % Save image as PNG
            fprintf('Saved image %d to %s\n', i, fileName);
        end
        disp("rotations complete...");  
    end

else
    disp("Error, Invalid input!");
end

%% Return to home

motors.A1.Home();
motors.A2.Home();
disp("Motors moved to home postion");
pause(1);

%% Disconnect from and close all devices

stop(vid);
delete(vid);
clear vid;

fprintf("Disconnecting.\n")
Thorlabs.Elliptec.ELLO_DLL.ELLDevicePort.Disconnect();
