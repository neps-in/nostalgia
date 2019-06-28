@ECHO OFF
REM **********************************************************************************
REM * Organizing Files 
REM * Move songs,pfs,photos to their respective folders
REM * ORGANIZE.BAT <FOLDERNAME>
REM **********************************************************************************

ECHO Organising MP3, Flv, PDF, WMV Files in %1 Folder
IF EXIST %1\*.MP3 MOVE *.MP3 C:\D_MP3
IF EXIST %1\*.FLV MOVE *.FLV C:\D_FLV
IF EXIST %1\*.PDF MOVE *.PDF C:\D_PDF
IF EXIST %1\*.WMV MOVE *.WMV C:\D_WMV
IF EXIST %1\*.JPG MOVE *.JPG C:\D_IMG
ECHO Organising MP3, Flv, PDF, WMV, JPG, GIF Files .... DONE

