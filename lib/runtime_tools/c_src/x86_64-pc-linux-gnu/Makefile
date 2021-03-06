#
# %CopyrightBegin%
#
# Copyright Ericsson AB 1999-2012. All Rights Reserved.
#
# The contents of this file are subject to the Erlang Public License,
# Version 1.1, (the "License"); you may not use this file except in
# compliance with the License. You should have received a copy of the
# Erlang Public License along with this software. If not, it can be
# retrieved online at http://www.erlang.org/.
#
# Software distributed under the License is distributed on an "AS IS"
# basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See
# the License for the specific language governing rights and limitations
# under the License.
#
# %CopyrightEnd%
#
include $(ERL_TOP)/make/target.mk
include $(ERL_TOP)/make/$(TARGET)/otp.mk
include $(ERL_TOP)/make/$(TARGET)/otp_ded.mk

# ----------------------------------------------------
# Items from top-level configure
# ----------------------------------------------------
DTRACE_ENABLED=
DTRACE_ENABLED_2STEP=
# ----------------------------------------------------
# Application version
# ----------------------------------------------------
include ../vsn.mk
VSN=$(RUNTIME_TOOLS_VSN)

# ----------------------------------------------------
# The following variables differ on different systems, we set
# reasonable defaults, if something different is needed it should
# be set for that system only.
# ----------------------------------------------------
CC = $(DED_CC)
CFLAGS = $(DED_CFLAGS)
LD = $(DED_LD)
SHELL = /bin/sh
LIBS = $(DED_LIBS)
LDFLAGS += $(DED_LDFLAGS)

DTRACE_LIBNAME = dyntrace

SYSINCLUDE = $(DED_SYS_INCLUDE)
ifeq ($(findstring vxworks,$(TARGET)),vxworks)
	SYSINCLUDE += -I$(ERL_TOP)/erts/etc/vxworks
endif

TRACE_DRV_INCLUDES = $(SYSINCLUDE)

ALL_CFLAGS = $(CFLAGS) -DHAVE_CONFIG_H $(TYPE_FLAGS) $(TRACE_DRV_INCLUDES) \
	-I$(OBJDIR) -I$(ERL_TOP)/erts/emulator/$(TARGET)

ifeq ($(TYPE),debug)
TYPEMARKER = .debug
TYPE_FLAGS = $(subst -O3,,$(subst -O2,,$(CFLAGS))) -DDEBUG -g
else
ifeq ($(TYPE),valgrind)
TYPEMARKER = .valgrind
TYPE_FLAGS = $(subst -O3,,$(subst -O2,,$(CFLAGS))) -DVALGRIND
else
TYPEMARKER =
TYPE_FLAGS = $(CFLAGS)
endif
endif

ROOTDIR = $(ERL_TOP)/lib
PRIVDIR = ../priv
LIBDIR = $(PRIVDIR)/lib/$(TARGET)
OBJDIR = $(PRIVDIR)/obj/$(TARGET)

# ----------------------------------------------------
# Release directory specification
# ----------------------------------------------------
RELSYSDIR = $(RELEASE_PATH)/lib/runtime_tools-$(VSN)

# ----------------------------------------------------
# Misc Macros
# ----------------------------------------------------
before_DTrace_OBJS = $(OBJDIR)/dyntrace$(TYPEMARKER).o
## NIF_MAKEFILE = $(PRIVDIR)/Makefile

# Higher-level makefiles says that we can only compile on UNIX flavors
NIF_LIB = $(LIBDIR)/dyntrace$(TYPEMARKER).so

ifeq ($(HOST_OS),)
HOST_OS := $(shell $(ERL_TOP)/erts/autoconf/config.guess)
endif

TRACE_IP_DRV_OBJS = \
	$(OBJDIR)/trace_ip_drv.o

TRACE_FILE_DRV_OBJS = \
	$(OBJDIR)/trace_file_drv.o

ifeq ($(findstring win32,$(TARGET)), win32)
SOLIBS = $(LIBDIR)/trace_ip_drv.dll $(LIBDIR)/trace_file_drv.dll
LN=cp
else
ifeq ($(findstring vxworks,$(TARGET)),vxworks)
SOLIBS = $(LIBDIR)/trace_ip_drv.eld $(LIBDIR)/trace_file_drv.eld
else
SOLIBS = $(LIBDIR)/trace_ip_drv.so $(LIBDIR)/trace_file_drv.so
endif
endif
# ----------------------------------------------------
# Targets
# ----------------------------------------------------

