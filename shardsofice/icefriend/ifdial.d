APPEND TRINNK01

IF WEIGHT #-100
~Global("ImoenArrested","GLOBAL",1)~ THEN BEGIN NoImoen
   SAY @0
   IF ~~ THEN REPLY @1 DO ~SetGlobal("ImoenArrested","GLOBAL",2)~ GOTO ImoenSnuckOut
   IF ~~ THEN REPLY @2 DO ~SetGlobal("ImoenArrested","GLOBAL",2)~ GOTO ImoenSnuckOut
   IF ~~ THEN REPLY @3 DO ~SetGlobal("ImoenArrested","GLOBAL",2)~ GOTO ImoenSnuckOutOhWell
   IF ~~ THEN REPLY @4 DO ~SetGlobal("ImoenArrested","GLOBAL",2)~ GOTO ImoenSnuckOut
END

IF ~~ THEN BEGIN ImoenSnuckOut
   SAY @5
   IF ~~ THEN REPLY @6 GOTO AskPatrons
   IF ~~ THEN REPLY @7 GOTO AskPatrons
END

IF ~~ THEN BEGIN ImoenSnuckOutOhWell
   SAY @8
   IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN AskPatrons
   SAY @9
   IF ~~ THEN EXIT
END

END // APPENDING TRINNK01

APPEND trtavp04

IF WEIGHT #-100
~Global("ImoenArrested","GLOBAL",2)~ THEN BEGIN SeenImoen
   SAY @10
   IF ~~ THEN REPLY @11 DO ~SetGlobal("ImoenArrested","GLOBAL",3)~ GOTO ImoenArrested
   IF ~~ THEN REPLY @12 DO ~SetGlobal("ImoenArrested","GLOBAL",3)~ GOTO ImoenArrested
END

IF ~~ THEN BEGIN ImoenArrested
   SAY @13
   IF ~~ THEN REPLY @14 GOTO MayorsHouse
   IF ~~ THEN REPLY @15 GOTO MayorsHouse
END

IF ~~ THEN BEGIN MayorsHouse
   SAY @16
   IF ~~ THEN REPLY @17 GOTO NoProblem
   IF ~~ THEN REPLY @18 GOTO NoProblem
END

IF ~~ THEN BEGIN NoProblem
   SAY @19
   IF ~~ THEN EXIT
END

END // APPENDING trtavp04

APPEND IMOEN2P

IF WEIGHT #-100
~Global("ImoenArrested","GLOBAL",3)~ THEN BEGIN Oops
   SAY @20
   IF ~~ THEN REPLY @21 DO ~SetGlobal("ImoenArrested","GLOBAL",4)~ GOTO Fine
   IF ~~ THEN REPLY @22 DO ~SetGlobal("ImoenArrested","GLOBAL",4)~ GOTO Fine
END

IF ~~ THEN BEGIN Fine
   SAY @23 
   IF ~~ THEN EXIT
END

IF WEIGHT #-200
~Global("ImoenArrested","GLOBAL",4)~ THEN BEGIN PleaseHurry
   SAY @24
   IF ~~ THEN EXIT
END

IF WEIGHT #-300
~Global("ImoenArrested","GLOBAL",6)~ THEN BEGIN ThankYou
   SAY @25
   IF ~~ THEN REPLY @26 DO ~SetGlobal("ImoenArrested","GLOBAL",7) JoinParty()~ EXIT
   IF ~~ THEN REPLY @27 DO ~SetGlobal("ImoenArrested","GLOBAL",7) JoinParty()~ EXIT
END

END // APPENDING IMOEN2P

APPEND CELOGAN

IF WEIGHT #-100
~OR(2)
Global("ImoenArrested","GLOBAL",3)
Global("ImoenArrested","GLOBAL",4)~ THEN BEGIN Thief
   SAY @28
   IF ~~ THEN REPLY @29 GOTO PayFine
   IF ~~ THEN REPLY @30 GOTO PayFine
END

IF ~~ THEN BEGIN PayFine
   SAY @31
   IF ~PartyGoldGT(500)~ THEN REPLY @32 DO ~SetGlobal("ImoenArrested","GLOBAL",6) TakePartyGold(500)~ EXIT
   IF ~PartyGoldLT(500)~ THEN REPLY @33 GOTO Charity
END

IF ~~ THEN BEGIN Charity
   SAY @34
   IF ~~ THEN REPLY @35 DO ~SetGlobal("ImoenArrested","GLOBAL",6)~ EXIT
END

END // APPENDING CELOGAN
