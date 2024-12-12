@echo off
set MATLAB=P:\Tools\matlab
call "P:\Tools\matlab\sys\lcc64\lcc64\mex\lcc64opts.bat"
"P:\Tools\matlab\toolbox\shared\coder\ninja\win64\ninja.exe" -v %*
