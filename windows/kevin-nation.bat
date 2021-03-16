set app=%APPDATA%\kevin-nation-modpack

if not exist %app% mkdir %app%

del %app%\process.bat

curl -H 'Cache-Control: no-cache' -L "https://raw.githubusercontent.com/savvasdalkitsis/minecraft-modpack-kevin-nation/main/windows/process.bat" > %app%\process.bat

CALL %app%\process.bat