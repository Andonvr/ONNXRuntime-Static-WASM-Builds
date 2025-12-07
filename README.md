# onnxruntime-static-wasm

Provides a static library build of the ONNX runtime, targeting WebAssembly.

Builds are available in the [Releases](https://github.com/Andonvr/ONNXRuntime-Static-WASM-Builds/releases) section of this repository. Each version of ONNX Runtime is built for several versions of the Emscripten SDK (emsdk).

These builds are not a one-size-fits-all solution, since certain flags are supplied during the build step. This was solely to match my needs, but chances are, this will work for you.

The relevant flags are:

| Flag                      | Description                                                               |
| ------------------------- | ------------------------------------------------------------------------- |
| `--build_wasm_static_lib` | Builds ONNX Runtime as a static WebAssembly library (duh).                |
| `--enable_wasm_simd`      | Enables SIMD (Single Instruction, Multiple Data) support for WebAssembly. |
| `--enable_wasm_threads`   | Enables multi-threading support in the WebAssembly build.                 |
| `--skip_tests`            | Skips building and running tests to speed up the build process.           |
| `--disable_rtti`          | Disables Run-Time Type Information (RTTI) to reduce binary size.          |
