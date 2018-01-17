
# apscheduler.mk
# Makefile to include building sqlobject in a larger top-level project
# Copyright (C) 2018 Long Range Systems, LLC.  All rights reserved.

ifndef APSCHEDULER_SRC_DIR
  APSCHEDULER_SRC_DIR := $(dir $(lastword $(MAKEFILE_LIST)))
endif

ifndef BUILD_TOOLS_DIR
  ${error BUILD_TOOLS_DIR not defined! You must specify where build tools reside}
endif

# greenlet package version
APSCHEDULER_PV = 1.4.1

# Build revision
APSCHEDULER_PR = -r1

# Overall build version
APSCHEDULER_BV = $(APSCHEDULER_PV)$(APSCHEDULER_PR)


APSCHEDULER_DOTFILE = $(call python-cross-dotfile,apscheduler,$(APSCHEDULER_BV))

APSCHEDULER_DEPS = $(APSCHEDULER_DOTFILE)

$(APSCHEDULER_DOTFILE): $(BUILD_PYTHON_NATIVE_MODULE_DEPS)
	$(call build-python-native-module,$(APSCHEDULER_SRC_DIR))
	touch $@
