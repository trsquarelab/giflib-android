LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := giflib

LOCAL_SRC_FILES := dgif_lib.c \
		   egif_lib.c \
		   gifalloc.c \
		   gif_err.c \
		   gif_font.c \
		   gif_hash.c \
		   openbsd-reallocarray.c \
		   quantize.c

LOCAL_LDLIBS := -llog

LOCAL_C_INCLUDES := $(LOCAL_PATH)/jni

# Adding the missing declarations in the build file itself to
# avoid any code changes
LOCAL_CFLAGS += -DSIZE_MAX=0xffffffff\
		-DS_IREAD=S_IRUSR\
		-DS_IWRITE=S_IWUSR\
		-DS_IEXEC=S_IXUSR

LOCAL_CFLAGS += -Wall

include $(BUILD_SHARED_LIBRARY)
