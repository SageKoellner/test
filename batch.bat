set DateArray=00 01 02 03 04 05 06 07 08 09
set Seconds=7
if %Seconds% LSS 10 (
    echo %DateArray[7]%
)
echo %Seconds%

pause