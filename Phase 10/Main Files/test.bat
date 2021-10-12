@ECHO OFF 
SETLOCAL EnableDelayedExpansion
SETLOCAL EnableExtensions 

@REM Use nested for statements to save space
SET "Card[0]=Skip Card" 

@REM SET "Cardsss="
@REM SET "fd=0"
@REM FOR /L %%x IN (1,1,12) DO SET "Cardsss=%Cardsss%, %%x Card"
@REM FOR %%y IN (Wild Card, %Cardsss%) DO (
@REM     SET /A "fd+=1"
@REM     FOR %%p IN (0, 1) DO (
@REM         SET /A "fd+=1"
@REM     )
@REM     SET "Card[%fd%]=%%y"
@REM     ECHO Card[%fd%]=%%y
@REM )

SET "FD=0"
FOR %%y IN (Wild, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12) DO (
    SET Card[%FD%]=%%y Card
    CALL SET /A FD+=1
    SET Card[%FD%]=%%y Card
    SET /A FD+=1
)



FOR /L %%a IN (0,1,26) DO ECHO !Card[%%a]!
GOTO :exit

SET "Colour[0]=Skip"
SET "Colour[1]=Wild"
SET "Colour[2]=Red"
SET "Colour[3]=Blue"
SET "Colour[4]=Green"
SET "Colour[5]=Yellow"

SET Hand_Len=0
SET Deal_Loop=1

:Deal_Hand
IF %Deal_Loop% EQU 1 SET "Player_Num=One"
IF %Deal_Loop% EQU 2 SET "Player_Num=Two"
IF %Deal_Loop% EQU 3 SET "Player_Num=Three"
IF %Deal_Loop% EQU 4 SET "Player_Num=Four"

SET /A "Rnd_Card=%RANDOM% %% 26"
SET /A "Rnd_Colour=%RANDOM% %% 4 + 2"
IF %Rnd_Card% GEQ 3 ( SET "Card_Name=!Colour[%Rnd_Colour%]! !Card[%Rnd_Card%]!" ) ELSE ( SET "Card_Name=!Card[%Rnd_Card%]!" )
IF %Rnd_Card% LEQ 2 SET "Rnd_Colour=1"
IF %Rnd_Card% EQU 0 SET "Rnd_Colour=0"

FOR %%b IN (Card, Colour, Name) DO SET "Hand[%Hand_Len%].%%b=%Card_%%b%"

SET /A "Hand_Len+=1"
IF %Hand_Len% LEQ 10 ( GOTO :Deal_Hand ) ELSE (
    @REM ECHO Hand Of Player %Deal_Loop%:
    FOR /L %%a IN (0,1,9) DO (
        FOR %%b IN (Card, Colour, Name) DO SET "Hand_%Player_Num%[%%a].%%b=!Hand[%%a].%%b!"
        @REM ECHO !Hand_%Player_Num%[%%a].Name!
    )
    @REM ECHO.
    IF %Deal_Loop% LSS 4 ( 
        SET /A "Deal_Loop+=1"
        SET "Hand_Len=0"
        GOTO :Deal_Hand
    )
) 

ECHO. 
GOTO :Sort_Colour

:Sort_Num
SET "s=0"
:Sort_Num_Loop
SET /A "t=%s% + 1"
FOR %%b IN (Card, Colour, Name) DO SET "Swap[0].%%b=!Hand_One[%s%].%%b!"
IF %s% LSS 9 (
    IF !Hand_One[%s%].Card! LEQ !Hand_One[%t%].Card! ( SET /A "s+=1" ) ELSE (
        FOR %%b IN (Card, Colour, Name) DO SET "Hand_One[%s%].%%b=!Hand_One[%t%].%%b!"
        FOR %%b IN (Card, Colour, Name) DO SET "Hand_One[%t%].%%b=!Swap[0].%%b!"
        SET "s=0"
    )
    GOTO :Sort_Num_Loop
) ELSE ( FOR /L %%a IN (0,1,9) DO ECHO !Hand_One[%%a].Name! )
GOTO :exit

:Sort_Colour
SET "s=0"
:Sort_Colour_Loop
SET /A "t=%s% + 1"
FOR %%b IN (Card, Colour, Name) DO SET "Swap[0].%%b=!Hand_One[%s%].%%b!"
IF %s% LSS 9 (
    IF !Hand_One[%s%].Colour! LEQ !Hand_One[%t%].Colour! ( SET /A "s+=1" ) ELSE (
        FOR %%b IN (Card, Colour, Name) DO SET "Hand_One[%s%].%%b=!Hand_One[%t%].%%b!"
        FOR %%b IN (Card, Colour, Name) DO SET "Hand_One[%t%].%%b=!Swap[0].%%b!"
        SET "s=0"
    )
    GOTO :Sort_Colour_Loop
) ELSE ( FOR /L %%a IN (0,1,9) DO ECHO !Hand_One[%%a].Name! )
GOTO :exit

:exit
PAUSE > NUL

