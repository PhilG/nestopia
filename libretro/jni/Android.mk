LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE    := libretro

ifeq ($(TARGET_ARCH),arm)
LOCAL_CXXFLAGS += -DANDROID_ARM
LOCAL_ARM_MODE := arm
endif

ifeq ($(TARGET_ARCH),x86)
LOCAL_CXXFLAGS +=  -DANDROID_X86
endif

ifeq ($(TARGET_ARCH),mips)
LOCAL_CXXFLAGS += -DANDROID_MIPS
endif

CORE_DIR = ../..

include $(CORE_DIR)/libretro/Makefile.common

LOCAL_SRC_FILES := $(SOURCES_CXX)

LOCAL_CXXFLAGS += -DINLINE=inline -DHAVE_STDINT_H -DHAVE_INTTYPES_H -DLSB_FIRST -D__LIBRETRO__ -DNST_NO_ZLIB -fexceptions
LOCAL_C_INCLUDES  = $(CORE_DIR) $(CORE_DIR)/source

include $(BUILD_SHARED_LIBRARY)
