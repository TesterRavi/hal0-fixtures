HauteLook Fixture Data
===
[![Build Status](https://next.travis-ci.com/hautelook/halo-sql.png?token=xYuNngLNi9oEKhdeDuxP)](https://next.travis-ci.com/hautelook/halo-sql)


The halo-sql repository provides for the population of test data (also known as [fixture data](http://en.wikipedia.org/wiki/Test_fixture)) in a local mysql 'hautelook' database so that engineers can vet their code and configuration changes against the test cases expressed therein.

We have two separate workflows for defining our fixture data; it can be done using [Doctrine](http://www.doctrine-project.org/), and separately through using the tools provided in this repo.

What halo-sql does
---

Halo-sql populates one 'hautelook' database, containing fixture data for the test cases we've identified (and took the trouble to capture), regardless of which method was used to express that data or what mysql instance (e.g. master, metrics, dmart) that data would live on in our [production configuration](./doc/mysql-architecture.md).

To put it another way, you don't need to worry about how existing fixture data was defined; the commands described below will load both flavors, and you can access it on the local mysql instance of your app's vagrant instance regardless of where it would live in production.


1. Interacting with fixture data from our applications.
---
The build steps used to populate and manipulate fixture data are defined in the [halo-symfony](http://github.com/hautelook/halo-symfony) repository, and the instructions and vagrant definitions for provisioning each of our PHP-based applications ([rack](http://github.com/hautelook/rack), [symfony](http://github.com/hautelook/halo-symfony), [workflow](http://github.com/hautelook/workflow) and [www](http://github.com/hautelook/halo-www)) reside in [halo-env](http://github.com/hautelook/halo-env). Check out halo-env's [readme](https://github.com/hautelook/halo-env/blob/master/README.md) for the grand unification of all those things.

2. Populating fixture data in your vagrant instance
---
Assuming you've followed the holy halo-env [readme](https://github.com/hautelook/halo-env/blob/master/README.md), populating the fixture data involves ssh'ing into your application's vagrant instance and running ```grunt mysql-fixtures:reset``` from the /vagrant directory. You're welcome.


3. Fixture data's software development lifecycle
---
When you want to add, modify or delete fixture data using the tooling in halo-sql, you need to remove the Doctrine-provided fixture data from your application's vagrant instance, make your changes, export the state of your database to the filesystem, and commit those added/modified/deleted .sql file to github. Here's how:

```
[vagrant@symfony vagrant]$ pwd
/vagrant
[vagrant@symfony vagrant]$ grunt mysql-fixtures:reset
Running "shell:sql-fixtures-reset" (shell) task
populating schema...
populating table triggers...
populating stored procedures...
  > loading Hautelook\ApiBundle\DataFixtures\ORM\LoadFixtureData
populating table data...
applying transformations to the fixture data...

Done, without errors.
```
* `grunt mysql-fixtures:reset` imports `doctrine fixture data` which shouldn't be exported to files tracked in halo-sql, so in order to block that `grunt mysql-fixtures:export` will resolve in this error:

```
[vagrant@symfony vagrant]$ grunt mysql-fixtures:export
Running "shell:sql-fixtures-export" (shell) task
  You are in reset mode, Contributing to fixture data is not valid in this mode.`

 You need to run  grunt mysql-fixtures:contribute  and then run  grunt mysql-fixtures:export

error: exit

Usage: fixtures [ACTION]
 Actions are one of the following
 grunt mysql-fixtures:reset               - populate mysql with schema, doctorine fixtures, table data and sprocs.
 grunt mysql-fixtures:contribute         - populate mysql with schema, data, sprocs & enables CRUD operation.
 grunt mysql-fixtures:export             - write sql files with schema, table, sprocs, triggers to filesystem.

Warning: Command failed:  Use --force to continue.

Aborted due to warnings.

```
* So don't do that! Here is what will work; let's contribute to the table `promo_types`:

```
[vagrant@symfony vagrant]$ mysql -u hautelook -phautelook -D hautelook

mysql> select * from promo_types;
+------------------+------------------+
| promo_type       | description      |
+------------------+------------------+
| facebook         | Facebook         |
| facebook_twitter | Facebook/Twitter |
| invite_a_friend  | Invite A Friend  |
| pinterest        | Pinterest        |
| standard         | Standard         |
| twitter          | Twitter          |
+------------------+------------------+
6 rows in set (0.00 sec)
```
* to enter contribution mode run `grunt mysql-fixtures:contribute`

```
[vagrant@symfony vagrant]$ grunt mysql-fixtures:contribute
Running "shell:sql-fixtures-contribute" (shell) task
populating schema...
populating table triggers...
populating stored procedures...
populating table data...
applying transformations to the fixture data...

Done, without errors.

```
* make an update in the database:

```
[vagrant@symfony vagrant]$ mysql -u hautelook -phautelook -D hautelook
mysql> update promo_types set description='tim wuz here' where promo_type='twitter';

Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from promo_types;
+------------------+------------------+
| promo_type       | description      |
+------------------+------------------+
| facebook         | Facebook         |
| facebook_twitter | Facebook/Twitter |
| invite_a_friend  | Invite A Friend  |
| pinterest        | Pinterest        |
| standard         | Standard         |
| twitter          | tim wuz here     |
+------------------+------------------+
mysql> exit
Bye
```
* now let's export our changes by running `grunt mysql-fixtures:export`:

```
[vagrant@symfony vagrant]$ grunt mysql-fixtures:export
Running "shell:sql-fixtures-export" (shell) task
exporting-schema
exporting-data-triggers
exporting sprocs

Done, without errors.

```
* let's see what git thinks of our repo now:

```
[vagrant@symfony vagrant]$ cd vendor/hautelook/halo-sql/fixtures/data/
[vagrant@symfony data]$ git --no-pager diff promo_types.sql 
diff --git a/fixtures/data/promo_types.sql b/fixtures/data/promo_types.sql
index e2da824..5293fb6 100644
--- a/fixtures/data/promo_types.sql
+++ b/fixtures/data/promo_types.sql
@@ -12,7 +12,7 @@
 
 LOCK TABLES `promo_types` WRITE;
 /*!40000 ALTER TABLE `promo_types` DISABLE KEYS */;
-INSERT  IGNORE INTO `promo_types` VALUES ('facebook','Facebook'),('facebook_twitter','Facebook/Twitter'),('invite_a_friend','Invite A Friend'),('pinterest','Pinterest'),('standard','Standard'),('twitter','Twitter');
+INSERT  IGNORE INTO `promo_types` VALUES ('facebook','Facebook'),('facebook_twitter','Facebook/Twitter'),('invite_a_friend','Invite A Friend'),('pinterest','Pinterest'),('standard','Standard'),('twitter','tim wuz here');
 /*!40000 ALTER TABLE `promo_types` ENABLE KEYS */;
 UNLOCK TABLES;
 /*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
[vagrant@symfony data]$ 
 ```
 * make a pull request against your fork of [halo-sql](http://github.com/hautelook/halo-env), and you are well on your way to getting your changes in front of your colleagues. You're welcome. 