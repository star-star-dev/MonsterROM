# Galaxy S21 Ultra (`p3sxxx`) compatibility prebuilts

This directory is a **fixed compatibility snapshot** required by `platform/exynos9825/patches/vendor/customize.sh` for the d2xks build. It supplies the legacy S21 light HAL service and its two 64-bit dependencies.

The snapshot was taken from firmware revision `G998BXXSFHYE1/G998BOXMFHYE1/G998BXXSFHYE1`, as recorded in `.current`. It must remain outside the automatic `Update prebuilt blobs` matrix: Samsung's current FUS firmware `G998BXXSJHZC2/G998BOXMJHZC2/G998BXXSJHZA6` no longer provides `vendor/lib64/android.hardware.light-V1-ndk_platform.so`, while d2xks needs this historical library pair for the injected service.

When updating these files, update all three HAL files as a compatible set, preserve the service executable mode and `u:object_r:hal_light_default_exec:s0` label specified by the patch, and validate a d2xks GitHub Actions ROM build before committing the replacement.
