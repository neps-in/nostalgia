' AddCtxMenuIE.vbs
' Adds a custom item to all the IE50 context menus 
' -----------------------------------------------------------------------

rc = MsgBox("Would you like to add a new item to all the IE50 context menus?", vbYesNo)
if rc=vbNo Then WScript.Quit

' The registry path where to add our new entries. 
' If your registry doesn't contain a Shell node, it'll be silently created
REG_HKCU_IE50_BASE = "HKCU\Software\Microsoft\Internet Explorer\MenuExt"

' Adds a new key (the name of the item) 
REG_HKCU_IE50_ITEM = REG_HKCU_IE50_BASE & "\Do Something...\"

' Creates the required values
Set shell = WScript.CreateObject("WScript.Shell")
shell.RegWrite REG_HKCU_IE50_ITEM, _
               "D:\Articles\Microsoft Internet Developer\Customize IE50\Source\myItem.htm", _
               "REG_SZ"

