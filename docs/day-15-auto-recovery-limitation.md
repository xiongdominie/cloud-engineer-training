EC2 Auto-Recovery was configured using the StatusCheckFailed_System metric.
However, AWS rejected the Recover action because the instance type does not
support recovery. This limitation is specific to certain instance families
and underlying hardware. In production, this would be addressed by selecting
a recovery-eligible instance type or using Auto Scaling for replacement.