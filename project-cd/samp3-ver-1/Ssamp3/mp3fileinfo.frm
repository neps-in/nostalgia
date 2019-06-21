VERSION 5.00
Begin VB.Form frminfo 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "MP3 File Information"
   ClientHeight    =   2520
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   7080
   Icon            =   "mp3fileinfo.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2520
   ScaleWidth      =   7080
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox txtentry 
      Height          =   285
      Left            =   1320
      TabIndex        =   12
      Top             =   600
      Width           =   5535
   End
   Begin VB.CommandButton cmdok 
      Caption         =   "&OK"
      Height          =   375
      Left            =   3120
      TabIndex        =   10
      Top             =   2040
      Width           =   1095
   End
   Begin VB.TextBox txtcomment 
      Height          =   285
      Left            =   1320
      TabIndex        =   9
      Top             =   1680
      Width           =   5055
   End
   Begin VB.TextBox txtlayer 
      Height          =   285
      Left            =   1320
      TabIndex        =   7
      Top             =   1320
      Width           =   1695
   End
   Begin VB.TextBox txtsize 
      Height          =   285
      Left            =   5040
      TabIndex        =   5
      Top             =   960
      Width           =   1815
   End
   Begin VB.TextBox txtduration 
      Height          =   285
      Left            =   1320
      TabIndex        =   3
      Top             =   960
      Width           =   1695
   End
   Begin VB.TextBox filenam 
      Height          =   315
      Left            =   1320
      TabIndex        =   1
      Top             =   120
      Width           =   5535
   End
   Begin VB.Label lblentry 
      Caption         =   "Playlist Entry :"
      Height          =   255
      Left            =   120
      TabIndex        =   11
      Top             =   600
      Width           =   975
   End
   Begin VB.Label Label5 
      Caption         =   "&Comment"
      Height          =   255
      Left            =   120
      TabIndex        =   8
      Top             =   1680
      Width           =   855
   End
   Begin VB.Label Label4 
      Caption         =   "MPEG Layer:"
      Height          =   255
      Left            =   120
      TabIndex        =   6
      Top             =   1320
      Width           =   975
   End
   Begin VB.Label Label3 
      Caption         =   "Size :"
      Height          =   255
      Left            =   4320
      TabIndex        =   4
      Top             =   960
      Width           =   495
   End
   Begin VB.Label lblduration 
      Caption         =   "&Duration :"
      Height          =   255
      Left            =   120
      TabIndex        =   2
      Top             =   960
      Width           =   855
   End
   Begin VB.Label lbfiletitle 
      Caption         =   "Title :"
      Height          =   255
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   855
   End
End
Attribute VB_Name = "frminfo"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdOK_Click()
Unload Me
Set frminfo = Nothing

End Sub

Private Sub Form_Load()
Dim fnam As String
Dim fn As Integer
Dim siz As Long
frminfo.Left = (Screen.Width - frminfo.Width) / 2
frminfo.Top = (Screen.Width - frminfo.Width) / 2
filenam.Text = frmmain.lblTitle.Caption
txtentry.Text = frmmain.ActiveMovie1.FileName
fnam = frmmain.ActiveMovie1.FileName
fn = FreeFile

Open fnam For Binary As fn
  siz = LOF(fn) / 1024
Close fn
frmmain.Mp3Info1.Open (frmmain.ActiveMovie1.FileName)
txtduration = Int(frmmain.ActiveMovie1.Duration) & " Seconds"
txtlayer = frmmain.Mp3Info1.Layer
txtsize.Text = siz & " KB"
txtcomment = frmmain.Mp3Info1.Comment
 
End Sub

