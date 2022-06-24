Scriptname SBActivatorScript extends ObjectReference

SBQuestScript Property SBQuest Auto
String Property stoneName Auto

; Pass self ref to book to update it
Auto State FirstTime
  Event OnActivate(ObjectReference akActionRef)
    (stoneBook as SBBookScript).updateStoneList(self)
    GoToState("")
  EndEvent
EndState

Event OnActivate(ObjectReference akActionRef)
EndEvent
