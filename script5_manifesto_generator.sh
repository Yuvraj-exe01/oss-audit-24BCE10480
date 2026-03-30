#!/bin/bash
# ============================================================
# Script 5: Open Source Manifesto Generator
# Author: Yuvraj Rajoriya
# Registration: 24BCE10480
# Course: Open Source Software | OSS NGMC
# Description: Asks the user three questions interactively,
#              then generates a personalised open-source
#              philosophy statement and saves it to a .txt file.
# ============================================================

# --- Alias demonstration ---
# Aliases let you create shorthand names for longer commands.
# In a real shell session you would run: alias today='date +%d-%B-%Y'
# Here we demonstrate the concept using a variable and a function instead,
# since aliases defined inside scripts do not apply to the script's own shell.
alias_demo_today() {
    # This function acts like an alias for the date command
    date '+%d %B %Y'
}

# --- Welcome message ---
echo "============================================================"
echo "       OPEN SOURCE MANIFESTO GENERATOR"
echo "============================================================"
echo ""
echo "  Answer three questions to generate your personal"
echo "  open-source philosophy statement."
echo ""
echo "------------------------------------------------------------"

# --- Question 1: read user input into a variable ---
# -p flag displays the prompt inline before reading input
read -p "  1. Name one open-source tool you use every day: " TOOL

# --- Question 2 ---
read -p "  2. In one word, what does 'freedom' mean to you?  " FREEDOM

# --- Question 3 ---
read -p "  3. Name one thing you would build and share freely: " BUILD

echo ""

# --- Validate: make sure none of the answers are empty ---
if [ -z "$TOOL" ] || [ -z "$FREEDOM" ] || [ -z "$BUILD" ]; then
    echo "  ERROR: All three questions must be answered."
    echo "  Please run the script again and fill in each answer."
    exit 1
fi

# --- Get current date and logged-in username ---
DATE=$(alias_demo_today)       # Uses our alias demo function above
AUTHOR=$(whoami)               # Gets the current user's login name

# --- Define the output filename using string concatenation ---
# The filename includes the username so each student gets their own file
OUTPUT="manifesto_${AUTHOR}.txt"

echo "------------------------------------------------------------"
echo "  Generating your manifesto..."
echo "------------------------------------------------------------"
echo ""

# --- Write the manifesto to the output file ---
# > creates/overwrites the file; >> appends to it
# We use > for the first line and >> for all subsequent lines

echo "============================================================" > "$OUTPUT"
echo "       MY OPEN SOURCE MANIFESTO" >> "$OUTPUT"
echo "  Author : $AUTHOR" >> "$OUTPUT"
echo "  Date   : $DATE" >> "$OUTPUT"
echo "============================================================" >> "$OUTPUT"
echo "" >> "$OUTPUT"

# --- Compose the manifesto paragraph using the three answers ---
# String concatenation in bash is done by placing variables inside a string
echo "Every day I use $TOOL — a piece of software that someone" >> "$OUTPUT"
echo "built, shared, and chose not to lock away. That decision" >> "$OUTPUT"
echo "changed something for me. It showed that $FREEDOM is not" >> "$OUTPUT"
echo "just a word. It is what happens when people choose to give" >> "$OUTPUT"
echo "their work to the world instead of selling it back to them." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "Open source is not charity. It is how the best tools get" >> "$OUTPUT"
echo "built. When the code is visible, anyone can find the flaw." >> "$OUTPUT"
echo "When the code is free, anyone can build the next thing on" >> "$OUTPUT"
echo "top of it. I intend to do exactly that. If I build $BUILD," >> "$OUTPUT"
echo "I will share it. Not because I have to, but because every" >> "$OUTPUT"
echo "tool I rely on today exists because someone else did." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "Standing on the shoulders of giants is only honest if you" >> "$OUTPUT"
echo "plan to hold someone else up in return." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "============================================================" >> "$OUTPUT"
echo "  Course  : Open Source Software | OSS NGMC" >> "$OUTPUT"
echo "  Project : The Open Source Audit — Firefox" >> "$OUTPUT"
echo "============================================================" >> "$OUTPUT"

# --- Confirm the file was created successfully ---
if [ -f "$OUTPUT" ]; then
    echo "  Manifesto saved to: $OUTPUT"
    echo ""
    echo "============================================================"
    echo "  YOUR MANIFESTO:"
    echo "============================================================"
    echo ""
    # cat prints the full contents of the file to the terminal
    cat "$OUTPUT"
else
    echo "  ERROR: Failed to create the output file."
    exit 1
fi
