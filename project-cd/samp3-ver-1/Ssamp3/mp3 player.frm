VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{5EE03E81-8B82-11D1-860C-0020AFE4DE54}#1.0#0"; "MP3INFO.OCX"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Object = "{05589FA0-C356-11CE-BF01-00AA0055595A}#2.0#0"; "AMOVIE.OCX"
Begin VB.Form frmmain 
   BackColor       =   &H00000040&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Simple And Magnificent MP3 Player"
   ClientHeight    =   4935
   ClientLeft      =   150
   ClientTop       =   435
   ClientWidth     =   7890
   Icon            =   "mp3 player.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   4935
   ScaleWidth      =   7890
   Begin MP3INFOLib.Mp3Info Mp3Info1 
      Height          =   495
      Left            =   4800
      TabIndex        =   10
      Top             =   3480
      Visible         =   0   'False
      Width           =   495
      _Version        =   65536
      _ExtentX        =   873
      _ExtentY        =   873
      _StockProps     =   0
   End
   Begin MSComDlg.CommonDialog CmnDlg 
      Left            =   7080
      Top             =   3360
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
      DialogTitle     =   "Add File To Playlist"
   End
   Begin MSComctlLib.Toolbar Toolbar1 
      Align           =   1  'Align Top
      Height          =   660
      Left            =   0
      TabIndex        =   5
      Top             =   0
      Width           =   7890
      _ExtentX        =   13917
      _ExtentY        =   1164
      ButtonWidth     =   1032
      ButtonHeight    =   1005
      AllowCustomize  =   0   'False
      Appearance      =   1
      ImageList       =   "ImageList1"
      _Version        =   393216
      BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
         NumButtons      =   9
         BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "kexit"
            Object.ToolTipText     =   "Exit SAMP3"
            ImageIndex      =   1
         EndProperty
         BeginProperty Button2 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "kspr1"
            Style           =   3
         EndProperty
         BeginProperty Button3 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "kremain"
            Object.ToolTipText     =   "Time Remaining"
            ImageIndex      =   2
            Style           =   2
            Value           =   1
         EndProperty
         BeginProperty Button4 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "kelapsed"
            Object.ToolTipText     =   "Time Elapsed"
            ImageIndex      =   3
            Style           =   2
         EndProperty
         BeginProperty Button5 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "kspr2"
            Style           =   3
         EndProperty
         BeginProperty Button6 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Enabled         =   0   'False
            Key             =   "kinfo"
            Object.ToolTipText     =   "View File Info"
            ImageIndex      =   4
         EndProperty
         BeginProperty Button7 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "kspr3"
            Style           =   3
         EndProperty
         BeginProperty Button8 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "korder"
            Object.ToolTipText     =   "Play songs at tandem"
            ImageIndex      =   5
            Style           =   2
            Value           =   1
         EndProperty
         BeginProperty Button9 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "kshuffle"
            Object.ToolTipText     =   "Play songs at random"
            ImageIndex      =   6
            Style           =   2
         EndProperty
      EndProperty
      BorderStyle     =   1
      MousePointer    =   99
   End
   Begin VB.Timer Timer1 
      Left            =   6000
      Top             =   4200
   End
   Begin MSComctlLib.ImageList ImageList1 
      Left            =   6840
      Top             =   4200
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   32
      ImageHeight     =   32
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   6
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "mp3 player.frx":08CA
            Key             =   "kexit"
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "mp3 player.frx":0D1E
            Key             =   "kremain"
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "mp3 player.frx":1172
            Key             =   "kelapsed"
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "mp3 player.frx":15C6
            Key             =   "kinfo"
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "mp3 player.frx":1A1A
            Key             =   "korder"
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "mp3 player.frx":1D36
            Key             =   "kshuffle"
         EndProperty
      EndProperty
   End
   Begin VB.CommandButton cmdremovesong 
      Height          =   495
      Left            =   7080
      MousePointer    =   99  'Custom
      Picture         =   "mp3 player.frx":2612
      Style           =   1  'Graphical
      TabIndex        =   3
      ToolTipText     =   "Delete song"
      Top             =   2760
      Width           =   495
   End
   Begin VB.CommandButton cmdaddsong 
      Height          =   495
      Left            =   4800
      MousePointer    =   99  'Custom
      Picture         =   "mp3 player.frx":26FC
      Style           =   1  'Graphical
      TabIndex        =   2
      ToolTipText     =   "Add Song"
      Top             =   2760
      Width           =   495
   End
   Begin VB.ListBox List1 
      BackColor       =   &H0080C0FF&
      ForeColor       =   &H80000005&
      Height          =   1620
      Left            =   4800
      TabIndex        =   1
      Top             =   1080
      Width           =   2775
   End
   Begin VB.Frame Frame1 
      BackColor       =   &H00000000&
      Height          =   2655
      Left            =   120
      TabIndex        =   0
      Top             =   720
      Width           =   4455
      Begin AMovieCtl.ActiveMovie ActiveMovie1 
         Height          =   375
         Left            =   240
         TabIndex        =   11
         Top             =   1680
         Width           =   3975
         _ExtentX        =   7011
         _ExtentY        =   661
      End
      Begin VB.CheckBox chkrepeat 
         BackColor       =   &H00000000&
         Caption         =   "Repeat"
         ForeColor       =   &H8000000E&
         Height          =   375
         Left            =   240
         MousePointer    =   99  'Custom
         TabIndex        =   6
         Top             =   2040
         Width           =   3855
      End
      Begin VB.Label lbltitle 
         Alignment       =   2  'Center
         BackStyle       =   0  'Transparent
         Caption         =   "title"
         ForeColor       =   &H8000000E&
         Height          =   375
         Left            =   240
         TabIndex        =   9
         Top             =   360
         Width           =   3975
      End
      Begin VB.Label lbltimecontent 
         BackColor       =   &H000000C0&
         BackStyle       =   0  'Transparent
         Caption         =   "Label4"
         BeginProperty Font 
            Name            =   "Schadow Lt BT"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   375
         Left            =   240
         TabIndex        =   8
         Top             =   960
         Width           =   495
      End
      Begin VB.Label Lbltimecaption 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Seconds remaining"
         BeginProperty Font 
            Name            =   "Schadow Lt BT"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H8000000E&
         Height          =   225
         Left            =   840
         TabIndex        =   4
         Top             =   960
         Width           =   1605
      End
   End
   Begin VB.Shape Shape2 
      BorderColor     =   &H80000005&
      Height          =   2535
      Left            =   4680
      Top             =   840
      Width           =   3135
   End
   Begin VB.Label lblplaylistsize 
      Alignment       =   2  'Center
      Caption         =   "Playlist"
      BeginProperty Font 
         Name            =   "MS Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   5520
      TabIndex        =   7
      Top             =   2880
      Width           =   1335
   End
   Begin VB.Shape Shape1 
      Height          =   2535
      Left            =   4680
      Top             =   720
      Width           =   3015
   End
   Begin VB.Menu mnufile 
      Caption         =   "&File"
      Begin VB.Menu mnuexit 
         Caption         =   "E&xit"
         Shortcut        =   ^X
      End
   End
   Begin VB.Menu mnuview 
      Caption         =   "V&iew"
      Begin VB.Menu mnutoolbar 
         Caption         =   "&Toolbar"
         Checked         =   -1  'True
         Shortcut        =   ^T
      End
      Begin VB.Menu spr1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuelapsed 
         Caption         =   "Time &Elapsed"
         Checked         =   -1  'True
         Shortcut        =   ^E
      End
      Begin VB.Menu mnutremain 
         Caption         =   "Time &Remaining"
         Shortcut        =   ^R
      End
      Begin VB.Menu spr2 
         Caption         =   "-"
      End
      Begin VB.Menu mnuinfo 
         Caption         =   "M&P3 File information..."
         Shortcut        =   ^I
      End
   End
   Begin VB.Menu mnuoption 
      Caption         =   "Option"
      Begin VB.Menu mnucontinous 
         Caption         =   "&Continous"
         Checked         =   -1  'True
         Shortcut        =   ^C
      End
      Begin VB.Menu mnushuffle 
         Caption         =   "&Shuffle"
         Shortcut        =   ^S
      End
      Begin VB.Menu spr3 
         Caption         =   "-"
      End
      Begin VB.Menu mnuskin 
         Caption         =   "S&kins"
         Begin VB.Menu mnuskinblue 
            Caption         =   "B&lue"
         End
         Begin VB.Menu mnubrown 
            Caption         =   "&Brown"
         End
         Begin VB.Menu mnuskin3 
            Caption         =   "Skin 3"
         End
      End
   End
   Begin VB.Menu mnuhelp 
      Caption         =   "&Help"
      Begin VB.Menu mnuplayerhelp 
         Caption         =   "MP3 Player Help"
         Shortcut        =   {F1}
      End
      Begin VB.Menu mnutip 
         Caption         =   "Tip of the day..."
      End
      Begin VB.Menu mnuAbout 
         Caption         =   "&About..."
      End
   End
