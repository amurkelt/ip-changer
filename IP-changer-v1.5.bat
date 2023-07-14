@ECHO off
cls
:start
ECHO.
ECHO 1. Wi-Fi Static IP  
ECHO 2. Wi-Fi Dynamic IP 
ECHO 3. Ethernet Static IP for PLC HW config
ECHO 4. Ethernet Static IP for Simulator run
ECHO 5. Ethernet Dynamic IP 
ECHO 6. Exit
ECHO.
set choice=
set /p choice=Enter the command: 
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto con1
if '%choice%'=='2' goto con2
if '%choice%'=='3' goto con3
if '%choice%'=='4' goto con4
if '%choice%'=='5' goto con5
if '%choice%'=='6' goto end
ECHO "%choice%" is not valid, try again
ECHO.
goto start

:con1
echo Enter 3 digits of Subnet, e.g. xxx from 10.241.xxx.246:
set /p Zone_Subnet=
netsh interface ip set address "Wi-Fi" static 10.241.%Zone_Subnet%.246 mask=255.255.224.0
ECHO Wi-Fi adapter was set to Static IP address: 10.241.%Zone_Subnet%.246
PAUSE
goto end

:con2
netsh interface ip set address "Wi-Fi" dhcp
ECHO Wi-Fi adapter was set to Dynamically obtain an IP address 
PAUSE
goto end

:con3
echo Enter 3 digits of Subnet, e.g. xxx from 10.241.xxx.247:
set /p Zone_Subnet=
netsh interface ip set address "Ethernet" static 10.241.%Zone_Subnet%.247 mask=255.255.224.0
ECHO Ethernet adapter was set to Static IP address: 10.241.%Zone_Subnet%.247 (for PLC HW config)
PAUSE
goto end

:con4
netsh interface ip set address "Ethernet" static 10.241.111.237 mask=255.255.255.0
ECHO Ethernet adapter was set to Static IP address: 10.241.111.237 (for Simulator run)
PAUSE
goto end

:con5
netsh interface ip set address "Ethernet" dhcp
ECHO Ethernet adapter was set to Dynamically obtain an IP address
PAUSE
goto end
:end