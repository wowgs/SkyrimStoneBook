Scriptname SBBookScript extends ObjectReference

bool Property working = false auto
SBQuestScript Property SBQuest auto

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
  if (akNewContainer == Game.GetPlayer())
    GoToState("Inventory")
  else
    GoToState("")
  endif
EndEvent

Event OnRead()
EndEvent

State Inventory
  Event onRead()
    if !working
      working = True

      ; Close book automatically
      Utility.WaitMenuMode(0.1)
      Game.DisablePlayerControls(false, false, false, false, false, true, false, false)
      Utility.WaitMenuMode(0.01)
  		Game.EnablePlayerControls(false, false, false, false, false, true, false, false)

      SBQuest.readBook()

      working = False
    endif
  EndEvent
EndState
