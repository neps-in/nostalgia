VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{00028C01-0000-0000-0000-000000000046}#1.0#0"; "DBGRID32.OCX"
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3780
   ClientLeft      =   165
   ClientTop       =   735
   ClientWidth     =   9300
   LinkTopic       =   "Form1"
   ScaleHeight     =   3780
   ScaleWidth      =   9300
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command2 
      Caption         =   "Advanced Search"
      Height          =   495
      Left            =   8040
      TabIndex        =   5
      Top             =   120
      Width           =   1215
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Search"
      Height          =   495
      Left            =   6840
      TabIndex        =   4
      Top             =   120
      Width           =   1095
   End
   Begin VB.TextBox Text1 
      Height          =   375
      Left            =   1320
      TabIndex        =   2
      Text            =   "Text1"
      Top             =   120
      Width           =   5415
   End
   Begin MSDBGrid.DBGrid DBGrid1 
      Height          =   5655
      Left            =   3000
      OleObjectBlob   =   "protomain.frx":0000
      TabIndex        =   1
      Top             =   720
      Width           =   6375
   End
   Begin MSComctlLib.ImageList ImageList1 
      Left            =   8520
      Top             =   840
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   32
      ImageHeight     =   32
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   5
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "protomain.frx":09DF
            Key             =   "folder"
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "protomain.frx":0E33
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "protomain.frx":1287
            Key             =   ""
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "protomain.frx":16DB
            Key             =   ""
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "protomain.frx":1B2F
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.TreeView treecat 
      Height          =   5655
      Left            =   120
      TabIndex        =   0
      Top             =   720
      Width           =   2775
      _ExtentX        =   4895
      _ExtentY        =   9975
      _Version        =   393217
      LineStyle       =   1
      Style           =   5
      Appearance      =   1
   End
   Begin VB.Label Label1 
      Caption         =   "Search"
      Height          =   375
      Left            =   120
      TabIndex        =   3
      Top             =   120
      Width           =   1095
   End
   Begin VB.Menu mnubookmark 
      Caption         =   "Bookmark"
      Begin VB.Menu mnunew 
         Caption         =   "New"
      End
      Begin VB.Menu mnuzap 
         Caption         =   "Zap"
      End
      Begin VB.Menu spr1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuimport 
         Caption         =   "Import Wizard"
      End
      Begin VB.Menu mnuexport 
         Caption         =   "Export Wizard"
      End
      Begin VB.Menu spr2 
         Caption         =   "-"
      End
      Begin VB.Menu mnuquit 
         Caption         =   "Quit"
      End
   End
   Begin VB.Menu mnuview 
      Caption         =   "View"
   End
   Begin VB.Menu mnutools 
      Caption         =   "Tools"
      Begin VB.Menu mnucheckstatus 
         Caption         =   "Check URL status"
      End
      Begin VB.Menu mnudelorphan 
         Caption         =   "Delete Orphan urls"
      End
      Begin VB.Menu mnurestore 
         Caption         =   "Restore Deleted URLS"
      End
      Begin VB.Menu mnurefresh 
         Caption         =   "Refresh"
      End
      Begin VB.Menu mnuremoveduplicates 
         Caption         =   "Remove Duplicates"
      End
   End
   Begin VB.Menu mnuoption 
      Caption         =   "Options"
   End
   Begin VB.Menu mnuhelp 
      Caption         =   "Help"
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
'child node
Dim alphabet As Node
'root node
Dim atoz As Node

Private Sub Command2_Click()
 Form2.Show
End Sub

Private Sub Form_Load()
Dim i As Long
Dim c As Integer
treecat.ImageList = ImageList1
Set atoz = treecat.Nodes.Add(, tvwFirst, , "URLS")
treecat.Nodes(1).Image = 2
c = 2
Dim X As Integer

 For i = 65 To 65 + 26
  Set alphabet = treecat.Nodes.Add(atoz, tvwChild, , Chr(i))
  treecat.Nodes(c).Image = 5
  c = c + 1
 Next i
X = treecat.Nodes.Count
MsgBox " Count " & X

 
 
End Sub

Private Sub mnuoption_Click()
 frmOptions.Show
End Sub
