'\\Plugin Painter
'\\Plugin Painter is a "Plugin Based Painter" it almost only uses Dlls to edit the images.
'\\The Plugin painter was made to show how to use Plugins (Or Assemblies) in applications
'\\The paint program itself needs alot of work.

Public Class Form2
    Inherits System.Windows.Forms.Form


    Dim bmap As New System.Drawing.Bitmap(640, 480) 'Creates our start image
#Region " Windows Form Designer generated code "

    Public Sub New()
        MyBase.New()

        'This call is required by the Windows Form Designer.
        InitializeComponent()

        'Add any initialization after the InitializeComponent() call
        Picture.Image = bmap


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
    Friend WithEvents Panel1 As System.Windows.Forms.Panel
    Friend WithEvents Button1 As System.Windows.Forms.Button
    Friend WithEvents ListPlugins As System.Windows.Forms.ListBox
    Friend WithEvents Picture As System.Windows.Forms.PictureBox
    Friend WithEvents Button2 As System.Windows.Forms.Button
    Friend WithEvents Button3 As System.Windows.Forms.Button
    Friend WithEvents Button4 As System.Windows.Forms.Button
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Dim resources As System.Resources.ResourceManager = New System.Resources.ResourceManager(GetType(Form2))
        Me.Picture = New System.Windows.Forms.PictureBox()
        Me.Panel1 = New System.Windows.Forms.Panel()
        Me.Button1 = New System.Windows.Forms.Button()
        Me.ListPlugins = New System.Windows.Forms.ListBox()
        Me.Button2 = New System.Windows.Forms.Button()
        Me.Button3 = New System.Windows.Forms.Button()
        Me.Button4 = New System.Windows.Forms.Button()
        Me.Panel1.SuspendLayout()
        Me.SuspendLayout()
        '
        'Picture
        '
        Me.Picture.BackColor = System.Drawing.Color.Transparent
        Me.Picture.Location = New System.Drawing.Point(120, 0)
        Me.Picture.Name = "Picture"
        Me.Picture.Size = New System.Drawing.Size(640, 480)
        Me.Picture.TabIndex = 1
        Me.Picture.TabStop = False
        '
        'Panel1
        '
        Me.Panel1.Controls.AddRange(New System.Windows.Forms.Control() {Me.Button1, Me.ListPlugins})
        Me.Panel1.Dock = System.Windows.Forms.DockStyle.Left
        Me.Panel1.DockPadding.All = 4
        Me.Panel1.Name = "Panel1"
        Me.Panel1.Size = New System.Drawing.Size(120, 526)
        Me.Panel1.TabIndex = 2
        '
        'Button1
        '
        Me.Button1.Dock = System.Windows.Forms.DockStyle.Bottom
        Me.Button1.Location = New System.Drawing.Point(4, 498)
        Me.Button1.Name = "Button1"
        Me.Button1.Size = New System.Drawing.Size(112, 24)
        Me.Button1.TabIndex = 1
        Me.Button1.Text = "Run"
        '
        'ListPlugins
        '
        Me.ListPlugins.Anchor = ((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Bottom) _
                    Or System.Windows.Forms.AnchorStyles.Left)
        Me.ListPlugins.Location = New System.Drawing.Point(4, 4)
        Me.ListPlugins.Name = "ListPlugins"
        Me.ListPlugins.Size = New System.Drawing.Size(112, 472)
        Me.ListPlugins.TabIndex = 0
        '
        'Button2
        '
        Me.Button2.Anchor = (System.Windows.Forms.AnchorStyles.Bottom Or System.Windows.Forms.AnchorStyles.Left)
        Me.Button2.Location = New System.Drawing.Point(128, 488)
        Me.Button2.Name = "Button2"
        Me.Button2.Size = New System.Drawing.Size(64, 32)
        Me.Button2.TabIndex = 2
        Me.Button2.Text = "New"
        '
        'Button3
        '
        Me.Button3.Anchor = (System.Windows.Forms.AnchorStyles.Bottom Or System.Windows.Forms.AnchorStyles.Left)
        Me.Button3.Location = New System.Drawing.Point(200, 488)
        Me.Button3.Name = "Button3"
        Me.Button3.Size = New System.Drawing.Size(64, 32)
        Me.Button3.TabIndex = 3
        Me.Button3.Text = "Save"
        '
        'Button4
        '
        Me.Button4.Anchor = (System.Windows.Forms.AnchorStyles.Bottom Or System.Windows.Forms.AnchorStyles.Left)
        Me.Button4.Location = New System.Drawing.Point(272, 488)
        Me.Button4.Name = "Button4"
        Me.Button4.Size = New System.Drawing.Size(64, 32)
        Me.Button4.TabIndex = 4
        Me.Button4.Text = "Load"
        '
        'Form2
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
        Me.BackgroundImage = CType(resources.GetObject("$this.BackgroundImage"), System.Drawing.Bitmap)
        Me.ClientSize = New System.Drawing.Size(776, 526)
        Me.Controls.AddRange(New System.Windows.Forms.Control() {Me.Button4, Me.Button3, Me.Picture, Me.Panel1, Me.Button2})
        Me.Name = "Form2"
        Me.Text = "Plugin Painter"
        Me.Panel1.ResumeLayout(False)
        Me.ResumeLayout(False)

    End Sub

#End Region

    Private Sub PictureBox1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Picture.Click

    End Sub

    Private Sub PictureBox1_Paint(ByVal sender As System.Object, ByVal e As System.Windows.Forms.PaintEventArgs) Handles Picture.Paint




    End Sub

    Private Sub Form2_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Dim plug As Plugin

        For Each plug In plugCollection
            ListPlugins.Items.Add(plug.Name)
        Next


    End Sub

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        Try
            Dim plug As Plugin

            plug = plugCollection.Item(ListPlugins.SelectedIndex + 1)






            plug.Run(Picture)
            Picture.Refresh()



        Catch ex As Exception

            MsgBox(ex.Message)

        End Try
    End Sub

    Private Sub Panel1_Paint(ByVal sender As System.Object, ByVal e As System.Windows.Forms.PaintEventArgs) Handles Panel1.Paint

    End Sub

    Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click
        bmap = New System.Drawing.Bitmap(640, 480) 'Creates a new Image
        Picture.Image = bmap
        Picture.Width = bmap.Width
        Picture.Height = bmap.Height

        Dim g As System.Drawing.Graphics

        Dim rect As New System.Drawing.Rectangle(0, 0, 640, 480)
        Dim mypen As New System.Drawing.Pen(System.Drawing.Color.White)

        mypen.Width = 1


        g = g.FromImage(bmap)


        g.DrawRectangle(mypen, rect)
        g.FillRectangle(mypen.Brush, 0, 0, 640, 480)
        Picture.Refresh()
    End Sub

    Private Sub Button3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button3.Click
        On Error Resume Next
        Dim a As System.Drawing.Imaging.ImageFormat

        bmap.Save(InputBox("Filename:"), a.Bmp) 'saves the image
    End Sub

    Private Sub Button4_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button4.Click
        On Error Resume Next

        bmap = New Bitmap(InputBox("Filename:")) 'Loads an image
        Picture.Image = bmap
        Picture.Width = bmap.Width
        Picture.Height = bmap.Height
        Picture.Refresh()

    End Sub

    Private Sub Panel2_Paint(ByVal sender As System.Object, ByVal e As System.Windows.Forms.PaintEventArgs)

    End Sub
End Class
