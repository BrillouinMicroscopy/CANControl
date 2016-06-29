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
            obj.focus = Focus(obj.s);
            obj.scanHead = ScanHead(obj.s);
            obj.stand = Stand(obj.s);
            obj.meta = Meta(obj.s);
            obj.mcu = Mcu(obj.s);
            obj.laser = Laser(obj.s);
            obj.pmt = Pmt(obj.s);
        end

        %% Destructor
        function delete (obj)
            fclose(obj.s);
            delete(obj.s);
        end
    end
end