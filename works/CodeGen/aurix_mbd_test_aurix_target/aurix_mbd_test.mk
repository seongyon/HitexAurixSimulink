# Copyright 1994-2012 The MathWorks, Inc.
#
# File    : ert_unix.tmf   
#
# Abstract:
#       Template makefile for building a UNIX-based stand-alone embedded 
#       real-time version of Simulink model using generated C code.
#
#       This makefile attempts to conform to the guidelines specified in the
#       IEEE Std 1003.2-1992 (POSIX) standard. It is designed to be used
#       with GNU Make which is located in matlabroot/rtw/bin.
#
#       Note that this template is automatically customized by the build 
#       procedure to create "<model>.mk"
#
#       The following defines can be used to modify the behavior of the
#       build:
#         OPT_OPTS       - Optimization options. Default is -O.
#         CPP_OPTS       - C++ compiler options.	
#         OPTS           - User specific compile options.
#         USER_SRCS      - Additional user sources, such as files needed by
#                          S-functions.
#         USER_INCLUDES  - Additional include paths
#                          (i.e. USER_INCLUDES="-Iwhere-ever -Iwhere-ever2")
#
#       To enable debugging:
#         set DEBUG_BUILD = 1 below, which will trigger OPTS=-g and
#          LDFLAGS += -g (may vary with compiler version, see compiler doc) 
#
#       This template makefile is designed to be used with a system target
#       file that contains 'rtwgensettings.BuildDirSuffix' see ert.tlc


#------------------------ Macros read by make_rtw ------------------------------
#
# The following macros are read by the build procedure:
#
#  MAKECMD         - This is the command used to invoke the make utility
#  HOST            - What platform this template makefile is targeted for
#                    (i.e. PC or UNIX)
#  BUILD           - Invoke make from the build procedure (yes/no)?
#  SYS_TARGET_FILE - Name of system target file.

MAKECMD         = C:\MATLAB\R2019a\bin/win64/gmake
HOST            = PC
BUILD           = yes
SYS_TARGET_FILE = any
COMPILER_TOOL_CHAIN = unix

#---------------------- Tokens expanded by make_rtw ----------------------------
#
# The following tokens, when wrapped with "|>" and "<|" are expanded by the
# build procedure.
#
#  MODEL_NAME          - Name of the Simulink block diagram
#  MODEL_MODULES       - Any additional generated source modules
#  MAKEFILE_NAME       - Name of makefile created from template makefile <model>.mk
#  MATLAB_ROOT         - Path to where MATLAB is installed.
#  S_FUNCTIONS         - List of additional S-function modules.
#  S_FUNCTIONS_LIB     - List of S-functions libraries to link. 
#  NUMST               - Number of sample times
#  NCSTATES            - Number of continuous states
#  COMPUTER            - Computer type. See the MATLAB computer command.
#  BUILDARGS           - Options passed in at the command line.
#  MULTITASKING        - yes (1) or no (0): Is solver mode multitasking
#  INTEGER_CODE        - yes (1) or no (0): Is generated code purely integer
#  MAT_FILE            - yes (1) or no (0): Should mat file logging be done,
#                        if 0, the generated code runs indefinitely
#  EXT_MODE            - yes (1) or no (0): Build for external mode
#  TMW_EXTMODE_TESTING - yes (1) or no (0): Build ext_test.c for external mode
#                        testing.
#  EXTMODE_TRANSPORT   - Index of transport mechanism (e.g. tcpip, serial) for extmode
#  MULTI_INSTANCE_CODE - Is the generated code multi instantiable (1/0)?
#  GEN_MDLREF_SFCN     - (1/0): are we generating model reference wrapper s-function
#  MODELREFS           - List of referenced models
#  EXTMODE_STATIC      - yes (1) or no (0): Use static instead of dynamic mem alloc.
#  EXTMODE_STATIC_SIZE - Size of static memory allocation buffer.
#  TGT_FCN_LIB         - Target Funtion library to use
#  PORTABLE_WORDSIZES  - Is this build intented for SIL simulation with portable word sizes (1/0)?
#  SHRLIBTARGET        - Is this build intended for generation of a shared library instead 
#                        of executable (1/0)?
#  MAKEFILEBUILDER_TGT - Is this build performed by the MakefileBuilder class
#                        e.g. to create a PIL executable?
#  STANDALONE_SUPPRESS_EXE - Build the standalone target but only create object code modules 
#                            and do not build an executable

MODEL                   = aurix_mbd_test
MODULES                 = 
MAKEFILE                = aurix_mbd_test.mk
MATLAB_ROOT             = C:\MATLAB\R2019a
ALT_MATLAB_ROOT         = C:\MATLAB\R2019a
ALT_MATLAB_BIN          = C:\MATLAB\R2019a\bin
MASTER_ANCHOR_DIR       = 
START_DIR               = C:\00_Works\hitex_aurix_mbd\works\CodeGen
S_FUNCTIONS             = 
S_FUNCTIONS_LIB         = 
NUMST                   = 1
NCSTATES                = 0
COMPUTER                = PCWIN64
BUILDARGS               =  GENERATE_ASAP2=0 HITEX_AURIX_AUTOMATIC_DOWNLOAD=0 HITEX_AURIX_MEMTOOL_ROOT="C:\Program Files (x86)\Infineon\Memtool 4.7" ISPROTECTINGMODEL=NOTPROTECTING
MULTITASKING            = 0
INTEGER_CODE            = 0
MAT_FILE                = 0
ONESTEPFCN              = 1
TERMFCN                 = 1
B_ERTSFCN               = 0
MEXEXT                  = mexw64
EXT_MODE                = 0
TMW_EXTMODE_TESTING     = 0
EXTMODE_TRANSPORT       = 0
EXTMODE_STATIC          = 0
EXTMODE_STATIC_SIZE     = 1000000
MULTI_INSTANCE_CODE     = 0
CLASSIC_INTERFACE       = 0
TGT_FCN_LIB             = ISO_C
MODELREFS               = 
SHARED_SRC              = 
SHARED_SRC_DIR          = 
SHARED_BIN_DIR          = 
SHARED_LIB              = 
GEN_SAMPLE_MAIN         = 1
TARGET_LANG_EXT         = c
PORTABLE_WORDSIZES      = 0
SHRLIBTARGET            = 0
MAKEFILEBUILDER_TGT     = 0
STANDALONE_SUPPRESS_EXE = 0
OPTIMIZATION_FLAGS      = 
ADDITIONAL_LDFLAGS      = 

