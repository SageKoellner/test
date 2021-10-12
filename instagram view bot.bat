@echo off

set Loop=0
SET /P Views=Please Enter the Number of Views You Want: 
set VideoLength=15

:InstagramViews
if not %Loop% == %Views% (
    start chrome https://www.instagram.com/reel/CRxgeCgFwPZ/
    timeout /T %VideoLength% /NOBREAK > nul
    taskkill /F /IM chrome.exe /T > nul
    set /A Loop=Loop+1
    goto InstagramViews
) else (
    pause
)
