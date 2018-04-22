cd %~dp0
set aapt_path=C:\Users\sivanliu\AppData\Local\Android\Sdk\build-tools\27.0.3\aapt.exe
java -Xmx2048m -XX:-UseParallelGC -XX:MinHeapFreeRatio=15 -jar kstools.jar ++hook %~dp0 src.apk %aapt_path% 1338303158
pause..