# To enable debugging:
# set DEBUG_BUILD = 1
# DEBUG_BUILD             = 0

#--------------------------- Model and reference models -----------------------
MODELLIB                  = aurix_mbd_testlib.lib
MODELREF_LINK_LIBS        = 
MODELREF_INC_PATH         = 
RELATIVE_PATH_TO_ANCHOR   = ..
# NONE: standalone, SIM: modelref sim, RTW: modelref coder target
MODELREF_TARGET_TYPE       = NONE
MODELREF_SFCN_SUFFIX       = _msf

#-- In the case when directory name contains space ---
ifneq ($(MATLAB_ROOT),$(ALT_MATLAB_ROOT))
MATLAB_ROOT := $(ALT_MATLAB_ROOT)
endif
ifneq ($(MATLAB_BIN),$(ALT_MATLAB_BIN))
MATLAB_BIN := $(ALT_MATLAB_BIN)
endif

# ---------- Target Settings ----------
HITEX_AURIX_TGT_ROOT          = C:\00_Works\aurix_target
HITEX_AURIX_CPU_TYPE          = tc27xx
HITEX_AURIX_TGT_TYPE          = TRICORE
HITEX_AURIX_TOOLCHAIN_ROOT    = C:\HIGHTEC\toolchains\tricore\v4.9.1.0-infineon-2.0
HITEX_AURIX_BSP_ROOT          = C:\00_Works\aurix_target\+aurixtgt\..\bsp/ShieldBuddy_TC275
HITEX_AURIX_GENERATE_MAP_FILE = 1
HITEX_AURIX_GENERATE_DEBUG    = 1
HITEX_AURIX_BOARD_TYPE        = ShieldBuddy_TC275
HITEX_AURIX_BOARD_DEFINES     = -DBRD=ShieldBuddy_TC275
HITEX_AURIX_BOARD_LDFLAGS     = 
HITEX_AURIX_BOARD_SRCS        =  Assert.o Bsp.o CompilerGnuc.o Htx_ASCLIN.o Htx_Sb_Setup.o Htx_ScheduleTimer.o Htx_VADC.o Htx_VADC_UserCfg.o IfxAsclin.o IfxAsclin_Asc.o IfxAsclin_Lin.o IfxAsclin_PinMap.o IfxAsclin_Spi.o IfxAsclin_cfg.o IfxCpu.o IfxCpu_CStart0.o IfxCpu_CStart1.o IfxCpu_CStart2.o IfxCpu_Irq.o IfxCpu_Trap.o IfxCpu_cfg.o IfxDma.o IfxDma_Dma.o IfxGpt12.o IfxGpt12_PinMap.o IfxGtm.o IfxGtm_Atom.o IfxGtm_Atom_Pwm.o IfxGtm_Atom_PwmHl.o IfxGtm_Atom_Timer.o IfxGtm_Cmu.o IfxGtm_Dpll.o IfxGtm_PinMap.o IfxGtm_Tbu.o IfxGtm_Tim.o IfxGtm_Tim_In.o IfxGtm_Tom.o IfxGtm_Tom_Pwm.o IfxGtm_Tom_PwmHl.o IfxGtm_Tom_Timer.o IfxGtm_Trig.o IfxGtm_cfg.o IfxPort.o IfxPort_Io.o IfxPort_PinMap.o IfxPort_cfg.o IfxQspi.o IfxQspi_PinMap.o IfxQspi_SpiMaster.o IfxQspi_SpiSlave.o IfxQspi_cfg.o IfxScuCcu.o IfxScuEru.o IfxScuWdt.o IfxScu_PinMap.o IfxSrc.o IfxStdIf_DPipe.o IfxStdIf_Pos.o IfxStdIf_PwmHl.o IfxStdIf_Timer.o IfxStm.o IfxStm_cfg.o Ifx_CircularBuffer.asm.o Ifx_CircularBuffer.o Ifx_Fifo.o Ifx_InternalMux.o SpiIf.o 
HITEX_AURIX_BOARD_INCLUDES    = -IC:\00_Works\aurix_target\+aurixtgt\..\bsp/ShieldBuddy_TC275/srcs -IC:\00_Works\aurix_target\+aurixtgt\..\bsp/ShieldBuddy_TC275/srcs/Application  -IC:\00_Works\aurix_target\+aurixtgt\..\bsp/ShieldBuddy_TC275/srcs/HtxDrivers  -IC:\00_Works\aurix_target\+aurixtgt\..\bsp/ShieldBuddy_TC275/srcs/IILDv1_0_0_2_0 -IC:\00_Works\aurix_target\+aurixtgt\..\bsp/ShieldBuddy_TC275/srcs/IILDv1_0_0_2_0/1_SrvSw -IC:\00_Works\aurix_target\+aurixtgt\..\bsp/ShieldBuddy_TC275/srcs/IILDv1_0_0_2_0/1_SrvSw/SysSe -IC:\00_Works\aurix_target\+aurixtgt\..\bsp/ShieldBuddy_TC275/srcs/IILDv1_0_0_2_0/1_SrvSw/SysSe/Bsp   -IC:\00_Works\aurix_target\+aurixtgt\..\bsp/ShieldBuddy_TC275/srcs/IILDv1_0_0_2_0/1_SrvSw/Tricore -IC:\00_Works\aurix_target\+aurixtgt\..\bsp/ShieldBuddy_TC275/srcs/IILDv1_0_0_2_0/1_SrvSw/Tricore/Compilers   -IC:\00_Works\aurix_target\+aurixtgt\..\bsp/ShieldBuddy_TC275/srcs/IILDv1_0_0_2_0/1_SrvSw/_Utilities   -IC:\00_Works\aurix_target\+aurixtgt\..\bsp/ShieldBuddy_TC275/srcs/IILDv1_0_0_2_0/4_McHal -IC:\00_Works\aurix_target\+aurixtgt\..\bsp/ShieldBuddy_TC275/srcs/IILDv1_0_0_2_0/4_McHal/Tricore -IC:\00_Works\aurix_target\+aurixtgt\..\bsp/ShieldBuddy_TC275/srcs/IILDv1_0_0_2_0/4_McHal/Tricore/Asclin -IC:\00_Works\aurix_target\+aurixtgt\..\bsp/ShieldBuddy_TC275/srcs/IILDv1_0_0_2_0/4_McHal/Tricore/Asclin/Asc  -IC:\00_Works\aurix_target\+aurixtgt\..\bsp/ShieldBuddy_TC275/srcs/IILDv1_0_0_2_0/4_McHal/Tricore/Asclin/Lin  -IC:\00_Works\aurix_target\+aurixtgt\..\bsp/ShieldBuddy_TC275/srcs/IILDv1_0_0_2_0/4_McHal/Tricore/Asclin/Spi  -IC:\00_Works\aurix_target\+aurixtgt\..\bsp/ShieldBuddy_TC275/srcs/IILDv1_0_0_2_0/4_McHal/Tricore/Asclin/Std   -IC:\00_Works\aurix_target\+aurixtgt\..\bsp/ShieldBuddy_TC275/srcs/IILDv1_0_0_2_0/4_McHal/Tricore/Cpu -IC:\00_Works\aurix_target\+aurixtgt\..\bsp/ShieldBuddy_TC275/srcs/IILDv1_0_0_2_0/4_McHal/Tricore/Cpu/CStart  -IC:\00_Works\aurix_target\+aurixtgt\..\bsp/ShieldBuddy_TC275/srcs/IILDv1_0_0_2_0/4_McHal/Tricore/Cpu/Irq  -IC:\00_Works\aurix_target\+aurixtgt\..\bsp/ShieldBuddy_TC275/srcs/IILDv1_0_0_2_0/4_McHal/Tricore/Cpu/Std  -IC:\00_Works\aurix_target\+aurixtgt\..\bsp/ShieldBuddy_TC275/srcs/IILDv1_0_0_2_0/4_McHal/Tricore/Cpu/Trap   -IC:\00_Works\aurix_target\+aurixtgt\..\bsp/ShieldBuddy_TC275/srcs/IILDv1_0_0_2_0/4_McHal/Tricore/Dma -IC:\00_Works\aurix_target\+aurixtgt\..\bsp/ShieldBuddy_TC275/srcs/IILDv1_0_0_2_0/4_McHal/Tricore/Dma/Dma  -IC:\00_Works\aurix_target\+aurixtgt\..\bsp/ShieldBuddy_TC275/srcs/IILDv1_0_0_2_0/4_McHal/Tricore/Dma/Std   -IC:\00_Works\aurix_target\+aurixtgt\..\bsp/ShieldBuddy_TC275/srcs/IILDv1_0_0_2_0/4_McHal/Tricore/Gpt12 -IC:\00_Works\aurix_target\+aurixtgt\..\bsp/ShieldBuddy_TC275/srcs/IILDv1_0_0_2_0/4_McHal/Tricore/Gpt12/Std   -IC:\00_Works\aurix_target\+aurixtgt\..\bsp/ShieldBuddy_TC275/srcs/IILDv1_0_0_2_0/4_McHal/Tricore/Gtm -IC:\00_Works\aurix_target\+aurixtgt\..\bsp/ShieldBuddy_TC275/srcs/IILDv1_0_0_2_0/4_McHal/Tricore/Gtm/Atom -IC:\00_Works\aurix_target\+aurixtgt\..\bsp/ShieldBuddy_TC275/srcs/IILDv1_0_0_2_0/4_McHal/Tricore/Gtm/Atom/Pwm  -IC:\00_Works\aurix_target\+aurixtgt\..\bsp/ShieldBuddy_TC275/srcs/IILDv1_0_0_2_0/4_McHal/Tricore/Gtm/Atom/PwmHl  -IC:\00_Works\aurix_target\+aurixtgt\..\bsp/ShieldBuddy_TC275/srcs/IILDv1_0_0_2_0/4_McHal/Tricore/Gtm/Atom/Timer   -IC:\00_Works\aurix_target\+aurixtgt\..\bsp/ShieldBuddy_TC275/srcs/IILDv1_0_0_2_0/4_McHal/Tricore/Gtm/Std  -IC:\00_Works\aurix_target\+aurixtgt\..\bsp/ShieldBuddy_TC275/srcs/IILDv1_0_0_2_0/4_McHal/Tricore/Gtm/Tim -IC:\00_Works\aurix_target\+aurixtgt\..\bsp/ShieldBuddy_TC275/srcs/IILDv1_0_0_2_0/4_McHal/Tricore/Gtm/Tim/In   -IC:\00_Works\aurix_target\+aurixtgt\..\bsp/ShieldBuddy_TC275/srcs/IILDv1_0_0_2_0/4_McHal/Tricore/Gtm/Tom -IC:\00_Works\aurix_target\+aurixtgt\..\bsp/ShieldBuddy_TC275/srcs/IILDv1_0_0_2_0/4_McHal/Tricore/Gtm/Tom/Pwm  -IC:\00_Works\aurix_target\+aurixtgt\..\bsp/ShieldBuddy_TC275/srcs/IILDv1_0_0_2_0/4_McHal/Tricore/Gtm/Tom/PwmHl  -IC:\00_Works\aurix_target\+aurixtgt\..\bsp/ShieldBuddy_TC275/srcs/IILDv1_0_0_2_0/4_McHal/Tricore/Gtm/Tom/Timer   -IC:\00_Works\aurix_target\+aurixtgt\..\bsp/ShieldBuddy_TC275/srcs/IILDv1_0_0_2_0/4_McHal/Tricore/Gtm/Trig   -IC:\00_Works\aurix_target\+aurixtgt\..\bsp/ShieldBuddy_TC275/srcs/IILDv1_0_0_2_0/4_McHal/Tricore/Port -IC:\00_Works\aurix_target\+aurixtgt\..\bsp/ShieldBuddy_TC275/srcs/IILDv1_0_0_2_0/4_McHal/Tricore/Port/Io  -IC:\00_Works\aurix_target\+aurixtgt\..\bsp/ShieldBuddy_TC275/srcs/IILDv1_0_0_2_0/4_McHal/Tricore/Port/Std   -IC:\00_Works\aurix_target\+aurixtgt\..\bsp/ShieldBuddy_TC275/srcs/IILDv1_0_0_2_0/4_McHal/Tricore/Qspi -IC:\00_Works\aurix_target\+aurixtgt\..\bsp/ShieldBuddy_TC275/srcs/IILDv1_0_0_2_0/4_McHal/Tricore/Qspi/SpiMaster  -IC:\00_Works\aurix_target\+aurixtgt\..\bsp/ShieldBuddy_TC275/srcs/IILDv1_0_0_2_0/4_McHal/Tricore/Qspi/SpiSlave  -IC:\00_Works\aurix_target\+aurixtgt\..\bsp/ShieldBuddy_TC275/srcs/IILDv1_0_0_2_0/4_McHal/Tricore/Qspi/Std   -IC:\00_Works\aurix_target\+aurixtgt\..\bsp/ShieldBuddy_TC275/srcs/IILDv1_0_0_2_0/4_McHal/Tricore/Scu -IC:\00_Works\aurix_target\+aurixtgt\..\bsp/ShieldBuddy_TC275/srcs/IILDv1_0_0_2_0/4_McHal/Tricore/Scu/Std   -IC:\00_Works\aurix_target\+aurixtgt\..\bsp/ShieldBuddy_TC275/srcs/IILDv1_0_0_2_0/4_McHal/Tricore/Src -IC:\00_Works\aurix_target\+aurixtgt\..\bsp/ShieldBuddy_TC275/srcs/IILDv1_0_0_2_0/4_McHal/Tricore/Src/Std   -IC:\00_Works\aurix_target\+aurixtgt\..\bsp/ShieldBuddy_TC275/srcs/IILDv1_0_0_2_0/4_McHal/Tricore/StdIf  -IC:\00_Works\aurix_target\+aurixtgt\..\bsp/ShieldBuddy_TC275/srcs/IILDv1_0_0_2_0/4_McHal/Tricore/Stm -IC:\00_Works\aurix_target\+aurixtgt\..\bsp/ShieldBuddy_TC275/srcs/IILDv1_0_0_2_0/4_McHal/Tricore/Stm/Std   -IC:\00_Works\aurix_target\+aurixtgt\..\bsp/ShieldBuddy_TC275/srcs/IILDv1_0_0_2_0/4_McHal/Tricore/_Impl  -IC:\00_Works\aurix_target\+aurixtgt\..\bsp/ShieldBuddy_TC275/srcs/IILDv1_0_0_2_0/4_McHal/Tricore/_Lib -IC:\00_Works\aurix_target\+aurixtgt\..\bsp/ShieldBuddy_TC275/srcs/IILDv1_0_0_2_0/4_McHal/Tricore/_Lib/DataHandling  -IC:\00_Works\aurix_target\+aurixtgt\..\bsp/ShieldBuddy_TC275/srcs/IILDv1_0_0_2_0/4_McHal/Tricore/_Lib/InternalMux   -IC:\00_Works\aurix_target\+aurixtgt\..\bsp/ShieldBuddy_TC275/srcs/IILDv1_0_0_2_0/4_McHal/Tricore/_PinMap  -IC:\00_Works\aurix_target\+aurixtgt\..\bsp/ShieldBuddy_TC275/srcs/IILDv1_0_0_2_0/4_McHal/Tricore/_Reg     -IC:\00_Works\aurix_target\+aurixtgt\..\bsp/ShieldBuddy_TC275/srcs/ObjectFiles  
HITEX_AURIX_OPTIM_LEVEL       = SIZE1
HITEX_AURIX_ADDITIONAL_COMPILER_FLAGS = 
HITEX_AURIX_ADDITIONAL_LINKER_FLAGS   = 

