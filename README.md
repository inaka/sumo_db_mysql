# sumo_db_mysql

# About

This is the [MySQL](http://dev.mysql.com/downloads/mysql/) adapter for [sumo_db](https://github.com/inaka/sumo_db).


## MySQL

### Install MySQL

To install/upgrade **MySQL** please follow the instructions in this link:
[Installing and Upgrading MySQL](http://dev.mysql.com/doc/refman/5.7/en/installing.html).


## Getting Started

To start using `sumo_db` with this MySQL adapter `sumo_db_mysql` is pretty easy, you just
have to follow these steps:

 1. Add `sumo_db` and `sumo_db_mysql` as dependencies in your project.

Using **erlang.mk**:

```erlang
DEPS = sumo_db sumo_db_mysql

dep_sumo_db       = git https://github.com/inaka/sumo_db.git      0.5.0
dep_sumo_db_mysql = git https://github.com/inaka/sumo_db_mysql.git 0.0.1
```

Using **Rebar**:

```erlang
{deps, [
  {sumo_db, {git, "https://github.com/inaka/sumo_db.git", {tag, "0.5.0"}}},
  {sumo_db_mysql, {git, "https://github.com/inaka/sumo_db_mysql.git", {tag, "0.0.1"}}}
]}.
```

 2. You need at least one doc/entity, let's use [sumo_test_people_mysql](./test/sumo_test_people_mysql.erl)
    as example.
    > NOTE: if you use this entity, you'll need to include `mixer` to the dependencies list

 3. Provide the configuration file, e.g.: [test.config](./test/test.config).
    > NOTE: if you use this config, you'll need to change `sumo_test_store` to `sumo_store_mysql`

 4. Now you can run your app and start using `sumo` from there.

### Running sumo from Erlang console

Start the Erlang console, adding the path to your beams and config file

    $ erl -pa ebin deps/*/ebin -config tests/test.config

Within the console:

```erlang
> sumo_db_mysql:start().
16:50:45.934 [info] Application lager started on node nonode@nohost
16:50:45.951 [info] Application crypto started on node nonode@nohost
16:50:45.966 [info] Application emysql started on node nonode@nohost
16:50:46.024 [info] Application sasl started on node nonode@nohost
16:50:46.032 [info] Creating wpool ETS table
16:50:46.033 [info] Application worker_pool started on node nonode@nohost
16:50:46.037 [info] Application quickrand started on node nonode@nohost
16:50:46.038 [info] Application uuid started on node nonode@nohost
16:50:46.146 [info] Application sumo_db started on node nonode@nohost
16:50:46.146 [info] Application sumo_db_mysql started on node nonode@nohost
{ok,[syntax_tools,compiler,goldrush,lager,crypto,emysql,
     sasl,worker_pool,quickrand,uuid,sumo_db,sumo_db_mysql]}

% from here you can start using sumo

> sumo:find_all(people).
[]
```


## Running Tests

- Create a user (or use defaults) and configure it on `test/test.config` file.

- Create test database `sumo_test`


## Contact Us

If you find any **bugs** or have a **problem** while using this library, please
[open an issue](https://github.com/inaka/sumo_db_mysql/issues/new) in this repo (or a pull request :)).

And you can check all of our open-source projects at
[inaka.github.io](http://inaka.github.io)
