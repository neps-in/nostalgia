
IEHelperps.dll: dlldata.obj IEHelper_p.obj IEHelper_i.obj
	link /dll /out:IEHelperps.dll /def:IEHelperps.def /entry:DllMain dlldata.obj IEHelper_p.obj IEHelper_i.obj kernel32.lib rpcndr.lib rpcns4.lib rpcrt4.lib oleaut32.lib uuid.lib 

.c.obj:
	cl /c /Ox /DWIN32 /D_WIN32_WINNT=0x0400 /DREGISTER_PROXY_DLL $<

clean:
	@del IEHelperps.dll
	@del IEHelperps.lib
	@del IEHelperps.exp
	@del dlldata.obj
	@del IEHelper_p.obj
	@del IEHelper_i.obj