HITEX_AURIX_INCLUDES = $(HITEX_AURIX_BOARD_INCLUDES)

#----------------------------- External mode -----------------------------------
# Uncomment -DVERBOSE to have information printed to stdout
# To add a new transport layer, see the comments in
#   <matlabroot>/toolbox/simulink/simulink/extmode_transports.m
ifeq ($(EXT_MODE),1)
  EXT_CC_OPTS = -DEXT_MODE -D$(COMPUTER) #-DVERBOSE
  EXT_LIB     =
  EXT_SRC     = ext_svr.c updown.c ext_work.c
  ifeq ($(EXTMODE_TRANSPORT),0) #tcpip
    EXT_SRC +=  rtiostream_interface.c rtiostream_tcpip.c
  endif
  ifeq ($(EXTMODE_TRANSPORT),1) #serial
    EXT_SRC += ext_svr_serial_transport.c ext_serial_pkt.c
    EXT_SRC += rtiostream_serial_interface.c rtiostream_serial.c
  endif
  ifeq ($(TMW_EXTMODE_TESTING),1)
    EXT_SRC     += ext_test.c
    EXT_CC_OPTS += -DTMW_EXTMODE_TESTING
  endif
  ifeq ($(EXTMODE_STATIC),1)
    EXT_SRC             += mem_mgr.c
    EXT_CC_OPTS         += -DEXTMODE_STATIC -DEXTMODE_STATIC_SIZE=$(EXTMODE_STATIC_SIZE)
  endif
  ifeq ($(COMPUTER),SOL64)
    EXT_LIB = -lsocket -lnsl
  endif
