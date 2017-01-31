classdef init < BA_Utils.ScanControl.Utils.CANControl.com & BA_Utils.ScanControl.Utils.CANControl.Laser.config
%Laser.init controls the Laser Module R3.2:LM Interface
    
    methods
        %% Constructor
        function obj = init(serial)
            obj@BA_Utils.ScanControl.Utils.CANControl.com(serial);
        end
        
        %% Available methods
    end
end