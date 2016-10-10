classdef init < com & Mcu.config
%Mcu.init controls the Stage MCU 28:MCU 28
    properties (Constant)
        mmperinc = 0.25;    % [µm per increment] constant for converting
                            %  µm to increments of focus z-position
        rangeFocus = hex2dec('FFFFFF'); % number of increments of focus
    end
    properties (Dependent)
        x;
        y;
        velocityX;
        velocityY;
    end
    
    methods
        %% Constructor
        function obj = init(serial)
            obj@com(serial);
        end
        
        %% Available methods
        % function returns current x-position in µm
        function x = get.x (obj)
            obj.send('Xp');                 % request current position
            x = obj.receive();
            x = hex2dec(x);                 % convert hexadezimal to dezimal
            x = x * obj.mmperinc;           % convert to µm
        end
        
        % function sets x-position given in µm
        function set.x (obj, pos)
            nP = pos / obj.mmperinc;        % convert µm to increments
            nP = mod(nP, obj.rangeFocus);   % calculate modulus (the zero-position is always set at microscope boot;
                                            % hence negative positions are adressed calculating the modulus
            nP = dec2hex(round(nP), 6);     % round and convert to hexadecimal
            obj.send(['XT' nP]);            % set current position
        end
        
        % function returns current y-position in µm
        function y = get.y (obj)
            obj.send('Yp');                 % request current position
            y = obj.receive();
            y = hex2dec(y);                 % convert hexadezimal to dezimal
            y = y * obj.mmperinc;           % convert to µm
        end
        
        % function sets y-position given in µm
        function set.y (obj, pos)
            nP = pos / obj.mmperinc;        % convert µm to increments
            nP = mod(nP, obj.rangeFocus);   % calculate modulus (the zero-position is always set at microscope boot;
                                            % hence negative positions are adressed calculating the modulus
            nP = dec2hex(round(nP), 6);     % round and convert to hexadecimal
            obj.send(['YT' nP]);            % set current position
        end
        
        % function sets the velocity of the x-axis
        function set.velocityX (obj, vel)
            % for security limited to ~10 mm/s
            vel = abs(vel);
            if (vel > 20)
                vel = 20;
            end
            vel = dec2hex(vel, 6);
            obj.send(['XV' vel]);
        end
        
        % function sets the velocity of the y-axis
        function set.velocityY (obj, vel)
            % for security limited to ~10 mm/s
            vel = abs(vel);
            if (vel > 20)
                vel = 20;
            end
            vel = dec2hex(vel, 6);
            obj.send(['YV' vel]);
        end
        
        % function stops the x-axis
        function stopX (obj)
            obj.send('XS');                 % stop movement in x-direction
        end
        
        % function stops the y-axis
        function stopY (obj)
            obj.send('YS');                 % stop movement in y-direction
        end
    end
end