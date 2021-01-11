# swissborg-homework
Codes for SwissBorg SRE role application homework

## Build the infra from scratch

I assume that the base VM got installed using the vagrant file attached to homework. I also assume that you have cloned the repo and now your working directory is the root of the repository.

Now the only thing you have to do is run each script after each other from the `script/` folder.

#TODO make a parent script which will invoke the other scripts...



## Used links to develop the solution
- Basic flask app developemnt:
  - https://programminghistorian.org/en/lessons/creating-apis-with-python-and-flask
  - https://flask.palletsprojects.com/en/1.1.x/quickstart/#variable-rules
- Minikube usage with local docker image: https://medium.com/bb-tutorials-and-thoughts/how-to-use-own-local-doker-images-with-minikube-2c1ed0b0968
- How to run flask app with uwsgi: https://smirnov-am.github.io/running-flask-in-production-with-docker/