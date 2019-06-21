VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Instance"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Private Declare Function GetForegroundWindow Lib "user32" () As Long
Private Declare Function GetWindowText Lib "user32" Alias "GetWindowTextA" (ByVal HWND As Long, ByVal lpString As String, ByVal cch As Long) As Long
Private Declare Function GetWindowTextLength Lib "user32" Alias "GetWindowTextLengthA" (ByVal HWND As Long) As Long

Public Property Get HWND() As Long
    HWND = GetForegroundWindow()
End Property

Public Property Get Title() As String
    Dim text As String
    Dim nLen As Long
    Dim hwndFocus As Long
    
    hwndFocus = GetForegroundWindow()
    nLen = GetWindowTextLength(hwndFocus) + 1
    text = String(nLen, 0)
    GetWindowText hwndFocus, text, nLen
    
    Title = text
End Property

Public Property Get IEDocument() As Object
    Dim SWs As New SHDocVw.ShellWindows
    Dim IE As SHDocVw.InternetExplorer
    
    Set IEDocument = Nothing
    
    For Each IE In SWs
        If IE.HWND = HWND Then
            Set IEDocument = IE.Document
        End If
    Next
End Property

Public Property Get IEObject() As Object
    Dim SWs As New SHDocVw.ShellWindows
    Dim IE As SHDocVw.InternetExplorer
    
    Set IEObject = Nothing
    
    For Each IE In SWs
        If IE.HWND = HWND Then
            Set IEObject = IE
        End If
    Next
End Property

