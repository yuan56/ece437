onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /system_tb/CLK
add wave -noupdate /system_tb/nRST
add wave -noupdate -expand -group pc /system_tb/DUT/CPU/DP/pc/pcif/PCen
add wave -noupdate -expand -group pc /system_tb/DUT/CPU/DP/pc/pcif/PCnext
add wave -noupdate -expand -group pc /system_tb/DUT/CPU/DP/pc/pcif/PCcurr
add wave -noupdate -expand -group ram /system_tb/DUT/prif/ramREN
add wave -noupdate -expand -group ram /system_tb/DUT/prif/ramWEN
add wave -noupdate -expand -group ram /system_tb/DUT/prif/ramaddr
add wave -noupdate -expand -group ram /system_tb/DUT/prif/ramstore
add wave -noupdate -expand -group ram /system_tb/DUT/prif/ramload
add wave -noupdate -expand -group ram /system_tb/DUT/prif/ramstate
add wave -noupdate /system_tb/DUT/CPUCLK
add wave -noupdate -expand -group datapath /system_tb/DUT/CPU/DP/dpif/halt
add wave -noupdate -expand -group datapath /system_tb/DUT/CPU/DP/dpif/ihit
add wave -noupdate -expand -group datapath /system_tb/DUT/CPU/DP/dpif/imemREN
add wave -noupdate -expand -group datapath /system_tb/DUT/CPU/DP/dpif/imemload
add wave -noupdate -expand -group datapath /system_tb/DUT/CPU/DP/dpif/imemaddr
add wave -noupdate -expand -group datapath /system_tb/DUT/CPU/DP/dpif/dhit
add wave -noupdate -expand -group datapath /system_tb/DUT/CPU/DP/dpif/datomic
add wave -noupdate -expand -group datapath /system_tb/DUT/CPU/DP/dpif/dmemREN
add wave -noupdate -expand -group datapath /system_tb/DUT/CPU/DP/dpif/dmemWEN
add wave -noupdate -expand -group datapath /system_tb/DUT/CPU/DP/dpif/flushed
add wave -noupdate -expand -group datapath /system_tb/DUT/CPU/DP/dpif/dmemload
add wave -noupdate -expand -group datapath /system_tb/DUT/CPU/DP/dpif/dmemstore
add wave -noupdate -expand -group datapath /system_tb/DUT/CPU/DP/dpif/dmemaddr
add wave -noupdate -group Reg_File /system_tb/DUT/CPU/DP/rf/rfif/WEN
add wave -noupdate -group Reg_File /system_tb/DUT/CPU/DP/rf/rfif/wsel
add wave -noupdate -group Reg_File /system_tb/DUT/CPU/DP/rf/rfif/rsel1
add wave -noupdate -group Reg_File /system_tb/DUT/CPU/DP/rf/rfif/rsel2
add wave -noupdate -group Reg_File /system_tb/DUT/CPU/DP/rf/rfif/wdat
add wave -noupdate -group Reg_File /system_tb/DUT/CPU/DP/rf/rfif/rdat1
add wave -noupdate -group Reg_File /system_tb/DUT/CPU/DP/rf/rfif/rdat2
add wave -noupdate -group Reg_File -expand /system_tb/DUT/CPU/DP/rf/Reg_Arr
add wave -noupdate -group Reg_File /system_tb/DUT/CPUCLK
add wave -noupdate -group cu /system_tb/DUT/CPU/DP/cuif/op
add wave -noupdate -group cu /system_tb/DUT/CPU/DP/cuif/funct
add wave -noupdate -group cu /system_tb/DUT/CPU/DP/cuif/vflag
add wave -noupdate -group cu /system_tb/DUT/CPU/DP/cuif/zflag
add wave -noupdate -group cu /system_tb/DUT/CPU/DP/cuif/RegWrite
add wave -noupdate -group cu /system_tb/DUT/CPU/DP/cuif/Branch
add wave -noupdate -group cu /system_tb/DUT/CPU/DP/cuif/Jump
add wave -noupdate -group cu /system_tb/DUT/CPU/DP/cuif/PCSrc
add wave -noupdate -group cu /system_tb/DUT/CPU/DP/cuif/ALUop
add wave -noupdate -group cu /system_tb/DUT/CPU/DP/cuif/RegDst
add wave -noupdate -group cu /system_tb/DUT/CPU/DP/cuif/ExtSel
add wave -noupdate -group cu /system_tb/DUT/CPU/DP/cuif/ALUSrc
add wave -noupdate -group cu /system_tb/DUT/CPU/DP/cuif/MemtoReg
add wave -noupdate -group cu /system_tb/DUT/CPU/DP/cuif/DWen
add wave -noupdate -group cu /system_tb/DUT/CPU/DP/cuif/DRen
add wave -noupdate -group cu /system_tb/DUT/CPU/DP/cuif/IRen
add wave -noupdate -group cu /system_tb/DUT/CPU/DP/cuif/halt
add wave -noupdate -group memory_control /system_tb/DUT/CPU/ccif/iwait
add wave -noupdate -group memory_control /system_tb/DUT/CPU/ccif/dwait
add wave -noupdate -group memory_control /system_tb/DUT/CPU/ccif/iREN
add wave -noupdate -group memory_control /system_tb/DUT/CPU/ccif/dREN
add wave -noupdate -group memory_control /system_tb/DUT/CPU/ccif/dWEN
add wave -noupdate -group memory_control /system_tb/DUT/CPU/ccif/iload
add wave -noupdate -group memory_control /system_tb/DUT/CPU/ccif/dload
add wave -noupdate -group memory_control /system_tb/DUT/CPU/ccif/dstore
add wave -noupdate -group memory_control /system_tb/DUT/CPU/ccif/iaddr
add wave -noupdate -group memory_control /system_tb/DUT/CPU/ccif/daddr
add wave -noupdate -group memory_control /system_tb/DUT/CPU/ccif/ramWEN
add wave -noupdate -group memory_control /system_tb/DUT/CPU/ccif/ramREN
add wave -noupdate -group memory_control /system_tb/DUT/CPU/ccif/ramstate
add wave -noupdate -group memory_control /system_tb/DUT/CPU/ccif/ramaddr
add wave -noupdate -group memory_control /system_tb/DUT/CPU/ccif/ramstore
add wave -noupdate -group memory_control /system_tb/DUT/CPU/ccif/ramload
add wave -noupdate -group alu /system_tb/DUT/CPU/DP/aif/nflag
add wave -noupdate -group alu /system_tb/DUT/CPU/DP/aif/vflag
add wave -noupdate -group alu /system_tb/DUT/CPU/DP/aif/zflag
add wave -noupdate -group alu /system_tb/DUT/CPU/DP/aif/portA
add wave -noupdate -group alu /system_tb/DUT/CPU/DP/aif/portB
add wave -noupdate -group alu /system_tb/DUT/CPU/DP/aif/outport
add wave -noupdate -group alu /system_tb/DUT/CPU/DP/aif/aluop
add wave -noupdate -group qu /system_tb/DUT/CPU/DP/qu/quif/DWen
add wave -noupdate -group qu /system_tb/DUT/CPU/DP/qu/quif/DRen
add wave -noupdate -group qu /system_tb/DUT/CPU/DP/qu/quif/IRen
add wave -noupdate -group qu /system_tb/DUT/CPU/DP/qu/quif/dhit
add wave -noupdate -group qu /system_tb/DUT/CPU/DP/qu/quif/ihit
add wave -noupdate -group qu /system_tb/DUT/CPU/DP/qu/quif/dREN
add wave -noupdate -group qu /system_tb/DUT/CPU/DP/qu/quif/dWEN
add wave -noupdate -group qu /system_tb/DUT/CPU/DP/qu/quif/iREN
add wave -noupdate -group qu /system_tb/DUT/CPU/DP/qu/quif/PCen
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {720000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {607006 ps} {935134 ps}
