VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3195
   ClientLeft      =   165
   ClientTop       =   735
   ClientWidth     =   7095
   LinkTopic       =   "Form1"
   ScaleHeight     =   3195
   ScaleWidth      =   7095
   StartUpPosition =   3  'Windows Default
   Begin MSComctlLib.ListView ListView1 
      Height          =   5655
      Left            =   3000
      TabIndex        =   1
      Top             =   720
      Width           =   6375
      _ExtentX        =   11245
      _ExtentY        =   9975
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      _Version        =   393217
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      NumItems        =   0
   End
   Begin MSComctlLib.TreeView TreeView1 
      Height          =   5655
      Left            =   120
      TabIndex        =   0
      Top             =   720
      Width           =   2775
      _ExtentX        =   4895
      _ExtentY        =   9975
      _Version        =   393217
      PathSeparator   =   ""
      Style           =   7
      Appearance      =   1
   End
   Begin VB.Menu mnuurl 
      Caption         =   "URL"
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
         Caption         =   "Import"
      End
      Begin VB.Menu mnuexport 
         Caption         =   "Export"
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
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub mnuview_Click()

End Sub
