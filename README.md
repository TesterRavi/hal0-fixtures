Hautelook SQL Repository
========================
[![Build Status](https://next.travis-ci.com/hautelook/halo-sql.png?token=xYuNngLNi9oEKhdeDuxP)](https://next.travis-ci.com/hautelook/halo-sql)

1. Introduction
---------------

This repository contains the sql files that are required to get a minimal working database for the [halo-www](https://github.com/hautelook/halo-symfony) app 

2. Pruning
----------

The scripts directory contains a `prune.sql` file that contains all the commands that I ran to get the database into its current state. 

3. Exporting
------------

To export the database, you can run the following command: 

    $ sudo mysqldump --opt -uroot -proot --tab=/sql_export hautelook_dev

Because of the way mysqldump works, you will need to make sure that the mysql user owns the output directory and has full
rights to it. The easiest way to do that is:

    $ sudo mkdir /sql_export
    $ sudo chown mysql:mysql /sql_export
    $ sudo chmod a+rwx /sql_export

4. Importing
------------

To import into a database, you can run the following command:

    $ script/install.sh <DB_USER> <DB_PASSWORD> <DB_NAME>

_Note_: Be sure that the user exists on your database, and the database is created. 
