#!/bin/sh

# make sure and run 01_set_wrenv.sh before running this script

# check that this is a valid VxWorks dev shell
if [ -z "$WIND_RELEASE_ID" ]; then echo "WR Dev Shell Not detected, run \<install_dir\>/wrenv.sh -p vxworks/${VXWORKS_VERSION} first";return -1; else echo "VxWorks Release $WIND_RELEASE_ID detected"; fi

# set 'workspace' as project workspace
export WORKSPACE_DIR=workspace
mkdir -p ${WORKSPACE_DIR}
export MY_WS_DIR=$(pwd)/${WORKSPACE_DIR}

# cd into the workspace directory
cd ${MY_WS_DIR}
echo $pwd

###############
# VSB
###############
# Create, Customize and Build the VSB
vxprj vsb create -lp64 -bsp ${BSP_NAME} ${VSB_NAME} -force -S 
cd ${VSB_NAME}

# Now add VSB layers/components. To find the names of available components, run:
# vxprj vsb listAll
vxprj vsb add LIBCURL
vxprj vsb add CJSON

# build the VSB
vxprj vsb build -j


##############
#  VIP
###############
# create, configure and build VIP
cd $MY_WS_DIR
vxprj vip create -vsb $VSB_NAME ${BSP_NAME} llvm -profile PROFILE_DEVELOPMENT $VIP_NAME
cd $MY_WS_DIR/$VIP_NAME
vxprj bundle add BUNDLE_STANDALONE_SHELL
vxprj vip component add $VIP_NAME INCLUDE_SIO
vxprj vip parameter set $VIP_NAME CONSOLE_BAUD_RATE '115200'
vxprj vip component add $VIP_NAME INCLUDE_STANDALONE_SYM_TBL
vxprj vip component add $VIP_NAME INCLUDE_RTP
vxprj vip component add $VIP_NAME INCLUDE_TIMER_SYS_SHOW
vxprj vip component add $VIP_NAME INCLUDE_GETOPT 
vxprj vip component add $VIP_NAME INCLUDE_STANDALONE_DTB
vxprj vip component add $VIP_NAME INCLUDE_IPWRAP_IFCONFIG
vxprj vip component add $VIP_NAME INCLUDE_IFCONFIG
vxprj vip parameter set $VIP_NAME IFCONFIG_1 '"ifname gei0","devname gei","inet '"${TARGET_IP}"'/'"${NETMASKCIDR}"'","gateway '"${GATEWAY_IP}"'"'
vxprj vip component add $VIP_NAME INCLUDE_IPATTACH
vxprj vip component add $VIP_NAME INCLUDE_PING
vxprj vip component add $VIP_NAME INCLUDE_IPPING_CMD
vxprj vip component add $VIP_NAME INCLUDE_IPTELNETS
vxprj vip component add $VIP_NAME INCLUDE_ROUTECMD
vxprj vip component add $VIP_NAME INCLUDE_IPROUTE_CMD
vxprj vip component add $VIP_NAME INCLUDE_VXBUS_SHOW
vxprj vip component add $VIP_NAME DRV_TEMPLATE_FDT_MAP
vxprj vip component add $VIP_NAME INCLUDE_USB
# vxprj vip component add $VIP_NAME INCLUDE_EHCI
# vxprj vip parameter set $VIP_NAME INCLUDE_EHCI_INIT
# vxprj vip parameter set $VIP_NAME INCLUDE_OHCI
# vxprj vip parameter set $VIP_NAME INCLUDE_OHCI_INIT
# vxprj vip parameter set $VIP_NAME INCLUDE_UHCI
# vxprj vip parameter set $VIP_NAME INCLUDE_UHCI_INIT
# vxprj vip parameter set $VIP_NAME INCLUDE_XHCI
# vxprj vip parameter set $VIP_NAME INCLUDE_XHCI_INIT
vxprj vip component add $VIP_NAME INCLUDE_UNIX
vxprj vip component add $VIP_NAME INCLUDE_ZLIB
vxprj vip component add $VIP_NAME INCLUDE_PC_CONSOLE
vxprj vip component add $VIP_NAME DRV_KBD_USB
vxprj vip component add $VIP_NAME DRV_CONSOLE_EFI


# Filesystem
vxprj vip component add $VIP_NAME INCLUDE_SD_BUS
vxprj vip component add $VIP_NAME INCLUDE_USB_GEN2_STORAGE_INIT
vxprj vip component add $VIP_NAME INCLUDE_XBD_BLK_DEV
vxprj vip component add $VIP_NAME INCLUDE_XBD_PART_LIB
vxprj vip component add $VIP_NAME DRV_MMCSTORAGE_CARD
vxprj vip component add $VIP_NAME INCLUDE_DOSFS
vxprj vip component add $VIP_NAME INCLUDE_DOSFS_DIR_VFAT
vxprj vip parameter set $VIP_NAME DOSFS_COMPAT_NT 'FALSE'
vxprj vip component add $VIP_NAME INCLUDE_DOSFS_FAT
vxprj vip component add $VIP_NAME INCLUDE_DOSFS_CACHE
vxprj vip component add $VIP_NAME INCLUDE_DOSFS_SHOW
vxprj vip component add $VIP_NAME INCLUDE_DOSFS_PRTMSG_LEVEL
vxprj vip component add $VIP_NAME INCLUDE_DOSFS_MAIN
vxprj vip component add $VIP_NAME INCLUDE_SYS_WARM_USB

# Debug
vxprj vip component add $VIP_NAME INCLUDE_DEBUG_AGENT_START
vxprj vip component add $VIP_NAME INCLUDE_ANALYSIS_AGENT
vxprj vip component add $VIP_NAME INCLUDE_ANALYSIS_DEBUG_SUPPORT
vxprj vip component add $VIP_NAME INCLUDE_DEBUG_AGENT INCLUDE_DEBUG_AGENT_START 
vxprj vip component add $VIP_NAME INCLUDE_WINDVIEW INCLUDE_WVUPLOAD_FILE
vxprj vip component add $VIP_NAME INCLUDE_VXBUS_SHOW
vxprj vip component add $VIP_NAME INCLUDE_VXEVENTS

# copy and specify the project DTS file
echo Using custom DTS file $DTS_DIR/$DTS_FILE
vxprj vip parameter set $VIP_NAME $DTS_FILE "$DTS_FILE"
cp $DTS_DIR/$DTS_FILE ${BSP_NAME}/$DTS_FILE

# build the project
vxprj vip build 
cd $MY_WS_DIR

echo Done