endif

#--------------------------- Tool Specifications -------------------------------

include $(HITEX_AURIX_TGT_ROOT)/tools/$(HITEX_AURIX_TGT_TYPE)_tools.mk

LD_SCRIPT = -Wl,-T $(HITEX_AURIX_TGT_ROOT)/tools/Lcf_Gnuc.lsl

ifeq ($(HITEX_AURIX_GENERATE_MAP_FILE),1)
LDFLAGS += -Wl,--extmap="a" -Wl,-Map,$(MODEL).map
endif

# Determine if we are generating an s-function
SFCN = 0
ifeq ($(MODELREF_TARGET_TYPE),SIM)
  SFCN = 1
endif
ifeq ($(B_ERTSFCN),1)
  SFCN = 1
endif

# Use GCC_TEST to do a test compile of the local source (add DO_GCC_TEST=1)
ifeq ($(DO_GCC_TEST), 1)
  GCC_TEST     = echo "Doing gcc test compile"; gcc -c -o /dev/null -Wall 
  GCC_TEST_OUT = 
else
  GCC_TEST     = echo
  GCC_TEST_OUT = > /dev/null
endif

#------------------------------ Include Path -----------------------------------

MATLAB_INCLUDES = \
	-I$(MATLAB_ROOT)/extern/include \
	-I$(MATLAB_ROOT)/simulink/include \
	-I$(MATLAB_ROOT)/rtw/c/src \
	-I$(MATLAB_ROOT)/rtw/c/src/ext_mode/common

