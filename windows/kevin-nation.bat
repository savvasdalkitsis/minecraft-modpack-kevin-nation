set app=%APPDATA%\kevin-nation-modpack

if not exist %app% mkdir %app%

del %app%\process.bat

curl -L -H "Cache-Control: no-cache" "https://raw.githubusercontent.com/savvasdalkitsis/minecraft-modpack-kevin-nation/main/windows/process.bat?cachebust=%time%" > %app%\process.bat

CALL %app%\process.bat