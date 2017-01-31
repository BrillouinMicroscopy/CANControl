classdef CANControl < handle
%CANControl control the LSM510 and AxioVert 200M via Serial communication
    properties (Access = private)
        s;      % serialPort
    end
    properties (Transient)
      focus;    % Stand Axiovert 200:Focus
      scanHead; % LSM 510:Scanhead
      stand;    % Stand Axiovert 200:Stand
      meta;     % LSM 510:Meta
      mcu;      % Stage MCU 28:MCU 28
      laser;    % Laser Module R3.2:LM Interface
      pmt;      % Detectors CAN11:T-PMT
    end

    methods
        %% Constructor
        function obj = CANControl(Port,BaudRate)
            obj.s=serial(Port,'Terminator','CR','BaudRate',BaudRate);
            fopen(obj.s);
            obj.focus       = BA_Utils.ScanControl.Utils.CANControl.Focus.init(obj.s);
            obj.scanHead    = BA_Utils.ScanControl.Utils.CANControl.ScanHead.init(obj.s);
            obj.stand       = BA_Utils.ScanControl.Utils.CANControl.Stand.init(obj.s);
            obj.meta        = BA_Utils.ScanControl.Utils.CANControl.Meta.init(obj.s);
            obj.mcu         = BA_Utils.ScanControl.Utils.CANControl.Mcu.init(obj.s);
            obj.laser       = BA_Utils.ScanControl.Utils.CANControl.Laser.init(obj.s);
            obj.pmt         = BA_Utils.ScanControl.Utils.CANControl.Pmt.init(obj.s);
        end

        %% Destructor
        function delete (obj)
            fclose(obj.s);
            delete(obj.s);
        end
    end
end