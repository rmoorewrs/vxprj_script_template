rem edit these parameters to match your setup 
rem Note: Please set VXWORKS_INSTALL_PATH to the Unix-style path equivalent of WIND_BASE

rem Set version and install path for VxWorks 21.03
rem set WIND_BASE=C:\vx\vx2103
rem set VXWORKS_INSTALL_PATH=/c/vx/vx2103
rem set VXWORKS_VERSION=21.03
rem set BSP_NAME=itl_generic_2_0_3_1

rem Set version and install path for VxWorks 21.07
rem set WIND_BASE=C:\vx\vx2107
rem set VXWORKS_INSTALL_PATH=/c/vx/vx2107
rem set VXWORKS_VERSION=21.07
rem set BSP_NAME=itl_generic_2_0_3_2

rem Set version and install path for VxWorks 21.11
rem set WIND_BASE=C:\vx\vx2111
rem set VXWORKS_INSTALL_PATH=/c/vx/vx2111
rem set VXWORKS_VERSION=21.11
rem set BSP_NAME=itl_generic_3_0_0_0

rem Set version and install path for VxWorks 22.03
rem set WIND_BASE=C:\vx\vx2203
rem set VXWORKS_INSTALL_PATH=/c/vx/vx2203
rem set VXWORKS_VERSION=22.03
rem set BSP_NAME=itl_generic_3_0_0_1

rem Set version and install path for VxWorks 22.09
rem set WIND_BASE=C:\vx\vx2209
rem set VXWORKS_INSTALL_PATH=/c/vx/vx2209
rem set VXWORKS_VERSION=22.09
rem set BSP_NAME=itl_generic_3_0_0_2

rem Set version and install path for VxWorks 23.03
rem set WIND_BASE=C:\vx\vx2303
rem set VXWORKS_INSTALL_PATH=/c/vx/vx2303
rem set VXWORKS_VERSION=23.03
rem set BSP_NAME=itl_generic_3_0_0_3

rem Set version and install path for VxWorks 23.09
rem set WIND_BASE=C:\vx\vx2309
rem set VXWORKS_INSTALL_PATH=/c/vx/vx2309
rem set VXWORKS_VERSION=23.09
rem set BSP_NAME=itl_generic_3_0_0_3

rem Set version and install path for VxWorks 24.03
rem set WIND_BASE=C:\vx\vx2403
rem set VXWORKS_INSTALL_PATH=/c/vx/vx2403
rem set VXWORKS_VERSION=24.03
rem set BSP_NAME=itl_generic_3_0_0_4

rem Set version and install path for VxWorks 24.07
rem set WIND_BASE=C:\vx\vx2407
rem set VXWORKS_INSTALL_PATH=/c/vx/vx2407
rem set VXWORKS_VERSION=24.07
rem set BSP_NAME=itl_generic_3_0_0_4

rem Set version and install path for VxWorks 25.03
rem set WIND_BASE=C:\vx\vx2503
rem set VXWORKS_INSTALL_PATH=/c/vx/vx2503
rem set VXWORKS_VERSION=25.03
rem set BSP_NAME=itl_generic_3_0_0_4

rem VxWorks version and install path settings. Uncomment for VxWorks 25.09
rem set WIND_BASE=C:\vx\vx2509
rem set VXWORKS_INSTALL_PATH=/c/vx/vx2603
rem set VXWORKS_VERSION=25.09
rem set BSP_NAME=itl_generic_3_0_0_4

rem VxWorks version and install path settings
set WIND_BASE=C:\vx\vx2603
set VXWORKS_INSTALL_PATH=/c/vx/vx2603
set VXWORKS_VERSION=26.03
set BSP_NAME=itl_generic_3_0_0_5

rem Project settings
set PROJECT_NAME=myx86pc
set WORKSPACE_DIR=workspace
set VSB_NAME=%PROJECT_NAME%-vsb
set VIP_NAME=%PROJECT_NAME%-vip
rem this is so you can use a custom DTS file
set DTS_DIR=%cd%\dts
set DTS_FILENAME=my_custom_dts_file
set DTS_FILE=%DTS_FILENAME%.dts


rem set this section for your target network
set TARGET_IP=192.168.12.32
set SERVER_IP=192.168.12.51
set GATEWAY_IP=192.168.12.1
set NETMASK=255.255.255.0
set NETMASKHEX=ffffff00
set NETMASKCIDR=24

echo setting VxWorks environment and starting bash on Windows
echo next run "./02_create_vsb.sh" to build your project
%WIND_BASE%\wrenv.exe -p vxworks/%VXWORKS_VERSION% bash
