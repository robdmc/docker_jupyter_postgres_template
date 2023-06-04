# Docker Jupyter Postgres Template

## Setting up
This repo is intented to be used with the cookiecutter python package.
Make sure it is installed in you python environment with the command
```
pip install cookiecutter
```
Now you will create a directory containing the project code.  Naivate
to the parent directory into which you'd like to place the project
directory (e.g.  ~/rob/repos) and run the cookiecutter command below,
which will prompt you for four values:

* project_dirname: This is the name of the directory into which to place
  all the code.
* project_name: This is the project name that will be prepended to
  all docker resource names (e.g. images, volumes, networks, etc.)
* database_name: The postgres databasename that will be used for the project
* docker_username: The docker image will be built with a name prefixed by
  this docker username.  So, for example: `my_docker_username/my_project_name`

```
cookiecutter https://github.com/robdmc/docker_jupyter_postgres_template
```

This command will prompt you for 3 variables

## Building the project
Once coockiecutter has deployed the code, you will see all the prebuilt
actions you can peform by running the command
```
make help
```

You can (re)build the project from scratch by running the single commmand
```
make bootstrap
```
which will build a local docker image, set up postgres with your database
and build install all the python packages you specify in the 
`requirements.txt` file.  Note that you  can run individual build steps
by running the corresponding make targets seen under `make help`.

## Running the project
The two most common prebuilt command you will probably run are
* `make notebook` which will run a jupyter notebook in the container
* `make pgcli` which will open a container shell with pgcli connected
to your database.


