plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.lachispa.pos_lightning"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = "27.0.12077973"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_17.toString()
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.lachispa.pos_lightning"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
            signingConfig = signingConfigs.getByName("debug")
        }
    }

    afterEvaluate {
        tasks.findByName("assembleRelease")?.doLast {
            val apkDir = layout.buildDirectory.dir("outputs/flutter-apk").get().asFile
            apkDir.listFiles()?.forEach { apk ->
                val name = apk.name
                if (!name.endsWith(".apk") || name.contains("unsigned")) return@forEach
                val abi = when {
                    name.contains("arm64-v8a") -> "arm64"
                    name.contains("armeabi-v7a") -> "armeabi"
                    name.contains("x86_64") -> "x86_64"
                    else -> return@forEach
                }
                val version = android.defaultConfig.versionName ?: return@forEach
                apk.copyTo(apk.parentFile.resolve("lachispapos-v${version}-${abi}.apk"), overwrite = true)
            }
        }
    }
}

flutter {
    source = "../.."
}