# Additional includes 
ADD_INCLUDES = \
	-I$(START_DIR) \
	-I$(START_DIR)\aurix_mbd_test_aurix_target \
	-I$(MATLAB_ROOT)\extern\include \
	-I$(MATLAB_ROOT)\simulink\include \
	-I$(MATLAB_ROOT)\rtw\c\src \
	-I$(MATLAB_ROOT)\rtw\c\src\ext_mode\common \
	-I$(MATLAB_ROOT)\rtw\c\ert \


SHARED_INCLUDES =
ifneq ($(SHARED_SRC_DIR),)
SHARED_INCLUDES = -I$(SHARED_SRC_DIR) 
endif

INCLUDES = -I. -I$(RELATIVE_PATH_TO_ANCHOR) $(MATLAB_INCLUDES) $(ADD_INCLUDES) $(USER_INCLUDES) \
	$(INSTRUMENT_INCLUDES) $(MODELREF_INC_PATH) $(SHARED_INCLUDES) $(HITEX_AURIX_INCLUDES)


#-------------------------------- C Flags --------------------------------------

# Optimization Options
ifndef OPT_OPTS
OPT_OPTS = $(DEFAULT_OPT_OPTS)
endif

# General User Options
ifeq ($(HITEX_AURIX_GENERATE_DEBUG),0)
DBG_FLAG =
else
#   Set OPTS=-g and any additional flags for debugging
DBG_FLAG = -g2
LDFLAGS += -g2
endif



# Compiler options, etc: 
CPP_REQ_DEFINES1 = -DMODEL=$(MODEL) -DNUMST=$(NUMST) -DNCSTATES=$(NCSTATES) \
		  -DUNIX -DMAT_FILE=$(MAT_FILE) -DINTEGER_CODE=$(INTEGER_CODE) \
		  -DONESTEPFCN=$(ONESTEPFCN) -DTERMFCN=$(TERMFCN) \
		  -DMULTI_INSTANCE_CODE=$(MULTI_INSTANCE_CODE) \
		  -DCLASSIC_INTERFACE=$(CLASSIC_INTERFACE)

# -DHAVESTDIO

CPP_REQ_DEFINES = $(CPP_REQ_DEFINES1)
ifeq ($(MODELREF_TARGET_TYPE),SIM)
CPP_REQ_DEFINES += -DMDL_REF_SIM_TGT=1
else
CPP_REQ_DEFINES += -DMT=$(MULTITASKING)
endif

