' AddButtonIE.vbs
' Adds a custom button to the IE50 toolbar
' -----------------------------------------------------------------------

rc = MsgBox("Would you like to add a new button to the IE50 toolbar?", vbYesNo)
if rc=vbNo Then WScript.Quit

' The registry path where to add our new entries. 
' If your registry doesn't contain a Shell node, it'll be silently created
REG_HKLM_IE50_BASE = "HKLM\Software\Microsoft\Internet Explorer\Extensions"

' Adds a new key (needs a newly created GUID) 
REG_HKLM_IE50_GUID = REG_HKLM_IE50_BASE & "\{10954C80-4F0F-11d3-B17C-00C0DFE39736}\"

' Creates the required values
Set shell = WScript.CreateObject("WScript.Shell")
shell.RegWrite REG_HKLM_IE50_GUID & "ButtonText", _
               "Run Script", _
               "REG_SZ"
shell.RegWrite REG_HKLM_IE50_GUID & "MenuText", _
               "Run Script", _
               "REG_SZ"
shell.RegWrite REG_HKLM_IE50_GUID & "MenuStatusBar", _
               "Run Script", _
               "REG_SZ"
shell.RegWrite REG_HKLM_IE50_GUID & "Clsid", _
               "{1FBA04EE-3024-11d2-8F1F-0000F87ABD16}", _
               "REG_SZ"
shell.RegWrite REG_HKLM_IE50_GUID & "Default Visible", _
               "Yes", _
               "REG_SZ"
shell.RegWrite REG_HKLM_IE50_GUID & "Icon", _
               "D:\Articles\Microsoft Internet Developer\Customize IE50\Source\icon1.ico", _
               "REG_SZ"
shell.RegWrite REG_HKLM_IE50_GUID & "HotIcon", _
               "D:\Articles\Microsoft Internet Developer\Customize IE50\Source\icon2.ico", _
               "REG_SZ"
shell.RegWrite REG_HKLM_IE50_GUID & "Exec", _
               "D:\Articles\Microsoft Internet Developer\Customize IE50\Source\myprg.vbs", _
               "REG_SZ"