End
Attribute VB_Name = "frmmain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
'Memory database that stores fullpath with filename
Dim slist As New Collection
Dim sindex As Long    'index for the memory database
Dim cursongnum As Integer
Dim sn As Long
Dim dclicked As Boolean


Private Sub ActiveMovie1_StateChange(ByVal oldState As Long, ByVal newState As Long)

 If ActiveMovie1.CurrentState = amvStopped And dclicked = False Then
   If mnushuffle.Checked = True Then
      sn = Int(slist.Count * Rnd + 1)
   Else
      If sn >= slist.Count Then
       sn = 1
      Else
       sn = sn + 1
      End If
   End If
   playsong (sn)
 End If
 dclicked = False
End Sub

Private Sub ActiveMovie1_Timer()
If mnuelapsed.Checked = True Then
   lbltimecontent.Caption = Int(ActiveMovie1.CurrentPosition)
Else
   lbltimecontent.Caption = Int(ActiveMovie1.Duration - ActiveMovie1.CurrentPosition)
End If
End Sub

Private Sub chkrepeat_Click()
If chkrepeat.Value = vbUnchecked Then
         ActiveMovie1.PlayCount = 1 ' Play song once
ElseIf chkrepeat.Value = vbChecked Then
        ActiveMovie1.PlayCount = 0 'Play current song repeatedly
