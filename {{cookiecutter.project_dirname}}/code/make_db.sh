#! /usr/bin/env bash

dropdb {{cookiecutter.database_name}} --if-exists
createdb {{cookiecutter.database_name}}
