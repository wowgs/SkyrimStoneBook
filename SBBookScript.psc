Scriptname SBBookScript extends ObjectReference

string onReadMsg = "Select new Standing Stone"
string emptyStoneList = "You have not used any stone yet"
bool isSorted = true
bool isInitiated = false
string[] validStones;
UIListMenu stoneBox;
powerShrineScript Property realStone Auto


Event OnInit()
  stoneBox = UIExtensions.GetMenu("UIListMenu") As UIListMenu
  validStones = new string[1]
  GoToState("Ready")
EndEvent

Event onRead()
  if validStones.Length == 1
    Debug.MessageBox(emptyStoneList)
    return
  endif

  if !isSorted
    PapyrusUtil.SortStringArray(validStones)
    recreateMenu()
    isSorted = true
  endif

  stoneBox.OpenMenu()
  switchPower(stoneBox.GetResultInt()+1)
  Game.EnablePlayerControls()
EndEvent


Function updateStoneList(ObjectReference stone)
  int i = 0
  string stoneName = (stone as SBActivatorScript).stoneName
  while (i < validStones.Length)
    if validStones[i] == stoneName
      return
    endif
    i += 1
  endwhile

  validStones = PapyrusUtil.PushString(validStones, (stone as SBActivatorScript).stoneName)
  isSorted = false
EndFunction

Function recreateMenu()
  stoneBox.ResetMenu()
  int i = 1
  while i < validStones.Length
    stoneBox.AddEntryItem(validStones[i])
    i += 1
  endWhile
EndFunction

Function switchPower(int index)
  string selected = validStones[index]

  realStone.bSteed = false

  if selected == "The Apprentice"
    realStone.bApprentice = true
    realStone.removeSign()
    realStone.addSign()
    realStone.bApprentice = false
  elseIf selected == "The Atronach"
    realStone.bAtronach = true
    realStone.removeSign()
    realStone.addSign()
    realStone.bAtronach = false
  elseIf selected == "The Lady"
    realStone.bLady = true
    realStone.removeSign()
    realStone.addSign()
    realStone.bLady = false
  elseIf selected == "The Lord"
    realStone.bLord = true
    realStone.removeSign()
    realStone.addSign()
    realStone.bLord = false
  elseIf selected == "The Lover"
    realStone.bLover = true
    realStone.removeSign()
    realStone.addSign()
    realStone.bLover = false
  elseIf selected == "The Mage"
    realStone.bMage = true
    realStone.removeSign()
    realStone.addSign()
    realStone.bMage = false
  elseIf selected == "The Ritual"
    realStone.bRitual = true
    realStone.removeSign()
    realStone.addSign()
    realStone.bRitual = false
  elseIf selected == "The Serpent"
    realStone.bSerpent = true
    realStone.removeSign()
    realStone.addSign()
    realStone.bSerpent = false
  elseIf selected == "The Shadow"
    realStone.bShadow = true
    realStone.removeSign()
    realStone.addSign()
    realStone.bShadow = false
  elseIf selected == "The Steed"
    realStone.bSteed = true
    realStone.removeSign()
    realStone.addSign()
    realStone.bSteed = false
  elseIf selected == "The Thief"
    realStone.bThief = true
    realStone.removeSign()
    realStone.addSign()
    realStone.bThief = false
  elseIf selected == "The Tower"
    realStone.bTower = true
    realStone.removeSign()
    realStone.addSign()
    realStone.bTower = false
  else
    realStone.bWarrior = true
    realStone.removeSign()
    realStone.addSign()
    realStone.bWarrior = false
  endif

  realStone.bSteed = true
EndFunction

State Ready
  Event OnInit()
  EndEvent
EndState
