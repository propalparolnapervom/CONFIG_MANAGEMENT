
[Auto Scaling group](https://docs.aws.amazon.com/autoscaling/ec2/userguide/AutoScalingGroup.html)

An **Auto Scaling group** contains a collection of Amazon EC2 instances that share similar characteristics and are treated as a logical grouping for the purposes of instance scaling and management.

You can use **scaling policies** to increase or decrease the number of instances in your group dynamically to meet changing conditions. 

When the scaling policy is in effect, the Auto Scaling group adjusts the desired capacity of the group and launches or terminates the instances as needed. 

You can also manually scale or scale on a schedule.

_________


[Scaling](https://docs.aws.amazon.com/autoscaling/ec2/userguide/scaling_plan.html)

**Scaling** is the ability to increase or decrease the compute capacity of your application. 

Scaling starts with an event, or scaling action, which instructs an Auto Scaling group to either launch or terminate Amazon EC2 instances.

_________


[Scaling Policy Types](https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-scale-based-on-demand.html):

    - **Target tracking scaling** — Increase or decrease the current capacity of the group based on a target value for a specific metric. This is similar to the way that your thermostat maintains the temperature of your home – you select a temperature and the thermostat does the rest.

    - **Step scaling** — Increase or decrease the current capacity of the group based on a set of scaling adjustments, known as step adjustments, that vary based on the size of the alarm breach.

    - **Simple scaling** — Increase or decrease the current capacity of the group based on a single scaling adjustment.