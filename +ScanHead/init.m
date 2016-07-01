classdef init < handle
%ScanHead.init controls the different devices within the ScanHead
    properties (Transient)
      collimator1;
      collimator2;
    end
    
    methods
        %% Constructor
        function obj = init(serial)
            obj.collimator1 = ScanHead.collimators.collimator1(serial);
            obj.collimator2 = ScanHead.collimators.collimator2(serial);
        end
    end
end