@echo off
set xv_path=G:\\Xlinx_2016\\Vivado\\2016.4\\bin
call %xv_path%/xelab  -wto 4df49332099e45e89e88a949980a3580 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot tb_top_test_behav xil_defaultlib.tb_top_test -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
