-dontwarn
-keep class kotlin.Metadata { *; }
-dontnote kotlin.internal.PlatformImplementationsKt
-dontnote kotlin.reflect.jvm.internal.**

-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.**  { *; }
-keep class io.flutter.util.**  { *; }
-keep class io.flutter.view.**  { *; }
-keep class io.flutter.**  { *; }
-keep class io.flutter.plugins.**  { *; }
-keep class io.flutter.embedding.** { *; }