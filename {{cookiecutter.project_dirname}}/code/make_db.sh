#! /usr/bin/env bash

dropdb {{database_name}} --if-exists
createdb {{database_name}}
