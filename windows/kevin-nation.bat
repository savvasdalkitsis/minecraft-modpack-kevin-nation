set app=%APPDATA%\kevin-nation-modpack

if not exist %app% mkdir %app%

del %app%\process.bat

bitsadmin.exe /transfer DownloadingLatestScript "https://raw.githubusercontent.com/savvasdalkitsis/minecraft-modpack-kevin-nation/main/windows/process.bat" %app%\process.bat

CALL %app%\process.bat