ifneq ($(OPTIMIZATION_FLAGS),)
CC_OPTS = $(OPTS) $(EXT_CC_OPTS) $(OPTIMIZATION_FLAGS)
else
CC_OPTS = $(OPT_OPTS) $(OPTS) $(EXT_CC_OPTS)
endif

CFLAGS = $(ANSI_OPTS) $(DBG_FLAG) $(CC_OPTS) $(CPP_REQ_DEFINES) $(INCLUDES) \
	$(HITEX_AURIX_ADDITIONAL_COMPILER_FLAGS)
CPPFLAGS = $(CPP_ANSI_OPTS) $(DBG_FLAG) $(CPP_OPTS) $(CC_OPTS) $(CPP_REQ_DEFINES) $(INCLUDES) \
	$(HITEX_AURIX_ADDITIONAL_COMPILER_FLAGS)
ifeq ($(SFCN),1)
ifneq ($(OPTIMIZATION_FLAGS),)
CC_OPTS_SFCN = COPTIMFLAGS="$(ANSI_OPTS) $(OPTIMIZATION_FLAGS)"
else
CC_OPTS_SFCN = COPTIMFLAGS="$(OPT_OPTS) $(ANSI_OPTS)"
endif
CFLAGS_SFCN = $(CC_OPTS_SFCN) $(CPP_REQ_DEFINES1) $(INCLUDES)
endif

LDFLAGS += $(HITEX_AURIX_ADDITIONAL_LINKER_FLAGS)

#-------------------------- Additional Libraries ------------------------------

SYSLIBS = $(EXT_LIB)

LIBS =
 
LIBS += $(S_FUNCTIONS_LIB) $(INSTRUMENT_LIBS)

ifeq ($(SFCN),1)	
LIBFIXPT = -L$(MATLAB_ROOT)/bin/$(ARCH) -lfixedpoint
else
LIBFIXPT = 
endif

ifeq ($(MODELREF_TARGET_TYPE),SIM)
LIBMWMATHUTIL = -L$(MATLAB_ROOT)/bin/$(ARCH) -lmwmathutil
else
LIBMWMATHUTIL = 
endif

ifeq ($(MODELREF_TARGET_TYPE),SIM)
LIBMWIPP = -L$(MATLAB_ROOT)/bin/$(ARCH) -lippmwipt
else
LIBMWIPP = 
endif

ifeq ($(MODELREF_TARGET_TYPE),SIM)
LIBMWSL_FILEIO = -L$(MATLAB_ROOT)/bin/$(ARCH) -lmwsl_fileio
else
LIBMWSL_FILEIO = 
endif

#----------------------------- Source Files ------------------------------------
ADD_SRCS =

ifneq ($(ADDITIONAL_LDFLAGS),)
MEX_LDFLAGS = CLIBS='$$CLIBS $(ADDITIONAL_LDFLAGS)' 
else
MEX_LDFLAGS =
endif

ifeq ($(SFCN),0)
  SRCS  = $(ADD_SRCS) $(S_FUNCTIONS)
  SRC_DEP =
  ifeq ($(MODELREF_TARGET_TYPE), NONE)
    ifeq ($(SHRLIBTARGET), 1)
      # Shared object/dynamic library
      PRODUCT            = $(MODEL).so
      BIN_SETTING        = $(LD) $(LD_SCRIPT) $(SHRLIBLDFLAGS)$(MODEL).def -o $(PRODUCT)
      BUILD_PRODUCT_TYPE = "shared object"
      SRCS               += $(MODULES) $(MODEL).$(TARGET_LANG_EXT) $(EXT_SRC)
    else
      ifeq ($(MAKEFILEBUILDER_TGT), 1)
        # Standalone executable (e.g. for PIL)
        PREBUILT_SRCS      = $(MODULES)
        PREBUILT_OBJS      = $(addsuffix .o, $(basename $(PREBUILT_SRCS)))
        PRODUCT            = $(MODEL)
        BIN_SETTING        = $(LD) $(LD_SCRIPT) $(LDFLAGS) $(ADDITIONAL_LDFLAGS) -o $(PRODUCT)
        BUILD_PRODUCT_TYPE = "executable"
      else
        SRCS               += $(MODULES) $(MODEL).$(TARGET_LANG_EXT) $(EXT_SRC)
        ifeq ($(STANDALONE_SUPPRESS_EXE), 1)
          # Build object code only for top level model
          PRODUCT            = "ObjectModulesOnly"
          BUILD_PRODUCT_TYPE = "object modules"
        else
          # ERT standalone
          PRODUCT            = $(MODEL).elf
          BIN_SETTING        = $(LD) $(LD_SCRIPT) $(LDFLAGS) $(ADDITIONAL_LDFLAGS) -o $(PRODUCT)
          BUILD_PRODUCT_TYPE = "executable"
          ifeq ($(GEN_SAMPLE_MAIN),0)
             ifeq ($(MULTI_INSTANCE_CODE), 1)
                SRCS += rt_malloc_main.c
             else
                SRCS += rt_main.c
             endif
          else
            SRCS += ert_main.$(TARGET_LANG_EXT)
          endif
        endif
      endif
    endif
  else
    # Model reference coder target
    SRCS               += $(MODULES)
    PRODUCT            = $(MODELLIB)
    BUILD_PRODUCT_TYPE = "library"
  endif
