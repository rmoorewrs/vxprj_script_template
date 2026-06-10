# edit these parameters to match your setup 

# Set VxWorks version and install path
export VXWORKS_INSTALL_PATH=/opt/wr/vx/vx2603
export VXWORKS_VERSION=26.03
export BSP_NAME=itl_generic_3_0_0_5

# Project Settings
export PROJECT_NAME=myx86pc
export WORKSPACE_DIR=workspace
export VSB_NAME=${PROJECT_NAME}-vsb
export VIP_NAME=${PROJECT_NAME}-vip
# this is so you could use a custom DTS file
export DTS_FILENAME=${PROJECT_NAME}
export DTS_FILE=${DTS_FILENAME}.dts

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
