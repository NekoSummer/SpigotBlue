#!/usr/bin/bash

set -e

MC_VERSION="1.13.2"
BUILD_TOOLS_URL="https://hub.spigotmc.org/jenkins/job/BuildTools/201/artifact/target/BuildTools.jar"
BUILD_TOOLS_FILE="BuildTools.jar"
GIT_REPO="https://github.com/NekoSummer/SpigotBlue.git"
WORK_DIR="SpigotBlue"

if [ ! -f "BuildTools.jar" ]; then
    echo "Downloading BuildTools..."
    wget -O "$BUILD_TOOLS_FILE" "$BUILD_TOOLS_URL"
else
    echo "BuildTools.jar already exists. Skipping download."
fi

echo "Source code downloading..."
java -jar "$BUILD_TOOLS_FILE" --rev "$MC_VERSION" --compile none

if [ -d "$WORK_DIR" ]; then
    echo "Detected existing $WORK_DIR directory. Cleaning up..."
    rm -rf "$WORK_DIR"
fi

echo "Cloning SpigotBlue...."
git clone "$GIT_REPO" "$WORK_DIR"

cd "$WORK_DIR"
./applyPatches.sh

echo "MVN Packaging..."
mvn clean package -DskipTests

cd ..
JAR=$(find "$WORK_DIR/SpigotBlue-Server/target" -maxdepth 1 -name "spigot-blue-*.jar" ! -name "original-*" | head -n 1)

if [ -n "$JAR" ]; then
  cp "$JAR" "./spigot-blue-$MC_VERSION.jar"
  echo "Done!"
else
  echo "ERROR! "
  exit 1
fi