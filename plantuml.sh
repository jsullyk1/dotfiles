#!/usr/bin/env bash
# Install PlantUML
set -e

PLANTUML_URL="${PLANTUML_URL:-http://github.com/plantuml/plantuml/releases/latest/download/plantuml.jar}"
JAR_LOC="$HOME/.local/plantuml"
BIN_LOC="$HOME/.local/bin/plantuml"
if [[ -f "$JAR_LOC/plantuml.jar" && -f "$BIN_LOC" ]]; then
  echo '[plantuml] PlantUML already installed.'
  exit
fi

echo '[plantuml] Installing PlantUML...'

# Install lsb-release to detect Ubuntu version
sudo apt-get install -y lsb-release

# Determine Ubuntu version and install appropriate Java package
UBUNTU_VERSION=$(lsb_release -rs 2>/dev/null || echo "unknown")

# For older Ubuntu versions, use openjdk-7-jre or openjdk-8-jre
if [[ "$UBUNTU_VERSION" == "12.04" ]]; then
    sudo apt-get install -y openjdk-7-jre graphviz
elif [[ "$UBUNTU_VERSION" == "14.04" ]]; then
    sudo apt-get install -y openjdk-7-jre graphviz
elif [[ "$UBUNTU_VERSION" == "16.04" ]]; then
    sudo apt-get install -y openjdk-8-jre graphviz
elif [[ "$UBUNTU_VERSION" == "18.04" ]]; then
    sudo apt-get install -y openjdk-8-jre graphviz
else
    # For Ubuntu 20.04+ use default-jre
    sudo apt-get install -y default-jre graphviz
fi

mkdir -p "$JAR_LOC"
curl -o "$JAR_LOC/plantuml.jar" -L "${PLANTUML_URL}"
printf '#!/bin/sh\nexec java -Djava.awt.headless=true -jar '${JAR_LOC}'/plantuml.jar "$@"' > $BIN_LOC
chmod +x $BIN_LOC
