Scriptname SBQuestScript extends Quest

powerShrineScript Property realStone Auto

bool isSorted = true
bool updating = false
string[] validStones
int arrSize
UIListMenu stoneMsgBox

; Init sotne array, fill it with warrior, thief and mage by default
Event OnInit()
  validStones = new string[13]
  validStones[0] = "The Mage"
  validStones[1] = "The Thief"
  validStones[2] = "The Warrior"

  arrSize = 3

EndEvent

; Called from SBActivatorScript attached to each standing stone
Function updateStoneList(string stoneName)
  if !updating
    updating = true

    int i = 0
    while (i < arrSize)
      if (validStones[i] == stoneName)
        return
      endif
      i += 1
    endwhile

    validStones[arrSize] = stoneName
    arrSize += 1

    isSorted = false
    updating = false
  endif
EndFunction

; Using ListMenu from UIExtensions, don't like pagination
int Function openMenu()
  stoneMsgBox = UIExtensions.GetMenu("UIListMenu") as UIListMenu
  stoneMsgBox.ResetMenu()

  int i = 0
  while i < arrSize
    stoneMsgBox.AddEntryItem(validStones[i])
    i += 1
  endWhile

  stoneMsgBox.OpenMenu()
  return stoneMsgBox.GetResultInt()
EndFunction

; Tradeoff between readability, compatibility, 3rd library usage etc.
; General idea - I am making one (Steed) stone persistent and change it's bool props
; after changing the stone, steed's bool props' changes are reverted back

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
  elseif selected == "The Warrior"
    realStone.bWarrior = true
    realStone.removeSign()
    realStone.addSign()
    realStone.bWarrior = false
  endif

  realStone.bSteed = true
EndFunction

Function readBook()
  if !isSorted
    SBUtilsScript.SortStringArrayHelper(validStones, arrSize)
    isSorted = true
  endif

  int selected = openMenu()
  switchPower(selected)
EndFunction
