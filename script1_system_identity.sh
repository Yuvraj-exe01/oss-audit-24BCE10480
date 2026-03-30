#!/bin/bash
# ============================================================
# Script 1: System Identity Report
# Author: Yuvraj Rajoriya
# Registration: 24BCE10480
# Course: Open Source Software | OSS NGMC
# Description: Displays a welcome screen with system info
#              and identifies the OS license.
# ============================================================

# --- Student and software details ---
STUDENT_NAME="Yuvraj Rajoriya"
SOFTWARE_CHOICE="Firefox"

# --- Gather system information using command substitution ---
KERNEL=$(uname -r)                          # Linux kernel version
USER_NAME=$(whoami)                         # Currently logged-in user
HOME_DIR=$HOME                              # Home directory of current user
UPTIME=$(uptime -p)                         # Human-readable uptime
CURRENT_DATE=$(date '+%d %B %Y, %H:%M:%S') # Formatted date and time

# --- Get distro name from /etc/os-release (standard on modern Linux) ---
if [ -f /etc/os-release ]; then
    DISTRO=$(grep -oP '(?<=^PRETTY_NAME=").*(?=")' /etc/os-release)
else
    DISTRO="Unknown Linux Distribution"
fi

# --- Display the identity report ---
echo "============================================================"
echo "        OPEN SOURCE AUDIT — SYSTEM IDENTITY REPORT         "
echo "============================================================"
echo ""
echo "  Student   : $STUDENT_NAME"
echo "  Software  : $SOFTWARE_CHOICE"
echo ""
echo "------------------------------------------------------------"
echo "  SYSTEM INFORMATION"
echo "------------------------------------------------------------"
echo "  Distribution : $DISTRO"
echo "  Kernel       : $KERNEL"
echo "  Logged User  : $USER_NAME"
echo "  Home Dir     : $HOME_DIR"
echo "  Uptime       : $UPTIME"
echo "  Date & Time  : $CURRENT_DATE"
echo ""
echo "------------------------------------------------------------"
echo "  LICENSE INFORMATION"
echo "------------------------------------------------------------"
echo "  This system runs on Linux, licensed under GPL v2."
echo "  GPL v2 guarantees the four freedoms: to run, study,"
echo "  modify, and distribute the software freely."
echo "  Firefox (chosen software) is licensed under MPL 2.0."
echo "============================================================"
echo ""
