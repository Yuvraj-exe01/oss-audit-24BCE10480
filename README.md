My name is Yuvraj Rajoriya. My registration number is 24BCE10480. This repository holds my capstone project for the Open Source Vityarthi Software course for the E22 Slot based on Linux.

I audited Firefox as an open-source project. The audit covers its origin story, license analysis, and Linux footprint. It explores the wider software ecosystem and compares Firefox against Google Chrome. I also wrote five shell scripts to demonstrate practical Linux and bash scripting skills.

The project folder contains five scripts and a readme file. Here is exactly what each script does.

Script 1 is a System Identity Report. It displays a welcome screen showing your Linux distribution, kernel version, and logged-in user. It lists your home directory, system uptime, and current time. The script identifies your operating system license as GPL v2 and Firefox as MPL 2.0. I used variables, command substitution, if-else logic, and grep.

Script 2 is a FOSS Package Inspector. It detects whether your system uses apt or rpm package managers. It checks if Firefox is installed and displays its version, license, and a short summary. A case statement prints a philosophy note based on the package name. The script checks firefox, apache, mysql, git, vlc, and python. I used if-then-else statements, dpkg, rpm, awk, and pipes.

Script 3 is a Disk and Permission Auditor. It loops through six important Linux directories. These are /etc, /var/log, /home, /usr/bin, /tmp, and /usr/share. The script reports the permissions, owner, group, and disk usage of each directory. It specifically checks for the Firefox user profile directory. I built this using bash arrays, for loops, and directory validation checks.

Script 4 is a Log File Analyzer. It reads a log file line by line and counts how many lines contain a specific keyword. It prints the last five matching lines and calculates a total match percentage. The script accepts the log file path and keyword as command-line arguments. It runs three input validation checks before it processes any data. I used parameter expansion, while loops, grep, tail, and awk.

Script 5 is an Open Source Manifesto Generator. It asks you three questions interactively. It takes your answers and generates a personalized philosophy statement. It saves this statement to a text file named after your current user. This script uses interactive input, alias wrapper functions, string concatenation, and file redirection.

You need a Linux system to run these scripts. Any Debian or RHEL-based distribution works. You also need Bash shell version 4.0 or above ok. Modern Linux distributions include this by default. You do not need to install any extra packages.

To set up the project, clone the repository and make the scripts executable.

git clone https://www.google.com/search?q=https://github.com/Yuvraj-exe01/oss-audit-24BCE10480.git
cd oss-audit-24BCE10480
chmod +x *.sh

Run each script by typing a dot and a slash followed by the script name. For example, you run the log analyzer by typing ./script4_log_analyzer.sh /var/log/syslog warning.

These scripts rely entirely on standard Linux utilities. They use tools like uname, uptime, grep, awk, ls, du, dpkg, and rpm. I tested everyhing on Ubuntu 24.04.3 LTS running kernel 6.8.0-1052-gcp. All scripts pass without issues.

My final submission includes a public GitHub repository, five shell scripts, a readme file, and a PDF project report.
