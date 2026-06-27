
@echo off
setlocal
set FORCE_HOSTS=false
if "%~1"=="--force" set FORCE_HOSTS=true

set K3S_NODE=192.168.51.30

echo ============================================
echo  WorkerTrust - Full Port Forward Setup
echo ============================================
echo.

echo [1/3] Setting up PC-side portproxy (PC localhost ^<-^> k3s node %K3S_NODE%)...
echo       (requires elevated prompt - run as Administrator)
netsh interface portproxy delete v4tov4 listenaddress=0.0.0.0 listenport=9090 >nul 2>&1
netsh interface portproxy delete v4tov4 listenaddress=0.0.0.0 listenport=8888 >nul 2>&1
netsh interface portproxy delete v4tov4 listenaddress=0.0.0.0 listenport=8000 >nul 2>&1
netsh interface portproxy delete v4tov4 listenaddress=0.0.0.0 listenport=30082 >nul 2>&1
netsh interface portproxy delete v4tov4 listenaddress=0.0.0.0 listenport=30050 >nul 2>&1
netsh interface portproxy delete v4tov4 listenaddress=0.0.0.0 listenport=30090 >nul 2>&1
netsh interface portproxy delete v4tov4 listenaddress=0.0.0.0 listenport=30200 >nul 2>&1
netsh interface portproxy delete v4tov4 listenaddress=0.0.0.0 listenport=30084 >nul 2>&1
netsh interface portproxy delete v4tov4 listenaddress=0.0.0.0 listenport=32675 >nul 2>&1

netsh interface portproxy add v4tov4 listenaddress=0.0.0.0 listenport=9090  connectaddress=%K3S_NODE% connectport=9090
netsh interface portproxy add v4tov4 listenaddress=0.0.0.0 listenport=8888  connectaddress=%K3S_NODE% connectport=8888
netsh interface portproxy add v4tov4 listenaddress=0.0.0.0 listenport=8000  connectaddress=%K3S_NODE% connectport=8000
netsh interface portproxy add v4tov4 listenaddress=0.0.0.0 listenport=30082 connectaddress=%K3S_NODE% connectport=30082
netsh interface portproxy add v4tov4 listenaddress=0.0.0.0 listenport=30050 connectaddress=%K3S_NODE% connectport=30050
netsh interface portproxy add v4tov4 listenaddress=0.0.0.0 listenport=30090 connectaddress=%K3S_NODE% connectport=30090
netsh interface portproxy add v4tov4 listenaddress=0.0.0.0 listenport=30200 connectaddress=%K3S_NODE% connectport=30200
netsh interface portproxy add v4tov4 listenaddress=0.0.0.0 listenport=30084 connectaddress=%K3S_NODE% connectport=30084
netsh interface portproxy add v4tov4 listenaddress=0.0.0.0 listenport=32675 connectaddress=%K3S_NODE% connectport=32675
echo PC portproxy rules set.
echo.

echo [2/3] Setting up ADB reverse (Android device ^<-^> PC localhost)...
adb reverse tcp:9090 tcp:9090
adb reverse tcp:8888 tcp:8888
adb reverse tcp:8000 tcp:8000
adb reverse tcp:30082 tcp:30082
adb reverse tcp:30050 tcp:30050
adb reverse tcp:30090 tcp:30090
adb reverse tcp:30200 tcp:30200
adb reverse tcp:30084 tcp:30084
adb reverse tcp:32675 tcp:32675
echo ADB reverse complete.
echo.

echo [3/3] Updating Android device /etc/hosts...
if "%FORCE_HOSTS%"=="false" (
    adb shell cat /etc/hosts | findstr /c:"keycloak.workertrust.local" >nul
    if %errorlevel% equ 0 (
        echo Hosts entries already exist on the device.
        goto :skip_hosts
    )
)

echo Hosts entries not found or forced. Attempting to add them [requires root/remount]...
adb root
adb remount

adb shell "sed -i '/workertrust.local/d' /etc/hosts"
adb shell "echo 127.0.0.1 grafana.workertrust.local >> /etc/hosts"
adb shell "echo 127.0.0.1 openbao.workertrust.local >> /etc/hosts"
adb shell "echo 127.0.0.1 prometheus.workertrust.local >> /etc/hosts"
adb shell "echo 127.0.0.1 keycloak.workertrust.local >> /etc/hosts"
adb shell "echo 127.0.0.1 minio.workertrust.local >> /etc/hosts"
adb shell "echo 127.0.0.1 minio-ui.workertrust.local >> /etc/hosts"
adb shell "echo 127.0.0.1 jenkins.workertrust.local >> /etc/hosts"
adb shell "echo 127.0.0.1 adminer.workertrust.local >> /etc/hosts"
adb shell "echo 127.0.0.1 opensearch.workertrust.local >> /etc/hosts"
adb shell "echo 127.0.0.1 neo4j.workertrust.local >> /etc/hosts"
adb shell "echo 127.0.0.1 harbor.workertrust.local >> /etc/hosts"
adb shell "echo 127.0.0.1 gitlab.workertrust.local >> /etc/hosts"

echo Hosts entries updated (mapped to 127.0.0.1).

:skip_hosts
echo.
echo ============================================
echo  Active Routes:
echo ============================================
echo  Phone -^> ADB reverse -^> PC:port -^> %K3S_NODE%:port
echo.
echo  - Keycloak (HTTPS): https://keycloak.workertrust.local:32675
echo  - Keycloak (HTTP):  http://keycloak.workertrust.local:30082
echo  - API (gRPC):       localhost:9090
echo  - API (Kong):       http://localhost:8000
echo  - MinIO API:        http://localhost:30090
echo  - OpenBao:          http://localhost:30200
echo  - Gotify Push:      http://localhost:30084
echo  - Unified gRPC:     localhost:30050
echo ============================================
echo.
echo NOTE: For NON-ROOTED devices, manually add in 'Virtual Hosts' app:
echo   keycloak.workertrust.local  ^<-^>  127.0.0.1
echo   minio.workertrust.local     ^<-^>  127.0.0.1
echo.
pause
