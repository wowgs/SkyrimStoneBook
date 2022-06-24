Scriptname SBBookScript extends Quest

powerShrineScript Property realStone Auto

bool isSorted = true
string[] validStones;
UIListMenu stoneMsgBox;


Event OnInit()
  stoneMsgBox = UIExtensions.GetMenu("UIListMenu") as UIListMenu
  validStones = new string[3]
  validStones[0] = "The Mage"
  validStones[1] = "The Thief"
  validStones[2] = "The Warrior"
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

  validStones = PapyrusUtil.PushString(validStones, stoneName)

  isSorted = false
EndFunction

int Function openMenu()
  stoneMsgBox.ResetMenu()
  int i = 0
  while i < validStones.Length
    stoneMsgBox.AddEntryItem(validStones[i])
    i += 1
  endWhile

  stoneMsgBox.OpenMenu()
  return stoneMsgBox.GetResultInt()
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

Function readBook()
  if !isSorted
    PapyrusUtil.SortStringArray(validStones)
    isSorted = true
  endif

  int selected = openMenu()
  switchPower(selected)
EndFunction
