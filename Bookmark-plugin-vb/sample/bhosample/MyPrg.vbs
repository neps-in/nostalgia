' MyPrg.vbs 
' Accessing the IE5 object model 
' --------------------------------------------------------

Set obj = CreateObject("IE5Script.Instance")
Set myPageObj = obj.IEDocument

For Each img In myPageObj.links
    txt = txt& img.href & vbCrLf
Next

MsgBox txt
