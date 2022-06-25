Scriptname SBActivatorScript extends ObjectReference

SBQuestScript Property SBQuest Auto
String Property stoneName Auto

; Decided not to use auto state, weird issues for existing save
Event OnActivate(ObjectReference akActionRef)
  SBQuest.updateStoneList(stoneName)
EndEvent
