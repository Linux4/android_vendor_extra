#
# Copyright (C) 2021 The LineageOS Project
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

## Recovery ADB keys
PRODUCT_COPY_FILES += \
    vendor/extra/adb_keys:$(TARGET_COPY_OUT_RECOVERY)/root/adb_keys

MAINTAINER := linux4

ifneq ($(filter x1s y2s z3s,$(LINEAGE_BUILD)),)
MAINTAINER := exynoobs
endif

PRODUCT_EXTRA_RECOVERY_KEYS += \
    vendor/extra/certs/$(MAINTAINER)

PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += \
    vendor/extra/overlay \
    vendor/extra/$(MAINTAINER)/overlay
DEVICE_PACKAGE_OVERLAYS += \
    vendor/extra/overlay \
    vendor/extra/$(MAINTAINER)/overlay


include vendor/linux4/security/$(MAINTAINER).mk
