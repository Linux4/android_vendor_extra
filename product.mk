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

MAINTAINER := Linux4
MAINTAINER_CERT := linux4

ifneq ($(filter x1s y2s z3s,$(LINEAGE_BUILD)),)
MAINTAINER := Exynoobs
MAINTAINER_CERT := exynoobs
endif

PRODUCT_EXTRA_RECOVERY_KEYS += \
    vendor/extra/certs/$(MAINTAINER_CERT)

PRODUCT_PRODUCT_PROPERTIES += \
    lineage.updater.uri=https://raw.githubusercontent.com/$(MAINTAINER)/lineage_OTA/master/{device}.json