End If
End Sub

Private Sub cmdaddsong_Click()
Dim title As String
'Shows commondialogbox and collects filename
CmnDlg.Filter = "MP3 Files (*.MP3)|*.mp3|Wav Files(*.wav)|*.wav"
'&H80000 for Explorer style dialog box
'&H4 for hiding ReadOnly Checkbox
CmnDlg.Flags = &H80000 + &H4
CmnDlg.ShowOpen
If Len(CmnDlg.FileTitle) > 25 Then
     title = Left(CmnDlg.FileTitle, 25) & "..."
Else
    title = CmnDlg.FileTitle
End If
slist.Add (CmnDlg.FileName)
List1.AddItem (StrConv(title, vbProperCase))
cmdremovesong.Enabled = True 'Enable the Remove song button
lblplaylistsize.Caption = "Playlist size : " & slist.Count & " song(s)"
End Sub

Private Sub cmdremovesong_Click()
Dim idx As Integer
'Removes first song from the playlist containing atleast 1 song
Dim marked As Boolean

marked = False
idx = 0
Do While idx <= List1.ListCount - 1
   If List1.Selected(idx) = True Then
       marked = True
      List1.RemoveItem (idx)
      slist.Remove (idx + 1)
  End If
    idx = idx + 1
 Loop
 If slist.Count > 0 And marked = False Then
  slist.Remove (1)
  List1.RemoveItem (0)
End If
If slist.Count = 0 Then
 lblplaylistsize.Caption = "Playlist Empty!"
 Toolbar1.Buttons.Item(5).Enabled = False
Else
 lblplaylistsize.Caption = "Playlist size : " & slist.Count & " songs "
