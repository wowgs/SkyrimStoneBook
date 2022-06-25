Scriptname SBBookScript extends ObjectReference

bool Property working = false auto
SBQuestScript Property SBQuest auto

Event onRead()
  if !working
    working = True
    ; Close book automatically
    Utility.WaitMenuMode(0.1)
    Game.DisablePlayerControls(true, true, true, true, true, true, true, false)
    Utility.WaitMenuMode(0.01)
		Game.EnablePlayerControls(true, true, true, true, true, true, true, false)
    SBQuest.readBook()
    working = False
  endif
EndEvent
