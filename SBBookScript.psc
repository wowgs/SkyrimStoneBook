Scriptname SBBookScript extends ObjectReference

bool Property working = false auto
SBQuestScript Property SBQuest auto

Event onRead()
  if !working
    working = True

    SBQuest.readBook()

    working = False
  endif
EndEvent
