@ECHO OFF

TITLE Phase 10 Account Register

::Variables
SET "Player_Choice="
SET "Login_Status="
SET "Username="
SET "VerifyUsername="
SET "Password="
SET "VerifyPassword="

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

SET "Player_Choice="
SET /P Player_Choice=Please Select A Destination: %=%

CLS
IF %Player_Choice% == 1 ( 
    SET "Username="
    SET "VerifyUsername="
    GOTO :Register_Username 
) ELSE (
    IF %Player_Choice% == 2 ( GOTO :Register_Password ) ELSE ( GOTO :Passwords_NEQ )
)