_create_dirs := $(shell mkdir -p $(OBJDIR) $(LIBDIR))

debug opt valgrind: $(SOLIBS) $(OBJDIR) $(LIBDIR) $(NIF_LIB)

ifdef DTRACE_ENABLED
DTRACE_USER_HEADER=$(OBJDIR)/dtrace_user.h
$(OBJDIR)/dtrace_user.h: ./dtrace_user.d
	dtrace -h -C $(INCLUDES) \
	  -s ./dtrace_user.d \
	  -o ./dtrace_user.tmp
	sed -e '/^#define[ 	]*ERLANG_[A-Z0-9_]*(.*)/y/ABCDEFGHIJKLMNOPQRSTUVWXYZ/abcdefghijklmnopqrstuvwxyz/' ./dtrace_user.tmp > $@
	rm ./dtrace_user.tmp
else
DTRACE_USER_HEADER=
endif

DTRACE_OBJS =
ifdef DTRACE_ENABLED_2STEP
DTRACE_OBJS += $(OBJDIR)/dtrace_user.o
$(OBJDIR)/dtrace_user.o: $(before_DTrace_OBJS) $(OBJDIR)/dtrace_user.h
	dtrace -G -C \
	  -s ./dtrace_user.d \
	  -o $@ $(before_DTrace_OBJS)
endif

DYNTRACE_OBJS = $(before_DTrace_OBJS) $(DTRACE_OBJS)

$(OBJDIR):
	-@mkdir -p $(OBJDIR)

$(LIBDIR):
	-@mkdir -p $(LIBDIR)

$(OBJDIR)/dyntrace$(TYPEMARKER).o: dyntrace.c $(DTRACE_USER_HEADER)
	$(INSTALL_DIR) $(OBJDIR)
	$(CC) -c -o $@ $(ALL_CFLAGS) $<

$(NIF_LIB): $(DYNTRACE_OBJS)
	$(INSTALL_DIR) $(LIBDIR)
	$(LD) $(LDFLAGS) -o $@ $^ $(LDLIBS)

$(OBJDIR)/%.o: %.c
	$(CC) -c -o $@ $(ALL_CFLAGS) $<

$(LIBDIR)/trace_ip_drv.so: $(TRACE_IP_DRV_OBJS)
	$(LD) $(LDFLAGS) -o $@ $^ -lc $(LIBS)

$(LIBDIR)/trace_file_drv.so: $(TRACE_FILE_DRV_OBJS)
	$(LD) $(LDFLAGS) -o $@ $^ -lc $(LIBS)

$(LIBDIR)/trace_ip_drv.dll: $(TRACE_IP_DRV_OBJS)
	$(LD) $(LDFLAGS) -o $@ $^ $(LIBS)
$(LIBDIR)/trace_file_drv.dll: $(TRACE_FILE_DRV_OBJS)
	$(LD) $(LDFLAGS) -o $@ $^ $(LIBS)
#
# VxWorks is simply to different from Unix in this sense.
# Here are the inference rules for VxWorks
#
$(LIBDIR)/trace_ip_drv.eld: $(TRACE_IP_DRV_OBJS)
	$(LD) $(LDFLAGS) -o $@ $^ 

$(LIBDIR)/trace_file_drv.eld: $(TRACE_FILE_DRV_OBJS)
	$(LD) $(LDFLAGS) -o $@ $^ 

clean:
	rm -f $(SOLIBS) $(TRACE_IP_DRV_OBJS) $(TRACE_FILE_DRV_OBJS)
	rm -f $(LIBDIR)/dyntrace.so
	rm -f $(LIBDIR)/dyntrace.debug.so
	rm -f $(LIBDIR)/dyntrace.valgrind.so
	rm -f $(OBJDIR)/dyntrace.o
	rm -f $(OBJDIR)/dyntrace.debug.o
	rm -f $(OBJDIR)/dyntrace.valgrind.o
	rm -f core *~

docs:

# ----------------------------------------------------
# Release Target
# ---------------------------------------------------- 
include $(ERL_TOP)/make/otp_release_targets.mk

release_spec: opt
	$(INSTALL_DIR) $(RELSYSDIR)/priv/obj
	$(INSTALL_DIR) $(RELSYSDIR)/priv/lib
	$(INSTALL_PROGRAM) $(DYNTRACE_OBJS) $(RELSYSDIR)/priv/obj
	$(INSTALL_PROGRAM) $(NIF_LIB) $(SOLIBS) $(RELSYSDIR)/priv/lib

release_docs_spec:

