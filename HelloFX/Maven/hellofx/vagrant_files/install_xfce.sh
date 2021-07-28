#!/usr/bin/env bash

# Install the Xfce Desktop Environment.
apt-get install -y xfce4
startxfce4&

# Install the chromium browser.
apt install -y chromium chromium-l10n
