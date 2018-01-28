FANS.SH

Script used to pull fan information via IPMI and send to Xymon.

Add the following to $XYMONCLIENTHOME/etc/clientlaunch.cfg

```
[fans]
        ENVFILE $XYMONCLIENTHOME/etc/xymonclient.cfg
        CMD $XYMONCLIENTHOME/ext/fans.sh
        LOGFILE $XYMONCLIENTLOGS/fans.log
        INTERVAL 5m
```

Make sure to add fans=ncv and SPLITNCV_fans="*:GAUGE" to server config

Add this to graphs.cfg:

```
[fans]
        FNPATTERN ^fans.(.*).rrd
        TITLE Fan Speed
        YAXIS RPM
        DEF:p@RRDIDX@=@RRDFN@:lambda:AVERAGE
        LINE1:p@RRDIDX@#@COLOR@:@RRDPARAM@
        GPRINT:p@RRDIDX@:LAST: \: %5.1lf (cur)
        GPRINT:p@RRDIDX@:MAX: \: %5.1lf (max)
        GPRINT:p@RRDIDX@:MIN: \: %5.1lf (min)
        GPRINT:p@RRDIDX@:AVERAGE: \: %5.1lf (avg)\n
```
