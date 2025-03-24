buildscript {
    repositories {
        google()
        mavenCentral()
    }
    dependencies {
        classpath("com.android.tools.build:gradle:7.0.4") // Remplace avec la version de Gradle que tu utilises
        classpath(kotlin("gradle-plugin", version = "1.5.31"))  // Si tu utilises Kotlin
    }
}

plugins {
    id("com.android.application") version "8.7.0" apply false // Applique le plugin Android ici
    id("kotlin-android") version "1.7.10" apply false

}

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

val newBuildDir: Directory = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}

subprojects {
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
