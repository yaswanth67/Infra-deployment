# infra-deployment

**Description**

This repository will hold the deployment state for all the micro services. This app will use ansible to deploy the various services to the staging and production environments. It also provide a stagging deployment and production deployment github action workflow that is used by coffee app to trigger the deployment.

**CI/CD**

This app in itself doesnt have any CI/CD but provides two workflow files that can be used by other services to the deployment on the staging and production servers.

**Developer Guide**

This repo provides two workflows staging_deployment_coffee.yml and production_deployment_coffee.yml. These actions help to checkout and deploy all the services on the respective servers. Both have similar structures and actions. The actions are as follows:
1. We checkout this repo which provides the deployment folder that contains deployment states for each services, ansible playbook and hosts file which will get the STAGING and PRODUCTION ip's and user names from the secrets.
2. It will then download the build artifact that will be created and uploaded by the coffee app workflow that triggers this deployment.
3. We will also checkout the main branch for the feature-configuration for deployent.
4. Based on the environment, we will get the Private key for ssh from the github secrets for ansible to be able to connect to the servers. (We have already configured the servers to have the corresponding public keys as the trusted devices).
5. we then build the ansible docker image and run it.
6. Based on if staging or production is triggered, we limit the ansible to use the proper host for deployment and set corresponding environment variables.

**_Deployment folder structure_**

We have all the containers that will be running as part of the deployment folder.
1. CoffeeApp - We have the docker file here and we will download the build created in the pipeline to this location.
2. feature-configuration - We have the Docker file for deploymnent in this folder, we will checkout the main branch of the feature-configuration repo in this location during the deployment.
3. monitoring/Grafana - This folder has docker file for deploying grafana and has a provision file that will help to setup the default data source as loki automatically on deployment.
4. monitoring/loki - This has the loki configuration file and the Docker file for the deployment.
5. mysql - This sets up a db and creates the features table in the mysql container that will be used by feature-configuration.
6. Nginx - This will act as the gateway for all requests, reverse proxying the api requests to the corresponding services.

**_Ansible steps_**

1. In ansible we first copy the deployment folder the server.
2. We then download and enable the loki docker plugin. This will allow sending all the logs from the docker containers to loki and automatically being able to see the corresponding logs in grafana.
3. We then create a docker network that will be used by all our containers.
4. We then build, remove existing container and deploy all the services, setting their corresponding environment varibles. We also configure each service to use loki as the log_driver and set its corresponding options.
