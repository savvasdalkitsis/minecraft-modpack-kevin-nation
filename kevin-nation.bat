set app=%APPDATA%\kevin-nation-modpack

if not exist %app% mkdir %app%

bitsadmin.exe /transfer DownloadingLatestScript "https://raw.githubusercontent.com/savvasdalkitsis/minecraft-modpack-kevin-nation/main/process.bat" %app%\process.bat

CALL %app%\process.bat