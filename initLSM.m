%% Connect to the Zeiss Axiovert 200M and LSM 510
% get handle of the stage
if ~exist('zeiss','var') || ~isa(zeiss,'CANControl') || ~isvalid(zeiss)
    zeiss = CANControl('COM1',9600);
end

%% Set the positions of the elements in the ScanHead

zeiss.scanHead.ht = 5;      % position of the main beam splitter
zeiss.scanHead.nt1 = 1;     % position of the secondary beam splitter 1
zeiss.scanHead.nt3 = 4;     % position of the secondary beam splitter 3

zeiss.scanHead.ph4x = 125;  % x-position of pinhole 4
zeiss.scanHead.ph4y = 125;  % y-position of pinhole 4
zeiss.scanHead.ph4d = 250;  % diameter of pinhole 4

% the collimator suffers from hysteresis, so make sure to always set the
% position from the same side
zeiss.scanHead.collimator1 = 1;
pause(2);                   % pause is necessary, otherwise collimator does
                            % not move, because the commands come to fast
zeiss.scanHead.collimator1 = 60;

%% Set the positions of the elements in the Axiovert 200M Stand

zeiss.stand.reflector = 1;  % position of the reflector
zeiss.stand.objective = 1;  % position of the objective
zeiss.stand.tubelens = 2;   % position of the tubelens
zeiss.stand.baseport = 1;   % position of the baseport
zeiss.stand.sideport = 2;   % position of the sideport
zeiss.stand.mirror = 1;     % position of the mirror

delete(zeiss);