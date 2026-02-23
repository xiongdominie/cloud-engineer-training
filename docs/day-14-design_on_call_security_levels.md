Severity Levels

SEV-1 (Wake Up Alert)
-Instance down
-SSH inaccessible
-Data loss risk

SEV-2 (Business Hours)
-High sustained CPU
-Disk usage warning
-Performance degradation

SEV-3 (No Alert)
-Short CPU spikes
-Normal scaling behavior
-Informational metrics

Not all metrics deserve alarms. Alerts are reserved for conditions requiring immediate human action. Over-alerting leads to alert fatigue and missed incidents.

Alarm Behavior Note
StatusCheckFailed_Instance may remain in INSUFFICIENT_DATA
This occurs when AWS emits no datapoints for healthy instances
Alarm corrected by setting Treat missing data as: Not breaching
Verified transition to OK