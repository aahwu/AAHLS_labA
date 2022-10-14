
set TopModule "matrixmul"
set ClockPeriod 10
set ClockList ap_clk
set HasVivadoClockPeriod 0
set CombLogicFlag 0
set PipelineFlag 0
set DataflowTaskPipelineFlag 1
set TrivialPipelineFlag 0
set noPortSwitchingFlag 1
set FloatingPointFlag 0
set FftOrFirFlag 0
set NbRWValue 0
set intNbAccess 0
set NewDSPMapping 1
set HasDSPModule 1
set ResetLevelFlag 1
set ResetStyle control
set ResetSyncFlag 1
set ResetRegisterFlag 0
set ResetVariableFlag 0
set ResetRegisterNum 0
set FsmEncStyle onehot
set MaxFanout 0
set RtlPrefix {}
set RtlSubPrefix matrixmul_
set ExtraCCFlags {}
set ExtraCLdFlags {}
set SynCheckOptions {}
set PresynOptions {}
set PreprocOptions {}
set SchedOptions {}
set BindOptions {}
set RtlGenOptions {}
set RtlWriterOptions {}
set CbcGenFlag {}
set CasGenFlag {}
set CasMonitorFlag {}
set AutoSimOptions {}
set ExportMCPathFlag 0
set SCTraceFileName mytrace
set SCTraceFileFormat vcd
set SCTraceOption all
set TargetInfo xcvu9p:-flgb2104:-1-e
set SourceFiles {sc {} c ../../../110061901_lab_a/Design_Optimization_Source_Code/lab1/matrixmul.cpp}
set SourceFlags {sc {} c {{}}}
set DirectiveFile C:/Users/ShaneWu/OneDrive/Desktop/Documents/NTU/HLS/labA/hls_matrixmul_prj/solution4/solution4.directive
set TBFiles {verilog ../../../110061901_lab_a/Design_Optimization_Source_Code/lab1/matrixmul_test.cpp bc ../../../110061901_lab_a/Design_Optimization_Source_Code/lab1/matrixmul_test.cpp vhdl ../../../110061901_lab_a/Design_Optimization_Source_Code/lab1/matrixmul_test.cpp sc ../../../110061901_lab_a/Design_Optimization_Source_Code/lab1/matrixmul_test.cpp cas ../../../110061901_lab_a/Design_Optimization_Source_Code/lab1/matrixmul_test.cpp c {}}
set SpecLanguage C
set TVInFiles {bc {} c {} sc {} cas {} vhdl {} verilog {}}
set TVOutFiles {bc {} c {} sc {} cas {} vhdl {} verilog {}}
set TBTops {verilog {} bc {} vhdl {} sc {} cas {} c {}}
set TBInstNames {verilog {} bc {} vhdl {} sc {} cas {} c {}}
set XDCFiles {}
set ExtraGlobalOptions {"area_timing" 1 "clock_gate" 1 "impl_flow" map "power_gate" 0}
set TBTVFileNotFound {}
set AppFile ../hls.app
set ApsFile solution4.aps
set AvePath ../..
set DefaultPlatform DefaultPlatform
set multiClockList {}
set SCPortClockMap {}
set intNbAccess 0
set PlatformFiles {{DefaultPlatform {xilinx/virtexuplus/virtexuplus}}}
set HPFPO 0
