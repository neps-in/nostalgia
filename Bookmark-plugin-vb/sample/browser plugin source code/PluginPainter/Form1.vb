Public Class Form1
    Inherits System.Windows.Forms.Form

#Region " Windows Form Designer generated code "

    Public Sub New()
        MyBase.New()

        'This call is required by the Windows Form Designer.
        InitializeComponent()

        'Add any initialization after the InitializeComponent() call

    End Sub

    'Form overrides dispose to clean up the component list.
    Protected Overloads Overrides Sub Dispose(ByVal disposing As Boolean)
        If disposing Then
            If Not (components Is Nothing) Then
                components.Dispose()
            End If
        End If
        MyBase.Dispose(disposing)
    End Sub

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.IContainer

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents LabelStatus As System.Windows.Forms.Label
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Me.Label1 = New System.Windows.Forms.Label()
        Me.LabelStatus = New System.Windows.Forms.Label()
        Me.SuspendLayout()
        '
        'Label1
        '
        Me.Label1.Location = New System.Drawing.Point(8, 8)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(272, 16)
        Me.Label1.TabIndex = 0
        Me.Label1.Text = "Loading plugins..."
        '
        'LabelStatus
        '
        Me.LabelStatus.Location = New System.Drawing.Point(8, 24)
        Me.LabelStatus.Name = "LabelStatus"
        Me.LabelStatus.Size = New System.Drawing.Size(272, 16)
        Me.LabelStatus.TabIndex = 1
        '
        'Form1
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
        Me.ClientSize = New System.Drawing.Size(292, 46)
        Me.Controls.AddRange(New System.Windows.Forms.Control() {Me.LabelStatus, Me.Label1})
        Me.Name = "Form1"
        Me.Text = "Plugin Painter Loading"
        Me.ResumeLayout(False)

    End Sub

#End Region

    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Dim x As Integer
        Dim arr As Array = LookForPlugins()
        Dim f As IO.FileInfo


        For x = 0 To arr.Length - 1

            LabelStatus.Text = arr(x).name()
            Dim plug As New Plugin(arr(x).FullName())
            plugCollection.Add(plug)
            plug.Load()


        Next

        Me.DialogResult = DialogResult.OK
        Me.Close()




    End Sub

    Private Sub LabelStatus_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles LabelStatus.Click

    End Sub
End Class
