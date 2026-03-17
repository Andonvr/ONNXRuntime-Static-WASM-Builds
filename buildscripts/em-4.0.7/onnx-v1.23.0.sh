#!/bin/bash
#
# Available environment:
#   EMSDK_VERSION - emsdk version (e.g. "4.0.3")
#   ONNX_VERSION  - onnxruntime tag (e.g. "v1.21.0")
#   ARTIFACT_DIR  - directory to place build outputs into
#   onnxruntime/  - shallow clone of onnxruntime at the correct tag

set -euo pipefail

cd onnxruntime
./build.sh \
  --build_dir ./build \
  --config Release \
  --build_wasm_static_lib \
  --enable_wasm_simd \
  --enable_wasm_threads \
  --compile_no_warning_as_error \
  --skip_tests \
  --disable_rtti \
  --emsdk_version ${EMSDK_VERSION} \
  --skip_submodule_sync \
  --cmake_extra_defines onnxruntime_BUILD_UNIT_TESTS=OFF \
                                    CMAKE_CXX_FLAGS="-sNO_DISABLE_EXCEPTION_CATCHING -Wno-deprecated-literal-operator -Wno-dangling-capture"
                                    
cd ..
cp onnxruntime/build/Release/libonnxruntime_webassembly.a ${ARTIFACT_DIR}/libonnxruntime_webassembly.a
cp onnxruntime/include/onnxruntime/core/session/onnxruntime_c_api.h ${ARTIFACT_DIR}/onnxruntime_c_api.h
cp onnxruntime/include/onnxruntime/core/session/onnxruntime_cxx_api.h ${ARTIFACT_DIR}/onnxruntime_cxx_api.h
cp onnxruntime/include/onnxruntime/core/session/onnxruntime_cxx_inline.h ${ARTIFACT_DIR}/onnxruntime_cxx_inline.h
cp onnxruntime/include/onnxruntime/core/session/onnxruntime_float16.h ${ARTIFACT_DIR}/onnxruntime_float16.h
cp onnxruntime/LICENSE ${ARTIFACT_DIR}/LICENSE
cp onnxruntime/ThirdPartyNotices.txt ${ARTIFACT_DIR}/ThirdPartyNotices.txt