else
  # Model Reference Simulation target, ERT S-function target
  MEX                 = $(MATLAB_ROOT)/bin/mex
  ifeq ($(MODELREF_TARGET_TYPE), SIM)
  PRODUCT            = $(RELATIVE_PATH_TO_ANCHOR)/$(MODEL)$(MODELREF_SFCN_SUFFIX).$(MEXEXT)
  RTW_SFUN_SRC       = $(MODEL)$(MODELREF_SFCN_SUFFIX).$(TARGET_LANG_EXT)
  SRCS               = $(MODULES) $(ADD_SRCS)
  else
  PRODUCT            = $(RELATIVE_PATH_TO_ANCHOR)/$(MODEL)_sf.$(MEXEXT)
  RTW_SFUN_SRC       = $(MODEL)_sf.$(TARGET_LANG_EXT)
  SRCS               = $(MODULES) $(ADD_SRCS) $(S_FUNCTIONS)
  endif
  BIN_SETTING        = $(MEX) -MATLAB_ARCH=$(ARCH) $(CFLAGS_SFCN) $(RTW_SFUN_SRC) $(MEX_LDFLAGS) -outdir $(RELATIVE_PATH_TO_ANCHOR) -silent
  BUILD_PRODUCT_TYPE = "mex file"
  ifeq ($(B_ERTSFCN),1)
    SRCS              += $(MODEL).$(TARGET_LANG_EXT)
  endif
  SRC_DEP            = $(RTW_SFUN_SRC)
endif

USER_SRCS =

USER_OBJS       = $(addsuffix .o, $(basename $(USER_SRCS)))
LOCAL_USER_OBJS = $(notdir $(USER_OBJS))

OBJS      = $(addsuffix .o, $(basename $(SRCS))) $(USER_OBJS) \
	$(addsuffix .o, $(basename $(HITEX_AURIX_BOARD_SRCS)))
LINK_OBJS = $(addsuffix .o, $(basename $(SRCS))) $(LOCAL_USER_OBJS) \
	$(addsuffix .o, $(basename $(HITEX_AURIX_BOARD_SRCS)))

SHARED_SRC := $(wildcard $(SHARED_SRC))
SHARED_OBJS_NO_PATH = $(addsuffix .o, $(basename $(notdir $(SHARED_SRC))))
SHARED_OBJS = $(addprefix $(join $(SHARED_BIN_DIR), /), $(SHARED_OBJS_NO_PATH))

ifneq ($(findstring .cpp,$(suffix $(SRCS), $(USER_SRCS), $(PREBUILT_SRCS))),)
  LD = $(CPP)
endif

#--------------------------------- Rules ---------------------------------------
ifeq ($(MODELREF_TARGET_TYPE),NONE)
  ifeq ($(SHRLIBTARGET), 1)
    ifeq ($(GEN_SAMPLE_MAIN), 1)
$(MODEL) : $(PRODUCT) ert_main.o
	$(LD) $(LDFLAGS) $(ADDITIONAL_LDFLAGS) -o $(MODEL) ert_main.o $(PRODUCT) $(SYSLIBS)
	@mv $(PRODUCT) $(RELATIVE_PATH_TO_ANCHOR)/
	@echo "### Created $(BUILD_PRODUCT_TYPE): $(PRODUCT)"
	@mv $(MODEL) $(RELATIVE_PATH_TO_ANCHOR)/
	@echo "### Created executable: $@"
    else
mvshrlib: $(PRODUCT)
	@mv $(PRODUCT) $(RELATIVE_PATH_TO_ANCHOR)/
    endif
  endif
  ifeq ($(MAKEFILEBUILDER_TGT), 1)
$(PRODUCT) : $(PREBUILT_OBJS) $(OBJS) $(SHARED_LIB) $(LIBS) $(SRC_DEP) $(MODELLIB) $(MODELREF_LINK_LIBS)
	$(BIN_SETTING) $(LINK_OBJS) $(PREBUILT_OBJS) $(MODELLIB) $(MODELREF_LINK_LIBS) $(SHARED_LIB) $(LIBFIXPT) $(LIBS)  $(SYSLIBS)
	@echo "### Created $(BUILD_PRODUCT_TYPE): $@"
  else
    ifeq ($(STANDALONE_SUPPRESS_EXE), 1)
.PHONY: $(PRODUCT)
$(PRODUCT) : $(OBJS) $(SHARED_LIB) $(LIBS) $(SRC_DEP) $(MODELREF_LINK_LIBS)
	@echo "### Created $(BUILD_PRODUCT_TYPE): $@"
    else
$(PRODUCT) : $(OBJS) $(SHARED_LIB) $(LIBS) $(SRC_DEP) $(MODELREF_LINK_LIBS)
	$(BIN_SETTING) $(LINK_OBJS) $(MODELREF_LINK_LIBS) $(SHARED_LIB) $(LIBFIXPT) $(LIBS)  $(SYSLIBS)
	@echo "### Created $(BUILD_PRODUCT_TYPE): $@"
    endif
  endif
else
 ifeq ($(MODELREF_TARGET_TYPE),SIM)
  $(PRODUCT) : $(OBJS) $(SHARED_LIB) $(LIBS) $(SRC_DEP)
	@rm -f $(MODELLIB)
	ar ruvs $(MODELLIB) $(LINK_OBJS)
	@echo "### Created $(MODELLIB)"
	$(BIN_SETTING) $(MODELLIB) $(MODELREF_LINK_LIBS) $(SHARED_LIB) $(LIBFIXPT) $(LIBS) $(LIBMWMATHUTIL) $(LIBMWIPP) $(LIBMWSL_FILEIO)
	@echo "### Created $(BUILD_PRODUCT_TYPE): $@"	
 else
  $(PRODUCT) : $(OBJS) $(SHARED_LIB) $(SRC_DEP)
	@rm -f $(MODELLIB)
	ar ruvs $(MODELLIB) $(LINK_OBJS)
	@echo "### Created $(MODELLIB)"
	@echo "### Created $(BUILD_PRODUCT_TYPE): $@"	
 endif
