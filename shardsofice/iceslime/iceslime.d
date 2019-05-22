BEGIN ~KJOBO~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN KjoboIntro
   SAY @0
   IF ~~ THEN REPLY @1 DO ~SetGlobal("TalkedKjobo","GLOBAL",1)~ GOTO KjoboSlime1
   IF ~~ THEN REPLY @2 GOTO KjoboLeave
END

IF ~~ THEN BEGIN KjoboLeave
   SAY @3
   IF ~~ THEN DO ~EscapeArea() ActionOverride("icejel1",EscapeArea()) ActionOverride("icejel2",EscapeArea())~ EXIT
END

IF ~~ THEN BEGIN KjoboSlime1
   SAY @4
   IF ~~ THEN GOTO KjoboSlime2
END

IF ~~ THEN BEGIN KjoboSlime2
   SAY @5
   IF ~~ THEN GOTO KjoboCoran1
END

IF ~~ THEN BEGIN KjoboCoran1
   SAY @6
   IF ~~ THEN GOTO KjoboCoran2
END

IF ~~ THEN BEGIN KjoboCoran2
   SAY @7
   IF ~~ THEN GOTO KjoboCoran3
END

IF ~~ THEN BEGIN KjoboCoran3
   SAY @8
   IF ~~ THEN GOTO KjoboCoranSafana1
END

IF ~~ THEN BEGIN KjoboCoranSafana1
   SAY @9
   IF ~~ THEN GOTO KjoboCoranSafana2
END

IF ~~ THEN BEGIN KjoboCoranSafana2
   SAY @10
   IF ~~ THEN GOTO KjoboSlimeyMen1
END

IF ~~ THEN BEGIN KjoboSlimeyMen1
   SAY @11
   IF ~~ THEN REPLY @12 GOTO KjoboLeave
   IF ~~ THEN REPLY @13 GOTO KjoboHelp1
END

IF ~~ THEN BEGIN KjoboHelp1
   SAY @14
   IF ~~ THEN GOTO KjoboSorcerer1
END

IF ~~ THEN BEGIN KjoboSorcerer1
   SAY @15
   IF ~~ THEN GOTO KjoboSorcerer2
END

IF ~~ THEN BEGIN KjoboSorcerer2
   SAY @16
   IF ~~ THEN GOTO KjoboSorcerer3
END

IF ~~ THEN BEGIN KjoboSorcerer3
   SAY @17
   IF ~~ THEN GOTO KjoboFigurine1
END

IF ~~ THEN BEGIN KjoboFigurine1
   SAY @18
   IF ~~ THEN REPLY @19 GOTO KjoboHelp2
   IF ~~ THEN REPLY @20 GOTO KjoboLeave
   IF ~PartyHasItem("iceslime")~ THEN REPLY @21 GOTO KjoboGetFigurine
END

IF ~~ THEN BEGIN KjoboHelp2
   SAY @22
   IF ~~ THEN REPLY @23 GOTO KjoboThanks1
   IF ~~ THEN REPLY @24 GOTO KjoboLeave
END

IF ~~ THEN BEGIN KjoboThanks1
   SAY @25
   IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KjoboGetFigurine
   SAY @26
   IF ~~ THEN DO ~ TakePartyItem("iceslime") ActionOverride("icejel1",EscapeArea()) ActionOverride("icejel2",EscapeArea()) EscapeArea()~ EXIT
END

IF ~Global("TalkedKjobo","GLOBAL",1)~ THEN BEGIN KjoboReturn
   SAY @27
   IF ~~ THEN REPLY @28 GOTO KjoboHelp2
   IF ~~ THEN REPLY @29 GOTO KjoboLeave
   IF ~PartyHasItem("iceslime")~ THEN REPLY @30 GOTO KjoboGetFigurine
END
