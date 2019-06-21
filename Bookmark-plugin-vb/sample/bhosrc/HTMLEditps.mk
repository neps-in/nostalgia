
HTMLEditps.dll: dlldata.obj HTMLEdit_p.obj HTMLEdit_i.obj
	link /dll /out:HTMLEditps.dll /def:HTMLEditps.def /entry:DllMain dlldata.obj HTMLEdit_p.obj HTMLEdit_i.obj \
		kernel32.lib rpcndr.lib rpcns4.lib rpcrt4.lib oleaut32.lib uuid.lib \

.c.obj:
	cl /c /Ox /DWIN32 /D_WIN32_WINNT=0x0400 /DREGISTER_PROXY_DLL \
		$<

clean:
	@del HTMLEditps.dll
	@del HTMLEditps.lib
	@del HTMLEditps.exp
	@del dlldata.obj
	@del HTMLEdit_p.obj
	@del HTMLEdit_i.obj
