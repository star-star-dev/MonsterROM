# Galaxy A26 (`a26xxx`) compatibility prebuilts

This directory is a **fixed compatibility snapshot** required by `platform/exynos9825/patches/camera/customize.sh` for the d2xks build. It provides the Polarr public-library declaration and the three 64-bit SDK libraries injected into the system image.

The snapshot was taken from firmware revision `A266BXXU3AYE6/A266BOXM3AYE6/A266BXXU3AYE6`, as recorded in `.current`. It must remain outside the automatic `Update prebuilt blobs` matrix: Samsung's current FUS firmware `A266BXXSBCZG2/A266BOXMBCZG2/A266BXXSBCZG2` no longer provides `system/etc/public.libraries-polarr.txt`, while d2xks still needs the paired declaration and libraries.

When updating these files, update the declaration and all three libraries as one compatible set and validate a d2xks GitHub Actions ROM build before committing a replacement.
