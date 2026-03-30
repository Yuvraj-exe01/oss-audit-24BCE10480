oss-audit-24BCE10480
Yuvraj Rajoriya 24BCE10480 Firefox Mozilla Public License 2.0 Open Source Audit Capstone Units One to Five
About This Project
Here lives the work handed in for the Open Source Audit final task. One path through this effort traces how Firefox began, peeling back layers of its early days. Licensing gets examined, not just listed, digging into what freedoms it grants users. On Linux systems, the browser leaves marks - those get mapped with care. Its place within the wider world of free code projects forms another thread woven throughout. Instead of walking alone, it's measured beside a closed counterpart: Google Chrome. Tools built along the way take shape as five small programs written for the command line, showing how tasks unfold in bash. Each script reflects time spent learning how Linux responds to precise instructions.
Repository Structure
Scripts - Description
System Identity Report Script One
A clean welcome screen loads up front. It shows which Linux version runs on the machine. The kernel build sits just below that detail. Your username appears along with where your files live. Time since last reboot gets listed clearly. Clock reads out day and hour in full view. License tags follow at the bottom edge. One label marks Linux under GPL v2 rules. Another assigns Firefox to MPL 2.0 terms.
VARIABLES ECHO COMMAND SUBSTITUTION IF ELSE GREP FORMATTED OUTPUT
FOSS Package Inspector Script Two
Picks up what tool the system uses to manage software - either apt or rpm. Firefox presence gets checked next, quietly confirming if it lives on the machine. Version number shows up first, then license type follows behind. A short description appears, just enough to know what it does. When names come into view, a small thought pops out depending on which one passes through. One idea fits firefox; another greets apache when spotted nearby. Mysql brings its own line, git carries a different tone entirely. Vlc speaks of rhythm, while python whispers something about structure. Each name unlocks a tailored phrase, nothing repeated twice. Decisions shift using case logic, clean and tucked away from sight. No extra noise, only what matters at that moment arrives. Everything stays brief, fitting inside a single clear sweep. Six slots filled, none left open, none added without cause. The flow moves step by step, never rushing ahead too far. Output forms naturally, shaped by what the system already holds. Details emerge only after checking where they belong first. Nothing assumes, everything verifies before speaking up. Logic runs quiet but precise, like background light under dawn. Phrasing avoids repetition, sidestepping familiar turns completely. Results show once, cleanly, ending exactly where they should.
If Then Else Case Statement Command V Dpkg Rpm Awk Pipe With Grep
Script Three Disk and Permission Check
Moves through six key Linux folders - /etc, /var/log, /home, /usr/bin, /tmp, and /usr/share - checking their access rights, who owns them, which group they belong to, plus how much space each takes up. Alongside that, looks directly inside ~/.mozilla/firefox to examine the user profile folder for Firefox.
Bash Arrays For Loop LS LD DU SH AWK Printf Directory Check
Log File Analyzer Script Four
Line by line, it goes through a log file. For every entry holding a specific word, the count increases. Afterward, five most recent hits show up alongside percent of matches overall. You pass the file location and search term when starting. Before doing anything, three validations confirm inputs are valid.
Shell script elements handling arguments defaults loops file checks counters and text processing
Open Source Manifesto Generator Script Five
A voice steps forward with three quick questions, shaping replies into a custom open-source creed. Each answer bends the output, folding personal views into lines of plain text. The script tucks this result into a .txt file tagged with whoever answered. A small wrapper acts like a mirror, showing how aliases redirect meaning without changing form.
Start by having the script ask for user input using a prompt. Instead of an alias, wrap reusable code inside a named block that runs when called. Join pieces of text together to form one continuous line. Send output straight into a file, wiping old data first. Or add new content without touching what was there before. Check if something is empty; if it is, trigger a fallback step right after. Grab the current username directly from the system itself. Pull today’s date and stamp it exactly as it appears. Spit out everything inside a file so you can see it on screen.
How to Run
Requirements
A computer running Ubuntu, Fedora, or something similar built on Debian or RHEL. Instead of generic labels, think specific flavors of Linux that behave in familiar ways once you're inside
Built into most current Linux systems, Bash shell version 4.0 or newer runs smoothly out of the box
Fresh out of the box, a typical Linux setup covers everything needed - no extras tagged on afterward
Setup
Start by copying the repo, then set every script to run mode

Running Each Script
System Identity Report Script One

Script Two FOSS Package Inspector

Script 3 - Disk and Permission Checker

Log File Analyzer Script Four

Open Source Manifesto Generator Script Five

You’ll see three questions appear on screen. After typing a reply, hit the key marked Enter. Your file lands right here, named manifesto_.txt.
Dependencies
Every script runs purely on common Linux tools
What it does shows up ready when you start. bash runs scripts straight away. uname tells kernel details without setup. whoami gives user name automatically. uptime appears live each session. date displays clock data out of the box. grep finds words built right in. awk handles lines fresh from boot. listing folders works immediately. du checks space used at launch. dpkg reveals package facts if apt is present. rpm shares package status where rpm lives. No need for extra downloads ever.
Tested On
Ubuntu 24.04.3 LTS 6.8.0-1052-gcp OS Kernel Scripts Pass Submission
Item Status Public GitHub Repository oss audit 24BCE10480 README md Five Shell Scripts in Root Project Report PDF Uploaded to VITyarthi Portal Open Source Software OSS NGMC VIT University 2024–2025
