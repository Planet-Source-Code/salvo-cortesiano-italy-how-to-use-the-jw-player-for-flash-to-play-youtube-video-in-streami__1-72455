VERSION 5.00
Object = "{D27CDB6B-AE6D-11CF-96B8-444553540000}#1.0#0"; "Flash10c.ocx"
Begin VB.Form frmMain 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Professional YouTube-Player Streaming v.1/*.*"
   ClientHeight    =   3960
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   7245
   BeginProperty Font 
      Name            =   "Courier New"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmMain.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   3960
   ScaleWidth      =   7245
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox Text1 
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   3225
      Left            =   4245
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   4
      Text            =   "frmMain.frx":23D2
      Top             =   210
      Width           =   2925
   End
   Begin VB.ComboBox cmbLinks 
      Height          =   330
      Left            =   135
      Style           =   2  'Dropdown List
      TabIndex        =   3
      Top             =   3540
      Width           =   7035
   End
   Begin VB.Frame Frame1 
      Caption         =   "Streaming Player"
      Height          =   3360
      Left            =   120
      TabIndex        =   0
      Top             =   105
      Width           =   4065
      Begin VB.PictureBox picBck 
         BorderStyle     =   0  'None
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   3015
         Left            =   30
         ScaleHeight     =   3015
         ScaleWidth      =   3990
         TabIndex        =   1
         Top             =   225
         Width           =   3990
         Begin ShockwaveFlashObjectsCtl.ShockwaveFlash SWF 
            Height          =   3000
            Left            =   15
            TabIndex        =   2
            Top             =   75
            Width           =   3945
            _cx             =   6959
            _cy             =   5292
            FlashVars       =   ""
            Movie           =   ""
            Src             =   ""
            WMode           =   "Window"
            Play            =   "0"
            Loop            =   "-1"
            Quality         =   "High"
            SAlign          =   ""
            Menu            =   "-1"
            Base            =   ""
            AllowScriptAccess=   "always"
            Scale           =   "ShowAll"
            DeviceFont      =   "0"
            EmbedMovie      =   "0"
            BGColor         =   "000001"
            SWRemote        =   ""
            MovieData       =   ""
            SeamlessTabbing =   "1"
            Profile         =   "0"
            ProfileAddress  =   ""
            ProfilePort     =   "0"
            AllowNetworking =   "all"
            AllowFullScreen =   "false"
         End
      End
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Declare Function InitCommonControls Lib "comctl32.dll" () As Long

Private flvLink As String

Private Sub cmbLinks_Click()
    If cmbLinks.ListCount > 0 Then
        flvLink = "http://youtube.com/get_video?video_id=" & cmbLinks.List(cmbLinks.ListIndex)
        Call SWF.SetVariable("file", flvLink)
        Call SWF.Play
        SWF.ToolTipText = "Preview of " & flvLink
    End If
End Sub


Private Sub Form_Initialize()
    Call InitCommonControls
End Sub

Private Sub Form_Load()
    
    '/// Load the Player into Flash stage
    If Dir(App.Path + "\flvplayer.swf") <> "" Then _
    SWF.Movie = App.Path + "\flvplayer.swf"
    
    '/// YouTube video Links
    cmbLinks.AddItem "SQ9NUc1K1dc&t=vjVQa1PpcFOI_22b4MholAzi3nGRPsw6bXzZH6svG1E%3D"
    cmbLinks.AddItem "iHgavzvCSpk&t=vjVQa1PpcFNCq2JXBHLrkZDP2gAC0pbrMDHShyyqm2s%3D"
    cmbLinks.AddItem "mp83NFtWnRQ&t=vjVQa1PpcFOpsAyjlNCLQVuQ6qE3VQQ260PyBNItLtw%3D"
    cmbLinks.AddItem "UzHuAdpsf3k&t=vjVQa1PpcFO-1U4tmQ2xD-9D5nUfEHhrAt_B52Z6WBo%3D"
    cmbLinks.AddItem "7L6CqRRH5WY&t=vjVQa1PpcFOKLmlvOefdFrCu0iNAHz4qZC099ByOBYY%3D"
    
    cmbLinks.ListIndex = 0
End Sub
