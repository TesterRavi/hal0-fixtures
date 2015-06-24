Hautelook's relational database architecture
===

HauteLook's relational databases architecture consists of multiple mysql instances, each containing a 'hautelook' database. The 'top level' database instance is called 'master. Each master can have its own read slaves, and seperately replicates to other downstream mysql instances, in the following arrangement:

- A toplevel **master** database, containing all data used by our ecomm platform (including components such as halo-symfony and halo-www). In production, any component needing to update (create/delete/modify) data does so in the master database. In production and in our development database clusters, each master replicates to one or more slave instances (replica's), that provide read-only access to that data. NOTE: Currently in our dev environments, the slaves aren't read-only. This is in oops.
- A **metrics** database that replicates from master, and contains additional data related to reporting. Additionally, our internal admin tool reads from metrics for some of what it does. Metrics databases can have their own read slaves. NOTE: metrics should likely be retired, in favor of our admin tooling reading from the read slaves of master and our reporting running aginst dmart (see below).
- A **dmart** database that replicates from metrics and contains additional data generated and consumed by our reports. Dmart databases can have their own read slaves.
