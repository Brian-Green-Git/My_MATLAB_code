classdef Q_Ed_App_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                     matlab.ui.Figure
        TabGroup                     matlab.ui.container.TabGroup
        ManualTab                    matlab.ui.container.Tab
        TabGroup2                    matlab.ui.container.TabGroup
        TakedataTab_2                matlab.ui.container.Tab
        GridLayout                   matlab.ui.container.GridLayout
        GridLayout12                 matlab.ui.container.GridLayout
        TakeManualStokesDataButton   matlab.ui.control.Button
        AcquiringdataPanel_2         matlab.ui.container.Panel
        GridLayout15_3               matlab.ui.container.GridLayout
        TextArea_2                   matlab.ui.control.TextArea
        TakeManualBellDataButton     matlab.ui.control.Button
        TakeManualQSTDataButton      matlab.ui.control.Button
        UIAxes2                      matlab.ui.control.UIAxes
        GridLayout5                  matlab.ui.container.GridLayout
        DMDConfigurationPanel        matlab.ui.container.Panel
        GridLayout6                  matlab.ui.container.GridLayout
        GratingsPanel                matlab.ui.container.Panel
        GridLayout7                  matlab.ui.container.GridLayout
        YGratingSpinner              matlab.ui.control.Spinner
        YGratingSpinnerLabel         matlab.ui.control.Label
        XGratingSpinner              matlab.ui.control.Spinner
        XGratingSpinnerLabel         matlab.ui.control.Label
        ShiftsPanel                  matlab.ui.container.Panel
        GridLayout8                  matlab.ui.container.GridLayout
        YShiftSpinner                matlab.ui.control.Spinner
        YShiftSpinnerLabel           matlab.ui.control.Label
        XShiftSpinner                matlab.ui.control.Spinner
        XShiftSpinnerLabel           matlab.ui.control.Label
        CameraConfigurationPanel_3   matlab.ui.container.Panel
        GridLayout6_5                matlab.ui.container.GridLayout
        DisconnectButton_2           matlab.ui.control.Button
        ConnectButton_2              matlab.ui.control.Button
        CameraDropDown               matlab.ui.control.DropDown
        CameraDropDownLabel          matlab.ui.control.Label
        ValueSpinner                 matlab.ui.control.Spinner
        ValueSpinnerLabel            matlab.ui.control.Label
        ConfigurecamerasettingsDropDown  matlab.ui.control.DropDown
        ConfigurecamerasettingsDropDownLabel  matlab.ui.control.Label
        FileLoggingPanel             matlab.ui.container.Panel
        FileLoggingGrid              matlab.ui.container.GridLayout
        EnterButton                  matlab.ui.control.Button
        SaveToEditField              matlab.ui.control.EditField
        SaveToEditFieldLabel         matlab.ui.control.Label
        ArduinoConnectionPanel       matlab.ui.container.Panel
        ConfigurationGrid            matlab.ui.container.GridLayout
        DisconnectButton             matlab.ui.control.Button
        ConnectButton                matlab.ui.control.Button
        BaudrateDropDown             matlab.ui.control.DropDown
        BaudrateDropDownLabel        matlab.ui.control.Label
        RefreshButton                matlab.ui.control.Button
        SerialportDropDown           matlab.ui.control.DropDown
        SerialportDropDownLabel      matlab.ui.control.Label
        AnalyzedataTab_2             matlab.ui.container.Tab
        GridLayout2                  matlab.ui.container.GridLayout
        FileLoggingPanel_2           matlab.ui.container.Panel
        FileLoggingGrid_2            matlab.ui.container.GridLayout
        StopButton_2                 matlab.ui.control.Button
        StartButton_2                matlab.ui.control.Button
        DigitalTab                   matlab.ui.container.Tab
        TabGroup3                    matlab.ui.container.TabGroup
        TakedataTab                  matlab.ui.container.Tab
        GridLayout3                  matlab.ui.container.GridLayout
        GridLayout5_2                matlab.ui.container.GridLayout
        DMDConfigurationPanel_2      matlab.ui.container.Panel
        GridLayout6_2                matlab.ui.container.GridLayout
        GenerateHologramButton       matlab.ui.control.Button
        AzimuthalIndexPanel          matlab.ui.container.Panel
        GridLayout17                 matlab.ui.container.GridLayout
        lEditField                   matlab.ui.control.EditField
        LLabel                       matlab.ui.control.Label
        PhasePanel                   matlab.ui.container.Panel
        GridLayout16                 matlab.ui.container.GridLayout
        EditphaseCheckBox            matlab.ui.control.CheckBox
        PhaseShiftEditField          matlab.ui.control.NumericEditField
        PhaseShiftEditFieldLabel     matlab.ui.control.Label
        GratingsPanel_2              matlab.ui.container.Panel
        GridLayout7_2                matlab.ui.container.GridLayout
        Y_BGratingEditField          matlab.ui.control.NumericEditField
        Y_BGratingEditFieldLabel     matlab.ui.control.Label
        X_BGratingEditField          matlab.ui.control.NumericEditField
        X_BGratingEditFieldLabel     matlab.ui.control.Label
        Y_AGratingEditField          matlab.ui.control.NumericEditField
        Y_AGratingEditFieldLabel     matlab.ui.control.Label
        X_AGratingEditField          matlab.ui.control.NumericEditField
        X_AGratingEditFieldLabel     matlab.ui.control.Label
        ShiftsPanel_2                matlab.ui.container.Panel
        GridLayout8_2                matlab.ui.container.GridLayout
        X_BShiftEditField            matlab.ui.control.NumericEditField
        X_BShiftEditFieldLabel       matlab.ui.control.Label
        Y_BShiftEditField            matlab.ui.control.NumericEditField
        Y_BShiftEditFieldLabel       matlab.ui.control.Label
        Y_AShiftEditField            matlab.ui.control.NumericEditField
        Y_AShiftEditFieldLabel       matlab.ui.control.Label
        X_AShiftEditField            matlab.ui.control.NumericEditField
        X_AShiftEditFieldLabel       matlab.ui.control.Label
        UIAxes3                      matlab.ui.control.UIAxes
        CameraConfigurationPanel_4   matlab.ui.container.Panel
        GridLayout6_6                matlab.ui.container.GridLayout
        CameraDropDown_2             matlab.ui.control.DropDown
        CameraDropDown_2Label        matlab.ui.control.Label
        DisconnectedButton           matlab.ui.control.Button
        ConnectButton_3              matlab.ui.control.Button
        ValueSpinner_2               matlab.ui.control.Spinner
        ValueSpinner_2Label          matlab.ui.control.Label
        ConfigurecamerasettingsDropDown_2  matlab.ui.control.DropDown
        ConfigurecamerasettingsDropDown_2Label  matlab.ui.control.Label
        GridLayout13                 matlab.ui.container.GridLayout
        AcquiringdataPanel           matlab.ui.container.Panel
        GridLayout15                 matlab.ui.container.GridLayout
        TextArea                     matlab.ui.control.TextArea
        TakeDigitalBellDataButton    matlab.ui.control.Button
        TakeDigitalQSTDataButton     matlab.ui.control.Button
        TakeDigitalStokesDataButton  matlab.ui.control.Button
        UIAxes                       matlab.ui.control.UIAxes
        FileLoggingPanel_3           matlab.ui.container.Panel
        FileLoggingGrid_3            matlab.ui.container.GridLayout
        TextArea_3Label_2            matlab.ui.control.Label
        SaveLocationEditField        matlab.ui.control.EditField
        PathEditFieldLabel           matlab.ui.control.Label
        AnalyzedataTab               matlab.ui.container.Tab
        GridLayout4                  matlab.ui.container.GridLayout
        FileLoggingPanel_4           matlab.ui.container.Panel
        FileLoggingGrid_4            matlab.ui.container.GridLayout
        StopButton_4                 matlab.ui.control.Button
        StartButton_4                matlab.ui.control.Button
    end


    % Public properties that correspond to the Simulink model
    properties (Access = public, Transient)
        Simulation simulink.Simulation
    end

      
    properties (Access = public)

        adaptors
        adaptorIndex
        adaptorInfo
        deviceList
        deviceID
        SelectedDevice
        selectedFormat
        vid 
        res
        width
        height
        hImage
        exposure 
        gain 
        shutter 
        currentfileloc = ("");
        Nx = 1920               ; % number of pixels
        Ny = 1080;
        dx = 5.4e-6               ; % size of each pixel
        dy = sqrt(2)*5.4e-6;
        Ly = 1920 * 1080
        % X,Y,Rho,Phi = optics.Grid(1090, 1080, (5.4e-6), (sqrt(2)*5.4e-6))
        % x,y,rho,phi = optics.Grid((1090/2), 1080, (5.4e-6), (sqrt(2)*5.4e-6))

        Phase
        gxA
        gyA
        gxB
        gyB

        allAdaptors
        adaptorList
        cameraTable = [];

        Azimuthal_index

        Locations = {'R\','L\','H\','V\','D\','A\'};
        

    end
  
    
    methods (Access = private)

        function DetectCameras(app)

            app.allAdaptors = imaqhwinfo;
            app.adaptorList = app.allAdaptors.InstalledAdaptors;
            
            app.cameraTable = []; % struct array to hold detected cams
            index = 1;
            
            for a = 1:length(app.adaptorList)
                adaptorName = app.adaptorList{a};
                
                try
                    info = imaqhwinfo(adaptorName);
                    devices = info.DeviceInfo;
            
                    for d = 1:length(devices)
                        app.cameraTable(index).Adaptor = adaptorName;
                        app.cameraTable(index).DeviceID = devices(d).DeviceID;
                        app.cameraTable(index).Name = devices(d).DeviceName;
                        app.cameraTable(index).Format = devices(d).DefaultFormat;
                        index = index + 1;
                    end
            
                catch
                    % Some adaptors fail silently — ignore and move on
                end
            end
            
            % If no cameras found, bail out
            if isempty(app.cameraTable)
                error("No cameras found on any adaptors.");
            end

        end

        function DisplayliveCamera(app)

            axes(app.UIAxes);  % target your UIAxes
            axis(app.UIAxes, 'off'); % optional: hide grid and labels
            hold(app.UIAxes, 'on');
            
            % Create an image object with same resolution as the video
            app.hImage = image(app.UIAxes, zeros(app.height, app.width, 3, 'uint8'));
            
            % Make it fill the UIAxes completely
            app.UIAxes.XLim = [0 app.width];
            app.UIAxes.YLim = [0 app.height];
            app.UIAxes.YDir = 'reverse'; % keep orientation normal
            axis(app.UIAxes, 'image'); % maintain aspect ratio
            
            app.UIAxes.Title.Color = [0.0, 1.0, 0.0];
            title(app.UIAxes,"Camera Conencted");
            
            % Start the preview on that image handle
            preview(app.vid, app.hImage);
        
        end

        function Pausecamera(app)
            
            stoppreview(app.vid);     % stop live feed
            cla(app.UIAxes);          % clear the preview image
            title(app.UIAxes, 'Camera live view paused...');
            app.UIAxes.Title.Color = [1.00, 0.00, 0.00];

        end

        function AberrationCorrectionFactor = AberrationCorrection(app)

             % Define Aberration Correction
            indices = {[2 0],[2 2],[4 -2],[3 -1],[2 -2]}; %You may include more that you think you need
            scoeff = [0 3 0 0 -2];  %This is the coefficient of each zernike you included above
            scorr = zeros(app.Ny,app.Nx/2);
            for kz = 1:length(scoeff)
                nz = indices{1,kz}(1);
                mz = indices{1,kz}(2);
                scorr = scorr + scoeff(kz).*optics.Zernike2_sterling(nz,mz,app.rho,app.phi,app.Ly/2);
            end
            AberrationCorrectionFactor = exp(1i.*scorr);
            return
        end

        function SaturationControl(app)
            % Define saturation threshold (percent)
            max_saturation_percent = 1;
            
            % Initialize saturation
            saturated_percent = 100;
            
            % Loop: adjust exposure to reduce saturation
            while saturated_percent > max_saturation_percent
                trigger(app.vid);
                img = getdata(app.vid, 1);
            
                % Check saturation (assuming 8-bit image)
                saturated_pixels = nnz(img(:) >= 255);
                saturated_percent = 100 * saturated_pixels / numel(img);
            
                % Reduce exposure if too saturated
                if saturated_percent > max_saturation_percent
                    src.Exposure = src.Exposure - 1;
                    pause(0.2);  % Allow camera to settle
                end
            end
            
        end
 
        function CameraSettings(app)

            try 
                if ~isempty(app.vid)

                    src = getselectedsource(app.vid);
        
                    % Initial exposure and gain values
        
                    src.Exposure = app.exposure;  
                    src.Gain = app.gain;
                    src.Shutter = app.shutter;
        
                    
                end
            catch ME

                uialert(app.UIFigure, ME.message, "Error detected");
       
            end

        end
        
         function DisplayHolograms(app, InHol)

            % --- Display hologram inside app ---

            axes(app.UIAxes3);
            app.UIAxes3.Title.Color = [0.00, 1.00, 0.00];
            imagesc(app.UIAxes3, InHol);
            colormap(app.UIAxes3, 'gray');
            axis(app.UIAxes3, 'image');
            app.UIAxes3.XTick = [];
            app.UIAxes3.YTick = [];
            title(app.UIAxes3, "Displayed Hologram");


        end         

        function DigitalStokesCode(app)          
        
            Pausecamera(app);

            CameraSettings(app);

            % app.vid.FramesPerTrigger = 1;
            % triggerconfig(app.vid, 'manual');
            % start(app.vid);

            try 

                % Folder to save images
                outputFolder = app.SaveLocationEditField.Value;
                if ~exist(outputFolder, 'dir')
                    mkdir(outputFolder);
                end
                % Base name for files
                baseFileName = 'I';
    
                Paths = {'R','L','H','V','D','A'};
                
    

                [X,Y,~,~] = optics.Grid(app.Nx,app.Ny,app.dx,app.dy);
                [x,y,~,~] = optics.Grid(app.Nx/2,app.Ny,app.dx,app.dy);
                
                phase = app.Phase;

                UA(:,1:960) = 1;
                UA(:,961:1920) = 0;
                HolA = optics.DMD_Hol(UA(:,1:960), x, y, app.gxA, app.gyA, 0, 1)';
                HolB = optics.DMD_Hol(UA(:,961:1920), x, y, app.gxB, app.gyB, 0, 1)';
                Hol =  optics.DMD_Hol(UA, X, Y, app.gxA, app.gyA, 0, 1)';
                Hol(:,1:960) = HolA;
                Hol(:,961:1920) = HolB;
                DisplayHolograms(app, Hol);
                optics.Fullscreen(Hol,1)
                pause(1);
                img = getsnapshot(app.vid);  % Capture a frame
                % img_scaled = mat2gray(img);           % Normalize to [0,1]
                % img  = uint8(255 * img_scaled) % Convert to uint8
                fileName = fullfile(outputFolder, sprintf('%s_%s.png', baseFileName, Paths{3}));
                imwrite(img, fileName);  % Save image as PNG
                fprintf('Saved image %d to %s\n', 1, fileName);
                
                
                %% MEASURE V
                
                UA(:,:) =0;
                UA(:,960:1920) = 1;
                
                % figure(2);imagesc(HolA); axis image off; colormap bone
                HolA = optics.DMD_Hol(UA(:,1:960), x, y, app.gxA, app.gyA, 0, 1)';
                HolB = optics.DMD_Hol(UA(:,961:1920), x, y, app.gxB, app.gyB, 0, 1)';
                Hol =  optics.DMD_Hol(UA, X, Y, app.gxA, app.gyA, 0, 1)';
                Hol(:,1:960) = HolA;
                Hol(:,961:1920) = HolB;
                DisplayHolograms(app, Hol);
                optics.Fullscreen(Hol,1)
                pause(1);
                img = getsnapshot(app.vid);  % Capture a frame
                % img_scaled = mat2gray(img);           % Normalize to [0,1]
                % img  = uint8(255 * img_scaled) % Convert to uint8
                fileName = fullfile(outputFolder, sprintf('%s_%s.png', baseFileName, Paths{4}));
                imwrite(img, fileName);  % Save image as PNG
                fprintf('Saved image %d to %s\n', 2, fileName);
                %% MEASURE D
                
                UA(:,:) = 1;
                UA(:,960:1920) =1*exp(1j*phase*pi/20);
                
                HolA = optics.DMD_Hol(UA(:,1:960), x, y, app.gxA, app.gyA, 0, 1)';
                HolB = optics.DMD_Hol(UA(:,961:1920), x, y, app.gxB, app.gyB, 0, 1)';
                Hol =  optics.DMD_Hol(UA, X, Y, app.gxA, app.gyA, 0, 1)';
                Hol(:,1:960) = HolA;
                Hol(:,961:1920) = HolB;
                DisplayHolograms(app, Hol);
                optics.Fullscreen(Hol,1)
                pause(1);
                img = getsnapshot(app.vid);  % Capture a frame
                % img_scaled = mat2gray(img);           % Normalize to [0,1]
                % img  = uint8(255 * img_scaled) % Convert to uint8
                fileName = fullfile(outputFolder, sprintf('%s_%s.png', baseFileName, Paths{5}));
                imwrite(img, fileName);  % Save image as PNG
                fprintf('Saved image %d to %s\n', 3, fileName);
                
                %% MEASURE A
                
                UA(:,:) = 1;
                UA(:,960:1920) =-1*exp(1j*phase*pi/20);
                
                % % %figure(2);imagesc(HolA); axis image off; colormap bone
                HolA = optics.DMD_Hol(UA(:,1:960), x, y, app.gxA, app.gyA, 0, 1)';
                HolB = optics.DMD_Hol(UA(:,961:1920), x, y, app.gxB, app.gyB, 0, 1)';
                Hol =  optics.DMD_Hol(UA, X, Y, app.gxA, app.gyA, 0, 1)';
                Hol(:,1:960) = HolA;
                Hol(:,961:1920) = HolB;
                DisplayHolograms(app, Hol);
                optics.Fullscreen(Hol,1)
                pause(1);
                img = getsnapshot(app.vid);  % Capture a frame
                % img_scaled = mat2gray(img);           % Normalize to [0,1]
                % img  = uint8(255 * img_scaled) % Convert to uint8
                fileName = fullfile(outputFolder, sprintf('%s_%s.png', baseFileName, Paths{6}));
                imwrite(img, fileName);  % Save image as PNG
                fprintf('Saved image %d to %s\n', 4, fileName);
                
                %% MEASURE R
                % phase = 10
                UA(:,:) = 1 ;
                UA(:,960:1920) = 1* exp(1j*pi/2)*exp(1j*phase*pi/20);
                
                HolA = optics.DMD_Hol(UA(:,1:960), x, y, app.gxA, app.gyA, 0, 1)';
                HolB = optics.DMD_Hol(UA(:,961:1920), x, y, app.gxB, app.gyB, 0, 1)';
                Hol =  optics.DMD_Hol(UA, X, Y, app.gxA, app.gyA, 0, 1)';
                Hol(:,1:960) = HolA;
                Hol(:,961:1920) = HolB;
                DisplayHolograms(app, Hol);
                optics.Fullscreen(Hol,1)
                pause(1);
                img = getsnapshot(app.vid);  % Capture a frame
                % img_scaled = mat2gray(img);           % Normalize to [0,1]
                % img  = uint8(255 * img_scaled) % Convert to uint8
                fileName = fullfile(outputFolder, sprintf('%s_%s.png', baseFileName, Paths{1}));
                imwrite(img, fileName);  % Save image as PNG
                fprintf('Saved image %d to %s\n', 5, fileName);
                
                
                %% MEASURE L
                
                UA(:,:) = 1;
                UA(:,960:1920) = -1*exp(1j*pi/2)*exp(1j*phase*pi/20);
                
                HolA = optics.DMD_Hol(UA(:,1:960), x, y, app.gxA, app.gyA, 0, 1)';
                HolB = optics.DMD_Hol(UA(:,961:1920), x, y, app.gxB, app.gyB, 0, 1)';
                Hol =  optics.DMD_Hol(UA, X, Y, app.gxA, app.gyA, 0, 1)';
                Hol(:,1:960) = HolA;
                Hol(:,961:1920) = HolB;
                DisplayHolograms(app, Hol);
                optics.Fullscreen(Hol,1)
                pause(1);
                img = getsnapshot(app.vid);  % Capture a frame
                % img_scaled = mat2gray(img);           % Normalize to [0,1]
                % img  = uint8(255 * img_scaled) % Convert to uint8
                fileName = fullfile(outputFolder, sprintf('%s_%s.png', baseFileName, Paths{2}));
                imwrite(img, fileName);  % Save image as PNG
                fprintf('Saved image %d to %s\n', 6, fileName);

            catch ME

                uialert(app.UIFigure, sprintf("Something went wrong: \n%s", ME.message), "Measurement error")
                disp('--- FULL ERROR REPORT ---');
                disp(getReport(ME, 'extended'));
            end

            % resume live feed of camera

            DisplayliveCamera(app)
         
        end

        function DigitalQSTCode(app)
        
            % l = app.Azimuthal_index;

            %Centering holograms
            leftx =100;
            lefty =0;
            rightx = -70;
            righty = 0;
            
            [X,Y,~,~] = optics.Grid(app.Nx,ap.Ny,app.dx,app.dy);

            [x,y,~,phi_left] = optics.Moving_Grid(app.Nx/2,app.Ny,leftx,lefty,app.dx,app.dy);
            [x,y,~,phi_right] = optics.Moving_Grid(app.Nx/2,app.Ny,rightx,righty,app.dx,app.dy);

            % i=2;
            % 
            % right = (1*exp(1j*1*phi_right) +exp(1j*i*pi/2)*exp(1j*-1*phi_right));
            % left = 1*exp(1j*pi/2)*(exp(1j*1*phi_left) +exp(1j*i*pi/2)*exp(1j*-1*phi_left))*exp(1j*phase*pi/20);
            % 
            % right = 1*exp(1j*phi_right*-1);
            % left =  1*exp(1j*pi/2)*exp(1j*phi_left*-1)*exp(1j*phase*pi/20); 
            % 
            % Display2DMD(left, right,app.gxA,app.gyA,app.gxB,app.gyB,x,y,X,Y);
            % pause(0.5)
            
            % Gaussian for centering
            % [x_l,y_l,rho_l,phi_left] = optics.Moving_Grid(Nx/2,Ny,leftx,lefty,dx,dy);
            % [x_r,y_r,rho_r,phi_right] = optics.Moving_Grid(Nx/2,Ny,rightx,righty,dx,dy);
            % 
            % right = sl.HG(x_r,y_r,0,0,1,0.9e-3);
            % left = sl.HG(x_l,y_l,0,0,1,0.9e-3);
            % 
            % HolA = optics.DMD_Hol(left, x_l, y_l, gxA, gyA, 0, 1)';
            % HolB = optics.DMD_Hol(right, x, y, gxB, gyB, 0, 1)';
            % Hol =  optics.DMD_Hol(UA, X, Y, gxA, gyA, 0, 1)';
            % Hol(:,1:960) = HolA;
            % Hol(:,961:1920) = HolB;
            % optics.Fullscreen(Hol,1)
            % pause(0.5)
            
            %% QST MEASUREMENTS
            
            %% MEASURE R        
            
            it = 0;
            outputFolder = fullfile(outputFolder1,app.Locations{1});
            if ~exist(outputFolder, 'dir')
                mkdir(outputFolder);
            end
            
            for i = [0,0,0,1,2,-1]
                if it==0
                    right = exp(1j*l*phi_right);% H
                    left =  exp(1j*pi/2)*exp(1j*l*phi_left)*exp(1j*phase*pi/20);  %V        
                    Display2DMD(left, right,app.gxA,app.gyA,app.gxB,app.gyB,x,y,X,Y);
                    pause(1);
                    img = getsnapshot(app.vid);  % Capture a frame
                    fileName = fullfile(outputFolder, sprintf('%s_%03d.png', orthfilename, 1));
                    imwrite(img, fileName);  % Save image as PNG
                    fprintf('Saved image %d to %s\n', it, fileName);
                    it = it + 1;  % Increment iteration counter
                elseif it==1
                    right = exp(1j*-l*phi_right);
                    left = exp(1j*pi/2)*exp(1j*-l*phi_left)*exp(1j*phase*pi/20);               
                    Display2DMD(left, right,app.gxA,app.gyA,app.gxB,app.gyB,x,y,X,Y);
                    pause(1);
                    img = getsnapshot(app.vid);  % Capture a frame
                    fileName = fullfile(outputFolder, sprintf('%s_%03d.png', orthfilename, -1));
                    imwrite(img, fileName);  % Save image as PNG
                    fprintf('Saved image %d to %s\n', it, fileName);
                    it = it + 1;  % Increment iteration counter
                else 
                    right = exp(1j*l*phi_right) +exp(1j*i*pi/2)*exp(1j*-l*phi_right);
                    left = exp(1j*pi/2)*((exp(1j*l*phi_left) +exp(1j*i*pi/2)*exp(1j*-l*phi_left)))*exp(1j*phase*pi/20);     
                    Display2DMD(left, right,app.gxA,app.gyA,app.gxB,app.gyB,x,y,X,Y);
                    pause(1);
                    img = getsnapshot(app.vid);  % Capture a frame
                    fileName = fullfile(outputFolder, sprintf('%s_%03d.png', baseFileName, i));
                    imwrite(img, fileName);  % Save image as PNG
                    fprintf('Saved image %d to %s\n', it, fileName);
                    it = it + 1;  % Increment iteration counter
                end
            end
            
            %% MEASURE L
            it = 0;
            outputFolder = fullfile(outputFolder1,app.Locations{2});
            if ~exist(outputFolder, 'dir')
                mkdir(outputFolder);
            end
            
            for i = [0,0,0,1,2,-1]
                if it==0
                    right = exp(1j*l*phi_right);
                    left = -exp(1j*pi/2)*exp(1j*l*phi_left)*exp(1j*phase*pi/20); 
                    Display2DMD(left, right,app.gxA,app.gyA,app.gxB,app.gyB,x,y,X,Y);
                    pause(1);
                    img = getsnapshot(app.vid);  % Capture a frame
                    fileName = fullfile(outputFolder, sprintf('%s_%03d.png', orthfilename, 1));
                    imwrite(img, fileName);  % Save image as PNG
                    fprintf('Saved image %d to %s\n', it, fileName);
                    it = it + 1;  % Increment iteration counter
                elseif it==1
                    right = exp(1j*-l*phi_right);
                    left = -exp(1j*pi/2)*exp(1j*-l*phi_left)*exp(1j*phase*pi/20);
                    Display2DMD(left, right,app.gxA,app.gyA,app.gxB,app.gyB,x,y,X,Y);
                    pause(1);
                    img = getsnapshot(app.vid);  % Capture a frame
                    fileName = fullfile(outputFolder, sprintf('%s_%03d.png', orthfilename, -1));
                    imwrite(img, fileName);  % Save image as PNG
                    fprintf('Saved image %d to %s\n', it, fileName);
                    it = it + 1;  % Increment iteration counter
                else 
                    right = exp(1j*l*phi_right) +exp(1j*i*pi/2)*exp(1j*-l*phi_right);
                    left = -exp(1j*pi/2)*(exp(1j*l*phi_left) +exp(1j*i*pi/2)*exp(1j*-l*phi_left))*exp(1j*phase*pi/20);
                    Display2DMD(left, right,app.gxA,app.gyA,app.gxB,app.gyB,x,y,X,Y);
                    pause(1);
                    img = getsnapshot(app.vid);  % Capture a frame
                    fileName = fullfile(outputFolder, sprintf('%s_%03d.png', baseFileName, i));
                    imwrite(img, fileName);  % Save image as PNG
                    fprintf('Saved image %d to %s\n', it, fileName);
                    it = it + 1;  % Increment iteration counter
                end
            end
            %% MEASURE H
            it = 0;
            outputFolder = fullfile(outputFolder1,app.Locations{3});
            if ~exist(outputFolder, 'dir')
                mkdir(outputFolder);
            end
            
            for i = [0,0,0,1,2,-1]
                 if it==0
                    right = exp(1j* l* phi_right);
                    left =0;
                    Display2DMD(left, right,app.gxA,app.gyA,app.gxB,app.gyB,x,y,X,Y);
                    pause(1);
                    img = getsnapshot(app.vid);  % Capture a frame
                    fileName = fullfile(outputFolder, sprintf('%s_%03d.png', orthfilename, 1));
                    imwrite(img, fileName);  % Save image as PNG
                    fprintf('Saved image %d to %s\n', it, fileName);
                    it = it + 1;  % Increment iteration counter
                elseif it==1
                    right = exp(1j* -l* phi_right);
                    left = 0;
                    Display2DMD(left, right,app.gxA,app.gyA,app.gxB,app.gyB,x,y,X,Y);
                    pause(1);
                    img = getsnapshot(app.vid);  % Capture a frame
                    fileName = fullfile(outputFolder, sprintf('%s_%03d.png', orthfilename, -1));
                    imwrite(img, fileName);  % Save image as PNG
                    fprintf('Saved image %d to %s\n', it, fileName);
                    it = it + 1;  % Increment iteration counter
                 else
                    right = exp(1j* l* phi_right) + exp(1j*i*pi/2)* exp(1j*-l*phi_right);
                    left = 0;
                    Display2DMD(left, right,app.gxA,app.gyA,app.gxB,app.gyB,x,y,X,Y);
                    pause(1);
                    img = getsnapshot(app.vid);  % Capture a frame
                    fileName = fullfile(outputFolder, sprintf('%s_%03d.png', baseFileName, i));
                    imwrite(img, fileName);  % Save image as PNG
                    fprintf('Saved image %d to %s\n', it, fileName);
                    it = it + 1;  % Increment iteration counter
                end
            end
            
            %% MEASURE V
            it = 0;
            outputFolder = fullfile(outputFolder1,app.Locations{4});
            if ~exist(outputFolder, 'dir')
                mkdir(outputFolder);
            end
            for i = [0,0,0,1,2,-1]
                if it==0
                    right = 0;
                    left = exp(1j* l*phi_left);
                    Display2DMD(left, right,app.gxA,app.gyA,app.gxB,app.gyB,x,y,X,Y);
                    pause(1);
                    img = getsnapshot(app.vid);  % Capture a frame
                    fileName = fullfile(outputFolder, sprintf('%s_%03d.png', orthfilename, 1));
                    imwrite(img, fileName);  % Save image as PNG
                    fprintf('Saved image %d to %s\n', it, fileName);
                    it = it + 1;  % Increment iteration counter
                elseif it==1
                    right = 0;
                    left = exp(1j* -l*phi_left);       
                    Display2DMD(left, right,app.gxA,app.gyA,app.gxB,app.gyB,x,y,X,Y);
                    pause(1);
                    img = getsnapshot(app.vid);  % Capture a frame
                    fileName = fullfile(outputFolder, sprintf('%s_%03d.png', orthfilename, -1));
                    imwrite(img, fileName);  % Save image as PNG
                    fprintf('Saved image %d to %s\n', it, fileName);
                    it = it + 1;  % Increment iteration counter
                else 
                    right = 0;
                    left = exp(1j*l*phi_left) + exp(1j*i*pi/2)* exp(1j*-l*phi_left);
                    Display2DMD(left, right,app.gxA,app.gyA,app.gxB,app.gyB,x,y,X,Y);
                    pause(1);
                    img = getsnapshot(app.vid);  % Capture a frame
                    fileName = fullfile(outputFolder, sprintf('%s_%03d.png', baseFileName, i));
                    imwrite(img, fileName);  % Save image as PNG
                    fprintf('Saved image %d to %s\n', it, fileName);
                    it = it + 1;  % Increment iteration counter
                end
            end
            %% MEASURE D
            it = 0;
            outputFolder = fullfile(outputFolder1,app.Locations{5});
            if ~exist(outputFolder, 'dir')
                mkdir(outputFolder);
            end
            
            for i = [0,0,0,1,2,-1]
                if it==0
                    right = exp(1j* l* phi_right);
                    left = exp(1j*l*phi_left)*exp(1j*phase*pi/20);     
                    Display2DMD(left, right,app.gxA,app.gyA,app.gxB,app.gyB,x,y,X,Y);
                    pause(1);   
                    img = getsnapshot(app.vid);  % Capture a frame
                    fileName = fullfile(outputFolder, sprintf('%s_%03d.png', orthfilename, 1));
                    imwrite(img, fileName);  % Save image as PNG
                    fprintf('Saved image %d to %s\n', it, fileName);
                    it = it + 1;  % Increment iteration counter
                elseif it==1
                    right = exp(1j* -l* phi_right);
                    left = exp(1j* -l*phi_left)*exp(1j*phase*pi/20);        
                    Display2DMD(left, right,app.gxA,app.gyA,app.gxB,app.gyB,x,y,X,Y);
                    pause(1);
                    img = getsnapshot(app.vid);  % Capture a frame
                    fileName = fullfile(outputFolder, sprintf('%s_%03d.png', orthfilename, -1));
                    imwrite(img, fileName);  % Save image as PNG
                    fprintf('Saved image %d to %s\n', it, fileName);
                    it = it + 1;  % Increment iteration counter
                else 
                    right = exp(1j* l* phi_right) + exp(1j*i*pi/2)* exp(1j*-l*phi_right);
                    left =(exp(1j*l*phi_left) + exp(1j*i*pi/2)* exp(1j*-l*phi_left))*exp(1j*phase*pi/20);    
                    Display2DMD(left, right,app.gxA,app.gyA,app.gxB,app.gyB,x,y,X,Y);
                    pause(1);
                    img = getsnapshot(app.vid);  % Capture a frame
                    fileName = fullfile(outputFolder, sprintf('%s_%03d.png', baseFileName, i));
                    imwrite(img, fileName);  % Save image as PNG
                    fprintf('Saved image %d to %s\n', it, fileName);
                    it = it + 1;  % Increment iteration counter
                end
            end
            %% MEASURE A
            it = 0;
            outputFolder = fullfile(outputFolder1,app.Locations{6});
            if ~exist(outputFolder, 'dir')
                mkdir(outputFolder);
            end
            for i = [0,0,0,1,2,-1]
                if it==0
                    right = exp(1j*l* phi_right);
                    left = -exp(1j*l*phi_left)*exp(1j*phase*pi/20);
                    Display2DMD(left, right,app.gxA,app.gyA,app.gxB,app.gyB,x,y,X,Y);
                    pause(1);
                    img = getsnapshot(app.vid);  % Capture a frame
                    fileName = fullfile(outputFolder, sprintf('%s_%03d.png', orthfilename, 1));
                    imwrite(img, fileName);  % Save image as PNG
                    fprintf('Saved image %d to %s\n', it, fileName);
                    it = it + 1;  % Increment iteration counter
                elseif it==1
                    right = exp(1j* -l* phi_right);
                    left = -exp(1j* -l*phi_left)*exp(1j*phase*pi/20);
                    Display2DMD(left, right,app.gxA,app.gyA,app.gxB,app.gyB,x,y,X,Y);
                    pause(1);
                    img = getsnapshot(app.vid);  % Capture a frame
                    fileName = fullfile(outputFolder, sprintf('%s_%03d.png', orthfilename, -1));
                    imwrite(img, fileName);  % Save image as PNG
                    fprintf('Saved image %d to %s\n', it, fileName);
                    it = it + 1;  % Increment iteration counter
                else 
                    right = exp(1j* l* phi_right) + exp(1j*i*pi/2)* exp(1j*-l*phi_right);
                    left = -(exp(1j*l*phi_left) + exp(1j*i*pi/2)* exp(1j* -l*phi_left))*exp(1j*phase*pi/20);    
                    Display2DMD(left, right,app.gxA,app.gyA,app.gxB,app.gyB,x,y,X,Y);
                    pause(1);
                    img = getsnapshot(app.vid);  % Capture a frame
                    fileName = fullfile(outputFolder, sprintf('%s_%03d.png', baseFileName, i));
                    imwrite(img, fileName);  % Save image as PNG
                    fprintf('Saved image %d to %s\n', it, fileName);
                    it = it + 1;  % Increment iteration counter
                end
            end
            % Clean up
            stop(app.vid);
            delete(app.vid);
            clear vid;
            

        function Display2DMD(left, right,gxA,gyA,gxB,gyB,x,y,X,Y)

                UA = 1;
                HolA = optics.DMD_Hol(left, x, y, gxA, gyA, 0, 1)';
                HolB = optics.DMD_Hol(right, x, y, gxB, gyB, 0, 1)';
                Hol =  optics.DMD_Hol(UA, X, Y, gxA, gyA, 0, 1)';
                Hol(:,1:960) = HolA;
                Hol(:,961:1920) = HolB;
                DisplayHolograms(app, Hol)
                optics.Fullscreen(Hol,1)
        end

        end

        % function done = DigitalBellCode(app)
        % 
        % end

        function RunTakeStokes(app)
                  
                if isempty(app.vid)

                        uialert(app.UIFigure,'User has not connected a camera!','Camera Warning')

               elseif ~isempty(app.vid) 

                    app.AcquiringdataPanel.Visible = "on";
                    app.AcquiringdataPanel.BackgroundColor = [0.00,1.00,0.00];
                    app.AcquiringdataPanel.Title = 'Acquiring Data';
                    app.TextArea.Value = {'Taking Stokes Measurements...'};

                    Pausecamera(app);

%% Stokes code
                    DigitalStokesCode(app);

%% End of stokes code
                    pause(3);
                    
                    DisplayliveCamera(app);

                    app.AcquiringdataPanel.Visible = "off";
                    clear app.TextArea.Value
                    app.TextArea.Value = {''};
                    app.TextArea.Value = {'Complete.'};
                    clear app.TextArea.Value
                    app.TextArea.Value = {''};

               end
        end

  % #######********Method end*********##########      
    end
     

    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app)
           
            app.UIAxes.Title.Color = [1.00, 0.00, 0.00];
            title(app.UIAxes,"Camera Disconnected");

            app.UIAxes3.Title.Color = [1.00, 0.00, 0.00];

            if isempty(app.exposure)
                app.exposure = 0.05;   
            end

            if isempty(app.gain)
                app.gain = 0.5;
            end

            if isempty(app.shutter)
                app.shutter = 30;      
            end

            % initialize gratings and shifts to values in the edit fields 
            
            app.Phase = 0;

            app.gxA = app.X_AGratingEditField.Value;

            app.gyA = app.Y_AGratingEditField.Value;

            app.gxB = app.X_BGratingEditField.Value;

            app.gyB = app.Y_BGratingEditField.Value;

        end

        % Button pushed function: TakeDigitalStokesDataButton
        function DigitalTakeStokesButton(app, event)
             %% check if user has input a file location  
                clear app.TextArea.Value
                app.TextArea.Value = {''};
                app.AcquiringdataPanel.BackgroundColor = [0.00,0.00,0.00];

            if app.SaveLocationEditField.Value == "File Location"
                
                uialert(app.UIFigure,'User has not input a file path to save the data!','Undefined file path')

            else
                %% check if user is using an already used file location 

                if app.SaveLocationEditField.Value == app.currentfileloc(1)

                    app.AcquiringdataPanel.Visible = "on";
                    app.AcquiringdataPanel.BackgroundColor = [1.00,0.00,0.00];
                    app.AcquiringdataPanel.Title = 'Fatal Error';
                    app.TextArea.Value = {'Error: user has already used the current save location!'};
                    pause(3);
                    clear app.TextArea.Value
                    app.TextArea.Value = {''};
                    app.AcquiringdataPanel.Visible = "off";

         %% Run stokes data acquisition code 
                elseif app.SaveLocationEditField.Value ~= app.currentfileloc(1)

                    RunTakeStokes(app);

                end
                app.currentfileloc(1) = app.SaveLocationEditField.Value;
            end
        end

        % Button pushed function: TakeDigitalQSTDataButton
        function DigitalTakeQSTData(app, event)

            %% check if user has input a file location  
                clear app.TextArea.Value
                app.TextArea.Value = {''};
                app.AcquiringdataPanel.BackgroundColor = [0.00,0.00,0.00];

            if app.SaveLocationEditField.Value == "File Location"

                uialert(app.UIFigure,'User has not input a file path to save the data!','Undefined file path')

            else
                %% check if user is using an already used file location 
                if app.SaveLocationEditField.Value == app.currentfileloc(1)

                    app.AcquiringdataPanel.Visible = "on";
                    app.AcquiringdataPanel.BackgroundColor = [1.00,0.00,0.00];
                    app.AcquiringdataPanel.Title = 'Fatal Error';
                    app.TextArea.Value = {'Error: user has already used the current save location!'};
                    pause(3);
                    clear app.TextArea.Value
                    app.TextArea.Value = {''};
                    app.AcquiringdataPanel.Visible = "off";
                elseif app.SaveLocationEditField.Value ~= app.currentfileloc(1)
                    if isempty(app.vid)

                        uialert(app.UIFigure,'User has not connected a camera!','Camera Warning')

                   elseif ~isempty(app.vid)                   
                        app.AcquiringdataPanel.Visible = "on";
                        app.AcquiringdataPanel.BackgroundColor = [0.00,1.00,0.00];
                        app.AcquiringdataPanel.Title = 'Acquiring Data';
                        app.TextArea.Value = {'Taking QST Measurements...'};
                    %% Run QST data acquisition code 
    %% QST code
                        DigitalQSTCode(app);
    
    %% End of QST code
                        pause(3);
                        app.AcquiringdataPanel.Visible = "off";
                        clear app.TextArea.Value
                        app.TextArea.Value = {''};
                        app.TextArea.Value = {''};
                        app.TextArea.Value = {'Complete.'};
                        clear app.TextArea.Value
                        app.TextArea.Value = {''};
                    end
                end
                app.currentfileloc(1) = app.SaveLocationEditField.Value;
            end
        end

        % Button pushed function: TakeDigitalBellDataButton
        function DigitalTakeBellData(app, event)

            %% check if user has input a file location  
                clear app.TextArea.Value
                app.TextArea.Value = {''};
                app.AcquiringdataPanel.BackgroundColor = [0.00,0.00,0.00];

            if app.SaveLocationEditField.Value == "File Location"

                uialert(app.UIFigure,'User has not input a file path to save the data!','Undefined file path')

            else
                %% check if user is using an already used file location 
                if app.SaveLocationEditField.Value == app.currentfileloc(1)

                    app.AcquiringdataPanel.Visible = "on";
                    app.AcquiringdataPanel.BackgroundColor = [1.00,0.00,0.00];
                    app.AcquiringdataPanel.Title = 'Fatal Error';
                    app.TextArea.Value = {'Error: user has already used the current save location!'};
                    pause(3);
                    clear app.TextArea.Value
                    app.TextArea.Value = {''};
                    app.AcquiringdataPanel.Visible = "off";

                elseif app.SaveLocationEditField.Value ~= app.currentfileloc(1)

                   if isempty(app.vid)

                        uialert(app.UIFigure,'User has not connected a camera!','Camera Warning')

                   elseif ~isempty(app.vid)
                        app.AcquiringdataPanel.Visible = "on";
                        app.AcquiringdataPanel.BackgroundColor = [0.00,1.00,0.00];
                        app.AcquiringdataPanel.Title = 'Acquiring Data';
                        app.TextArea.Value = {'Taking QST Measurements...'};

