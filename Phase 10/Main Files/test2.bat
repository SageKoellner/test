@ECHO OFF
SETLOCAL EnableDelayedExpansion

SET array[0]=3
SET array[1]=1
SET array[2]=4
SET array[3]=9
SET array[4]=9
SET array[5]=2
SET array[6]=5
SET array[7]=9
SET array[8]=1
SET array[9]=2
SET array[10]=6

SET "Card_Cycle=0"
SET "Card_Cycle_1=1"
Set "temp_var="

@REM SET Len=0
@REM :Get_Len
@REM IF DEFINED array[%Len%] (
@REM     SET /a "Len+=1"
@REM     GOTO :Get_Len
@REM )
@REM SET /a Len=%Len% - 1

:Sort_Num
SET /A "Card_Cycle_1=%Card_Cycle% + 1"
SET "temp_var=!array[%Card_Cycle%]!"
IF %Card_Cycle% LSS 9 (
    IF !array[%Card_Cycle%]! LEQ !array[%Card_Cycle_1%]! ( SET /A "Card_Cycle+=1" ) ELSE (
        SET "array[%Card_Cycle%]=!array[%Card_Cycle_1%]!"
        SET "array[%Card_Cycle_1%]=%temp_var%"
        SET "Card_Cycle=0"
    )
    GOTO :Sort_Num
) ELSE ( FOR /L %%a IN (0,1,9) DO ECHO !array[%%a]! )

PAUSE > NUL