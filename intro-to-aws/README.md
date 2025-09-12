# Intro to AWS

- [Intro to AWS](#intro-to-aws)
  - [Questions we will answer](#questions-we-will-answer)
- [What is AWS](#what-is-aws)
- [Marketshare and use cases for AWS](#marketshare-and-use-cases-for-aws)
- [How is AWS structured globally?](#how-is-aws-structured-globally)
- [What are AWS regions?](#what-are-aws-regions)
- [What are AWS availability zones?](#what-are-aws-availability-zones)
- [What are AWS Points of Presence/Edge locations?](#what-are-aws-points-of-presenceedge-locations)
    - [AWS Points of Presence (PoPs)](#aws-points-of-presence-pops)
    - [Edge Locations](#edge-locations)

## Questions we will answer
* What is AWS
* Marketshare and use cases for AWS
* How is AWS structured globally?
* What are AWS regions?
* What are AWS availability zones?
* What are AWS Points of Presence/Edge locations?

# What is AWS
* Amazon Web Services
* 2002 Internal launch
* 2004 Public launch

# Marketshare and use cases for AWS
Examples of companies that use AWS:
* Netflix
* McDonalds
* AirBnB
* Expedia
* Samsung
* Nasa
* Facebook/Meta
* Adobe
* Twitch
* BBC
* Twitter
* Pfizer
* BMW
* Coursera
* Ubisoft


# How is AWS structured globally?

* Regions broken into Availability Zones (AZs)
* Each availability zone is made up of a data center (or cluster of data centers)

**Benefits for a business**
* Low latency (shorter delay if computer storage is closer to you)
* Possible to save money depending on the region you choose
* Data compliance

# What are AWS regions?
* Distinct geographical areas around the world that house clusters of isolated AWS data centers.

# What are AWS availability zones?
* Isolated, discrete data centers within an AWS region, each with its own independent power, networking, and connectivity.
* Physically separated and spread out across regions to protect against correlated failures like power outages or natural disasters.

# What are AWS Points of Presence/Edge locations?
### AWS Points of Presence (PoPs)
* Strategic locations, like data centers, within the AWS global infrastructure
* Serve as points where the AWS network connects to end-users or other networks.

### Edge Locations
* Type of PoP, located all over the world.
* Designed to deliver services with the lowest latency possible.
* Closer to users than Regions or Availability Zones, so responses can be fast.