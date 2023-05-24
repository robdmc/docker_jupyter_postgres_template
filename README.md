# Docker Jupyter Postgres Template

## Setting up
This repo is intented to be used with the cookiecutter python package.
Make sure it is installed in you python environment with the command
```
pip install XXXX
```
Then (possibly create a directory??) and run
```
XXX
```

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


