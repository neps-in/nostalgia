VERSION 5.00
Begin VB.Form frmAbout 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "About SAMP3 Player"
   ClientHeight    =   4080
   ClientLeft      =   2340
   ClientTop       =   1935
   ClientWidth     =   6345
   ClipControls    =   0   'False
   Icon            =   "frmAbout.frx":0000
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2816.089
   ScaleMode       =   0  'User
   ScaleWidth      =   5958.283
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton cmdOK 
      Cancel          =   -1  'True
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   345
      Left            =   4365
      TabIndex        =   0
      Top             =   2985
      Width           =   1260
   End
   Begin VB.Image Image1 
      Height          =   2160
      Left            =   120
      Picture         =   "frmAbout.frx":08CA
      Stretch         =   -1  'True
      Top             =   240
      Width           =   1800
   End
   Begin VB.Label Label4 
      Caption         =   "Napolean Arouldass S."
      BeginProperty Font 
         Name            =   "MS Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   1920
      TabIndex        =   7
      Top             =   1560
      Width           =   3855
   End
   Begin VB.Label Label3 
      Caption         =   "Written By"
      BeginProperty Font 
         Name            =   "MS Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   1920
      TabIndex        =   6
      Top             =   1320
      Width           =   3855
   End
   Begin VB.Label Label1 
      Caption         =   "Simple And Magnificent MP3 Player"
      BeginProperty Font 
         Name            =   "DeVinne BT"
         Size            =   11.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   1920
      TabIndex        =   4
      Top             =   960
      Width           =   3975
   End
   Begin VB.Label lblTitle 
      Caption         =   "SAMP3 Player"
      BeginProperty Font 
         Name            =   "DeVinne Txt BT"
         Size            =   20.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   480
      Left            =   2040
      TabIndex        =   2
      Top             =   120
      Width           =   3885
   End
   Begin VB.Label lblVersion 
      Caption         =   "Version 1.1"
      BeginProperty Font 
         Name            =   "Serifa BT"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   2040
      TabIndex        =   3
      Top             =   600
      Width           =   3885
   End
   Begin VB.Label Label5 
      Caption         =   "A. Armel Susai Raja"
      BeginProperty Font 
         Name            =   "MS Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   1920
      TabIndex        =   8
      Top             =   2280
      Width           =   3855
   End
   Begin VB.Label Label2 
      Caption         =   "Designed By"
      BeginProperty Font 
         Name            =   "MS Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   1920
      TabIndex        =   5
      Top             =   2040
      Width           =   3855
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00808080&
      BorderStyle     =   6  'Inside Solid
      Index           =   1
      X1              =   225.372
      X2              =   5450.256
      Y1              =   1905.002
      Y2              =   1905.002
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00FFFFFF&
      BorderWidth     =   2
      Index           =   0
      X1              =   225.372
      X2              =   5436.17
      Y1              =   1905.002
      Y2              =   1905.002
   End
   Begin VB.Label lblDisclaimer 
      Caption         =   "Warning: ... This Computer Program is fully a freeware  No one has the right to sell or distribute with other packages."
      BeginProperty Font 
         Name            =   "NewsGoth Lt BT"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   945
      Left            =   375
      TabIndex        =   1
      Top             =   2985
      Width           =   3870
   End
End
Attribute VB_Name = "frmAbout"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit





Private Sub cmdOK_Click()
  Unload Me
End Sub

Private Sub Form_Load()
    Me.Caption = "About SAMP3 Player"
    lblVersion.Caption = "Version 1.1"
    lblTitle.Caption = "SAMP3 Player"
 End Sub

