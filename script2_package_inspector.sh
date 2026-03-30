#!/bin/bash
# ============================================================
# Script 2: FOSS Package Inspector
# Author: Yuvraj Rajoriya
# Registration: 24BCE10480
# Course: Open Source Software | OSS NGMC
# Description: Checks if Firefox is installed, shows version
#              and license info, and prints a philosophy note
#              using a case statement.
# ============================================================

# --- Package to inspect ---
PACKAGE="firefox"

# --- Check if the system uses apt (Debian/Ubuntu) or rpm (Fedora/RHEL) ---
if command -v apt &>/dev/null; then
    PKG_MANAGER="apt"
elif command -v rpm &>/dev/null; then
    PKG_MANAGER="rpm"
else
    PKG_MANAGER="unknown"
fi

echo "============================================================"
echo "           FOSS PACKAGE INSPECTOR"
echo "============================================================"
echo "  Package      : $PACKAGE"
echo "  Pkg Manager  : $PKG_MANAGER"
echo "------------------------------------------------------------"

# --- Check if the package is installed depending on package manager ---
if [ "$PKG_MANAGER" = "apt" ]; then
    # dpkg -l lists installed packages; grep checks if firefox is present
    if dpkg -l "$PACKAGE" &>/dev/null; then
        INSTALLED=true
        # Extract version from dpkg output using awk (3rd column)
        VERSION=$(dpkg -l "$PACKAGE" | grep "^ii" | awk '{print $3}')
    else
        INSTALLED=false
    fi
elif [ "$PKG_MANAGER" = "rpm" ]; then
    # rpm -q returns 0 if installed, non-zero if not
    if rpm -q "$PACKAGE" &>/dev/null; then
        INSTALLED=true
        VERSION=$(rpm -qi "$PACKAGE" | grep "^Version" | awk '{print $3}')
    else
        INSTALLED=false
    fi
else
    # Fallback: try running firefox --version directly
    if command -v firefox &>/dev/null; then
        INSTALLED=true
        VERSION=$(firefox --version 2>/dev/null | awk '{print $NF}')
    else
        INSTALLED=false
    fi
fi

# --- Display installation status and version ---
if [ "$INSTALLED" = true ]; then
    echo "  Status   : INSTALLED"
    echo "  Version  : $VERSION"
    echo ""

    # Show license info if rpm is available, otherwise display known info
    if [ "$PKG_MANAGER" = "rpm" ]; then
        echo "  RPM Package Details:"
        rpm -qi "$PACKAGE" | grep -E "^(Version|License|Summary|URL)" | \
            while IFS= read -r line; do echo "  $line"; done
    else
        echo "  License  : Mozilla Public License 2.0 (MPL 2.0)"
        echo "  Summary  : Free and open-source web browser by Mozilla"
        echo "  URL      : https://www.mozilla.org/firefox"
    fi
else
    echo "  Status   : NOT INSTALLED"
    echo ""
    echo "  To install Firefox, run:"
    echo "    Ubuntu/Debian : sudo apt install firefox"
    echo "    Fedora/RHEL   : sudo dnf install firefox"
fi

echo ""
echo "------------------------------------------------------------"
echo "  PHILOSOPHY NOTE"
echo "------------------------------------------------------------"

# --- Case statement: print a philosophy note based on the package name ---
case $PACKAGE in
    firefox)
        echo "  Firefox: A non-profit browser that broke IE's monopoly"
        echo "  and proved that open source can reshape an entire market."
        ;;
    httpd|apache2)
        echo "  Apache: The web server that built the open internet."
        echo "  Powers roughly 30% of all websites globally."
        ;;
    mysql)
        echo "  MySQL: Open source at the heart of millions of apps."
        echo "  A dual-license model that shows commerce and open"
        echo "  source can coexist."
        ;;
    git)
        echo "  Git: Linus Torvalds built this when BitKeeper went"
        echo "  proprietary. A reminder that open source protects itself."
        ;;
    vlc)
        echo "  VLC: Built by students in Paris because no free tool"
        echo "  existed to stream video over their campus network."
        ;;
    python3|python)
        echo "  Python: A language shaped entirely by community."
        echo "  Its PSF license keeps it usable by everyone, forever."
        ;;
    *)
        # Default case for any other package
        echo "  $PACKAGE: Part of the open-source ecosystem that"
        echo "  powers the modern world."
        ;;
esac

echo "============================================================"
echo ""
