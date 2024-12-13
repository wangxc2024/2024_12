@echo off
call setEnv.bat
"E:\Program Files\MATLAB\R2024b\toolbox\shared\coder\ninja\win64\ninja.exe" -t compdb cc cxx cudac > compile_commands.json
"E:\Program Files\MATLAB\R2024b\toolbox\shared\coder\ninja\win64\ninja.exe" -v %*
