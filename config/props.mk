# Copyright 2018 The Fred Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Override undesired Google defaults
ADDITIONAL_BUILD_PROPERTIES += \
    keyguard.no_require_sim=true \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.com.google.clientidbase=android-google \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.setupwizard.require_network=any \
    ro.setupwizard.mode=OPTIONAL \
    ro.opa.eligible_device=true

# Don't Hide APNs
ADDITIONAL_BUILD_PROPERTIES += persist.sys.hideapn=false

# Allow tethering without provisioning app
ADDITIONAL_BUILD_PROPERTIES += net.tethering.noprovisioning=true

# Include versioning information
export FRED_VERSION := Fred-Beta
export ROM_VERSION := $(FRED_VERSION)-$(shell date -u +%Y%m%d)
export CAF_VERSION := LA.UM.7.3.r1-06700-sdm845.0

ADDITIONAL_BUILD_PROPERTIES += \
    ro.modversion=$(ROM_VERSION) \
    ro.fred.version=$(FRED_VERSION) \
    ro.caf.version=$(CAF_VERSION)

# Default notification/alarm sounds
ADDITIONAL_BUILD_PROPERTIES += \
    ro.config.notification_sound=Popcorn.ogg \
    ro.config.alarm_alert=Bright_morning.ogg \
    ro.config.ringtone=Titania.ogg

