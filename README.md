# swissborg-homework
Codes for SwissBorg SRE role application homework

##  CHSB token

CHSB is an (ERC20) utility token developped on by SwissBorg on the top of the ethereum blockchain. Aldo CHSB has its own exchange value like "strandard cryptocurrencies" (for example Bitcoin) as an utility token it main porpuse is to grant access to special funcions/mechanism in the Swissborg Ecosystem:
- Staking
- Voting Rights
- Buy Back and burn
- Meritocracy

Linked I used:
 - https://cointelegraph.com/explained/differences-between-tokens-coins-and-virtual-currencies-explained
 - https://swissborg.com/blog/what-is-the-swissborg-token

## Build the infra from scratch

I assume that the base VM got installed using the vagrant file attached to homework (minikube and helm installed, and started as it stated in the doc). I also assume that you have cloned the repo and now your working directory is the root of the repository.

Now the only thing you have to do is run each script after each other from the `script/` folder.

```
cd script
00_preconfigure_env.sh                    # --> will install prerequisites
01_run_pytest.sh                          # --> runs soma basics test against the python code
02_create_and_upload_docker_image.sh      # --> creates the docker image and uploads it to the minikube cache. 
03_install_argocd.sh                      # --> deploys argocd non-ha to minikube and downloads argocd cli tool
04_helm_deploy.sh                         # --> tries to deploy the foobarqix api using argocd . If it fails it will use simple helm deployment
05_testing_deployed_service.sh            # --> runs some tests against the deployed service
06_clean_up.sh                            # --> stops kubectl port-forward, deletes the argocd app or helm chart app, killa the minikube tunnel and stops the minikube
```

Notes:

## Used links to develop the solution
- Basic flask app developemnt:
  - https://programminghistorian.org/en/lessons/creating-apis-with-python-and-flask
  - https://flask.palletsprojects.com/en/1.1.x/quickstart/#variable-rules
- Minikube usage with local docker image: https://medium.com/bb-tutorials-and-thoughts/how-to-use-own-local-doker-images-with-minikube-2c1ed0b0968
- How to run flask app with uwsgi: https://smirnov-am.github.io/running-flask-in-production-with-docker/
- https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/
- https://argoproj.github.io/argo-cd/getting_started/


## Notes
- I would love to do the optional tasks as well (unprivileged user, service account) , but I have no clue when I will have time to do it. 
- I have deployed my solution first using the ArgoCD WebUI. Later I saved its seetings as a yaml config file `argo-foobarqix.yml`. I was not able to find the proper `argocd` cli command to redeploy the app using this `.yml` file, so I used the (I think) ugly workaround in the `scripts/04_helm_deploy.sh` file.
- I am not as good in k8s as much I would like (haven't used it in the last year or so), so I am not sure if my solution to make the foobarqix serive available on port 8000 is what you were looking for.