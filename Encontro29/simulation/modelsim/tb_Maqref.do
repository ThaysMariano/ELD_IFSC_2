
vlib rtl_work
vmap work rtl_work
vmap work rtl_work 
vcom -93 -work work {../../maquinaRefri.vhd}
vsim work.maquinarefri(arc_maquinarefri)


add wave -position end  sim:/maquinarefri/clk
add wave -position end  sim:/maquinarefri/rst
add wave -position end  sim:/maquinarefri/x
add wave -position end  sim:/maquinarefri/dev5
add wave -position end  sim:/maquinarefri/dev10
add wave -position end  sim:/maquinarefri/prod
add wave -position end  sim:/maquinarefri/pr_state
add wave -position end  sim:/maquinarefri/nx_state


force -freeze sim:/maquinarefri/clk 1 0, 0 {50 ps} -r 100
force -freeze sim:/maquinarefri/rst 1 0
run
force -freeze sim:/maquinarefri/rst 0 0
run

# 25 direto
force -freeze sim:/maquinarefri/x 5 0
run
force -freeze sim:/maquinarefri/x 5 0
run
run
run
run
run

#25
force -freeze sim:/maquinarefri/x 10 0
run
force -freeze sim:/maquinarefri/x 5 0
run
force -freeze sim:/maquinarefri/x 10 0
run

#30
force -freeze sim:/maquinarefri/x 10 0
run
force -freeze sim:/maquinarefri/x 10 0
run
force -freeze sim:/maquinarefri/x 10 0
run
force -freeze sim:/maquinarefri/x 10 0
run
force -freeze sim:/maquinarefri/x 0 0
run
run

#45
force -freeze sim:/maquinarefri/x 5 0
run
force -freeze sim:/maquinarefri/x 10 0
run
force -freeze sim:/maquinarefri/x 5 0
run
force -freeze sim:/maquinarefri/x 25 0
run
force -freeze sim:/maquinarefri/x 0 0
run
run
run

#35
force -freeze sim:/maquinarefri/x 5 0
run
force -freeze sim:/maquinarefri/x 10 0
run
force -freeze sim:/maquinarefri/x 25 0
run
force -freeze sim:/maquinarefri/x 0 0
run
run



