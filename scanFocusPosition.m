% scanning range
zdiff = 50;         % [mikrometer]  scanning range
nrSteps = 11;

%% Open port and set Terminator and Baudrate (Important) 
zeiss = CANControl('COM1',9600);
 
startPos = zeiss.focus.get();
positionMin = startPos - zdiff/2;
stepSize = zdiff / (nrSteps-1);

for jj = 1:nrSteps
    disp('Move to next position? Press any key to confirm.');
    pause;
    position = positionMin + (jj-1) * stepSize;
    zeiss.focus.set(position);
    disp('Position reached.');
end
disp('Move to start position');
pause;
zeiss.focus.set(startPos);
disp('Moved to start position');

%% Close connection
delete(zeiss);
