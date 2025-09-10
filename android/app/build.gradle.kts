plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
    // The Google services Gradle plugin
   // id("com.google.gms.google-services")
}

dependencies {
    // Import the Firebase BoM
   // implementation(platform("com.google.firebase:firebase-bom:34.2.0"))
}

android {
    namespace = "com.astrea.findmyslef.astrea"
    compileSdk = 36
    //ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        //applicationId = "com.astrea.findmyslef"
        applicationId = "com.xxxxx.xxxxxxx.appteam"
        minSdk = 26
        targetSdk = 36
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }


    signingConfigs {
        create("release") {
            storeFile = file(project.property("storeFile") as String)
            storePassword = project.property("storePassword") as String
            keyAlias = project.property("keyAlias") as String
            keyPassword = project.property("keyPassword") as String
        }
    }


    buildTypes {
        release {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
            //signingConfig = signingConfigs.getByName("release")
            signingConfig = signingConfigs.getByName("debug")
            isMinifyEnabled = true
            isShrinkResources = true
            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                "proguard-rules.pro"
            )
            ndk {
                abiFilters += listOf("armeabi-v7a", "arm64-v8a")
            }
        }

        debug {
            isMinifyEnabled = false
            isShrinkResources = false
            ndk {
                abiFilters += listOf("armeabi-v7a", "arm64-v8a")
            }
        }
    }
}

flutter {
    source = "../.."
}


