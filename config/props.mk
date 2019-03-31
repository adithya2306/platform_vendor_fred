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

# Misc props
ADDITIONAL_BUILD_PROPERTIES += \
    keyguard.no_require_sim=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.build.selinux=1 \
    ro.actionable_compatible_property.enabled=false \
    ro.com.android.prov_mobiledata=false

# Don't hide APNs
ADDITIONAL_BUILD_PROPERTIES += persist.sys.hideapn=false

# Allow tethering without provisioning app
ADDITIONAL_BUILD_PROPERTIES += net.tethering.noprovisioning=true

# Default notification/alarm sounds
ADDITIONAL_BUILD_PROPERTIES += \
    ro.config.notification_sound=Popcorn.ogg \
    ro.config.alarm_alert=Bright_morning.ogg \
    ro.config.ringtone=Titania.ogg
