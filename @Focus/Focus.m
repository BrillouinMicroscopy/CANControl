classdef Focus < com
%Focus controls the position of the objective lens of the AxioVert 200M
    properties
        prefix = 'F';      % prefix for adressing with the device
    end
    properties (Constant)
        mmperinc = 0.025;   % [µm per increment] constant for converting
                            %  µm to increments of focus z-position
        rangeFocus = hex2dec('FFFFFF'); % number of increments of focus
    end
    properties (Dependent)
        velocity;
    end
    
    methods
        %% Constructor
        function obj = Focus(serial)
            obj@com(serial); 
        end
        
        %% Available methods 
        % function returns current position in µm
        function cP = get (obj)
            obj.send('Zp');                 % request current position
            cP = obj.receive();
            cP = hex2dec(cP);               % convert hexadezimal to dezimal
            cP = cP * obj.mmperinc;         % convert to µm
        end
        
        % function sets position given in µm
        function set (obj, pos)
            nP = pos / obj.mmperinc;        % convert µm to increments
            nP = mod(nP, obj.rangeFocus);   % calculate modulus (the zero-position is always set at microscope boot;
                                            % hence negative positions are adressed calculating the modulus
            nP = dec2hex(round(nP), 6);     % round and convert to hexadecimal
            obj.send(['ZD' nP]);            % set current position
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
    end
end