%% take bell code

                        DigitalBellCode(app);

%% end of take bell code
                        pause(3);
                        app.AcquiringdataPanel.Visible = "off";
                        clear app.TextArea.Value
                        app.TextArea.Value = {''};
                        app.TextArea.Value = {''};
                        app.TextArea.Value = {'Complete.'};
                        clear app.TextArea.Value
                        app.TextArea.Value = {''}; 
                        
                   end
                end
                app.currentfileloc(1) = app.SaveLocationEditField.Value;
            end
        end

        % Button pushed function: ConnectButton_3
        function DigitalCameraConnectButton(app, event)
                    % Get all available adaptors
            % adaptors = imaqhwinfo;
            % 
            % % For simplicity, pick the standard Windows adaptor
            % adaptorName = 'winvideo';
            % 
            % % Get all connected devices for that adaptor
            % app.adaptorInfo = imaqhwinfo(adaptorName);
            % app.deviceList = app.adaptorInfo.DeviceInfo;
            % 
            % % Fill dropdown with camera names
            % cameraNames = {app.deviceList.DeviceName};
            % app.CameraDropDown_2.Items = [{'Select a camera...'}, cameraNames];
            % app.CameraDropDown_2.Value = 'Select a camera...';  % safe default


            DetectCameras(app);
            % 
            %             % Fill dropdown with camera names
            % cameraNames = {app.cameraTable.Name};
            % app.CameraDropDown_2.Items = [{'Select a camera...'}, cameraNames];
            % app.CameraDropDown_2.Value = 'Select a camera...';
            % 
            % 

                        % Fill dropdown with camera names
            app.deviceList = app.cameraTable;   % <-- Store it in the app so all functions can access
            cameraNames = {app.cameraTable.Name};
            
            app.CameraDropDown_2.Items = [{'Select a camera...'}, cameraNames];
            app.CameraDropDown_2.Value = 'Select a camera...';


            % Display message
            uialert(app.UIFigure, 'Select a camera from the dropdown to connect.', 'Camera Selection');
            
            % Enable camera dropdown menu
            app.CameraDropDown_2.Enable = true;

            % Add listener for dropdown selection
            % app.CameraDropDown_2.ValueChangedFcn = @(src, event) startCamera(app, adaptorName);

            app.CameraDropDown_2.ValueChangedFcn = @(src, event) startCamera(app);

        end


        function startCamera(app)
            % % Find which camera the user selected
            % selectedName = app.CameraDropDown_2.Value;
            % 
            % deviceIndex = find(strcmp({app.deviceList.DeviceName}, selectedName));
            % app.deviceID = app.deviceList(deviceIndex).DeviceID;
            % selectedDevice = app.deviceList(deviceIndex);
            % 
            % % Connect using default format
            % app.selectedFormat = selectedDevice.DefaultFormat;
            % app.vid = videoinput(adaptorName, app.deviceID, app.selectedFormat);
            % 
            % % Get resolution
            % app.res = app.vid.VideoResolution;
            % app.width = app.res(1);
            % app.height = app.res(2);
            % 
            % 
            % % Display live camera feed in UIAxes
            % DisplayliveCamera(app)
            % 
            % % Edit accessablity of buttons
            % app.ConnectButton_3.Text = "Connected";
            % app.ConnectButton_3.Enable= false;
            % app.DisconnectedButton.Text = "Disconnect";
            % app.DisconnectedButton.Enable = true;
            % 
            % % Enable visiblility of buttons
            % app.CameraDropDown_2Label.Enable = true;
            % app.ConfigurecamerasettingsDropDown_2Label.Enable = true;
            % app.ValueSpinner_2Label.Enable = true;
            % 
            % % Enable dopdown selection and value spinner
            % app.ConfigurecamerasettingsDropDown_2.Enable = true;
            % % app.ConfigurecamerasettingsDropDown_2.Value = "Selection";
            % 
            % app.ValueSpinner_2.Enable = true;
            % app.ConfigurecamerasettingsDropDown_2ValueChanged(app);

                % User's camera selection
            selectedName = app.CameraDropDown_2.Value;
        
            if strcmp(selectedName, "Select a camera...")
                return; % do nothing if user didn't pick a camera
            end
        
            % Find selected camera entry
            idx = find(strcmp({app.deviceList.Name}, selectedName));
            cam = app.deviceList(idx);
        
            % Connect to camera
            app.vid = videoinput(cam.Adaptor, cam.DeviceID, cam.Format);
        
            % Get resolution
            app.res = app.vid.VideoResolution;
            app.width = app.res(1);
            app.height = app.res(2);
        
            % Display in UIAxes
            DisplayliveCamera(app);
        
            % UI changes
            app.ConnectButton_3.Text = "Connected";
            app.ConnectButton_3.Enable = false;
            app.DisconnectedButton.Text = "Disconnect";
            app.DisconnectedButton.Enable = true;
        
            app.ConfigurecamerasettingsDropDown_2.Enable = true;
            app.ValueSpinner_2.Enable = true;


            app.ConfigurecamerasettingsDropDown_2.Enable = true;
            app.ValueSpinner_2.Enable = true;
            app.CameraDropDownLabel.Enable = true;
            app.ConfigurecamerasettingsDropDown_2Label.Enable = true;
            app.ValueSpinner_2Label.Enable = true;


            % Update settings UI
            app.ConfigurecamerasettingsDropDown_2ValueChanged(app);
                  

        end

        % Value changed function: ConfigurecamerasettingsDropDown_2
        function ConfigurecamerasettingsDropDown_2ValueChanged(app, event)
            
            selection = app.ConfigurecamerasettingsDropDown_2.Value;

            switch selection
                case "Exposure"
                    app.ValueSpinner_2.Value = app.exposure;
                    app.ValueSpinner_2Label.Text = "Exposure";
        
                case "Gain"
                    app.ValueSpinner_2.Value = app.gain;
                    app.ValueSpinner_2Label.Text = "Gain";
        
                case "Shutter"
                    app.ValueSpinner_2.Value = app.shutter;
                    app.ValueSpinner_2Label.Text = "Shutter";
            end


        end

        % Button pushed function: DisconnectedButton
        function DigitalCameraDisconnectButton(app, event)
            try
                if isvalid(app.vid)
                    stoppreview(app.vid);     % stop live feed
                    delete(app.vid);          % release camera object
                    clear app.vid;            % free memory
                    cla(app.UIAxes);          % clear the preview image
                    title(app.UIAxes, 'Camera disconnected');
                    app.UIAxes.Title.Color = [1.00, 0.00, 0.00];
                    
                    % Edit accessablity of buttons
                    app.ConnectButton_3.Text = "Connect";
                    app.ConnectButton_3.Enable= true;
                    app.DisconnectedButton.Text = "Disconnected";
                    app.DisconnectedButton.Enable = false;
        
                    % Enable dopdown selection and value spinner
                    app.ConfigurecamerasettingsDropDown_2.Enable = false;
                    app.CameraDropDown_2.Items = {'Please wait'};
                    app.CameraDropDown_2.Value = 'Please wait';
                    app.CameraDropDown_2.Enable = false;
                    app.CameraDropDown_2Label.Enable = false;
                    app.ConfigurecamerasettingsDropDown_2Label.Enable = false;
                    app.ValueSpinner_2Label.Enable = false;

                    app.ValueSpinner_2.Editable = false;
                    app.ValueSpinner_2.Enable = false;
                    app.ValueSpinner_2.Value = 0;
                    app.ValueSpinner_2.Placeholder = 0;

                    app.ValueSpinner_2.Enable = false;
                    app.CameraDropDownLabel.Enable = false;
                    app.ConfigurecamerasettingsDropDown_2Label.Enable = false;
                    app.ValueSpinner_2Label.Enable = false;
                end
            catch ME
                warning(['Error while disconnecting camera: ', ME.message]);
            end
        end

        % Value changing function: ValueSpinner_2
        function ValueSpinner_2ValueChanging(app, event)
            
            newValue = app.ValueSpinner_2.Value;
        
            switch app.ConfigurecamerasettingsDropDown_2.Value
                case "Exposure"
                    app.exposure = newValue;
        
                case "Gain"
                    app.gain = newValue;
        
                case "Shutter"
                    app.shutter = newValue;
            end
        
            % Apply to camera
            CameraSettings(app);

          
            
        end

        % Value changed function: ValueSpinner_2
        function ValueSpinner_2ValueChanged(app, event)
            
            newValue = app.ValueSpinner_2.Value;
        
            switch app.ConfigurecamerasettingsDropDown_2.Value
                case "Exposure"
                    app.exposure = newValue;
        
                case "Gain"
                    app.gain = newValue;
        
                case "Shutter"
                    app.shutter = newValue;
            end
        
            % Apply to camera
            CameraSettings(app);

            
        end

        % Value changed function: X_AGratingEditField
        function X_AGratingEditFieldValueChanged(app, event)
            app.gxA = app.X_AGratingEditField.Value;
            
        end

        % Value changed function: Y_AGratingEditField
        function Y_AGratingEditFieldValueChanged(app, event)
            app.gyA = app.Y_AGratingEditField.Value;
            
        end

        % Value changed function: X_BGratingEditField
        function X_BGratingEditFieldValueChanged(app, event)
            app.gxB = app.X_BGratingEditField.Value;
            
        end

        % Value changed function: Y_BGratingEditField
        function Y_BGratingEditFieldValueChanged(app, event)
            app.gyB = app.Y_BGratingEditField.Value;
            
        end

        % Value changed function: EditphaseCheckBox
        function EditphaseCheckBoxValueChanged(app, event)
            
            if app.EditphaseCheckBox.Value == true
            app.PhaseShiftEditField.Enable = true;
            app.PhaseShiftEditFieldLabel.Enable = true;

                if ~isempty(app.Phase)
                    app.PhaseShiftEditField.Value = app.Phase;
                end
            end

            if app.EditphaseCheckBox.Value == false
            app.PhaseShiftEditField.Enable = false;
            app.PhaseShiftEditFieldLabel.Enable = false;
            end
            
        end

        % Value changed function: PhaseShiftEditField
        function PhaseShiftEditFieldValueChanged(app, event)
           app.Phase = app.PhaseShiftEditField.Value;
           
        end

        % Button pushed function: GenerateHologramButton
        function GenerateHologramButtonPushed(app, event)
            
        end

        % Value changed function: lEditField
        function lEditFieldValueChanged(app, event)
            app.Azimuthal_index = app.lEditField.Value;
            
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Get the file path for locating images
            pathToMLAPP = fileparts(mfilename('fullpath'));

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Color = [0.149 0.149 0.149];
            app.UIFigure.Position = [100 100 741 797];
            app.UIFigure.Name = 'MATLAB App';
            app.UIFigure.WindowStyle = 'modal';

            % Create TabGroup
            app.TabGroup = uitabgroup(app.UIFigure);
            app.TabGroup.Position = [1 1 741 797];

            % Create ManualTab
            app.ManualTab = uitab(app.TabGroup);
            app.ManualTab.Title = 'Manual';
            app.ManualTab.BackgroundColor = [0.149 0.149 0.149];

            % Create TabGroup2
            app.TabGroup2 = uitabgroup(app.ManualTab);
            app.TabGroup2.Position = [1 1 740 772];

            % Create TakedataTab_2
            app.TakedataTab_2 = uitab(app.TabGroup2);
            app.TakedataTab_2.Title = 'Take data';
            app.TakedataTab_2.BackgroundColor = [0.149 0.149 0.149];

            % Create GridLayout
            app.GridLayout = uigridlayout(app.TakedataTab_2);
            app.GridLayout.ColumnWidth = {'1x', '1.05x'};
            app.GridLayout.RowHeight = {140, '1x'};
            app.GridLayout.ColumnSpacing = 5;
            app.GridLayout.RowSpacing = 5;
            app.GridLayout.Padding = [0 0 0 0];
            app.GridLayout.BackgroundColor = [0.149 0.149 0.149];

            % Create ArduinoConnectionPanel
            app.ArduinoConnectionPanel = uipanel(app.GridLayout);
            app.ArduinoConnectionPanel.Title = 'Arduino Connection';
            app.ArduinoConnectionPanel.Layout.Row = 1;
            app.ArduinoConnectionPanel.Layout.Column = 1;
            app.ArduinoConnectionPanel.FontWeight = 'bold';

            % Create ConfigurationGrid
            app.ConfigurationGrid = uigridlayout(app.ArduinoConnectionPanel);
            app.ConfigurationGrid.ColumnWidth = {'1x', 23, '1x', 23};
            app.ConfigurationGrid.RowHeight = {'1x', '1x', '1x'};

            % Create SerialportDropDownLabel
            app.SerialportDropDownLabel = uilabel(app.ConfigurationGrid);
            app.SerialportDropDownLabel.Layout.Row = 1;
            app.SerialportDropDownLabel.Layout.Column = [1 2];
            app.SerialportDropDownLabel.Text = 'Serial port';

            % Create SerialportDropDown
            app.SerialportDropDown = uidropdown(app.ConfigurationGrid);
            app.SerialportDropDown.Items = {};
            app.SerialportDropDown.Placeholder = 'Select...';
            app.SerialportDropDown.Layout.Row = 1;
            app.SerialportDropDown.Layout.Column = 3;
            app.SerialportDropDown.Value = {};

            % Create RefreshButton
            app.RefreshButton = uibutton(app.ConfigurationGrid, 'push');
            app.RefreshButton.Layout.Row = 1;
            app.RefreshButton.Layout.Column = 4;
            app.RefreshButton.Text = '';
            app.RefreshButton.Icon = fullfile(pathToMLAPP, 'refresh.svg');

            % Create BaudrateDropDownLabel
            app.BaudrateDropDownLabel = uilabel(app.ConfigurationGrid);
            app.BaudrateDropDownLabel.Layout.Row = 2;
            app.BaudrateDropDownLabel.Layout.Column = [1 2];
            app.BaudrateDropDownLabel.Text = 'Baud rate';

            % Create BaudrateDropDown
            app.BaudrateDropDown = uidropdown(app.ConfigurationGrid);
            app.BaudrateDropDown.Items = {'4800', '9600', '19200', '115200'};
            app.BaudrateDropDown.Editable = 'on';
            app.BaudrateDropDown.BackgroundColor = [1 1 1];
            app.BaudrateDropDown.Placeholder = 'Select...';
            app.BaudrateDropDown.Layout.Row = 2;
            app.BaudrateDropDown.Layout.Column = 3;
            app.BaudrateDropDown.Value = '4800';

            % Create ConnectButton
            app.ConnectButton = uibutton(app.ConfigurationGrid, 'push');
            app.ConnectButton.Layout.Row = 3;
            app.ConnectButton.Layout.Column = [1 2];
            app.ConnectButton.Text = 'Connect';

            % Create DisconnectButton
            app.DisconnectButton = uibutton(app.ConfigurationGrid, 'push');
            app.DisconnectButton.Enable = 'off';
            app.DisconnectButton.Layout.Row = 3;
            app.DisconnectButton.Layout.Column = [3 4];
            app.DisconnectButton.Text = 'Disconnect';

            % Create FileLoggingPanel
            app.FileLoggingPanel = uipanel(app.GridLayout);
            app.FileLoggingPanel.Title = 'File Logging';
            app.FileLoggingPanel.Layout.Row = 1;
            app.FileLoggingPanel.Layout.Column = 2;
            app.FileLoggingPanel.FontWeight = 'bold';

            % Create FileLoggingGrid
            app.FileLoggingGrid = uigridlayout(app.FileLoggingPanel);
            app.FileLoggingGrid.ColumnWidth = {'1x', 23, '1x', 80};
            app.FileLoggingGrid.RowHeight = {'1x', '1x', '1x'};

            % Create SaveToEditFieldLabel
            app.SaveToEditFieldLabel = uilabel(app.FileLoggingGrid);
            app.SaveToEditFieldLabel.Layout.Row = 1;
            app.SaveToEditFieldLabel.Layout.Column = [1 2];
            app.SaveToEditFieldLabel.Text = 'Save To: ';

            % Create SaveToEditField
            app.SaveToEditField = uieditfield(app.FileLoggingGrid, 'text');
            app.SaveToEditField.Layout.Row = 2;
            app.SaveToEditField.Layout.Column = 1;
            app.SaveToEditField.Value = 'File Location';

            % Create EnterButton
            app.EnterButton = uibutton(app.FileLoggingGrid, 'push');
            app.EnterButton.Layout.Row = 3;
            app.EnterButton.Layout.Column = 3;
            app.EnterButton.Text = 'Enter';

            % Create GridLayout5
            app.GridLayout5 = uigridlayout(app.GridLayout);
            app.GridLayout5.ColumnWidth = {'1x'};
            app.GridLayout5.RowHeight = {140, 153, '1x'};
            app.GridLayout5.ColumnSpacing = 0;
            app.GridLayout5.Padding = [0 0 0 5];
            app.GridLayout5.Layout.Row = 2;
            app.GridLayout5.Layout.Column = 1;
            app.GridLayout5.BackgroundColor = [0.149 0.149 0.149];

            % Create CameraConfigurationPanel_3
            app.CameraConfigurationPanel_3 = uipanel(app.GridLayout5);
            app.CameraConfigurationPanel_3.Title = 'Camera Configuration';
            app.CameraConfigurationPanel_3.Layout.Row = 1;
            app.CameraConfigurationPanel_3.Layout.Column = 1;
            app.CameraConfigurationPanel_3.FontWeight = 'bold';

            % Create GridLayout6_5
            app.GridLayout6_5 = uigridlayout(app.CameraConfigurationPanel_3);
            app.GridLayout6_5.RowHeight = {20, 20, 20, '1x'};
            app.GridLayout6_5.ColumnSpacing = 3;
            app.GridLayout6_5.RowSpacing = 3;

            % Create ConfigurecamerasettingsDropDownLabel
            app.ConfigurecamerasettingsDropDownLabel = uilabel(app.GridLayout6_5);
            app.ConfigurecamerasettingsDropDownLabel.Layout.Row = 3;
            app.ConfigurecamerasettingsDropDownLabel.Layout.Column = 1;
            app.ConfigurecamerasettingsDropDownLabel.Text = 'Configure camera settings';

            % Create ConfigurecamerasettingsDropDown
            app.ConfigurecamerasettingsDropDown = uidropdown(app.GridLayout6_5);
            app.ConfigurecamerasettingsDropDown.Items = {'Exposure', 'Gain', 'Shutter'};
            app.ConfigurecamerasettingsDropDown.Layout.Row = 3;
            app.ConfigurecamerasettingsDropDown.Layout.Column = 2;
            app.ConfigurecamerasettingsDropDown.Value = 'Exposure';

            % Create ValueSpinnerLabel
            app.ValueSpinnerLabel = uilabel(app.GridLayout6_5);
            app.ValueSpinnerLabel.HorizontalAlignment = 'right';
            app.ValueSpinnerLabel.Layout.Row = 4;
            app.ValueSpinnerLabel.Layout.Column = 1;
            app.ValueSpinnerLabel.Text = 'Value';

            % Create ValueSpinner
            app.ValueSpinner = uispinner(app.GridLayout6_5);
            app.ValueSpinner.Step = 0.1;
            app.ValueSpinner.Limits = [0 50];
            app.ValueSpinner.Layout.Row = 4;
            app.ValueSpinner.Layout.Column = 2;

            % Create CameraDropDownLabel
            app.CameraDropDownLabel = uilabel(app.GridLayout6_5);
            app.CameraDropDownLabel.Layout.Row = 1;
            app.CameraDropDownLabel.Layout.Column = 1;
            app.CameraDropDownLabel.Text = 'Camera';

            % Create CameraDropDown
            app.CameraDropDown = uidropdown(app.GridLayout6_5);
            app.CameraDropDown.Items = {'Please wait'};
            app.CameraDropDown.Layout.Row = 1;
            app.CameraDropDown.Layout.Column = 2;
            app.CameraDropDown.Value = 'Please wait';

            % Create ConnectButton_2
            app.ConnectButton_2 = uibutton(app.GridLayout6_5, 'push');
            app.ConnectButton_2.Layout.Row = 2;
            app.ConnectButton_2.Layout.Column = 1;
            app.ConnectButton_2.Text = 'Connect';

            % Create DisconnectButton_2
            app.DisconnectButton_2 = uibutton(app.GridLayout6_5, 'push');
            app.DisconnectButton_2.Layout.Row = 2;
            app.DisconnectButton_2.Layout.Column = 2;
            app.DisconnectButton_2.Text = 'Disconnect';

            % Create DMDConfigurationPanel
            app.DMDConfigurationPanel = uipanel(app.GridLayout5);
            app.DMDConfigurationPanel.Title = 'DMD Configuration';
            app.DMDConfigurationPanel.Layout.Row = 2;
            app.DMDConfigurationPanel.Layout.Column = 1;
            app.DMDConfigurationPanel.FontWeight = 'bold';

            % Create GridLayout6
            app.GridLayout6 = uigridlayout(app.DMDConfigurationPanel);
            app.GridLayout6.RowHeight = {'1x'};
            app.GridLayout6.ColumnSpacing = 3;
            app.GridLayout6.RowSpacing = 3;

            % Create ShiftsPanel
            app.ShiftsPanel = uipanel(app.GridLayout6);
            app.ShiftsPanel.TitlePosition = 'centertop';
            app.ShiftsPanel.Title = 'Shifts';
            app.ShiftsPanel.Layout.Row = 1;
            app.ShiftsPanel.Layout.Column = 2;

            % Create GridLayout8
            app.GridLayout8 = uigridlayout(app.ShiftsPanel);
            app.GridLayout8.RowHeight = {20, 20};

            % Create XShiftSpinnerLabel
            app.XShiftSpinnerLabel = uilabel(app.GridLayout8);
            app.XShiftSpinnerLabel.Layout.Row = 1;
            app.XShiftSpinnerLabel.Layout.Column = 1;
            app.XShiftSpinnerLabel.Text = 'X Shift';

            % Create XShiftSpinner
            app.XShiftSpinner = uispinner(app.GridLayout8);
            app.XShiftSpinner.Layout.Row = 1;
            app.XShiftSpinner.Layout.Column = 2;

            % Create YShiftSpinnerLabel
            app.YShiftSpinnerLabel = uilabel(app.GridLayout8);
            app.YShiftSpinnerLabel.Layout.Row = 2;
            app.YShiftSpinnerLabel.Layout.Column = 1;
            app.YShiftSpinnerLabel.Text = 'Y Shift';

            % Create YShiftSpinner
            app.YShiftSpinner = uispinner(app.GridLayout8);
            app.YShiftSpinner.Layout.Row = 2;
            app.YShiftSpinner.Layout.Column = 2;

            % Create GratingsPanel
            app.GratingsPanel = uipanel(app.GridLayout6);
            app.GratingsPanel.TitlePosition = 'centertop';
            app.GratingsPanel.Title = 'Gratings';
            app.GratingsPanel.Layout.Row = 1;
            app.GratingsPanel.Layout.Column = 1;

            % Create GridLayout7
            app.GridLayout7 = uigridlayout(app.GratingsPanel);
            app.GridLayout7.RowHeight = {20, 20};

            % Create XGratingSpinnerLabel
            app.XGratingSpinnerLabel = uilabel(app.GridLayout7);
            app.XGratingSpinnerLabel.Layout.Row = 1;
            app.XGratingSpinnerLabel.Layout.Column = 1;
            app.XGratingSpinnerLabel.Text = 'X Grating';

            % Create XGratingSpinner
            app.XGratingSpinner = uispinner(app.GridLayout7);
            app.XGratingSpinner.Layout.Row = 1;
            app.XGratingSpinner.Layout.Column = 2;

            % Create YGratingSpinnerLabel
            app.YGratingSpinnerLabel = uilabel(app.GridLayout7);
            app.YGratingSpinnerLabel.Layout.Row = 2;
            app.YGratingSpinnerLabel.Layout.Column = 1;
            app.YGratingSpinnerLabel.Text = 'Y Grating';

            % Create YGratingSpinner
            app.YGratingSpinner = uispinner(app.GridLayout7);
            app.YGratingSpinner.Layout.Row = 2;
            app.YGratingSpinner.Layout.Column = 2;

            % Create GridLayout12
            app.GridLayout12 = uigridlayout(app.GridLayout);
            app.GridLayout12.RowHeight = {'100x', 25, 25, 25, 70};
            app.GridLayout12.ColumnSpacing = 1;
            app.GridLayout12.Padding = [1 1 10 1];
            app.GridLayout12.Layout.Row = 2;
            app.GridLayout12.Layout.Column = 2;
            app.GridLayout12.BackgroundColor = [0.149 0.149 0.149];

            % Create UIAxes2
            app.UIAxes2 = uiaxes(app.GridLayout12);
            title(app.UIAxes2, 'Title')
            app.UIAxes2.PlotBoxAspectRatio = [1 1 1];
            app.UIAxes2.XTick = [];
            app.UIAxes2.YTick = [];
            app.UIAxes2.Box = 'on';
            app.UIAxes2.Layout.Row = 1;
            app.UIAxes2.Layout.Column = [1 2];

            % Create TakeManualQSTDataButton
            app.TakeManualQSTDataButton = uibutton(app.GridLayout12, 'push');
            app.TakeManualQSTDataButton.Layout.Row = 3;
            app.TakeManualQSTDataButton.Layout.Column = 2;
            app.TakeManualQSTDataButton.Text = 'Take Manual QST Data';

            % Create TakeManualBellDataButton
            app.TakeManualBellDataButton = uibutton(app.GridLayout12, 'push');
            app.TakeManualBellDataButton.Layout.Row = 4;
            app.TakeManualBellDataButton.Layout.Column = 2;
            app.TakeManualBellDataButton.Text = 'Take Manual Bell Data';

            % Create AcquiringdataPanel_2
            app.AcquiringdataPanel_2 = uipanel(app.GridLayout12);
            app.AcquiringdataPanel_2.TitlePosition = 'centertop';
            app.AcquiringdataPanel_2.Title = 'Acquiring data';
            app.AcquiringdataPanel_2.Visible = 'off';
            app.AcquiringdataPanel_2.BackgroundColor = [0.8 0.8 0.8];
            app.AcquiringdataPanel_2.Layout.Row = 5;
            app.AcquiringdataPanel_2.Layout.Column = [1 2];
            app.AcquiringdataPanel_2.FontWeight = 'bold';

            % Create GridLayout15_3
            app.GridLayout15_3 = uigridlayout(app.AcquiringdataPanel_2);
            app.GridLayout15_3.ColumnWidth = {'1x'};
            app.GridLayout15_3.RowHeight = {30};

            % Create TextArea_2
            app.TextArea_2 = uitextarea(app.GridLayout15_3);
            app.TextArea_2.HorizontalAlignment = 'center';
            app.TextArea_2.Layout.Row = 1;
            app.TextArea_2.Layout.Column = 1;

            % Create TakeManualStokesDataButton
            app.TakeManualStokesDataButton = uibutton(app.GridLayout12, 'push');
            app.TakeManualStokesDataButton.Layout.Row = 2;
            app.TakeManualStokesDataButton.Layout.Column = 2;
            app.TakeManualStokesDataButton.Text = 'Take Manual Stokes Data';

            % Create AnalyzedataTab_2
            app.AnalyzedataTab_2 = uitab(app.TabGroup2);
            app.AnalyzedataTab_2.Title = 'Analyze data';
            app.AnalyzedataTab_2.BackgroundColor = [0.149 0.149 0.149];

            % Create GridLayout2
            app.GridLayout2 = uigridlayout(app.AnalyzedataTab_2);
            app.GridLayout2.RowHeight = {140, '2.5x'};
            app.GridLayout2.ColumnSpacing = 0;
            app.GridLayout2.RowSpacing = 0;
            app.GridLayout2.Padding = [0 0 0 0];
            app.GridLayout2.BackgroundColor = [0.149 0.149 0.149];

            % Create FileLoggingPanel_2
            app.FileLoggingPanel_2 = uipanel(app.GridLayout2);
            app.FileLoggingPanel_2.Title = 'File Logging';
            app.FileLoggingPanel_2.Layout.Row = 1;
            app.FileLoggingPanel_2.Layout.Column = 1;
            app.FileLoggingPanel_2.FontWeight = 'bold';

            % Create FileLoggingGrid_2
            app.FileLoggingGrid_2 = uigridlayout(app.FileLoggingPanel_2);
            app.FileLoggingGrid_2.ColumnWidth = {'1x', 23, '1x', 80};
            app.FileLoggingGrid_2.RowHeight = {'1x', '1x', '1x'};

            % Create StartButton_2
            app.StartButton_2 = uibutton(app.FileLoggingGrid_2, 'push');
            app.StartButton_2.Layout.Row = 3;
            app.StartButton_2.Layout.Column = [1 2];
            app.StartButton_2.Text = 'Start';

            % Create StopButton_2
            app.StopButton_2 = uibutton(app.FileLoggingGrid_2, 'push');
            app.StopButton_2.Enable = 'off';
            app.StopButton_2.Layout.Row = 3;
            app.StopButton_2.Layout.Column = [3 4];
            app.StopButton_2.Text = 'Stop';

            % Create DigitalTab
            app.DigitalTab = uitab(app.TabGroup);
            app.DigitalTab.Title = 'Digital';
            app.DigitalTab.BackgroundColor = [0.149 0.149 0.149];

            % Create TabGroup3
            app.TabGroup3 = uitabgroup(app.DigitalTab);
            app.TabGroup3.Position = [0 2 741 771];

            % Create TakedataTab
            app.TakedataTab = uitab(app.TabGroup3);
            app.TakedataTab.Title = 'Take data';
            app.TakedataTab.BackgroundColor = [0.149 0.149 0.149];

            % Create GridLayout3
            app.GridLayout3 = uigridlayout(app.TakedataTab);
            app.GridLayout3.ColumnWidth = {'1x', '1.05x'};
            app.GridLayout3.RowHeight = {130, '2.5x'};
            app.GridLayout3.ColumnSpacing = 5;
            app.GridLayout3.RowSpacing = 5;
            app.GridLayout3.Padding = [0 0 0 0];
            app.GridLayout3.BackgroundColor = [0.149 0.149 0.149];

            % Create FileLoggingPanel_3
            app.FileLoggingPanel_3 = uipanel(app.GridLayout3);
            app.FileLoggingPanel_3.Title = 'File Logging';
            app.FileLoggingPanel_3.BackgroundColor = [0.302 0.7451 0.9333];
            app.FileLoggingPanel_3.Layout.Row = 1;
            app.FileLoggingPanel_3.Layout.Column = 2;
            app.FileLoggingPanel_3.FontWeight = 'bold';

            % Create FileLoggingGrid_3
            app.FileLoggingGrid_3 = uigridlayout(app.FileLoggingPanel_3);
            app.FileLoggingGrid_3.ColumnWidth = {'1x', '1x', 23, '1x', 80};
            app.FileLoggingGrid_3.RowHeight = {'1x', '1x', '1x'};

            % Create PathEditFieldLabel
            app.PathEditFieldLabel = uilabel(app.FileLoggingGrid_3);
            app.PathEditFieldLabel.Layout.Row = 2;
            app.PathEditFieldLabel.Layout.Column = 1;
            app.PathEditFieldLabel.Text = 'Path:';

            % Create SaveLocationEditField
            app.SaveLocationEditField = uieditfield(app.FileLoggingGrid_3, 'text');
            app.SaveLocationEditField.Layout.Row = 2;
            app.SaveLocationEditField.Layout.Column = [2 5];
            app.SaveLocationEditField.Value = 'File Location';

            % Create TextArea_3Label_2
            app.TextArea_3Label_2 = uilabel(app.FileLoggingGrid_3);
            app.TextArea_3Label_2.Layout.Row = 1;
            app.TextArea_3Label_2.Layout.Column = [1 2];
            app.TextArea_3Label_2.Text = 'Save location:';

            % Create GridLayout13
            app.GridLayout13 = uigridlayout(app.GridLayout3);
            app.GridLayout13.RowHeight = {'100x', 300, '100x', 25, 25, 25, 70};
            app.GridLayout13.ColumnSpacing = 0;
            app.GridLayout13.Padding = [1 1 15 1];
            app.GridLayout13.Layout.Row = 2;
            app.GridLayout13.Layout.Column = 2;
            app.GridLayout13.BackgroundColor = [0.149 0.149 0.149];

            % Create UIAxes
            app.UIAxes = uiaxes(app.GridLayout13);
            title(app.UIAxes, 'Camera Disconnected')
            app.UIAxes.AmbientLightColor = [0 0.4471 0.7412];
            app.UIAxes.FontWeight = 'bold';
            app.UIAxes.XTick = [];
            app.UIAxes.YTick = [];
            app.UIAxes.YTickLabel = '';
            app.UIAxes.ZColor = [1 0 0];
            app.UIAxes.BoxStyle = 'full';
            app.UIAxes.LineWidth = 4;
            app.UIAxes.Color = 'none';
            app.UIAxes.GridColor = [0 0.4471 0.7412];
            app.UIAxes.MinorGridColor = [0 0.4471 0.7412];
            app.UIAxes.Box = 'on';
            app.UIAxes.Layout.Row = [1 3];
            app.UIAxes.Layout.Column = [1 2];

            % Create TakeDigitalStokesDataButton
            app.TakeDigitalStokesDataButton = uibutton(app.GridLayout13, 'push');
            app.TakeDigitalStokesDataButton.ButtonPushedFcn = createCallbackFcn(app, @DigitalTakeStokesButton, true);
            app.TakeDigitalStokesDataButton.Layout.Row = 4;
            app.TakeDigitalStokesDataButton.Layout.Column = 2;
            app.TakeDigitalStokesDataButton.Text = 'Take Digital Stokes Data';

            % Create TakeDigitalQSTDataButton
            app.TakeDigitalQSTDataButton = uibutton(app.GridLayout13, 'push');
            app.TakeDigitalQSTDataButton.ButtonPushedFcn = createCallbackFcn(app, @DigitalTakeQSTData, true);
            app.TakeDigitalQSTDataButton.Layout.Row = 5;
            app.TakeDigitalQSTDataButton.Layout.Column = 2;
            app.TakeDigitalQSTDataButton.Text = 'Take Digital QST Data';

            % Create TakeDigitalBellDataButton
            app.TakeDigitalBellDataButton = uibutton(app.GridLayout13, 'push');
            app.TakeDigitalBellDataButton.ButtonPushedFcn = createCallbackFcn(app, @DigitalTakeBellData, true);
            app.TakeDigitalBellDataButton.Layout.Row = 6;
            app.TakeDigitalBellDataButton.Layout.Column = 2;
            app.TakeDigitalBellDataButton.Text = 'Take Digital Bell Data';

            % Create AcquiringdataPanel
            app.AcquiringdataPanel = uipanel(app.GridLayout13);
            app.AcquiringdataPanel.TitlePosition = 'centertop';
            app.AcquiringdataPanel.Title = 'Acquiring data';
            app.AcquiringdataPanel.Visible = 'off';
            app.AcquiringdataPanel.BackgroundColor = [0.8 0.8 0.8];
            app.AcquiringdataPanel.Layout.Row = 7;
            app.AcquiringdataPanel.Layout.Column = [1 2];
            app.AcquiringdataPanel.FontWeight = 'bold';

            % Create GridLayout15
            app.GridLayout15 = uigridlayout(app.AcquiringdataPanel);
            app.GridLayout15.ColumnWidth = {'1x'};
            app.GridLayout15.RowHeight = {30};

            % Create TextArea
            app.TextArea = uitextarea(app.GridLayout15);
            app.TextArea.HorizontalAlignment = 'center';
            app.TextArea.Layout.Row = 1;
            app.TextArea.Layout.Column = 1;

            % Create CameraConfigurationPanel_4
            app.CameraConfigurationPanel_4 = uipanel(app.GridLayout3);
            app.CameraConfigurationPanel_4.Title = 'Camera Configuration';
            app.CameraConfigurationPanel_4.BackgroundColor = [0.302 0.7451 0.9333];
            app.CameraConfigurationPanel_4.Layout.Row = 1;
            app.CameraConfigurationPanel_4.Layout.Column = 1;
            app.CameraConfigurationPanel_4.FontWeight = 'bold';

            % Create GridLayout6_6
            app.GridLayout6_6 = uigridlayout(app.CameraConfigurationPanel_4);
            app.GridLayout6_6.RowHeight = {'1x', '1x', '1x', '1x'};
            app.GridLayout6_6.ColumnSpacing = 3;
            app.GridLayout6_6.RowSpacing = 3;

            % Create ConfigurecamerasettingsDropDown_2Label
            app.ConfigurecamerasettingsDropDown_2Label = uilabel(app.GridLayout6_6);
            app.ConfigurecamerasettingsDropDown_2Label.Enable = 'off';
            app.ConfigurecamerasettingsDropDown_2Label.Layout.Row = 3;
            app.ConfigurecamerasettingsDropDown_2Label.Layout.Column = 1;
            app.ConfigurecamerasettingsDropDown_2Label.Text = 'Configure camera settings';

            % Create ConfigurecamerasettingsDropDown_2
            app.ConfigurecamerasettingsDropDown_2 = uidropdown(app.GridLayout6_6);
            app.ConfigurecamerasettingsDropDown_2.Items = {'Selection', 'Exposure', 'Gain', 'Shutter'};
            app.ConfigurecamerasettingsDropDown_2.ValueChangedFcn = createCallbackFcn(app, @ConfigurecamerasettingsDropDown_2ValueChanged, true);
            app.ConfigurecamerasettingsDropDown_2.Enable = 'off';
            app.ConfigurecamerasettingsDropDown_2.Layout.Row = 3;
            app.ConfigurecamerasettingsDropDown_2.Layout.Column = 2;
            app.ConfigurecamerasettingsDropDown_2.Value = 'Selection';

            % Create ValueSpinner_2Label
            app.ValueSpinner_2Label = uilabel(app.GridLayout6_6);
            app.ValueSpinner_2Label.HorizontalAlignment = 'right';
            app.ValueSpinner_2Label.Enable = 'off';
            app.ValueSpinner_2Label.Layout.Row = 4;
            app.ValueSpinner_2Label.Layout.Column = 1;
            app.ValueSpinner_2Label.Text = 'Value';

            % Create ValueSpinner_2
            app.ValueSpinner_2 = uispinner(app.GridLayout6_6);
            app.ValueSpinner_2.Step = 0.1;
            app.ValueSpinner_2.ValueChangingFcn = createCallbackFcn(app, @ValueSpinner_2ValueChanging, true);
            app.ValueSpinner_2.Limits = [0 50];
            app.ValueSpinner_2.ValueChangedFcn = createCallbackFcn(app, @ValueSpinner_2ValueChanged, true);
            app.ValueSpinner_2.Enable = 'off';
            app.ValueSpinner_2.Layout.Row = 4;
            app.ValueSpinner_2.Layout.Column = 2;

            % Create ConnectButton_3
            app.ConnectButton_3 = uibutton(app.GridLayout6_6, 'push');
            app.ConnectButton_3.ButtonPushedFcn = createCallbackFcn(app, @DigitalCameraConnectButton, true);
            app.ConnectButton_3.BackgroundColor = [0 1 0];
            app.ConnectButton_3.Layout.Row = 1;
            app.ConnectButton_3.Layout.Column = 1;
            app.ConnectButton_3.Text = 'Connect';

            % Create DisconnectedButton
            app.DisconnectedButton = uibutton(app.GridLayout6_6, 'push');
            app.DisconnectedButton.ButtonPushedFcn = createCallbackFcn(app, @DigitalCameraDisconnectButton, true);
            app.DisconnectedButton.BackgroundColor = [1 0 0];
            app.DisconnectedButton.Enable = 'off';
            app.DisconnectedButton.Layout.Row = 1;
            app.DisconnectedButton.Layout.Column = 2;
            app.DisconnectedButton.Text = 'Disconnected';

            % Create CameraDropDown_2Label
            app.CameraDropDown_2Label = uilabel(app.GridLayout6_6);
            app.CameraDropDown_2Label.Enable = 'off';
            app.CameraDropDown_2Label.Layout.Row = 2;
            app.CameraDropDown_2Label.Layout.Column = 1;
            app.CameraDropDown_2Label.Text = 'Camera';

            % Create CameraDropDown_2
            app.CameraDropDown_2 = uidropdown(app.GridLayout6_6);
            app.CameraDropDown_2.Items = {'Please wait'};
            app.CameraDropDown_2.Enable = 'off';
            app.CameraDropDown_2.Layout.Row = 2;
            app.CameraDropDown_2.Layout.Column = 2;
            app.CameraDropDown_2.Value = 'Please wait';

            % Create GridLayout5_2
            app.GridLayout5_2 = uigridlayout(app.GridLayout3);
            app.GridLayout5_2.ColumnWidth = {'1x'};
            app.GridLayout5_2.RowHeight = {280, '1x', '1x', '1x'};
            app.GridLayout5_2.ColumnSpacing = 0;
            app.GridLayout5_2.Padding = [0 0 0 5];
            app.GridLayout5_2.Layout.Row = 2;
            app.GridLayout5_2.Layout.Column = 1;
            app.GridLayout5_2.BackgroundColor = [0.149 0.149 0.149];

            % Create UIAxes3
            app.UIAxes3 = uiaxes(app.GridLayout5_2);
            title(app.UIAxes3, 'DIsplayed Hologram')
            app.UIAxes3.FontWeight = 'bold';
            app.UIAxes3.XTick = [];
            app.UIAxes3.YTick = [];
            app.UIAxes3.LineWidth = 2;
            app.UIAxes3.Color = 'none';
            app.UIAxes3.Box = 'on';
            app.UIAxes3.Layout.Row = [3 4];
            app.UIAxes3.Layout.Column = 1;

            % Create DMDConfigurationPanel_2
            app.DMDConfigurationPanel_2 = uipanel(app.GridLayout5_2);
            app.DMDConfigurationPanel_2.Title = 'DMD Configuration';
            app.DMDConfigurationPanel_2.BackgroundColor = [0.302 0.7451 0.9333];
            app.DMDConfigurationPanel_2.Layout.Row = [1 2];
            app.DMDConfigurationPanel_2.Layout.Column = 1;
            app.DMDConfigurationPanel_2.FontWeight = 'bold';

            % Create GridLayout6_2
            app.GridLayout6_2 = uigridlayout(app.DMDConfigurationPanel_2);
            app.GridLayout6_2.RowHeight = {140, 85, 60, '1x'};
            app.GridLayout6_2.ColumnSpacing = 3;

            % Create ShiftsPanel_2
            app.ShiftsPanel_2 = uipanel(app.GridLayout6_2);
            app.ShiftsPanel_2.TitlePosition = 'centertop';
            app.ShiftsPanel_2.Title = 'Shifts';
            app.ShiftsPanel_2.BackgroundColor = [0.302 0.7451 0.9333];
            app.ShiftsPanel_2.Layout.Row = 1;
            app.ShiftsPanel_2.Layout.Column = 2;
            app.ShiftsPanel_2.FontWeight = 'bold';

            % Create GridLayout8_2
            app.GridLayout8_2 = uigridlayout(app.ShiftsPanel_2);
            app.GridLayout8_2.RowHeight = {'1x', '1x', '1x', '1x'};

            % Create X_AShiftEditFieldLabel
            app.X_AShiftEditFieldLabel = uilabel(app.GridLayout8_2);
            app.X_AShiftEditFieldLabel.Layout.Row = 1;
            app.X_AShiftEditFieldLabel.Layout.Column = 1;
            app.X_AShiftEditFieldLabel.Text = 'X_A Shift';

            % Create X_AShiftEditField
            app.X_AShiftEditField = uieditfield(app.GridLayout8_2, 'numeric');
            app.X_AShiftEditField.Layout.Row = 1;
            app.X_AShiftEditField.Layout.Column = 2;

            % Create Y_AShiftEditFieldLabel
            app.Y_AShiftEditFieldLabel = uilabel(app.GridLayout8_2);
            app.Y_AShiftEditFieldLabel.Layout.Row = 2;
            app.Y_AShiftEditFieldLabel.Layout.Column = 1;
            app.Y_AShiftEditFieldLabel.Text = 'Y_A Shift';

            % Create Y_AShiftEditField
            app.Y_AShiftEditField = uieditfield(app.GridLayout8_2, 'numeric');
            app.Y_AShiftEditField.Layout.Row = 2;
            app.Y_AShiftEditField.Layout.Column = 2;

            % Create Y_BShiftEditFieldLabel
            app.Y_BShiftEditFieldLabel = uilabel(app.GridLayout8_2);
            app.Y_BShiftEditFieldLabel.Layout.Row = 4;
            app.Y_BShiftEditFieldLabel.Layout.Column = 1;
            app.Y_BShiftEditFieldLabel.Text = 'Y_B Shift';

            % Create Y_BShiftEditField
            app.Y_BShiftEditField = uieditfield(app.GridLayout8_2, 'numeric');
            app.Y_BShiftEditField.Layout.Row = 4;
            app.Y_BShiftEditField.Layout.Column = 2;

            % Create X_BShiftEditFieldLabel
            app.X_BShiftEditFieldLabel = uilabel(app.GridLayout8_2);
            app.X_BShiftEditFieldLabel.Layout.Row = 3;
            app.X_BShiftEditFieldLabel.Layout.Column = 1;
            app.X_BShiftEditFieldLabel.Text = 'X_B Shift';

            % Create X_BShiftEditField
            app.X_BShiftEditField = uieditfield(app.GridLayout8_2, 'numeric');
            app.X_BShiftEditField.Layout.Row = 3;
            app.X_BShiftEditField.Layout.Column = 2;

            % Create GratingsPanel_2
            app.GratingsPanel_2 = uipanel(app.GridLayout6_2);
            app.GratingsPanel_2.TitlePosition = 'centertop';
            app.GratingsPanel_2.Title = 'Gratings';
            app.GratingsPanel_2.BackgroundColor = [0.302 0.7451 0.9333];
            app.GratingsPanel_2.Layout.Row = 1;
            app.GratingsPanel_2.Layout.Column = 1;
            app.GratingsPanel_2.FontWeight = 'bold';

            % Create GridLayout7_2
            app.GridLayout7_2 = uigridlayout(app.GratingsPanel_2);
            app.GridLayout7_2.RowHeight = {'1x', '1x', '1x', '1x'};

            % Create X_AGratingEditFieldLabel
            app.X_AGratingEditFieldLabel = uilabel(app.GridLayout7_2);
            app.X_AGratingEditFieldLabel.Layout.Row = 1;
            app.X_AGratingEditFieldLabel.Layout.Column = 1;
            app.X_AGratingEditFieldLabel.Text = 'X_A Grating';

            % Create X_AGratingEditField
            app.X_AGratingEditField = uieditfield(app.GridLayout7_2, 'numeric');
            app.X_AGratingEditField.ValueChangedFcn = createCallbackFcn(app, @X_AGratingEditFieldValueChanged, true);
            app.X_AGratingEditField.Layout.Row = 1;
            app.X_AGratingEditField.Layout.Column = 2;
            app.X_AGratingEditField.Value = 10000;

            % Create Y_AGratingEditFieldLabel
            app.Y_AGratingEditFieldLabel = uilabel(app.GridLayout7_2);
            app.Y_AGratingEditFieldLabel.Layout.Row = 2;
            app.Y_AGratingEditFieldLabel.Layout.Column = 1;
            app.Y_AGratingEditFieldLabel.Text = 'Y_A Grating';

            % Create Y_AGratingEditField
            app.Y_AGratingEditField = uieditfield(app.GridLayout7_2, 'numeric');
            app.Y_AGratingEditField.ValueChangedFcn = createCallbackFcn(app, @Y_AGratingEditFieldValueChanged, true);
            app.Y_AGratingEditField.Layout.Row = 2;
            app.Y_AGratingEditField.Layout.Column = 2;
            app.Y_AGratingEditField.Value = 10000;

            % Create X_BGratingEditFieldLabel
            app.X_BGratingEditFieldLabel = uilabel(app.GridLayout7_2);
            app.X_BGratingEditFieldLabel.Layout.Row = 3;
            app.X_BGratingEditFieldLabel.Layout.Column = 1;
            app.X_BGratingEditFieldLabel.Text = 'X_B Grating';

            % Create X_BGratingEditField
            app.X_BGratingEditField = uieditfield(app.GridLayout7_2, 'numeric');
            app.X_BGratingEditField.ValueChangedFcn = createCallbackFcn(app, @X_BGratingEditFieldValueChanged, true);
            app.X_BGratingEditField.Layout.Row = 3;
            app.X_BGratingEditField.Layout.Column = 2;
            app.X_BGratingEditField.Value = 10000;

            % Create Y_BGratingEditFieldLabel
            app.Y_BGratingEditFieldLabel = uilabel(app.GridLayout7_2);
            app.Y_BGratingEditFieldLabel.Layout.Row = 4;
            app.Y_BGratingEditFieldLabel.Layout.Column = 1;
            app.Y_BGratingEditFieldLabel.Text = 'Y_B Grating';

            % Create Y_BGratingEditField
            app.Y_BGratingEditField = uieditfield(app.GridLayout7_2, 'numeric');
            app.Y_BGratingEditField.ValueChangedFcn = createCallbackFcn(app, @Y_BGratingEditFieldValueChanged, true);
            app.Y_BGratingEditField.Layout.Row = 4;
            app.Y_BGratingEditField.Layout.Column = 2;
            app.Y_BGratingEditField.Value = 10000;

            % Create PhasePanel
            app.PhasePanel = uipanel(app.GridLayout6_2);
            app.PhasePanel.Title = 'Phase';
            app.PhasePanel.BackgroundColor = [0.302 0.7451 0.9333];
            app.PhasePanel.Layout.Row = 2;
            app.PhasePanel.Layout.Column = [1 2];
            app.PhasePanel.FontWeight = 'bold';

            % Create GridLayout16
            app.GridLayout16 = uigridlayout(app.PhasePanel);

            % Create PhaseShiftEditFieldLabel
            app.PhaseShiftEditFieldLabel = uilabel(app.GridLayout16);
            app.PhaseShiftEditFieldLabel.HorizontalAlignment = 'right';
            app.PhaseShiftEditFieldLabel.Enable = 'off';
            app.PhaseShiftEditFieldLabel.Layout.Row = 2;
            app.PhaseShiftEditFieldLabel.Layout.Column = 1;
            app.PhaseShiftEditFieldLabel.Text = 'Phase Shift';

            % Create PhaseShiftEditField
            app.PhaseShiftEditField = uieditfield(app.GridLayout16, 'numeric');
            app.PhaseShiftEditField.ValueChangedFcn = createCallbackFcn(app, @PhaseShiftEditFieldValueChanged, true);
            app.PhaseShiftEditField.Enable = 'off';
            app.PhaseShiftEditField.Layout.Row = 2;
            app.PhaseShiftEditField.Layout.Column = 2;

            % Create EditphaseCheckBox
            app.EditphaseCheckBox = uicheckbox(app.GridLayout16);
            app.EditphaseCheckBox.ValueChangedFcn = createCallbackFcn(app, @EditphaseCheckBoxValueChanged, true);
            app.EditphaseCheckBox.Text = 'Edit phase';
            app.EditphaseCheckBox.WordWrap = 'on';
            app.EditphaseCheckBox.Layout.Row = 1;
            app.EditphaseCheckBox.Layout.Column = 1;

            % Create AzimuthalIndexPanel
            app.AzimuthalIndexPanel = uipanel(app.GridLayout6_2);
            app.AzimuthalIndexPanel.Title = 'Azimuthal Index';
            app.AzimuthalIndexPanel.BackgroundColor = [0.302 0.7451 0.9333];
            app.AzimuthalIndexPanel.Layout.Row = 3;
            app.AzimuthalIndexPanel.Layout.Column = [1 2];
            app.AzimuthalIndexPanel.FontWeight = 'bold';

            % Create GridLayout17
            app.GridLayout17 = uigridlayout(app.AzimuthalIndexPanel);
            app.GridLayout17.ColumnWidth = {'1x', '1x', '1x', '1x'};
            app.GridLayout17.RowHeight = {'1x'};

            % Create LLabel
            app.LLabel = uilabel(app.GridLayout17);
            app.LLabel.HorizontalAlignment = 'center';
            app.LLabel.FontName = 'Times New Roman';
            app.LLabel.FontSize = 14;
            app.LLabel.FontAngle = 'italic';
            app.LLabel.Layout.Row = 1;
            app.LLabel.Layout.Column = 1;
            app.LLabel.Text = ' l = ';

            % Create lEditField
            app.lEditField = uieditfield(app.GridLayout17, 'text');
            app.lEditField.CharacterLimits = [0 100];
            app.lEditField.InputType = 'digits';
            app.lEditField.ValueChangedFcn = createCallbackFcn(app, @lEditFieldValueChanged, true);
            app.lEditField.HorizontalAlignment = 'center';
            app.lEditField.Layout.Row = 1;
            app.lEditField.Layout.Column = 2;
            app.lEditField.Value = '1';

            % Create GenerateHologramButton
            app.GenerateHologramButton = uibutton(app.GridLayout6_2, 'push');
            app.GenerateHologramButton.ButtonPushedFcn = createCallbackFcn(app, @GenerateHologramButtonPushed, true);
            app.GenerateHologramButton.Layout.Row = 4;
            app.GenerateHologramButton.Layout.Column = [1 2];
            app.GenerateHologramButton.Text = 'Generate Hologram';

            % Create AnalyzedataTab
            app.AnalyzedataTab = uitab(app.TabGroup3);
            app.AnalyzedataTab.Title = 'Analyze data';
            app.AnalyzedataTab.BackgroundColor = [0.149 0.149 0.149];

            % Create GridLayout4
            app.GridLayout4 = uigridlayout(app.AnalyzedataTab);
            app.GridLayout4.RowHeight = {140, '2.5x'};
            app.GridLayout4.ColumnSpacing = 0;
            app.GridLayout4.RowSpacing = 0;
            app.GridLayout4.Padding = [0 0 0 0];
            app.GridLayout4.BackgroundColor = [0.149 0.149 0.149];

            % Create FileLoggingPanel_4
            app.FileLoggingPanel_4 = uipanel(app.GridLayout4);
            app.FileLoggingPanel_4.Title = 'File Logging';
            app.FileLoggingPanel_4.Layout.Row = 1;
            app.FileLoggingPanel_4.Layout.Column = 1;
            app.FileLoggingPanel_4.FontWeight = 'bold';

            % Create FileLoggingGrid_4
            app.FileLoggingGrid_4 = uigridlayout(app.FileLoggingPanel_4);
            app.FileLoggingGrid_4.ColumnWidth = {'1x', 23, '1x', 80};
            app.FileLoggingGrid_4.RowHeight = {'1x', '1x', '1x'};

            % Create StartButton_4
            app.StartButton_4 = uibutton(app.FileLoggingGrid_4, 'push');
            app.StartButton_4.Layout.Row = 3;
            app.StartButton_4.Layout.Column = [1 2];
            app.StartButton_4.Text = 'Start';

            % Create StopButton_4
            app.StopButton_4 = uibutton(app.FileLoggingGrid_4, 'push');
            app.StopButton_4.Enable = 'off';
            app.StopButton_4.Layout.Row = 3;
            app.StopButton_4.Layout.Column = [3 4];
            app.StopButton_4.Text = 'Stop';

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = Q_Ed_App_exported

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            % Execute the startup function
            runStartupFcn(app, @startupFcn)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end