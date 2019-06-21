VERSION 5.00
Begin VB.Form frmbhoentry 
   Caption         =   "Browser Helper Object"
   ClientHeight    =   2430
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   7035
   LinkTopic       =   "Form1"
   ScaleHeight     =   2430
   ScaleWidth      =   7035
   StartUpPosition =   3  'Windows Default
   Begin VB.ComboBox Combo1 
      Height          =   315
      Left            =   960
      TabIndex        =   9
      Text            =   "Combo1"
      Top             =   480
      Width           =   1095
   End
   Begin VB.CommandButton cmdcancel 
      Caption         =   "Cancel"
      Height          =   495
      Left            =   3720
      TabIndex        =   8
      Top             =   1800
      Width           =   1215
   End
   Begin VB.TextBox Text3 
      Height          =   375
      Left            =   2760
      TabIndex        =   7
      Text            =   "Text1"
      Top             =   480
      Width           =   4215
   End
   Begin VB.TextBox Text2 
      Height          =   735
      Left            =   960
      TabIndex        =   6
      Text            =   "Text1"
      Top             =   960
      Width           =   6015
   End
   Begin VB.TextBox Text1 
      Height          =   375
      Left            =   960
      TabIndex        =   5
      Text            =   "Text1"
      Top             =   0
      Width           =   6015
   End
   Begin VB.CommandButton cmdsave 
      Caption         =   "Save && Exit"
      Height          =   495
      Left            =   2400
      TabIndex        =   4
      Top             =   1800
      Width           =   1215
   End
   Begin VB.CommandButton cmdsvadd 
      Caption         =   "Save && Add another"
      Height          =   495
      Left            =   1080
      TabIndex        =   3
      Top             =   1800
      Width           =   1215
   End
   Begin VB.Label Label1 
      Caption         =   "Protocol"
      Height          =   375
      Left            =   0
      TabIndex        =   10
      Top             =   480
      Width           =   855
   End
   Begin VB.Label lblurl 
      Caption         =   "URL"
      Height          =   375
      Left            =   2160
      TabIndex        =   2
      Top             =   480
      Width           =   495
   End
   Begin VB.Label lbldesc 
      Caption         =   "Description"
      Height          =   375
      Left            =   0
      TabIndex        =   1
      Top             =   960
      Width           =   855
   End
   Begin VB.Label lblname 
      Caption         =   "Name"
      Height          =   375
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   855
   End
End
Attribute VB_Name = "frmbhoentry"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Form_Load()
 Combo1.AddItem "http://"
 Combo1.AddItem "ftp://"
 Combo1.AddItem "https://"
 Combo1.Text = "Protocol ?"
 
End Sub
