#!/usr/bin/env bash
# Maven/Java installation

JAVA_VERSION=11
MAVEN_MIRROR=https://mirror.dkm.cz/apache/maven/maven-3
MAVEN_VERSION=3.6.3

# Install Java (OpenJDK)
apt-get install -y openjdk-${JAVA_VERSION}-jdk

# Install the latest Maven version.
curl $MAVEN_MIRROR/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz \
  --output /tmp/apache-maven-${MAVEN_VERSION}-bin.tar.gz
tar xf /tmp/apache-maven-${MAVEN_VERSION}-bin.tar.gz -C /opt
ln -s /opt/apache-maven-${MAVEN_VERSION} /opt/maven

# Set up the Maven environment variables.
cat << 'EOF' > /etc/profile.d/maven.sh
export M2_HOME=/opt/maven
export MAVEN_HOME=/opt/maven
export PATH=${PATH}:${M2_HOME}/bin
EOF

# Make the Maven script executable.
chmod +x /etc/profile.d/maven.sh
# Load the environment variables.
source /etc/profile.d/maven.sh
mvn -version
