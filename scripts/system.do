onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /system_tb/CLK
add wave -noupdate /system_tb/nRST
add wave -noupdate /system_tb/syif/halt
add wave -noupdate -expand -group pc /system_tb/DUT/CPU/DP/pout
add wave -noupdate -expand -group pc /system_tb/DUT/CPU/DP/npc
add wave -noupdate -expand -group pc /system_tb/DUT/CPU/DP/pc/pcif/PCen
add wave -noupdate -expand -group pc /system_tb/DUT/CPU/DP/pc/pcif/PCnext
add wave -noupdate -expand -group pc /system_tb/DUT/CPU/DP/pc/pcif/PCcurr
add wave -noupdate -group ram /system_tb/DUT/prif/ramREN
add wave -noupdate -group ram /system_tb/DUT/prif/ramWEN
add wave -noupdate -group ram /system_tb/DUT/prif/ramaddr
add wave -noupdate -group ram /system_tb/DUT/prif/ramstore
add wave -noupdate -group ram /system_tb/DUT/prif/ramload
add wave -noupdate -group ram /system_tb/DUT/prif/ramstate
add wave -noupdate /system_tb/DUT/CPUCLK
add wave -noupdate -expand -group {Pipeline Movement} -label {decode op} /system_tb/DUT/CPU/DP/ieif/opcode_i
add wave -noupdate -expand -group {Pipeline Movement} -label DECODE /system_tb/DUT/CPU/DP/iiif/npc_o
add wave -noupdate -expand -group {Pipeline Movement} -label {exec op} /system_tb/DUT/CPU/DP/ieif/opcode_o
add wave -noupdate -expand -group {Pipeline Movement} -label EXECUTE /system_tb/DUT/CPU/DP/ieif/npc_o
add wave -noupdate -expand -group {Pipeline Movement} -label {mem op} /system_tb/DUT/CPU/DP/emif/opcode_o
add wave -noupdate -expand -group {Pipeline Movement} -label {MEMORY ACCESS} /system_tb/DUT/CPU/DP/emif/npc_o
add wave -noupdate -expand -group {Pipeline Movement} -label {wb op} /system_tb/DUT/CPU/DP/mwif/opcode_o
add wave -noupdate -expand -group {Pipeline Movement} -label WRITEBACK /system_tb/DUT/CPU/DP/mwif/npc_o
add wave -noupdate -group Reg_File /system_tb/DUT/CPU/DP/rf/rfif/WEN
add wave -noupdate -group Reg_File /system_tb/DUT/CPU/DP/rf/rfif/wsel
add wave -noupdate -group Reg_File /system_tb/DUT/CPU/DP/rf/rfif/rsel1
add wave -noupdate -group Reg_File /system_tb/DUT/CPU/DP/rf/rfif/rsel2
add wave -noupdate -group Reg_File /system_tb/DUT/CPU/DP/rf/rfif/wdat
add wave -noupdate -group Reg_File /system_tb/DUT/CPU/DP/rf/rfif/rdat1
add wave -noupdate -group Reg_File /system_tb/DUT/CPU/DP/rf/rfif/rdat2
add wave -noupdate -group Reg_File -expand /system_tb/DUT/CPU/DP/rf/Reg_Arr
add wave -noupdate -group Reg_File /system_tb/DUT/CPUCLK
add wave -noupdate -group {Forwarding Unit Muxes} /system_tb/DUT/CPU/DP/memfwA
add wave -noupdate -group {Forwarding Unit Muxes} /system_tb/DUT/CPU/DP/wbfwA
add wave -noupdate -group {Forwarding Unit Muxes} /system_tb/DUT/CPU/DP/memfwB
add wave -noupdate -group {Forwarding Unit Muxes} /system_tb/DUT/CPU/DP/wbfwB
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
add wave -noupdate -group datapath /system_tb/DUT/CPU/DP/dpif/halt
add wave -noupdate -group datapath /system_tb/DUT/CPU/DP/itype.opcode
add wave -noupdate -group datapath /system_tb/DUT/CPU/DP/jtype.addr
add wave -noupdate -group datapath /system_tb/DUT/CPU/DP/JumpAddr
add wave -noupdate -group datapath /system_tb/DUT/CPU/DP/cuif/Jump
add wave -noupdate -group datapath /system_tb/DUT/CPU/DP/branchdecide
add wave -noupdate -group datapath /system_tb/DUT/CPU/DP/dpif/ihit
add wave -noupdate -group datapath /system_tb/DUT/CPU/DP/dpif/imemREN
add wave -noupdate -group datapath /system_tb/DUT/CPU/DP/dpif/imemload
add wave -noupdate -group datapath /system_tb/DUT/CPU/DP/dpif/imemaddr
add wave -noupdate -group datapath /system_tb/DUT/CPU/DP/dpif/dhit
add wave -noupdate -group datapath /system_tb/DUT/CPU/DP/dpif/datomic
add wave -noupdate -group datapath /system_tb/DUT/CPU/DP/dpif/dmemREN
add wave -noupdate -group datapath /system_tb/DUT/CPU/DP/dpif/dmemWEN
add wave -noupdate -group datapath /system_tb/DUT/CPU/DP/dpif/flushed
add wave -noupdate -group datapath /system_tb/DUT/CPU/DP/hazard
add wave -noupdate -group datapath /system_tb/DUT/CPU/DP/dpif/dmemload
add wave -noupdate -group datapath /system_tb/DUT/CPU/DP/dpif/dmemstore
add wave -noupdate -group datapath /system_tb/DUT/CPU/DP/dpif/dmemaddr
add wave -noupdate -group datapath /system_tb/DUT/CPU/DP/RegDst_out
add wave -noupdate -group datapath /system_tb/DUT/CPU/DP/MtR_out
add wave -noupdate -group datapath /system_tb/DUT/CPU/DP/rtype.rs
add wave -noupdate -group datapath /system_tb/DUT/CPU/DP/rtype.rt
add wave -noupdate -group datapath /system_tb/DUT/CPU/DP/rtype.rd
add wave -noupdate -group ifid /system_tb/DUT/CPU/DP/iiif/iien
add wave -noupdate -group ifid /system_tb/DUT/CPU/DP/iiif/flush
add wave -noupdate -group ifid /system_tb/DUT/CPU/DP/iiif/npc_i
add wave -noupdate -group ifid /system_tb/DUT/CPU/DP/iiif/iload_i
add wave -noupdate -group ifid /system_tb/DUT/CPU/DP/iiif/iload_o
add wave -noupdate -expand -group idex /system_tb/DUT/CPU/DP/ieif/opcode_i
add wave -noupdate -expand -group idex /system_tb/DUT/CPU/DP/ieif/opcode_o
add wave -noupdate -expand -group idex /system_tb/DUT/CPU/DP/ieif/bnpc_i
add wave -noupdate -expand -group idex /system_tb/DUT/CPU/DP/ieif/bnpc_o
add wave -noupdate -expand -group idex /system_tb/DUT/CPU/DP/ieif/flush
add wave -noupdate -expand -group idex -expand /system_tb/DUT/CPU/DP/rtype
add wave -noupdate -expand -group idex /system_tb/DUT/CPU/DP/ieif/Rs_i
add wave -noupdate -expand -group idex /system_tb/DUT/CPU/DP/ieif/Rt_i
add wave -noupdate -expand -group idex /system_tb/DUT/CPU/DP/ieif/Rd_i
add wave -noupdate -expand -group idex /system_tb/DUT/CPU/DP/ieif/Rs_o
add wave -noupdate -expand -group idex /system_tb/DUT/CPU/DP/ieif/Rt_o
add wave -noupdate -expand -group idex /system_tb/DUT/CPU/DP/ieif/Rd_o
add wave -noupdate -expand -group idex /system_tb/DUT/CPU/DP/ieif/npc_i
add wave -noupdate -expand -group idex /system_tb/DUT/CPU/DP/ieif/Jaddr_i
add wave -noupdate -expand -group idex /system_tb/DUT/CPU/DP/ieif/Jaddr_o
add wave -noupdate -expand -group idex /system_tb/DUT/CPU/DP/ieif/rdata1_i
add wave -noupdate -expand -group idex /system_tb/DUT/CPU/DP/ieif/rdata1_o
add wave -noupdate -expand -group idex /system_tb/DUT/CPU/DP/ieif/rdata2_i
add wave -noupdate -expand -group idex /system_tb/DUT/CPU/DP/ieif/rdata2_o
add wave -noupdate -expand -group idex /system_tb/DUT/CPU/DP/ieif/extout_i
add wave -noupdate -expand -group idex /system_tb/DUT/CPU/DP/ieif/extout_o
add wave -noupdate -expand -group idex /system_tb/DUT/CPU/DP/ieif/Branch_i
add wave -noupdate -expand -group idex /system_tb/DUT/CPU/DP/ieif/Branch_o
add wave -noupdate -expand -group idex /system_tb/DUT/CPU/DP/ieif/DRen_i
add wave -noupdate -expand -group idex /system_tb/DUT/CPU/DP/ieif/DRen_o
add wave -noupdate -expand -group idex /system_tb/DUT/CPU/DP/ieif/DWen_i
add wave -noupdate -expand -group idex /system_tb/DUT/CPU/DP/ieif/DWen_o
add wave -noupdate -expand -group idex /system_tb/DUT/CPU/DP/ieif/RegWrite_i
add wave -noupdate -expand -group idex /system_tb/DUT/CPU/DP/ieif/RegWrite_o
add wave -noupdate -expand -group idex /system_tb/DUT/CPU/DP/ieif/RegDst_i
add wave -noupdate -expand -group idex /system_tb/DUT/CPU/DP/ieif/RegDst_o
add wave -noupdate -expand -group idex /system_tb/DUT/CPU/DP/ieif/halt_i
add wave -noupdate -expand -group idex /system_tb/DUT/CPU/DP/ieif/halt_o
add wave -noupdate -expand -group idex /system_tb/DUT/CPU/DP/ieif/MemtoReg_i
add wave -noupdate -expand -group idex /system_tb/DUT/CPU/DP/ieif/MemtoReg_o
add wave -noupdate -expand -group idex /system_tb/DUT/CPU/DP/ieif/ALUSrc_i
add wave -noupdate -expand -group idex /system_tb/DUT/CPU/DP/ieif/ALUSrc_o
add wave -noupdate -expand -group idex /system_tb/DUT/CPU/DP/ieif/ALUop_i
add wave -noupdate -expand -group idex /system_tb/DUT/CPU/DP/ieif/ALUop_o
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/emif/opcode_i
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/emif/opcode_o
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/emif/Rd_i
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/emif/Rt_i
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/emif/Rd_o
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/emif/Rt_o
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/emif/npc_i
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/emif/bnpc_i
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/emif/bnpc_o
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/emif/Jaddr_i
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/emif/Jaddr_o
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/emif/aluout_i
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/emif/aluout_o
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/emif/rdata2_i
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/emif/rdata2_o
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/emif/extout_i
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/emif/extout_o
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/emif/Branch_i
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/emif/Branch_o
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/emif/DRen_i
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/emif/DRen_o
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/emif/DWen_i
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/emif/DWen_o
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/emif/RegWrite_i
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/emif/RegWrite_o
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/emif/RegDst_i
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/emif/RegDst_o
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/emif/halt_i
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/emif/halt_o
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/emif/emen
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/emif/MemtoReg_i
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/emif/MemtoReg_o
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/emif/ALUSrc_i
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/emif/ALUSrc_o
add wave -noupdate -group memwr /system_tb/DUT/CPU/DP/mwif/opcode_i
add wave -noupdate -group memwr /system_tb/DUT/CPU/DP/mwif/opcode_o
add wave -noupdate -group memwr /system_tb/DUT/CPU/DP/mwif/Rd_i
add wave -noupdate -group memwr /system_tb/DUT/CPU/DP/mwif/Rt_i
add wave -noupdate -group memwr /system_tb/DUT/CPU/DP/mwif/Rd_o
add wave -noupdate -group memwr /system_tb/DUT/CPU/DP/mwif/Rt_o
add wave -noupdate -group memwr /system_tb/DUT/CPU/DP/mwif/npc_i
add wave -noupdate -group memwr /system_tb/DUT/CPU/DP/mwif/Jaddr_i
add wave -noupdate -group memwr /system_tb/DUT/CPU/DP/mwif/Jaddr_o
add wave -noupdate -group memwr /system_tb/DUT/CPU/DP/mwif/aluout_i
add wave -noupdate -group memwr /system_tb/DUT/CPU/DP/mwif/aluout_o
add wave -noupdate -group memwr /system_tb/DUT/CPU/DP/mwif/dload_i
add wave -noupdate -group memwr /system_tb/DUT/CPU/DP/mwif/dload_o
add wave -noupdate -group memwr /system_tb/DUT/CPU/DP/mwif/extout_i
add wave -noupdate -group memwr /system_tb/DUT/CPU/DP/mwif/extout_o
add wave -noupdate -group memwr /system_tb/DUT/CPU/DP/mwif/halt_i
add wave -noupdate -group memwr /system_tb/DUT/CPU/DP/mwif/halt_o
add wave -noupdate -group memwr /system_tb/DUT/CPU/DP/mwif/mwen
add wave -noupdate -group memwr /system_tb/DUT/CPU/DP/mwif/RegDst_i
add wave -noupdate -group memwr /system_tb/DUT/CPU/DP/mwif/RegDst_o
add wave -noupdate -group memwr /system_tb/DUT/CPU/DP/mwif/RegWrite_i
add wave -noupdate -group memwr /system_tb/DUT/CPU/DP/mwif/RegWrite_o
add wave -noupdate -group memwr /system_tb/DUT/CPU/DP/mwif/MemtoReg_i
add wave -noupdate -group memwr /system_tb/DUT/CPU/DP/mwif/MemtoReg_o
add wave -noupdate -group memwr /system_tb/DUT/CPU/DP/mwif/Rt_o
add wave -noupdate -group memwr /system_tb/DUT/CPU/DP/mwif/Rd_o
add wave -noupdate -group eif /system_tb/DUT/CPU/DP/eif/ExtSel
add wave -noupdate -group eif /system_tb/DUT/CPU/DP/eif/imm
add wave -noupdate -group eif /system_tb/DUT/CPU/DP/eif/extout
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {501690 ps} 0} {{Cursor 2} {336599 ps} 0}
quietly wave cursor active 2
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
WaveRestoreZoom {151281 ps} {487477 ps}
