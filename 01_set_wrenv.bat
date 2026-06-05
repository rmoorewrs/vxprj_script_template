rem edit these parameters to match your setup 
rem Note: Please set VXWORKS_INSTALL_PATH to the Unix-style path equivalent of WIND_BASE

rem VxWorks version and install path settings
set WIND_BASE=C:\vx\vx2603
set VXWORKS_INSTALL_PATH=/c/vx/vx2603
set VXWORKS_VERSION=26.03
set BSP_NAME=amd_zynqmp_3_0_1_3

rem Project settings
set PROJECT_NAME=myx86pc
set WORKSPACE_DIR=workspace
set VSB_NAME=%PROJECT_NAME%-vsb
set VIP_NAME=%PROJECT_NAME%-vip
rem this is so you could use a custom DTS file
set DTS_FILENAME=%PROJECT_NAME%
set DTS_FILE=%DTS_FILENAME%.dts


# set this section for your target network
set TARGET_IP=192.168.12.35
set SERVER_IP=192.168.12.51
set GATEWAY_IP=192.168.12.1
set NETMASK=255.255.255.0
set NETMASKHEX=ffffff00
set NETMASKCIDR=24


echo setting VxWorks environment and starting bash on Windows
echo next run "./02_create_vsb.sh" to build your project
%WIND_BASE%\wrenv.exe -p vxworks/%VXWORKS_VERSION% bash