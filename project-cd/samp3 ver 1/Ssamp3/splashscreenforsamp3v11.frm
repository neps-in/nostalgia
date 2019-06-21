VERSION 5.00
Begin VB.Form frmsamp3splash 
   BorderStyle     =   0  'None
   Caption         =   "Form1"
   ClientHeight    =   4200
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   7365
   FillColor       =   &H00800000&
   ForeColor       =   &H00800000&
   LinkTopic       =   "Form1"
   Picture         =   "splashscreenforsamp3v11.frx":0000
   ScaleHeight     =   4200
   ScaleWidth      =   7365
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdclickme 
      BackColor       =   &H00FFFF80&
      Caption         =   "<<Click &Me>>"
      Height          =   375
      Left            =   1800
      MaskColor       =   &H00400000&
      Style           =   1  'Graphical
      TabIndex        =   6
      Top             =   2160
      Width           =   3495
   End
   Begin VB.Label Label7 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "Feel free to distribute this MP3 Player to everyone"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFF00&
      Height          =   735
      Left            =   360
      TabIndex        =   7
      Top             =   1440
      Width           =   6495
   End
   Begin VB.Label Label6 
      BackStyle       =   0  'Transparent
      Caption         =   "This Software is a FREEWARE.  No one has the right to sell it or distribute with other packages."
      BeginProperty Font 
         Name            =   "Garamond"
         Size            =   11.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00800000&
      Height          =   495
      Left            =   120
      TabIndex        =   5
      Top             =   3480
      Width           =   7095
   End
   Begin VB.Label Label5 
      BackStyle       =   0  'Transparent
      Caption         =   "Warning :"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   375
      Left            =   120
      TabIndex        =   4
      Top             =   3120
      Width           =   1095
   End
   Begin VB.Label Label4 
      Alignment       =   1  'Right Justify
      BackStyle       =   0  'Transparent
      Caption         =   "Version 1.1"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   14.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   375
      Left            =   5760
      TabIndex        =   3
      Top             =   3120
      Width           =   1455
   End
   Begin VB.Label Label3 
      Alignment       =   1  'Right Justify
      BackStyle       =   0  'Transparent
      Caption         =   "For Windows 95"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   14.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   375
      Left            =   4800
      TabIndex        =   2
      Top             =   2760
      Width           =   2535
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "SAMP3"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   36
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   735
      Left            =   2040
      TabIndex        =   1
      Top             =   120
      Width           =   3375
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "Simple And Magnificent MP3 Player"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   20.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   495
      Left            =   360
      TabIndex        =   0
      Top             =   840
      Width           =   6615
   End
   Begin VB.Shape Shape1 
      BackColor       =   &H00FFFFFF&
      FillColor       =   &H00800000&
      FillStyle       =   0  'Solid
      Height          =   2775
      Left            =   120
      Shape           =   2  'Oval
      Top             =   120
      Width           =   7095
   End
End
Attribute VB_Name = "frmsamp3splash"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Command1_Click()
Unload Me
End Sub

Private Sub cmdclickme_Click()
Unload Me
Set frmsamp3splash = Nothing
frmmain.Show
End Sub

Private Sub Form_Click()
Unload Me
Set frmsamp3splash = Nothing
frmmain.Show
End Sub

Private Sub Form_Load()
frmsamp3splash.Left = (Screen.Width - frmsamp3splash.Width) / 2
frmsamp3splash.Top = (Screen.Width - frmsamp3splash.Width) / 2
End Sub

