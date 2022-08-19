# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct C:\Xilinx\Vitis\project_3\workspace\top\platform.tcl
# 
# OR launch xsct and run below command.
# source C:\Xilinx\Vitis\project_3\workspace\top\platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {top}\
-hw {C:\Xilinx\Vitis\project_3\top.xsa}\
-fsbl-target {psu_cortexa53_0} -out {C:/Xilinx/Vitis/project_3/workspace}

platform write
domain create -name {standalone_ps7_cortexa9_0} -display-name {standalone_ps7_cortexa9_0} -os {standalone} -proc {ps7_cortexa9_0} -runtime {cpp} -arch {32-bit} -support-app {hello_world}
platform generate -domains 
platform active {top}
domain active {zynq_fsbl}
domain active {standalone_ps7_cortexa9_0}
platform generate -quick
platform generate
