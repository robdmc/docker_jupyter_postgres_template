#! /usr/bin/env bash

psql -d postgres -c 'Drop database if exists test;'
psql -d postgres -c 'create database test;'
psql -d test < /dbdump/load_table.sql

