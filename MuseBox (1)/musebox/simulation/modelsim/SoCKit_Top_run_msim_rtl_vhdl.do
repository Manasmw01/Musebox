transcript on
if ![file isdirectory SoCKit_Top_iputf_libs] {
	file mkdir SoCKit_Top_iputf_libs
}

if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

###### Libraries for IPUTF cores 
###### End libraries for IPUTF cores 
###### MIF file copy and HDL compilation commands for IPUTF cores 


vlog "/home/user4/spring14/ma2799/4840/musebox/audio_clk/clock_pll_sim/clock_pll.vo"

vlog -vlog01compat -work work +incdir+/home/user4/spring14/ma2799/4840/musebox/FFT_module {/home/user4/spring14/ma2799/4840/musebox/FFT_module/fft_module.vo}
vlog -vlog01compat -work work +incdir+/home/user4/spring14/ma2799/4840/musebox/FFT_module {/home/user4/spring14/ma2799/4840/musebox/FFT_module/fft_module.v}
vlog -vlog01compat -work work +incdir+/home/user4/spring14/ma2799/4840/musebox/output_files {/home/user4/spring14/ma2799/4840/musebox/output_files/dc_fifo_sm.v}
vlog -vlog01compat -work work +incdir+/home/user4/spring14/ma2799/4840/musebox/dcfifo {/home/user4/spring14/ma2799/4840/musebox/dcfifo/dc_fifo.v}
vlog -vlog01compat -work work +incdir+/home/user4/spring14/ma2799/4840/musebox {/home/user4/spring14/ma2799/4840/musebox/SoCKit_top.v}
vlog -vlog01compat -work work +incdir+/home/user4/spring14/ma2799/4840/musebox/signal_type {/home/user4/spring14/ma2799/4840/musebox/signal_type/signal_tap.v}
vlog -sv -work work +incdir+/home/user4/spring14/ma2799/4840/musebox/audio {/home/user4/spring14/ma2799/4840/musebox/audio/i2c_controller.sv}
vlog -sv -work work +incdir+/home/user4/spring14/ma2799/4840/musebox/audio {/home/user4/spring14/ma2799/4840/musebox/audio/i2c_av_config.sv}
vlog -sv -work work +incdir+/home/user4/spring14/ma2799/4840/musebox/audio {/home/user4/spring14/ma2799/4840/musebox/audio/audio_codec.sv}
vlog -sv -work work +incdir+/home/user4/spring14/ma2799/4840/musebox/aud-to-fft {/home/user4/spring14/ma2799/4840/musebox/aud-to-fft/aud_to_fft.sv}
vlib fir_equalizer
vmap fir_equalizer fir_equalizer

