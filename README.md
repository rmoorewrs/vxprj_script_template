# VxWorks Build Script Templates
These scripts serve as a starting point for scripting your VxWorks platform projects. The scripts will produce:
- VSB
    - VSB=VxWorks Source Build is a set of binary libraries compiled for a specific processor, instruction set and board support package
- VIP
    - VIP=VxWorks Image Project is the actual kernel image that is loaded into memory and runs the VxWorks kernel. It is composed of object modules pulled from the VSB
    
The scripts will work on both Windows and supported Linux development hosts.


## Prerequisites: 
- Valid VxWorks installation on a Windows or Linux host
- Board Support Package name. See instructions below on how to get the exact correct BSP name
- edit the `01_set_wrenv.bat` or `01_set_wrenv.sh` to match your installation


## Instructions:

### 0) Edit the 02_create_vip

### 1) Change directory into the `ws` workspace

```
cd zcu102-demo/ws
```

### 2) Set up the environment variables for VxWorks

```
. ../set_wrenv_2503.sh
```

 Alternately, run 
 ```
 <path-to-vxworks-install>/wrenv.sh -p vxworks/25.03     # use your path, your version
 ```

### 3) Run the A53 creation script
```
../create_zynqmp_a53.sh
```

### 4) Run the R5 creation script
```
../create_zynqmp_r5.sh
```

### 5) Optional: import the VSB and VIP projects into Workbench. Import the VSBs first. 

Import 4 projects: 
- zynqmp_r5-vsb
- zynqmp_r5-vip
- zynqmp_a53-vsb
- zynqmp_a53-vip

In order to import in workbench do the following:
```
File->Import->VxWorks->VxWorks VSB
```
---

### How to find your exact BSP name and version

#### Step 1) Open a VxWorks Development shell
open a DOS CMD or bash shell and run the wrenv utility to set up the VxWorks environment.
Examples assume VxWorks 26.03, substitute your version

Windows cmd shell:
```
<VxWorks_Install_Dir>\wrenv.exe -p vxworks/26.03 bash
env | grep WIND
```

Linux bash shell:
```
<VxWorks_Install_Dir>/wrenv.sh -p vxworks/26.03
env | grep WIND
```
You should see a lot of environment variables that start with `WIND`

#### Step 2) Run the vxprj command to get the list of BSPs
Run this command in your VxWorks development shell
```
vxprj vsb listBsps
```

The results will look something like this:
```

Valid BSPs :
   altr_agilex5_1_0_0_2
   amd_versal2_1_0_0_0
   amd_versal_1_0_2_4
   amd_versal_r5_1_0_0_2
   amd_zynq7k_3_0_0_6
   amd_zynqmp_3_0_1_3
   amd_zynqmp_r5_2_0_5_2
   aptiv_cvc131_2_0_0_1
   aws_graviton_1_0_0_3
   fsl_imx6_2_0_6_3
   fsl_imx6sx_m4_2_0_4_3
   fsl_mpc82xx_2_0_4_2
   fsl_p1p2_3_0_0_2
   fsl_p3p4p5_3_0_0_3
   fsl_t1_3_0_0_3
   fsl_t2t4_3_0_0_3
   itl_arria10_2_0_0_2
   itl_cyclone5_2_0_0_3
   itl_generic_3_0_0_5
   microchip_pfsoc_2_0_1_4
   nvidia_jetson_tx2_0_1_2_0 (UNSUPPORTED)
   nxp_imx8_1_0_7_1
   nxp_imx9_1_0_2_0
   nxp_layerscape_a7_3_0_1_0
   nxp_layerscape_a53_3_0_1_2
   nxp_layerscape_a72_2_0_8_1
   nxp_ls2085_3_0_1_1
   nxp_s32g3_1_0_0_1
   nxp_s32g274_2_0_2_1
   nxp_s32v234_2_0_0_3
   qsp_arm_3_0_0_2
   qsp_ppc750_2_0_2_3
   qsp_ppc_3_0_0_3
   renesas_rcar_h3_3_0_1_1
   renesas_rz_g2m_0_1_1_0 (UNSUPPORTED)
   renesas_rz_n1_1_0_6_2
   rpi_4_0_1_3_0 (UNSUPPORTED)
   sifive_generic_2_0_1_5
   ti_am62x_1_0_1_1
   ti_am64x_1_1_0_1
   ti_am65x_2_0_0_3
   ti_sitara_a8_2_0_6_1
   ti_sitara_a9_2_0_4_3
   ti_sitara_a15_3_0_0_3
   ti_sitara_m4_2_0_4_3
   ti_tda4_2_0_2_1
   vxsim_linux_2_0_1_3
   vxsim_windows_2_0_1_3
   wrs_sbc750gx_1_0_3_3
   xen_arm_3_0_1_0
```
#### Step 3) Set the BSP_NAME in the 01_set_wrenv script

Copy correct BSP name from the list and use it to set the `BSP_NAME=` line in the `01_set_wrenv.*` script for your Host OS

Windows CMD example:
```
set BSP_NAME=itl_generic_3_0_0_5
```

Linux Bash example:
```
export BSP_NAME=itl_generic_3_0_0_5
```
>Note: when you change VxWorks versions, you'll need to update the BSP name and version