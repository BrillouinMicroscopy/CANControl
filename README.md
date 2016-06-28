# CANControl

Matlab software used for controlling Zeiss LSM 510 META and Zeiss AxioVert 200M via Serial Port

## General

The devices are controlled via Serial communication. The correct code words to control them can be acquired with 'Free Serial Port Monitor' by sniffing the communication between 'CanCheck' or 'ZEN' and the devices to control. The already implemented functions are described in the next section.

The Matlab class for controlling the devices is named ```CANControl```.

## Functions

### z-Position objective lens (Focus)

This device is adressed using the prefix ```FP``` which has to be added in front of each command. It controls the position of the objective lens of the AxioVert 200M. It is possible to get and set the current position and start and stop a continuous scan with a given velocity.

Commands:
- ```FPZp```	Request the current position. The read buffer has to be written out in order to get the position in hexadecimal units.
- ```FPZG1```	Set the velocity of the continuous scan as hexadecimal value. A value of ```3E8``` (1000) amounts to approximately 1.5 µm per second.
- ```FPZS-```	Start a scan in negative direction.
- ```FPZS+```	Start a scan in positive direction.
- ```FPZSS```	Stop the scan.
- ```FPZDxxxxxx```	Set the current position with ```xxxxxx``` as the desired position in hexadecimal units. One increment corresponds to 0.025 µm.
- ```FPZp```	State of scanner. ```0``` corresponds to static focus, ```255``` means moving lens.

### Collimator UV

This device controls the laser scanning module and is adressed using the prefix ```IP```. You can control beam splitters, collimators, filters and pinholes.

Commands:
- ```IPCS25,x```	Set the position of collimator 1. The value ```x``` is the desired position with values from ```1```to ```100```.