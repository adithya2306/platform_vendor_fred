# Copyright (C) 2016-2017 ParanoidAndroid Project
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

SDCLANG ?= true
SDCLANG_PATH := vendor/qcom/sdclang-6.0/linux-x86/bin
SDCLANG_PATH_2 := vendor/qcom/sdclang-6.0/linux-x86/bin
SDCLANG_FLAGS := -O3 -fvectorize -Wno-user-defined-warnings -Wno-vectorizer-no-neon -Wno-unknown-warning-option -Wno-deprecated-register -Wno-tautological-type-limit-compare -Wno-sign-compare -Wno-gnu-folding-constant -mllvm -arm-implicit-it=always -Wno-inline-asm -Wno-unused-command-line-argument -Wno-unused-parameter -g0 -DNDEBUG
SDCLANG_FLAGS_2 := -O3 -fvectorize -Wno-user-defined-warnings -Wno-vectorizer-no-neon -Wno-unknown-warning-option -Wno-deprecated-register -Wno-tautological-type-limit-compare -Wno-sign-compare -Wno-gnu-folding-constant -mllvm -arm-implicit-it=always -Wno-inline-asm -Wno-unused-command-line-argument -Wno-unused-parameter -g0 -DNDEBUG
SDCLANG_COMMON_FLAGS := -O3 -fvectorize -Wno-user-defined-warnings -Wno-vectorizer-no-neon -Wno-unknown-warning-option -Wno-deprecated-register -Wno-tautological-type-limit-compare -Wno-sign-compare -Wno-gnu-folding-constant -mllvm -arm-implicit-it=always -Wno-inline-asm -Wno-unused-command-line-argument -Wno-unused-parameter -g0 -DNDEBUG
SDCLANG_LTO_DEFS := vendor/fred/sdclang/sdllvm-lto-defs.mk
