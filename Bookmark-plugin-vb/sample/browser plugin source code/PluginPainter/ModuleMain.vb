Imports System.Reflection
Imports System.IO
Module ModuleMain
    Public plugCollection As New Collection()

    Public Function LookForPlugins() As Array

        Dim arr As New ArrayList()
        Dim dInfo As New DirectoryInfo(Application.StartupPath & "\plugins")


        arr.AddRange(dInfo.GetFiles("*.dll"))
        Return arr.ToArray

    End Function

    Public Sub Main()
        Dim a As New Form1()
        Dim b As New Form2()
        a.Show()
        If a.DialogResult = DialogResult.OK Then
            Application.Run(b)
        End If


    End Sub
End Module

Public Class Plugin
    Dim A As [Assembly]

    Dim _FileName As String
    
    Public Sub New(ByVal filename As String)
        _FileName = filename
    End Sub

    Public Sub Load()
        A = [Assembly].LoadFrom(_FileName) 'Loads the DLL
    End Sub

    Public Function Name()
        Dim t As Type = A.GetType("PlugIn.Root")
        Dim bf As BindingFlags = BindingFlags.DeclaredOnly Or BindingFlags.Public Or BindingFlags.NonPublic Or BindingFlags.Instance

        '// Construct an instance of the type
        Dim obj As Object = t.InvokeMember("Name", bf Or BindingFlags.CreateInstance, Nothing, Nothing, Nothing)

        '// Call the function that returns a value

        Return t.InvokeMember("Name", bf Or BindingFlags.InvokeMethod, Nothing, obj, Nothing)
    End Function

    Public Sub Run(ByVal Picture As PictureBox)
        Dim t As Type = A.GetType("PlugIn.Root") 'a type PlugIn is the namespace, and root are the class
        Dim bf As BindingFlags = BindingFlags.DeclaredOnly Or BindingFlags.Public Or BindingFlags.NonPublic Or BindingFlags.Instance
        Dim arg As New ArrayList() 'The arguments


        arg.Add(Picture) 'Adds the pictureBox control to the Dll can use it

        '// Construct an instance of the type
        Dim obj As Object = t.InvokeMember("Run", bf Or BindingFlags.CreateInstance, Nothing, Nothing, Nothing)

        '// Call the function
        t.InvokeMember("Run", bf Or BindingFlags.InvokeMethod, Nothing, obj, arg.ToArray)
    End Sub
End Class

