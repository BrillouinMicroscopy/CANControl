classdef init < BA_Utils.ScanControl.Utils.CANControl.com & BA_Utils.ScanControl.Utils.CANControl.Focus.config
%Focus.init controls the Stand Axiovert 200:Focus
    properties (Constant)
        umperinc = 0.025;   % [µm per increment] constant for converting
                            %  µm to increments of focus z-position
        rangeFocus = hex2dec('FFFFFF'); % number of increments of focus
    end
    properties (Dependent)
        z;
        velocity;
    end
    
    methods
        %% Constructor
        function obj = init(serial)
            obj@BA_Utils.ScanControl.Utils.CANControl.com(serial); 
        end
        
        %% Available methods
        % function returns current position in µm
        function cP = get.z (obj)
            obj.send('Zp');                 % request current position
            cP = obj.receive();
            cP = hex2dec(cP);               % convert hexadezimal to dezimal
            cP = cP * obj.umperinc;         % convert to µm
        end
        
        % function sets position given in µm
        function set.z (obj, pos)
            nP = pos / obj.umperinc;        % convert µm to increments
            nP = mod(nP, obj.rangeFocus);   % calculate modulus (the zero-position is always set at microscope boot;
                                            % hence negative positions are adressed calculating the modulus
            nP = dec2hex(round(nP), 6);     % round and convert to hexadecimal
            obj.send(['ZD' nP]);            % set current position
            obj.receive();
        end
        
        % function sets the scan velocity
        function set.velocity (obj, vel)
            % for security limited to ~30 µm/s
            vel = abs(vel);
            if (vel > 20000)
                vel = 20000;
            end
            vel = dec2hex(vel, 6);
            obj.send(['ZG' vel]);
        end
        
        % function starts a focus scan in positive direction
        function scanUp (obj)
            obj.send('ZS+');        % scan in positive direction
        end
        
        % function starts a focus scan in negative direction
        function scanDown (obj)
            obj.send('ZS-');        % scan in negative direction
        end
        
        % function stops the focus scan
        function scanStop (obj)
            obj.send('ZSS');        % stop the scan
        end
        
        % function returns the current scan status
        function stat = scanStatus (obj)
            obj.send('Zt');         % scan status
            stat = obj.receive();
        end
        
        % function returns the key of the current position
        function key = statusKey (obj)
            obj.send('Zw');         % status key
            key = obj.receive();
        end
        
        % function moves the focus to the load position
        function move2Load (obj)
            obj.send('ZW0');        % load position
        end
        
        % function moves the focus to the work position
        function move2Work (obj)
            obj.send('ZW1');        % work position
        end
    end
end