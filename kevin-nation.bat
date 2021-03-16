set app=%APPDATA%\kevin-nation-modpack
set rclone-version=v1.54.1
set rclone-zip=%app%\rclone-%rclone-version%.zip

if not exist %app% mkdir %app%

IF not EXIST %rclone-zip% (
    bitsadmin.exe /transfer Job "https://downloads.rclone.org/%rclone-version%/rclone-%rclone-version%-windows-amd64.zip" %rclone-zip%
)

if not EXIST %app%/rclone-%rclone-version%-windows-amd64/rclone.exe (
    tar -xf %rclone-zip% -C %app%
)

