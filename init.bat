@echo off
setlocal

set /p PROJECT_NAME=Enter Project Name: 

mkdir "%PROJECT_NAME%"
mkdir "%PROJECT_NAME%\.vscode"

REM Create main.cpp
echo #include ^<iostream^> > "%PROJECT_NAME%\main.cpp"
echo using namespace std; >> "%PROJECT_NAME%\main.cpp"
echo int main() { >> "%PROJECT_NAME%\main.cpp"
echo     cout ^<^< "Hello, World!" ^<^< endl; >> "%PROJECT_NAME%\main.cpp"
echo     return 0; >> "%PROJECT_NAME%\main.cpp"
echo } >> "%PROJECT_NAME%\main.cpp"

REM Create settings.json
echo { > "%PROJECT_NAME%\.vscode\settings.json"
echo   "files.associations": { >> "%PROJECT_NAME%\.vscode\settings.json"
echo     "ostream": "cpp", >> "%PROJECT_NAME%\.vscode\settings.json"
echo     "typeinfo": "cpp", >> "%PROJECT_NAME%\.vscode\settings.json"
echo     "sstream": "cpp", >> "%PROJECT_NAME%\.vscode\settings.json"
echo     "limits": "cpp", >> "%PROJECT_NAME%\.vscode\settings.json"
echo     "iostream": "cpp" >> "%PROJECT_NAME%\.vscode\settings.json"
echo   }, >> "%PROJECT_NAME%\.vscode\settings.json"
echo   "editor.formatOnSave": true, >> "%PROJECT_NAME%\.vscode\settings.json"
echo   "json.schemas": [], >> "%PROJECT_NAME%\.vscode\settings.json"
echo   "launch": { >> "%PROJECT_NAME%\.vscode\settings.json"
echo     "configurations": [], >> "%PROJECT_NAME%\.vscode\settings.json"
echo     "compounds": [] >> "%PROJECT_NAME%\.vscode\settings.json"
echo   } >> "%PROJECT_NAME%\.vscode\settings.json"
echo } >> "%PROJECT_NAME%\.vscode\settings.json"

REM Create tasks.json
echo { > "%PROJECT_NAME%\.vscode\tasks.json"
echo   "version": "2.0.0", >> "%PROJECT_NAME%\.vscode\tasks.json"
echo   "tasks": [ >> "%PROJECT_NAME%\.vscode\tasks.json"
echo     { >> "%PROJECT_NAME%\.vscode\tasks.json"
echo       "label": "build with warnings", >> "%PROJECT_NAME%\.vscode\tasks.json"
echo       "type": "shell", >> "%PROJECT_NAME%\.vscode\tasks.json"
echo       "command": "g++", >> "%PROJECT_NAME%\.vscode\tasks.json"
echo       "args": [ >> "%PROJECT_NAME%\.vscode\tasks.json"
echo         "-Wall", >> "%PROJECT_NAME%\.vscode\tasks.json"
echo         "-Wextra", >> "%PROJECT_NAME%\.vscode\tasks.json"
echo         "-Wpedantic", >> "%PROJECT_NAME%\.vscode\tasks.json"
echo         "-Werror", >> "%PROJECT_NAME%\.vscode\tasks.json"
echo         "-std=c++17", >> "%PROJECT_NAME%\.vscode\tasks.json"
echo         "${file}", >> "%PROJECT_NAME%\.vscode\tasks.json"
echo         "-o", >> "%PROJECT_NAME%\.vscode\tasks.json"
echo         "${fileDirname}\\${fileBasenameNoExtension}.exe" >> "%PROJECT_NAME%\.vscode\tasks.json"
echo       ], >> "%PROJECT_NAME%\.vscode\tasks.json"
echo       "options": { >> "%PROJECT_NAME%\.vscode\tasks.json"
echo         "shell": { >> "%PROJECT_NAME%\.vscode\tasks.json"
echo           "executable": "cmd.exe", >> "%PROJECT_NAME%\.vscode\tasks.json"
echo           "args": ["/c"] >> "%PROJECT_NAME%\.vscode\tasks.json"
echo         } >> "%PROJECT_NAME%\.vscode\tasks.json"
echo       }, >> "%PROJECT_NAME%\.vscode\tasks.json"
echo       "group": { >> "%PROJECT_NAME%\.vscode\tasks.json"
echo         "kind": "build", >> "%PROJECT_NAME%\.vscode\tasks.json"
echo         "isDefault": true >> "%PROJECT_NAME%\.vscode\tasks.json"
echo       }, >> "%PROJECT_NAME%\.vscode\tasks.json"
echo       "problemMatcher": ["$gcc"] >> "%PROJECT_NAME%\.vscode\tasks.json"
echo     } >> "%PROJECT_NAME%\.vscode\tasks.json"
echo   ] >> "%PROJECT_NAME%\.vscode\tasks.json"
echo } >> "%PROJECT_NAME%\.vscode\tasks.json"

echo Project "%PROJECT_NAME%" created successfully!
echo Opening VS Code...

cd "%PROJECT_NAME%"
code .

REM Wait 3 seconds before closing the terminal
timeout /t 3 >nul
exit
