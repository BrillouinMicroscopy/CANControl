classdef init < BA_Utils.ScanControl.Utils.CANControl.com & BA_Utils.ScanControl.Utils.CANControl.Pmt.config
%Pmt.init controls the Detectors CAN11:T-PMT
    
    methods
        %% Constructor
        function obj = init(serial)
            obj@BA_Utils.ScanControl.Utils.CANControl.com(serial);
        end
        
        %% Available methods
    end
end