endif


#--------------- Support for building referenced models -----------------------


#-------------------------- Support for building modules ----------------------

ifneq ($(SHARED_SRC_DIR),)
$(SHARED_BIN_DIR)/%.o : $(SHARED_SRC_DIR)/%.c
	$(CC) -c -o $@ $(CFLAGS) $(GCC_WALL_FLAG_MAX) "$<"

$(SHARED_BIN_DIR)/%.o : $(SHARED_SRC_DIR)/%.cpp
	$(CPP) -c -o $@ $(CPPFLAGS) $(GCC_WALL_FLAG_MAX) "$<"
endif

%.o : %.c
	$(CC) -c $(CFLAGS) $(GCC_WALL_FLAG) "$<"

%.o : %.cpp
	$(CPP) -c $(CPPFLAGS) $(GCC_WALL_FLAG) "$<"

%.o : $(RELATIVE_PATH_TO_ANCHOR)/%.c
	$(CC) -c $(CFLAGS) $(GCC_WALL_FLAG) "$<"

%.o : $(RELATIVE_PATH_TO_ANCHOR)/%.cpp
	$(CPP) -c $(CPPFLAGS) $(GCC_WALL_FLAG) "$<"

ifeq ($(GEN_SAMPLE_MAIN),0)
ifeq ($(TARGET_LANG_EXT),cpp)
%.o : $(MATLAB_ROOT)/rtw/c/src/common/%.c
	$(CPP) -c $(CPPFLAGS) $(GCC_WALL_FLAG_MAX) "$<"
else
%.o : $(MATLAB_ROOT)/rtw/c/src/common/%.c
	$(CC) -c $(CFLAGS) $(GCC_WALL_FLAG_MAX) "$<"
endif
endif


%.o : $(HITEX_AURIX_BSP_ROOT)/src/%.c
	$(CC) -c $(CFLAGS) $(GCC_WALL_FLAG_MAX) "$<"

%.o : $(HITEX_AURIX_BSP_ROOT)/src/%.cpp
	$(CPP) -c $(CPPFLAGS) $(GCC_WALL_FLAG_MAX) "$<"

%.o : $(HITEX_AURIX_BSP_ROOT)/src/%.S
	$(AS) -c $(ASFLAGS_C2) $(GCC_WALL_FLAG_MAX) "$<"

%.o : $(MATLAB_ROOT)/rtw/c/src/%.c
	$(CC) -c $(CFLAGS) $(GCC_WALL_FLAG_MAX) "$<"

%.o : $(MATLAB_ROOT)/rtw/c/src/ext_mode/common/%.c
	$(CC) -c $(CFLAGS) $(GCC_WALL_FLAG_MAX) "$<"

%.o : $(MATLAB_ROOT)/rtw/c/src/rtiostream/rtiostreamtcpip/%.c
	$(CC) -c $(CFLAGS) $(GCC_WALL_FLAG_MAX) "$<"

%.o : $(MATLAB_ROOT)/rtw/c/src/ext_mode/custom/%.c
	$(CC) -c $(CFLAGS) $(GCC_WALL_FLAG_MAX) "$<"

#----Expanded Rules START------------------------
%.o : $(MATLAB_ROOT)\rtw\c\src/%.c
	$(CC) -c $(CFLAGS) $(GCC_WALL_FLAG_MAX) "$<"

%.o : $(MATLAB_ROOT)\simulink\src/%.c
	$(CC) -c $(CFLAGS) $(GCC_WALL_FLAG_MAX) "$<"



%.o : $(MATLAB_ROOT)\rtw\c\src/%.cpp
	$(CPP) -c $(CPPFLAGS) $(GCC_WALL_FLAG_MAX) "$<"

%.o : $(MATLAB_ROOT)\simulink\src/%.cpp
	$(CPP) -c $(CPPFLAGS) $(GCC_WALL_FLAG_MAX) "$<"



#----Expanded Rules END------------------------

%.o : $(MATLAB_ROOT)/simulink/src/%.cpp
	$(CPP) -c $(CPPFLAGS) $(GCC_WALL_FLAG_MAX) "$<"

%.o : $(MATLAB_ROOT)/simulink/src/%.c
	$(CC) -c $(CFLAGS) $(GCC_WALL_FLAG_MAX) "$<"

#------------------------------- Libraries -------------------------------------





#----------------------------- Dependencies ------------------------------------

-include $(OBJS:.o=.d)

$(OBJS) : $(MAKEFILE) rtw_proj.tmw

$(SHARED_LIB) : $(SHARED_OBJS)
	@echo "### Creating $@ "
	ar ruvs $@ $(SHARED_OBJS)
	@echo "### $@ Created "


#--------- Miscellaneous rules to purge, clean and lint (sol2 only) ------------

purge : clean
	@echo "### Deleting the generated source code for $(MODEL)"
	@\rm -f $(MODEL).c $(MODEL).h $(MODEL)_types.h $(MODEL)_data.c \
	        $(MODEL)_private.h $(MODEL).rtw $(MODULES) rtw_proj.tmw $(MAKEFILE)

clean :
	@echo "### Deleting the objects, $(PRODUCT)"
	@del $(LINK_OBJS) $(PRODUCT)

# EOF: aurix_sys_trgt.tmf