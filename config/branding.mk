FRED_VERNUM := v1.0

ifndef FRED_BUILD_TYPE
    FRED_BUILD_TYPE := Unofficial
endif

TARGET_PRODUCT_SHORT := $(subst fred_,,$(FRED_BUILD_TYPE))

# OTA version
ROM_VERSION := $(FRED_VERNUM)-$(shell date -u +%Y%m%d)

# CAF version
CAF_VERSION := LA.UM.7.3.r1-06700-sdm845.0

# Set all versions
DATE := $(shell date -u +%Y%m%d)
FRED_BUILD_DATE := $(shell date -u +%Y%m%d-%H%M)
FRED_DATE := $(shell date -u +%d-%m-%Y)
FRED_RELEASETYPE := $(FRED_BUILD)-$(FRED_BUILD_TYPE)-$(DATE)
FRED_MOD_VERSION := Fred-OS-$(FRED_VERNUM)-$(FRED_BUILD_DATE)-$(FRED_BUILD_TYPE)
FRED_VERSION := Fred-OS-$(FRED_VERNUM)-$(DATE)-$(FRED_BUILD)-$(FRED_BUILD_TYPE)
ROM_FINGERPRINT := Fred-OS/$(FRED_VERNUM)/$(PLATFORM_VERSION)/$(TARGET_PRODUCT_SHORT)/$(FRED_BUILD_DATE)

PRODUCT_PROPERTY_OVERRIDES += \
    ro.modversion=$(FRED_MOD_VERSION) \
    ro.fred.version=$(FRED_VERSION) \
    ro.fred.vernum=$(FRED_VERNUM) \
    ro.fred.releasetype=$(FRED_RELEASETYPE) \
    ro.caf.version=$(CAF_VERSION)
