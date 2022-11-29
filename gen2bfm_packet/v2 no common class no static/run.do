vlib work
vlog top.sv 
vsim top +testcase=good_pkt -sv_seed 2345
run -all
