@echo off
cls
set INPUT=preview
set FLAG=no
set /P INPUT=Enter Course Acronym ["Press Enter key to open preview.htm"]: 
set course=c:\p5\PREVIEW\preview.htm
set sharedcourse=d:\p5\PREVIEW\preview.htm
IF EXIST %sharedcourse% (set course=d:\p5\PREVIEW\preview.htm)
set temp=c:\xml\production\working\try-%INPUT%.htm
IF EXIST %temp% (set course=C:\xml\production\working\try-%INPUT%.htm
         set FLAG=yes)
set sharedservertemp=d:\xml\production\working\%USERNAME%\try-%INPUT%.htm
IF EXIST %sharedservertemp% (set course=d:\xml\production\working\%USERNAME%\try-%INPUT%.htm
         set FLAG=yes)		 
set temp=c:\xml\production\working\try-OLP-%INPUT%.htm
IF EXIST %temp% (set course=C:\xml\production\working\try-OLP-%INPUT%.htm
         set FLAG=yes)
set sharedservertemp=d:\xml\production\working\%USERNAME%\try-OLP-%INPUT%.htm
IF EXIST %sharedservertemp% (set course=d:\xml\production\working\%USERNAME%\try-OLP-%INPUT%.htm
         set FLAG=yes)
IF %INPUT% EQU preview (set FLAG=yes) 

IF %FLAG% EQU no (msg * try htm not present for the course in C:\xml\production\working
          Exit)
tasklist  | findstr /I /N "chrome.exe">NUL
IF %ERRORLEVEL% EQU 0 (msg * Instance of Chrome already running. Close running instance and try again) ELSE (start chrome --allow-file-access-from-files  --enable-file-cookies %course% )