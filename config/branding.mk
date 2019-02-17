# FredOS version
FRED_VERNUM := v1.0

# OTA version
ROM_VERSION := $(FRED_VERNUM)-$(shell date -u +%Y%m%d)

# CAF version
CAF_VERSION := LA.UM.7.6.2.r1-06900-89xx.0

# Official build support
CURRENT_DEVICE := $(shell echo "$(TARGET_PRODUCT)" | cut -d'_' -f 2,3)
FRED_BUILD_TYPE ?= UNOFFICIAL

ifeq ($(FRED_BUILD_TYPE),OFFICIAL)
  LIST = $(shell curl -s https://raw.githubusercontent.com/FredProject/platform_vendor_fred/f9x/fred.devices)
  FOUND_DEVICE = $(filter $(CURRENT_DEVICE), $(LIST))
    ifeq ($(FOUND_DEVICE),$(CURRENT_DEVICE))
      PRODUCT_PACKAGES += Updater
    else
      $(warning ALERT: Device $(CURRENT_DEVICE) is not official! Going unofficial...)
      FRED_BUILD_TYPE := UNOFFICIAL
    endif
endif

# Configure FredOS versions and props
FRED_DATE := $(shell date -u +%Y%m%d)
FRED_RELEASETYPE := $(FRED_BUILD)-$(FRED_BUILD_TYPE)-$(FRED_DATE)
FRED_MOD_VERSION := FredOS-$(FRED_VERNUM)-$(FRED_DATE)-$(FRED_BUILD_TYPE)
FRED_VERSION := FredOS-$(FRED_VERNUM)-$(FRED_DATE)-$(FRED_BUILD)-$(FRED_BUILD_TYPE)

PRODUCT_PROPERTY_OVERRIDES += \
    ro.modversion=$(FRED_MOD_VERSION) \
    ro.fred.version=$(FRED_VERSION) \
    ro.fred.vernum=$(FRED_VERNUM) \
    ro.fred.releasetype=$(FRED_RELEASETYPE) \
    ro.caf.version=$(CAF_VERSION)
