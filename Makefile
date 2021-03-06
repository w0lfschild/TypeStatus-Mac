TARGET = macosx:clang:10.8:latest
ARCHS = x86_64

include theos/makefiles/common.mk

SIMBLTWEAK_NAME = TypeStatus
TypeStatus_FILES = Tweak.xm
TypeStatus_FRAMEWORKS = Cocoa AppKit CoreGraphics
TypeStatus_PRIVATE_FRAMEWORKS = IMCore

include $(THEOS_MAKE_PATH)/simbltweak.mk

release: stage
	rm -rf release || true
	mkdir release
	cp stuff/How\ to\ Install\ EasySIMBL.webloc release
	rsync -rav obj/macosx/TypeStatus.bundle release/TypeStatus.bundle
	dropdmg --config-name=tsmac obj/macosx/TypeStatus.bundle
