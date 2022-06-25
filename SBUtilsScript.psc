ScriptName SBUtilsScript Hidden

Function SortStringArray(string[] array) global
  SortStringArrayHelper(array, array.Length)
EndFunction

; simple n^2 sort
Function SortStringArrayHelper(string[] array, int end) global
  string tmp

  int i = 0
  int j

  while (i < end)
    j = i + 1
    while (j < end)
      if array[i] > array[j]
        tmp = array[i]
        array[i] = array[j]
        array[j] = tmp
      endif
      j += 1
    endWhile
    i += 1
  endWhile
EndFunction