End If
List1.Refresh
End Sub

Private Sub Form_Load()
cmdremovesong.Enabled = False
mnuinfo.Enabled = False
chkrepeat.Value = Unchecked
Lbltimecaption.Caption = "Seconds elapsed"
lbltitle.Caption = ""
Lbltimecaption.Visible = False
lbltimecontent.Caption = ""
frmmain.Left = (Screen.Height - frmmain.Height) / 2
frmmain.Top = (Screen.Width - frmmain.Width) / 2
Toolbar1.Buttons.Item(5).Enabled = False
sn = 1
dclicked = False
Randomize
Timer1.Enabled = True
Timer1.Interval = 500
End Sub







Private Sub Form_Resize()
If frmmain.WindowState = 1 Then
  If lbltitle.Caption = "" Then
   frmmain.Caption = "No Song Loaded"
  Else
   frmmain.Caption = lbltitle.Caption
  End If
Else
  frmmain.Caption = "Simple And Magnificent MP3 Player"
End If
 
End Sub

Private Sub List1_Click()
List1.Selected(List1.ListIndex) = True
End Sub

Private Sub List1_DblClick()
  Dim idx As Integer
 For idx = 0 To List1.ListCount - 1
   If List1.Selected(idx) = True Then
      If ActiveMovie1.CurrentState = amvRunning Then
        dclicked = True
        ActiveMovie1.Stop
      End If
      playsong (idx + 1)
      Exit For
    End If
 Next idx
 Toolbar1.Buttons.Item(6).Enabled = True
 mnuinfo.Enabled = True
 Toolbar1.Buttons.Item(5).Enabled = True
 Lbltimecaption.Visible = True
 End Sub

Private Sub mnuAbout_Click()
frmAbout.Show
End Sub

Private Sub mnucontinous_Click()
mnucontinous.Checked = True
mnushuffle.Checked = False
End Sub

Private Sub mnuelapsed_Click()
mnuelapsed.Checked = True
mnutremain.Checked = False
Lbltimecaption.Caption = "Seconds elapsed"
End Sub

Private Sub mnuexit_Click()
Dim ex As Integer
ex = MsgBox("Do you want to really quit", vbQuestion + vbYesNo, "Quit  ?")
If ex = 6 Then
  ActiveMovie1.Stop
  Unload Me
 Set frmmain = Nothing
End If
End Sub

Private Sub mnuinfo_Click()
  frminfo.Show 0, frmmain
End Sub
Private Sub playsong(ByVal songnumber)
   ActiveMovie1.FileName = slist.Item(songnumber)
   lbltitle.Caption = List1.List(songnumber - 1)
 End Sub

Private Sub mnuplayerhelp_Click()
Dim ms As Integer
ms = MsgBox("Help is getting ready, It will be included in the next version", vbInformation, "Help in next version")
End Sub

Private Sub mnushuffle_Click()
mnushuffle.Checked = True
mnucontinous.Checked = False
End Sub

Private Sub mnutip_Click()
'Load frmTip
frmTip.Show
End Sub

Private Sub mnutoolbar_Click()
If mnutoolbar.Checked = True Then
   mnutoolbar.Checked = False
   Toolbar1.Visible = False
Else
    mnutoolbar.Checked = True
    Toolbar1.Visible = True
End If
End Sub

Private Sub mnutremain_Click()
Lbltimecaption.Caption = "Seconds remaining"
mnutremain.Checked = True
mnuelapsed.Checked = False
End Sub

Private Sub Toolbar1_ButtonClick(ByVal Button As MSComctlLib.Button)
      Select Case Button.Key
      Case Is = "kexit"
        Call mnuexit_Click
      Case Is = "kinfo"
        Call mnuinfo_Click
      Case Is = "kremain"
        Call mnutremain_Click
      Case Is = "kelapsed"
        Call mnuelapsed_Click
      Case Is = "korder"
        Call mnucontinous_Click
      Case Is = "kshuffle"
        Call mnushuffle_Click
      End Select
End Sub
