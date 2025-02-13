onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /seq_mult/clk
add wave -noupdate /seq_mult/reset
add wave -noupdate /seq_mult/start
add wave -noupdate -radix unsigned /seq_mult/a_in
add wave -noupdate -radix unsigned /seq_mult/b_in
add wave -noupdate -radix unsigned /seq_mult/r
add wave -noupdate -radix unsigned /seq_mult/state_reg
add wave -noupdate -radix unsigned /seq_mult/state_next
add wave -noupdate -radix unsigned /seq_mult/a_is_0
add wave -noupdate -radix unsigned /seq_mult/b_is_0
add wave -noupdate -radix unsigned /seq_mult/count_0
add wave -noupdate -radix unsigned /seq_mult/a_reg
add wave -noupdate -radix unsigned /seq_mult/a_next
add wave -noupdate -radix unsigned /seq_mult/n_reg
add wave -noupdate -radix unsigned /seq_mult/n_next
add wave -noupdate -radix unsigned /seq_mult/r_reg
add wave -noupdate -radix unsigned /seq_mult/r_next
add wave -noupdate -radix unsigned /seq_mult/adder_out
add wave -noupdate -radix unsigned /seq_mult/sub_out
add wave -noupdate -radix unsigned /seq_mult/ready
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {5124 ps} 0}
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
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {11760 ps}
