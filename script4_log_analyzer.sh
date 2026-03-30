#!/bin/bash
# ============================================================
# Script 4: Log File Analyzer
# Author: Yuvraj Rajoriya
# Registration: 24BCE10480
# Course: Open Source Software | OSS NGMC
# Description: Reads a log file line by line, counts how many
#              lines contain a given keyword, and prints the
#              last 5 matching lines. Accepts the log file path
#              and keyword as command-line arguments.
# Usage: ./script4_log_analyzer.sh <logfile> [keyword]
# Example: ./script4_log_analyzer.sh /var/log/syslog error
# ============================================================

# --- Read command-line arguments ---
# $1 is the first argument: the log file path
LOGFILE=$1

# $2 is the optional second argument: the keyword to search for
# If not provided, default to "error" using parameter expansion
KEYWORD=${2:-"error"}

# --- Counter variable to track how many matches are found ---
COUNT=0

echo "============================================================"
echo "           LOG FILE ANALYZER"
echo "============================================================"

# --- Validate: check that a file path was actually given ---
if [ -z "$LOGFILE" ]; then
    echo "  ERROR: No log file specified."
    echo "  Usage: $0 <logfile> [keyword]"
    echo "  Example: $0 /var/log/syslog error"
    exit 1
fi

# --- Validate: check that the file exists and is a regular file ---
if [ ! -f "$LOGFILE" ]; then
    echo "  ERROR: File '$LOGFILE' not found."
    echo "  Common log files to try:"
    echo "    /var/log/syslog      (Ubuntu/Debian)"
    echo "    /var/log/messages    (Fedora/RHEL)"
    echo "    /var/log/auth.log    (authentication events)"
    exit 1
fi

# --- Validate: check that the file is not empty ---
# A retry-style check — if empty, inform the user and exit cleanly
if [ ! -s "$LOGFILE" ]; then
    echo "  WARNING: File '$LOGFILE' is empty. No lines to analyze."
    echo "  Check that the logging service is running:"
    echo "    sudo systemctl status rsyslog"
    exit 0
fi

echo "  Log File : $LOGFILE"
echo "  Keyword  : $KEYWORD"
echo "------------------------------------------------------------"

# --- Read the file line by line using a while-read loop ---
# IFS= prevents leading/trailing whitespace from being stripped
# -r prevents backslash interpretation
while IFS= read -r LINE; do

    # Check if the current line contains the keyword (case-insensitive)
    # grep -iq: -i = case insensitive, -q = quiet (no output, just exit code)
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        # Increment the counter each time a match is found
        COUNT=$((COUNT + 1))
    fi

done < "$LOGFILE"

# --- Print the summary ---
echo ""
echo "  RESULT: Keyword '$KEYWORD' found $COUNT time(s) in:"
echo "  $LOGFILE"
echo ""

# --- Show the last 5 matching lines for context ---
echo "------------------------------------------------------------"
echo "  LAST 5 MATCHING LINES:"
echo "------------------------------------------------------------"

if [ "$COUNT" -gt 0 ]; then
    # grep -i for case-insensitive match, tail -5 for last 5 lines
    grep -i "$KEYWORD" "$LOGFILE" | tail -5 | while IFS= read -r MATCH; do
        echo "  >> $MATCH"
    done
else
    echo "  No matching lines found for keyword: '$KEYWORD'"
fi

echo ""
echo "------------------------------------------------------------"
echo "  FILE SUMMARY"
echo "------------------------------------------------------------"

# Count total lines in the file using wc -l
TOTAL_LINES=$(wc -l < "$LOGFILE")
echo "  Total lines in file : $TOTAL_LINES"
echo "  Matching lines      : $COUNT"

# Calculate match percentage if total lines > 0
if [ "$TOTAL_LINES" -gt 0 ]; then
    # Use awk for floating-point division (bash only handles integers)
    PERCENT=$(awk "BEGIN {printf \"%.2f\", ($COUNT/$TOTAL_LINES)*100}")
    echo "  Match percentage    : $PERCENT%"
fi

echo "============================================================"
echo ""
