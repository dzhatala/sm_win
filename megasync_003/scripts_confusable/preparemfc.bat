@echo off
@call env.bat
@echo "using datadir=$datadir [ENTER]"


@REM if [ "remove"  == "remove" ]; then
@REM 	del  %datadir%\*.mfc
@REM else 
@REM 	echo "WARNING:  $0 NOT cleaning old mfcs in $datadir "
@REM fi
@REM #read
set z_my_cmd=%HTKTOOLS_DIR%\HCopy -T 7 -C configcopy.txt -S wav2mfcc_lst.w32
@echo on
echo %z_my_cmd% 
@rem ; eval $cmd
@rem set
@%z_my_cmd%
