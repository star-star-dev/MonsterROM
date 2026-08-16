# Galaxy Note10+ 5G Korea (`d2xks`) VNDK compatibility prebuilt

This directory contains a **fixed compatibility snapshot** of `com.android.vndk.v31.apex` required when building the Android 16/One UI 8.5 donor for the Galaxy Note10+ 5G Korea target. The target stock firmware has Android VNDK API level 31, while the donor is newer than API level 34 and therefore does not include the required v31 APEX.

The APEX is a byte-for-byte fixed snapshot from Galaxy S23 FE (`r11sxxx`) firmware revision `S711BXXS9EYG1/S711BOXM9EYG1/S711BXXS9EYG1`, recorded in `.current`. Its SHA-256 is `e669fcc3cff06e1039d43ed732ebedcbd0377f4ccc66ff71679c1a7314746b7e`. It is installed at `system/system/system_ext/apex/com.android.vndk.v31.apex` because d2xks uses a static system layout rather than a separate `system_ext` partition.

This file is intentionally outside the automatic prebuilt-update matrix. The VNDK patch selects it only for `TARGET_CODENAME=d2xks` and board API level 31; other targets retain their original `b0qxxx` prebuilt selection. Replace it only with a verified Android 12 / VNDK v31 APEX and validate a full d2xks build before committing an update.
