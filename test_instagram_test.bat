@echo off

set Loop=0
set VideoLength=15
SET /P Views=Please Enter the Number of Views You Want: 
set /A TotalTime=%VideoLength% * %Views%
set TimeSpent=0

:timer
set DateArray=00 01 02 03 04 05 06 07 08 09
set /A TimeRemaining=%TotalTime% - %TimeSpent%

set /A Seconds=%TimeRemaining% %% 60
if %Seconds% < 10 Seconds=DateArray[Seconds]
set /A Minutes=%TimeRemaining% / 60
if %Minutes% < 10 Minutes=DateArray[Minutes]
set TimeList=%TimeRemainingMin%:%TimeRemainingSec%
if %Minutes% >= 60 (
    set Minutes=%Minutes% %% 60
    if %Minutes% < 10 Minutes=DateArray[Minutes]
    set Hours=%Minutes% / 60 
    if %Hours% < 10 Hours=DateArray[Hours]
    set TimeList=%TimeRemainingHour%:%TimeRemainingMin%:%TimeRemainingSec%
    if %Hours% >= 60 (
        set Hours=%Hours% %% 24
        if %Hours% < 10 Hours=DateArray[Hours]
        set Days=%Hours% / 24 
        if %Days% < 10 Days=DateArray[Days]
        set TimeList=%TimeRemainingDay%:%TimeRemainingHour%:%TimeRemainingMin%:%TimeRemainingSec%
    )
)

cls
echo View Counter: %Loop%
echo Stops at %Views% Views
echo Estimated Time Remaining: %TimeRemainingDay%:%TimeRemainingHour%:%TimeRemainingMin%:%TimeRemainingSec%

if not %TotalTime% == %TimeSpent% (
    @REM if %TimeSpent% %% %VideoLength% == 0 and (
    @REM     set /A Loop=Loop+1
    @REM )
    timeout /T 1 /NOBREAK > nul
    set /A TimeSpent=TimeSpent + 1
    goto timer
)

@REM :InstagramViews
@REM if not %Loop% == %Views% (
@REM     start chrome https://www.instagram.com/reel/CRxgeCgFwPZ/
@REM     timeout /T %VideoLength% /NOBREAK > nul
@REM     taskkill /F /IM chrome.exe /T > nul
@REM     set /A Loop=Loop+1
@REM     goto InstagramViews
@REM ) else (
@REM     cls
@REM     echo Total Views: %Loop%
@REM     pause
@REM )
