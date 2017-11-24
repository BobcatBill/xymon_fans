FANS=`/usr/local/bin/ipmitool sdr | grep -E "^FAN" | grep -v "no reading" | awk '{print $1$2": \t"$4" RPM"}'`

$XYMON $XYMSRV "status `hostname -s`.fans green `date`
`echo "$FANS"`
"
