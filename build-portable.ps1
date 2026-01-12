git clone --depth 1 -b v1.7.0 https://github.com/ERGO-Code/HiGHS.git
cd HiGHS
cmake --preset static-win
cmake --build --preset win
strip build-static-win/bin/highs.exe
upx -9 build-static-win/bin/highs.exe
Compress-Archive -Path build-static-win/bin/highs.exe -DestinationPath highs-v1.7.0-win64.zip