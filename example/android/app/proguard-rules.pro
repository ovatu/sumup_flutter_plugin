# Keep Tap-to-Pay SDK (loaded via reflection; R8 would otherwise strip it in release)
-keep class com.sumup.taptopay.** { *; }
-keep class com.sumup.tap.topay.** { *; }
-keep class ca.amadis.agnos.** { *; }
