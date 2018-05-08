#!/bin/sh
# \
exec expect -f "$0" "$@"
if { $argc != 2 } {
    puts "Usage: $argv0 <username> <passwd>"
    exit 1
}
set password [lindex $argv 1]
spawn passwd [lindex $argv 0]
sleep 1
expect "assword:"
send "$password\r"
expect "assword:"
send "$password\r"
expect eof
