% scanning range
zdiff = 50;         % [mikrometer]  scanning range
nrSteps = 50;

%% Open port and set Terminator and Baudrate (Important) 
zeiss = CANControl('COM1',9600);

startPos = zeiss.getFocusPosition();
positionMin = startPos - zdiff/2;
stepSize = zdiff / (nrSteps-1);

for jj = 1:nrSteps
    disp('Move to next position? Press any key to confirm.');
    pause;
    position = positionMin + (jj-1) * stepSize;
    disp(position);
    zeiss.setFocusPosition(position);
    disp('Position reached.');
end
disp('Move to start position');
pause;
zeiss.setFocusPosition(startPos);
disp('Moved to start position');

%% Close connection
delete(zeiss);
