set app=%APPDATA%\kevin-nation-modpack
set instance=%app%\instance
set rclone-version=v1.54.1
set rclone-zip=%app%\rclone-%rclone-version%.zip
set rclone=%app%/rclone-%rclone-version%-windows-amd64/rclone.exe
set modpack-version=v0.0.1
set conf=%app%\conf
set rclone-config-version=1.0.0
set rclone-config=%app%\conf\rclone-%rclone-config-version%.conf

if not exist %app% mkdir %app%
if not exist %conf% mkdir %conf%
if not exist %instance% mkdir %instance%

if EXIST %app%\last-version-%modpack-version% (
    EXIT /b 0
)
echo "">%app%\last-version-%modpack-version%

IF not EXIST %rclone-zip% (
    bitsadmin.exe /transfer DownloadingRclone "https://downloads.rclone.org/%rclone-version%/rclone-%rclone-version%-windows-amd64.zip" %rclone-zip%
)

if not EXIST %rclone% (
    tar -xf %rclone-zip% -C %app%
)

IF not EXIST %rclone-config% (
    bitsadmin.exe /transfer DownloadingRcloneConfig "https://raw.githubusercontent.com/savvasdalkitsis/minecraft-modpack-kevin-nation/%modpack-version%/rclone.conf" %rclone-config%
)

%rclone% sync -vP --config=%rclone-config% b2:kevin-nation-modpack/mods %instance%\mods
%rclone% copy -vP %instance%/persistentmods %instance%/mods
%rclone% copy -vP --config=%rclone-config% b2:kevin-nation-modpack/config %instance%\config
%rclone% copy -vP --config=%rclone-config% b2:kevin-nation-modpack/resourcepacks %instance%\resourcepacks
