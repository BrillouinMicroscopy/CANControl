classdef CANControl < handle
%CANControl control the LSM510 and AxioVert 200M via Serial communication
    properties (Access = private)
        s;  % serialPort
    end
    properties (Constant)
        mmperinc = 0.025;   % [µm per increment] constant for converting
                            %  µm to increments of focus z-position
        rangeFocus = hex2dec('FFFFFF'); % number of increments of focus
    end

    methods
        %% Constructor
        function obj = CANControl(Port,BaudRate)
            obj.s=serial(Port,'Terminator','CR','BaudRate',BaudRate);
            fopen(obj.s);
        end

        %% Destructor
        function delete (obj)
            fclose(obj.s);
            delete(obj.s);
        end
        
        %% AxioVert Focus
        % prefix 'FP'
        
        % function returns current position in Âµm
        function cP = getFocusPosition (obj)
            fprintf(obj.s, 'FPZp');         % request current position
            cP = fscanf(obj.s);             % read answer
            cP = obj.stripPrefix(cP);       % strip prefix
            cP = hex2dec(cP);               % convert hexadezimal to dezimal
            cP = cP * obj.mmperinc;         % convert to µm
        end
        
        % function sets position given in Âµm
        function setFocusPosition (obj, pos)
            nP = pos / obj.mmperinc;        % convert µm to increments
            nP = mod(nP, obj.rangeFocus);   % calculate modulus (the zero-position is always set at microscope boot;
                                            % hence negative positions are adressed calculating the modulus
            nP = dec2hex(round(nP));        % round and convert to hexadecimal
            fprintf(obj.s, ['FPZD' nP]);    % set current position
        end
        
        % function sets the scan velocity
        function setFocusVelocity (obj, vel)
            % for security limited to ~30 µm/s
            vel = abs(vel);
            if (vel > 20000)
                vel = 20000;
            end
            vel = dec2hex(vel);
            fprintf(obj.s, ['FPZG' vel]);
        end
        
        % function starts a focus scan in positive direction
        function scanFocusUp (obj)
            fprintf(obj.s, 'FPZS+');        % scan in positive direction
        end
        
        % function starts a focus scan in negative direction
        function scanFocusDown (obj)
            fprintf(obj.s, 'FPZS-');        % scan in negative direction
        end
        
        % function stops the focus scan
        function scanFocusStop (obj)
            fprintf(obj.s, 'FPZSS');        % stop the scan
        end
        
        
        %% Laser scanning module
        % prefix 'IP'
        function setCollimator1 (obj, pos)
            fprintf(obj.s,['IPCS25,' pos]);
        end
    end
        
    methods (Static)
        %% Strip
        function ret = stripPrefix (string)
            ret = string(3:end-1);
        end
    end
end