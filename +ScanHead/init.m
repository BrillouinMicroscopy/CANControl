classdef init < BA_Utils.ScanControl.Utils.CANControl.com & BA_Utils.ScanControl.Utils.CANControl.ScanHead.config
%collimator1 controls the z-position of collimator1
    properties (Dependent)
        ht;             % main beam splitter
        nt1;            % secondary beam splitter 1
        nt2;            % secondary beam splitter 2
        nt3;            % secondary beam splitter 3
        ph4d;           % pinhole 4, diameter
        ph4x;           % pinhole 4, x-position
        ph4y;           % pinhole 4, y-position
        collimator1;    % collimator 1
        collimator2;    % collimator 2
    end
    
    methods
        %% Constructor
        function obj = init(serial)
            obj@BA_Utils.ScanControl.Utils.CANControl.com(serial);
        end
        
        %% Available methods
        %% Main beam splitter (HT)
        % function returns the position of the main beam splitter
        function pos = get.ht (obj)
            obj.send('Cr6,1');
            pos = str2double(obj.receive());
            positions = [25, 19, 13, 7, 1, 43, 37, 31];
            pos = find(positions==pos);
        end
        
        % function sets the position of the main beam splitter
        function set.ht (obj, pos)
            if ismember(pos, [1, 2, 3, 4, 5, 6, 7, 8])
                positions = [25, 19, 13, 7, 1, 43, 37, 31];
                obj.send(['CR6,' num2str(positions(pos))]);
            end
        end
        
        %% secondary beam splitter 1 (NT1)
        % function returns the position of the secondary beam splitter 1
        function pos = get.nt1 (obj)
            obj.send('Cr7,1');
            pos = str2double(obj.receive());
            positions = [25, 19, 13, 7, 1, 43, 37, 31];
            pos = find(positions==pos);
        end
        
        % function sets the position of the secondary beam splitter 1
        function set.nt1 (obj, pos)
            if ismember(pos, [1, 2, 3, 4, 5, 6, 7, 8])
                positions = [25, 19, 13, 7, 1, 43, 37, 31];
                obj.send(['CR7,' num2str(positions(pos))]);
            end
        end
        
        %% secondary beam splitter 2 (NT2)
        % function returns the position of the secondary beam splitter 2
        function pos = get.nt2 (obj)
            obj.send('Cr8,1');
            pos = str2double(obj.receive());
            positions = [10, 1, 28, 19];
            pos = find(positions==pos);
        end
        
        % function sets the position of the secondary beam splitter 2
        function set.nt2 (obj, pos)
            if ismember(pos, [1, 2, 3, 4])
                positions = [10, 1, 28, 19];
                obj.send(['CR8,' num2str(positions(pos))]);
            end
        end
        
        %% secondary beam splitter 3 (NT3)
        % function returns the position of the secondary beam splitter 3
        function pos = get.nt3 (obj)
            obj.send('Cr9,1');
            pos = str2double(obj.receive());
            positions = [10, 1, 28, 19];
            pos = find(positions==pos);
        end
        
        % function sets the position of the secondary beam splitter 3
        function set.nt3 (obj, pos)
            if ismember(pos, [1, 2, 3, 4])
                positions = [10, 1, 28, 19];
                obj.send(['CR9,' num2str(positions(pos))]);
            end
        end
        
        %% Pinhole 4, x-position
        % function returns the x-position of pinhole 4
        function pos = get.ph4x (obj)
            obj.send('Cs19,1');
            pos = str2double(obj.receive());
        end
        
        % function sets the x-position of pinhole 4
        function set.ph4x (obj, pos)
            if pos > 250
                pos = 250;
            elseif pos < 1
                pos = 1;
            end
            obj.send(['CS19,' num2str(pos)]);
        end
        
        %% Pinhole 4, y-position
        % function returns the y-position of pinhole 4
        function pos = get.ph4y (obj)
            obj.send('Cs23,1');
            pos = str2double(obj.receive());
        end
        
        % function sets the y-position of pinhole 4
        function set.ph4y (obj, pos)
            if pos > 250
                pos = 250;
            elseif pos < 1
                pos = 1;
            end
            obj.send(['CS23,' num2str(pos)]);
        end
        
        %% Pinhole 4, diameter
        % function returns the diameter of pinhole 4
        function pos = get.ph4d (obj)
            obj.send('Cs30,1');
            pos = str2double(obj.receive());
        end
        
        % function sets the diameter of pinhole 4
        function set.ph4d (obj, pos)
            if pos > 250
                pos = 250;
            elseif pos < 1
                pos = 1;
            end
            obj.send(['CS30,' num2str(pos)]);
        end
        
        %% Collimator 1
        % function returns the position of collimator 1
        function pos = get.collimator1 (obj)
            obj.send('Cs25,1');
            pos = str2double(obj.receive());
        end
        
        % function sets the position of collimator 1
        function set.collimator1 (obj, pos)
            obj.send(['CS25,' num2str(pos)]);
        end
        
        %% Collimator 2
        % function returns the position of collimator 2
        function pos = get.collimator2 (obj)
            obj.send('Cs26,1');
            pos = str2double(obj.receive());
        end
        
        % function sets the position of collimator 2
        function set.collimator2 (obj, pos)
            obj.send(['CS26,' num2str(pos)]);
        end
    end
end