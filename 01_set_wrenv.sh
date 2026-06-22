# edit these parameters to match your setup 

# First, uncomment exactly ONE version of VxWorks and edit the path to match your host

# Set version and install path for VxWorks 21.03
# export VXWORKS_INSTALL_PATH=/opt/wr/vx/vx2103
# export VXWORKS_VERSION=21.03
# export BSP_NAME=itl_generic_2_0_3_1

# Set version and install path for VxWorks 21.07
# export VXWORKS_INSTALL_PATH=/opt/wr/vx/vx2107
# export VXWORKS_VERSION=21.07
# export BSP_NAME=itl_generic_2_0_3_2

# Set version and install path for VxWorks 21.11
# export VXWORKS_INSTALL_PATH=/opt/wr/vx/vx2111
# export VXWORKS_VERSION=21.11
# export BSP_NAME=itl_generic_3_0_0_0

# Set version and install path for VxWorks 22.03
# export VXWORKS_INSTALL_PATH=/opt/wr/vx/vx2203
# export VXWORKS_VERSION=22.03
# export BSP_NAME=itl_generic_3_0_0_1

# Set version and install path for VxWorks 22.09
# export VXWORKS_INSTALL_PATH=/opt/wr/vx/vx2209
# export VXWORKS_VERSION=22.09
# export BSP_NAME=itl_generic_3_0_0_2

# Set version and install path for VxWorks 23.03
# export VXWORKS_INSTALL_PATH=/opt/wr/vx/vx2303
# export VXWORKS_VERSION=23.03
# export BSP_NAME=itl_generic_3_0_0_3

# Set version and install path for VxWorks 23.09
# export VXWORKS_INSTALL_PATH=/opt/wr/vx/vx2309
# export VXWORKS_VERSION=23.09
# export BSP_NAME=itl_generic_3_0_0_3

# Set version and install path for VxWorks 24.03
# export VXWORKS_INSTALL_PATH=/opt/wr/vx/vx2403
# export VXWORKS_VERSION=24.03
# export BSP_NAME=itl_generic_3_0_0_4

# Set version and install path for VxWorks 24.07
# export VXWORKS_INSTALL_PATH=/opt/wr/vx/vx2407
# export VXWORKS_VERSION=24.07
# export BSP_NAME=itl_generic_3_0_0_4

# Set version and install path for VxWorks 25.03
# export VXWORKS_INSTALL_PATH=/opt/wr/vx/vx2503
# export VXWORKS_VERSION=25.03
# export BSP_NAME=itl_generic_3_0_0_4

# Set version and install path for VxWorks 25.09
# export VXWORKS_INSTALL_PATH=/opt/wr/vx/vx2509
# export VXWORKS_VERSION=25.09
# export BSP_NAME=itl_generic_3_0_0_4

# Set version and install path for VxWorks 26.03
export VXWORKS_INSTALL_PATH=/opt/wr/vx/vx2603
export VXWORKS_VERSION=26.03
export BSP_NAME=itl_generic_3_0_0_5

# Project Settings
export PROJECT_NAME=myx86pc
export WORKSPACE_DIR=workspace
export VSB_NAME=${PROJECT_NAME}-vsb
export VIP_NAME=${PROJECT_NAME}-vip
# this is so you can use a custom DTS file for your specific board and/or configuration
# note that the file $DTS_FILE must exist in the dts/ directory or the VIP will fail
export DTS_FILE=my_custom_dts_file.dts
 

# set this section for your target network
export TARGET_IP=192.168.12.32
export SERVER_IP=192.168.12.51
export GATEWAY_IP=192.168.12.1
export NETMASK=255.255.255.0
export NETMASKHEX=ffffff00
export NETMASKCIDR=24

# alias wgrep='env | grep WIND'
echo "Setting VxWorks developer's shell environment variables. type 'env | grep WIND' to see them"
${VXWORKS_INSTALL_PATH}/wrenv.sh -p vxworks/${VXWORKS_VERSION}
