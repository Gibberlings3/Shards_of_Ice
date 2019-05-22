ALTER_TRANS LUCY BEGIN 0 END BEGIN 0 END BEGIN "REPLY" ~#28098~ END // "I must be going. Farewell." Must have PC reply on trasn 0, otherwise new one beloe gets ignored
EXTEND_BOTTOM LUCY 0
  IF ~~ THEN REPLY @0 /* ~Pardon me, um... ma'am?  Might I inquire as to your name?~ */  DO ~SetGlobal("LucyStore","GLOBAL",1)~ GOTO LucyStore1
END

APPEND LUCY 

  IF ~~ THEN BEGIN LucyStore1 // from: 0
    SAY @1 /* ~Not that it's your business, <RACE>, but my name is Lucy.  Unless you intend to purchase some of my unique wares, you are wasting my time.~ */
    IF ~~ THEN REPLY @2 /* ~Very well, perhaps we will take a look.~ */ GOTO LucyStore4
    IF ~~ THEN REPLY @3 /* ~No thanks.  We will leave you to your thoughts.~ */ GOTO LucyStore2
  END
  
  IF ~~ THEN BEGIN LucyStore2 // from: 1
    SAY @4 /* ~Fine by me.~ */
    IF ~~ THEN EXIT
  END
  
  IF ~Global("LucyStore","GLOBAL",1)~ THEN BEGIN LucyStore3
    SAY @5 /* ~Again you disturb me.  Are you here to buy, or here to annoy?~ */
    IF ~~ THEN REPLY @2 /* ~Very well, perhaps we will take a look.~ */ GOTO LucyStore4
    IF ~~ THEN REPLY @3 /* ~No thanks.  We will leave you to your thoughts.~ */ GOTO LucyStore2
  END
  
  IF ~~ THEN BEGIN LucyStore4 // from: 1.1 3.1
    SAY @6 /* ~Just don't break anything...~ */
    IF ~~ THEN DO ~StartStore("u!lstore",LastTalkedToBy())~
    EXIT
  END

END
