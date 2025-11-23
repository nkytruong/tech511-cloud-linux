# CPU Usage Alarm

- [CPU Usage Alarm](#cpu-usage-alarm)
  - [Why use a CPU Usage Alarm](#why-use-a-cpu-usage-alarm)
  - [How to Create a CPU Usage Alarm](#how-to-create-a-cpu-usage-alarm)
    - [Setting up a CPU Usage Alarm using the AWS Management Console](#setting-up-a-cpu-usage-alarm-using-the-aws-management-console)
  - [Email Alert](#email-alert)

## Why use a CPU Usage Alarm
* Detect performance issues
  *  If CPU usage is consistently high, it could mean your app is overloaded, which may slow down responses or cause failures
  *  If CPU usage is consistently low, you might be overprovisioned (paying for more than you need)
* Trigger notifications
  * Can connect alarms to SNS topics to send alerts when CPU usage exceeds a certain threshold
* Proactive troubleshooting
  * Alarms help to catch issues early, instead of waiting for system failures to happen


## How to Create a CPU Usage Alarm
Instructions taken from [Amazon docs]( https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/US_AlarmAtThresholdEC2.html)

### Setting up a CPU Usage Alarm using the AWS Management Console

1. Open the CloudWatch console at https://console.aws.amazon.com/cloudwatch/.

2. In the navigation pane, choose Alarms, All Alarms.

3. Choose Create alarm.

4. Choose Select metric.

5. In the All metrics tab, choose EC2 metrics.

6. Choose a metric category (for example, Per-Instance Metrics).

7. Find the row with the instance that you want listed in the InstanceId column and CPUUtilization in the Metric Name column. Select the check box next to this row, and choose Select metric.
![alt text](../images/cpu-usage-metric.png)

8. Under Specify metric and conditions, for Statistic choose Average, choose one of the predefined percentiles, or specify a custom percentile (for example, p95.45).
![alt text](../images/create-alarm-1.png)

9. Choose a period (for example, 1 minute).

10. Under Conditions, specify the following:

    a. For Threshold type, choose Static.

    b. For Whenever CPUUtilization is, specify Greater. Under than..., specify the threshold that is to trigger the alarm to go to ALARM state if the CPU utilization exceeds this percentage. For example, 5.

    c. Choose Additional configuration. For Datapoints to alarm, specify how many evaluation periods (data points) must be in the ALARM state to trigger the alarm. If the two values here match, you create an alarm that goes to ALARM state if that many consecutive periods are breaching.

    To create an M out of N alarm, specify a lower number for the first value than you specify for the second value.

    d. For Missing data treatment, choose how to have the alarm behave when some data points are missing.

    e. If the alarm uses a percentile as the monitored statistic, a Percentiles with low samples box appears. Use it to choose whether to evaluate or ignore cases with low sample rates. If you choose ignore (maintain alarm state), the current alarm state is always maintained when the sample size is too low.

11. Choose Next.

12. Under Notification, choose In alarm and select an SNS topic to notify when the alarm is in ALARM state

    To have the alarm send multiple notifications for the same alarm state or for different alarm states, choose Add notification.

    To have the alarm not send notifications, choose Remove.

13. When finished, choose Next.

14. Enter a name and description for the alarm. Then choose Next.

The name must contain only UTF-8 characters, and can't contain ASCII control characters. The description can include markdown formatting, which is displayed only in the alarm Details tab in the CloudWatch console. The markdown can be useful to add links to runbooks or other internal resources.

15. Under Preview and create, confirm that the information and conditions are what you want, then choose Create alarm.


## Email Alert
Here is an example of an alert email you could receive when CPU usage exceeds the threshold you set. 

![alt text](../images/alarm-email-notif.png)