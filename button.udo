

add wave -noupdate -format logic /button_TB/TB_clk

add wave -noupdate -format logic /button_TB/TB_in

add wave -noupdate -format logic /button_TB/TB_out



add wave -noupdate -format hexadecimal /button_TB/test_button/r_count
add wave -noupdate -format logic /button_TB/test_button/r_flag_fall

add wave -noupdate -format logic /button_TB/test_button/r_old_data
add wave -noupdate -format logic /button_TB/test_button/w_new_data




#TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {50 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 161
configure wave -valuecolwidth 150
#configure wave -justifyvalue left
configure wave -signalnamewidth 1

#configure wave -snapdistance 10
#configure wave -datasetprefix 0
#configure wave -rowmargin 4
#configure wave -childrowmargin 2
#configure wave -gridoffset 0
#configure wave -gridperiod 1
#configure wave -griddelta 40
#configure wave -timeline 0

configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {1 us}
