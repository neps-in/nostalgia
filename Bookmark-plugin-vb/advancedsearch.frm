VERSION 5.00
Begin VB.Form Form2 
   Caption         =   "Form2"
   ClientHeight    =   3120
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   6855
   LinkTopic       =   "Form2"
   ScaleHeight     =   3120
   ScaleWidth      =   6855
   StartUpPosition =   3  'Windows Default
   Begin VB.ComboBox Combo2 
      Height          =   315
      Left            =   5040
      TabIndex        =   5
      Text            =   "Combo2"
      Top             =   600
      Width           =   1215
   End
   Begin VB.TextBox Text1 
      Height          =   375
      Left            =   1920
      TabIndex        =   4
      Text            =   "Text1"
      Top             =   600
      Width           =   3015
   End
   Begin VB.ComboBox Combo1 
      Height          =   315
      Left            =   360
      TabIndex        =   3
      Text            =   "Combo1"
      Top             =   600
      Width           =   1455
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Command2"
      Height          =   495
      Left            =   4080
      TabIndex        =   2
      Top             =   2280
      Width           =   1215
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Command1"
      Height          =   495
      Left            =   5400
      TabIndex        =   1
      Top             =   2280
      Width           =   1215
   End
   Begin VB.Frame Frame1 
      Caption         =   "Frame your Querry"
      Height          =   2655
      Left            =   120
      TabIndex        =   0
      Top             =   240
      Width           =   6615
   End
End
Attribute VB_Name = "Form2"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Command2_Click()
 Command2.Caption = "Stop Search"
 
End Sub

Private Sub Form_Load()
 Command2.Caption = " Start Search"
 Combo1.AddItem "Starts with"
 Combo1.AddItem "contains"
 Combo1.AddItem "Doesnot contain"
 
 Combo2.AddItem "AND"
 Combo2.AddItem "OR"
 Combo2.AddItem "NOT"
End Sub

