#!/bin/bash
# ============================================================
# Script 3: Disk and Permission Auditor
# Author: Yuvraj Rajoriya
# Registration: 24BCE10480
# Course: Open Source Software | OSS NGMC
# Description: Loops through key system directories, reports
#              their permissions, owner, and disk usage.
#              Also checks Firefox's config directory.
# ============================================================

# --- List of important system directories to audit ---
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp" "/usr/share")

echo "============================================================"
echo "           DISK AND PERMISSION AUDITOR"
echo "============================================================"
printf "%-20s %-22s %-10s\n" "Directory" "Permissions/Owner" "Size"
echo "------------------------------------------------------------"

# --- Loop through each directory in the DIRS array ---
for DIR in "${DIRS[@]}"; do

    # Check if the directory actually exists before trying to read it
    if [ -d "$DIR" ]; then

        # ls -ld gives long listing of the dir itself (not its contents)
        # awk extracts: field 1 = permissions, field 3 = owner, field 4 = group
        PERMS=$(ls -ld "$DIR" | awk '{print $1}')
        OWNER=$(ls -ld "$DIR" | awk '{print $3 "/" $4}')

        # du -sh gives human-readable size; 2>/dev/null suppresses
        # "permission denied" errors for dirs we can't fully read
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)

        # Print formatted output
        printf "%-20s %-14s %-8s %-10s\n" "$DIR" "$PERMS" "$OWNER" "${SIZE:-N/A}"

    else
        # Directory does not exist on this system
        printf "%-20s %-32s\n" "$DIR" "[does not exist]"
    fi

done

echo "------------------------------------------------------------"
echo ""

# --- Check Firefox's user profile directory specifically ---
echo "  FIREFOX CONFIG DIRECTORY CHECK"
echo "------------------------------------------------------------"

# Firefox stores per-user data in ~/.mozilla/firefox
FIREFOX_DIR="$HOME/.mozilla/firefox"

if [ -d "$FIREFOX_DIR" ]; then
    # Directory exists — show its permissions and size
    FF_PERMS=$(ls -ld "$FIREFOX_DIR" | awk '{print $1}')
    FF_OWNER=$(ls -ld "$FIREFOX_DIR" | awk '{print $3 "/" $4}')
    FF_SIZE=$(du -sh "$FIREFOX_DIR" 2>/dev/null | cut -f1)

    echo "  Path        : $FIREFOX_DIR"
    echo "  Permissions : $FF_PERMS"
    echo "  Owner       : $FF_OWNER"
    echo "  Size        : ${FF_SIZE:-N/A}"
    echo ""
    echo "  Profile directories inside:"

    # List profile folders inside the firefox directory
    for PROFILE in "$FIREFOX_DIR"/*/; do
        if [ -d "$PROFILE" ]; then
            # basename strips the full path, leaving just the folder name
            PROF_NAME=$(basename "$PROFILE")
            PROF_SIZE=$(du -sh "$PROFILE" 2>/dev/null | cut -f1)
            echo "    - $PROF_NAME  (${PROF_SIZE:-N/A})"
        fi
    done
else
    echo "  $FIREFOX_DIR does not exist."
    echo "  Firefox may not have been launched yet, or is not installed."
fi

echo "============================================================"
echo ""
