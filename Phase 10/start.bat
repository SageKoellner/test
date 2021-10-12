@ECHO OFF

TITLE Phase 10

::Variables
SET Player_Choice=0
SET Login_Status=0
SET "Username="
SET "VerifyUsername="
SET "Password="
SET "VerifyPassword="

:: Graphics Tittle Screen
:Title_Screen
ECHO  . . . . . . . . . . . . . . . . . . . . . . . . . .
ECHO  .                                                 .
ECHO  .   Welcome to Phase 10!                          .
ECHO  .                                                 .
ECHO  . . . . . . . . . . . . . . . . . . . . . . . . . .

IF NOT %Login_Status% == "Logged In" (
    GOTO :Standard
) ELSE (
    GOTO :Logged_In
)

::Not Logged In
:Standard
ECHO  . . . . . . . . . . . . . . . . . . . . . . . . . . 
ECHO  .                                                 .
ECHO  .   (1) Start                                     .
ECHO  .                                                 .
ECHO  .   (2) Login                                     .
ECHO  .                                                 .
ECHO  .   (3) Register                                  .
ECHO  .                                                 .
ECHO  . . . . . . . . . . . . . . . . . . . . . . . . . .
ECHO.

SET Player_Choice=0
SET /P Player_Choice=Please Select A Destination: %=%

CLS

IF %Player_Choice% == 1 ( GOTO :Start ) ELSE (
    IF %Player_Choice% == 2 ( GOTO :Login ) ELSE (
        IF %Player_Choice% == 3 ( GOTO :Register ) ELSE ( GOTO :Title_Screen )
    )
) 

::Logged In
:Logged_In
ECHO  . . . . . . . . . . . . . . . . . . . . . . . . . . 
ECHO  .                                                 .
ECHO  .   (1) Start                                     .
ECHO  .                                                 .
ECHO  .   (2) Player Stats                              .
ECHO  .                                                 .
ECHO  .   (3) Settings                                  .
ECHO  .                                                 .
ECHO  .   (4) Log Out                                   .
ECHO  .                                                 .
ECHO  . . . . . . . . . . . . . . . . . . . . . . . . . .
ECHO  . Logged in as %Username%
ECHO  . . . . . . . . . . . . . . . . . . . . . . . . . .
ECHO.

SET Player_Choice=0
SET /P Player_Choice=Please Select A Destination: %=%

CLS
IF %Player_Choice% == 1 ( GOTO :Start ) ELSE (
    IF %Player_Choice% == 2 ( GOTO :Player_Stats ) ELSE (
        IF %Player_Choice% == 3 ( GOTO :Settings ) ELSE (
            IF %Player_Choice% == 4 ( GOTO :Log_Out ) ELSE ( GOTO :Title_Screen )
        )
    )
) 

::Start Process
:Start
ECHO start
PAUSE >nul
EXIT

::Player Sats
:Player_Stats
PAUSE >nul
EXIT

::Settings
:Settings
PAUSE >nul
EXIT

::Log Out
:Log_Out
CLS
ECHO Are you sure you would like to log out?
ECHO (1) Yes
ECHO (2) No
ECHO.

SET Player_Choice=0
SET /P Player_Choice=Please Select A Destination: %=%

CLS
IF %Player_Choice% == 1 (
    SET Login_Status=0
    SET "Username="
    SET "VerifyUsername="
    SET "Password="
    SET "VerifyPassword="

    GOTO :Title_Screen
) ELSE (
    IF %Player_Choice% == 2 ( GOTO :Title_Screen ) ELSE ( GOTO :Log_Out )
)

::Login
:Login
PAUSE >nul
EXIT

::Register
:Register
ECHO To create your account please answer a few question
ECHO Press anything to continue
PAUSE > nul

CLS
GOTO :Register_Username

::Create Username
:Register_Username
SET /P Username=New Username: %=%
IF NOT DEFINED Username (
    CLS
    GOTO :Register_Username
)
:Register_Username_Verify
SET /P VerifyUsername=Verify Username: %=%
IF NOT DEFINED VerifyUsername (
    CLS
    ECHO New Username: %Username%
    GOTO :Register_Username_Verify
)

IF %Username% == %VerifyUsername% ( 
    CLS
    GOTO :Register_Password 
) ELSE (
    SET "Username="
    SET "VerifyUsername="
    CLS
    ECHO ERROR USERNAMES DO NOT MATCH
    GOTO :Register_Username
)

::Create Password
:Register_Password
SET /P Password=New Password: %=%
IF NOT DEFINED Password (
    CLS
    GOTO :Register_Password
)
:Register_Password_Verify
SET /P VerifyPassword=Verify Password: %=%
IF NOT DEFINED VerifyPassword (
    CLS
    ECHO New Password: %Password%
    GOTO :Register_Password_Verify
)

IF %Password% == %VerifyPassword% ( GOTO :Passwords_EQU ) ELSE ( GOTO :Passwords_NEQ )

::Passwords Are Equal
:Passwords_EQU
SET Login_Status="Logged In"

CLS
GOTO :Title_Screen

::Passwords Are Not Equal
:Passwords_NEQ
SET "Password="
SET "VerifyPassword="
CLS
ECHO ERROR PASSWORDS DO NOT MATCH
ECHO (1) Create New Username
ECHO (2) Retry Create Password
ECHO.

SET Player_Choice=0
SET /P Player_Choice=Please Select A Destination: %=%

CLS
IF %Player_Choice% == 1 ( 
    SET "Username="
    SET "VerifyUsername="
    GOTO :Register_Username 
) ELSE (
    IF %Player_Choice% == 2 ( GOTO :Register_Password ) ELSE ( GOTO :Passwords_NEQ )
)