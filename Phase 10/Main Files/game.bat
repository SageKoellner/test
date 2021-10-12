@ECHO OFF 
SETLOCAL EnableDelayedExpansion

SET "Card[0]=1 Card" 
SET "Card[1]=1 Card" 
SET "Card[2]=2 Card" 
SET "Card[3]=2 Card" 
SET "Card[4]=3 Card" 
SET "Card[5]=3 Card" 
SET "Card[6]=4 Card" 
SET "Card[7]=4 Card" 
SET "Card[8]=5 Card" 
SET "Card[9]=5 Card" 
SET "Card[10]=6 Card" 
SET "Card[11]=6 Card" 
SET "Card[12]=7 Card" 
SET "Card[13]=7 Card" 
SET "Card[14]=8 Card" 
SET "Card[15]=8 Card" 
SET "Card[16]=9 Card" 
SET "Card[17]=9 Card" 
SET "Card[18]=10 Card" 
SET "Card[19]=10 Card" 
SET "Card[20]=11 Card" 
SET "Card[21]=11 Card" 
SET "Card[22]=12 Card" 
SET "Card[23]=12 Card" 
SET "Card[24]=Skip Card" 
SET "Card[25]=Wild Card"
SET "Card[26]=Wild Card"

SET "Colour[0]=Red"
SET "Colour[1]=Blue"
SET "Colour[2]=Green"
SET "Colour[3]=Yellow"

SET Hand_Len=0
SET Deal_Loop=1

:Deal_Hand
IF %Deal_Loop% EQU 1 SET "Player_Num=One"
IF %Deal_Loop% EQU 2 SET "Player_Num=Two"
IF %Deal_Loop% EQU 3 SET "Player_Num=Three"
IF %Deal_Loop% EQU 4 SET "Player_Num=Four"

SET /A "Rnd_Card=%RANDOM% %% 26"
SET /A "Rnd_Colour=%RANDOM% %% 4"
IF %Rnd_Card% LEQ 23 ( SET "Card_Name=!Colour[%Rnd_Colour%]! !Card[%Rnd_Card%]!" ) ELSE ( SET "Card_Name=!Card[%Rnd_Card%]!" )

SET "Hand[%Hand_Len%]=%Card_Name%"

SET /A "Hand_Len+=1"
IF %Hand_Len% LEQ 10 ( GOTO :Deal_Hand ) ELSE (
    ECHO Hand Of Player %Deal_Loop%:
    FOR /L %%a IN (0,1,9) DO (
        SET "Hand_%Deal_Loop%[%%a]=!Hand[%%a]!"
        ECHO !Hand_%Deal_Loop%[%%a]!
    )
    ECHO.
    IF %Deal_Loop% LSS 4 ( 
        SET /A "Deal_Loop+=1"
        SET "Hand_Len=0"
        GOTO :Deal_Hand
    )
) 

:Draw_From_Deck
SET /A "Rnd_Card=%RANDOM% %% 26"
SET /A "Rnd_Colour=%RANDOM% %% 4"
IF %Rnd_Card% LEQ 23 ( SET "Card_Name=!Colour[%Rnd_Colour%]! !Card[%Rnd_Card%]!" ) ELSE ( SET "Card_Name=!Card[%Rnd_Card%]!" )

PAUSE > NUL