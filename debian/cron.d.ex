#
# Regular cron jobs for the erlang-otp-r15b01 package
#
0 4	* * *	root	[ -x /usr/bin/erlang-otp-r15b01_maintenance ] && /usr/bin/erlang-otp-r15b01_maintenance
