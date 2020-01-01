# DevOps challenge

This challenge was designed to look for your DevOps skills. The repository contains a simple python application, but it is not completed. The app needs a MongoDB database to be able to run it.

## The app

This is a python *(flask)* application. To download it:

```bash
$ git clone git@github.com:vigilantcc/devops-challenge.git
Cloning into 'devops-challenge'...
remote: Enumerating objects: 3, done.
remote: Counting objects: 100% (3/3), done.
remote: Compressing objects: 100% (2/2), done.
remote: Total 3 (delta 0), reused 0 (delta 0)
Receiving objects: 100% (3/3), done.
$ cd ./devops-challenge
```

### Run the tests

This python app contains some tests. To run it in your own host:

```bash
$ pwd
devops-challenge
$ pip install tox
Collecting tox
  Using cached https://files.pythonhosted.org/packages/d0/43/2160a300e0b77a929a980f36ac7427dcef8f4ddac7a8c21e5a8baedad828/tox-3.5.3-py2.py3-none-any.whl
Collecting toml>=0.9.4 (from tox)
  Using cached https://files.pythonhosted.org/packages/a2/12/ced7105d2de62fa7c8fb5fce92cc4ce66b57c95fb875e9318dba7f8c5db0/toml-0.10.0-py2.py3-none-any.whl
Collecting py<2,>=1.4.17 (from tox)
  Using cached https://files.pythonhosted.org/packages/3e/c7/3da685ef117d42ac8d71af525208759742dd235f8094221fdaafcd3dba8f/py-1.7.0-py2.py3-none-any.whl
Collecting pluggy<1,>=0.3.0 (from tox)
  Using cached https://files.pythonhosted.org/packages/1c/e7/017c262070af41fe251401cb0d0e1b7c38f656da634cd0c15604f1f30864/pluggy-0.8.0-py2.py3-none-any.whl
Collecting six<2,>=1.0.0 (from tox)
  Using cached https://files.pythonhosted.org/packages/67/4b/141a581104b1f6397bfa78ac9d43d8ad29a7ca43ea90a2d863fe3056e86a/six-1.11.0-py2.py3-none-any.whl
Collecting virtualenv>=1.11.2 (from tox)
  Using cached https://files.pythonhosted.org/packages/7c/17/9b7b6cddfd255388b58c61e25b091047f6814183e1d63741c8df8dcd65a2/virtualenv-16.1.0-py2.py3-none-any.whl
Collecting filelock<4,>=3.0.0 (from tox)
  Using cached https://files.pythonhosted.org/packages/d7/ca/3c74396a9ed8a4cfab5459800edeef9a1269591cb21f5a49bd71a49c5fa2/filelock-3.0.10-py3-none-any.whl
Requirement already satisfied: setuptools>=30.0.0 in ./.venvTox/lib/python3.6/site-packages (from tox) (40.6.2)
Installing collected packages: toml, py, pluggy, six, virtualenv, filelock, tox
Successfully installed filelock-3.0.10 pluggy-0.8.0 py-1.7.0 six-1.11.0 toml-0.10.0 tox-3.5.3 virtualenv-16.1.0
$ tox
___________________________________________________________________________________________ summary ___________________________________________________________________________________________
  py27: commands succeeded
ERROR:  py34: InterpreterNotFound: python3.4
ERROR:  py35: InterpreterNotFound: python3.5
  py36: commands succeeded
```

If you prefer, you can run the tests in a container:

```bash
$ pwd
devops-challenge
$ docker run -it -v $(pwd):/tmp/app -w /tmp/app --rm painless/tox /bin/bash tox
___________________________________________________________________________________________ summary ___________________________________________________________________________________________
  py27: commands succeeded
  py34: commands succeeded
  py35: commands succeeded
  py36: commands succeeded
  congratulations :)
```

### Run the app

If you want to run the app locally:

```bash
$ virtualenv -p python3 .venv
Running virtualenv with interpreter /usr/bin/python3
Using base prefix '/usr'
New python executable in /home/ubuntu/vigilant/devops-challenge/.venv/bin/python3
Also creating executable in /home/ubuntu/vigilant/devops-challenge/.venv/bin/python
Installing setuptools, pip, wheel...
done.
$ source .venv/bin/activate
$ pip install -r requirements.txt
Collecting Flask-PyMongo==2.2.0 (from -r requirements.txt (line 1))
  Using cached https://files.pythonhosted.org/packages/d5/c8/22ddacfe05893884dceef5b9ecfa683f947ba155bd63cd9d841aea29b7b7/Flask_PyMongo-2.2.0-py2.py3-none-any.whl
Collecting isodate==0.6.0 (from -r requirements.txt (line 2))
  Using cached https://files.pythonhosted.org/packages/9b/9f/b36f7774ff5ea8e428fdcfc4bb332c39ee5b9362ddd3d40d9516a55221b2/isodate-0.6.0-py2.py3-none-any.whl
Collecting Flask>=0.11 (from Flask-PyMongo==2.2.0->-r requirements.txt (line 1))
  Using cached https://files.pythonhosted.org/packages/7f/e7/08578774ed4536d3242b14dacb4696386634607af824ea997202cd0edb4b/Flask-1.0.2-py2.py3-none-any.whl
Collecting PyMongo>=3.0 (from Flask-PyMongo==2.2.0->-r requirements.txt (line 1))
  Using cached https://files.pythonhosted.org/packages/b1/45/5440555b901a8416196fbf2499c4678ef74de8080c007104107a8cfdda20/pymongo-3.7.2-cp36-cp36m-manylinux1_x86_64.whl
Collecting six (from isodate==0.6.0->-r requirements.txt (line 2))
  Using cached https://files.pythonhosted.org/packages/67/4b/141a581104b1f6397bfa78ac9d43d8ad29a7ca43ea90a2d863fe3056e86a/six-1.11.0-py2.py3-none-any.whl
Collecting Werkzeug>=0.14 (from Flask>=0.11->Flask-PyMongo==2.2.0->-r requirements.txt (line 1))
  Using cached https://files.pythonhosted.org/packages/20/c4/12e3e56473e52375aa29c4764e70d1b8f3efa6682bef8d0aae04fe335243/Werkzeug-0.14.1-py2.py3-none-any.whl
Collecting itsdangerous>=0.24 (from Flask>=0.11->Flask-PyMongo==2.2.0->-r requirements.txt (line 1))
  Using cached https://files.pythonhosted.org/packages/76/ae/44b03b253d6fade317f32c24d100b3b35c2239807046a4c953c7b89fa49e/itsdangerous-1.1.0-py2.py3-none-any.whl
Collecting click>=5.1 (from Flask>=0.11->Flask-PyMongo==2.2.0->-r requirements.txt (line 1))
  Using cached https://files.pythonhosted.org/packages/fa/37/45185cb5abbc30d7257104c434fe0b07e5a195a6847506c074527aa599ec/Click-7.0-py2.py3-none-any.whl
Collecting Jinja2>=2.10 (from Flask>=0.11->Flask-PyMongo==2.2.0->-r requirements.txt (line 1))
  Using cached https://files.pythonhosted.org/packages/7f/ff/ae64bacdfc95f27a016a7bed8e8686763ba4d277a78ca76f32659220a731/Jinja2-2.10-py2.py3-none-any.whl
Collecting MarkupSafe>=0.23 (from Jinja2>=2.10->Flask>=0.11->Flask-PyMongo==2.2.0->-r requirements.txt (line 1))
  Using cached https://files.pythonhosted.org/packages/08/04/f2191b50fb7f0712f03f064b71d8b4605190f2178ba02e975a87f7b89a0d/MarkupSafe-1.1.0-cp36-cp36m-manylinux1_x86_64.whl
Installing collected packages: Werkzeug, itsdangerous, click, MarkupSafe, Jinja2, Flask, PyMongo, Flask-PyMongo, six, isodate
Successfully installed Flask-1.0.2 Flask-PyMongo-2.2.0 Jinja2-2.10 MarkupSafe-1.1.0 PyMongo-3.7.2 Werkzeug-0.14.1 click-7.0 isodate-0.6.0 itsdangerous-1.1.0 six-1.11.0
$ export MONGO_URI=mongodb://YOUR_USERNAME:YOUR_PASSWORD@YOUR_MONGO_HOST:YOUR_MONGO_PORT/YOUR_MONGO_DB_NAME
$ python app.py
 * Serving Flask app "app" (lazy loading)
 * Environment: production
   WARNING: Do not use the development server in a production environment.
   Use a production WSGI server instead.
 * Debug mode: off
 * Running on http://0.0.0.0:8080/ (Press CTRL+C to quit)
```

You will be able to access the api locally in the `8080` port.

#### The API

- `/api/v1/records`: Returns a list containing all the records.
- `/api/v1/records/{id}`: Returns a list with a single record that match the `id` path parameter.

Examples:

```bash
curl localhost:8080/api/v1/records | jq
.
.
.
  {
    "_id": "5df9868bf941d1c95ad44fb9",
    "contributor": "Maria Maldonado",
    "amount": "8",
    "filing_url": "https://apps-secure.phoenix.gov/CampaignFinance/Reports/PrintReport/232cf644-a524-4282-8772-a1a3b5f004aa",
    "date": "2019-01-28",
    "recipient": "Carlos For Phoenix"
  },
  {
    "_id": "5df9868bf941d1c95ad44fba",
    "contributor": "Sandy Rogers",
    "amount": "25",
    "filing_url": "https://apps-secure.phoenix.gov/CampaignFinance/Reports/PrintReport/4d2a55db-3000-412f-83dc-c7fb509158b7",
    "date": "2019-01-25",
    "recipient": "Kate Gallego for Phoenix Mayor"
  },
  {
    "_id": "5df9868bf941d1c95ad44fbb",
    "contributor": "David Boate",
    "amount": "25",
    "filing_url": "https://apps-secure.phoenix.gov/CampaignFinance/Reports/PrintReport/3f0e2248-18fc-462a-9b50-034372fe17ad",
    "date": "2017-04-07",
    "recipient": "Gannett Fleming, Inc. PAC"
  },
  .
  .
  .
```

This is an example output, to get the full output, test it locally.

```bash
curl localhost:8080/api/v1/records/5df983d2970c93051e784eeb | jq
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   241  100   241    0     0    317      0 --:--:-- --:--:-- --:--:--   317
[
  {
    "_id": "5df983d2970c93051e784eeb",
    "contributor": "Phil Gordon",
    "amount": "450",
    "filing_url": "https://apps-secure.phoenix.gov/CampaignFinance/Reports/PrintReport/9941fb26-0959-42af-b793-70ef530fd480",
    "date": "2013-03-26",
    "recipient": "Karlene for Council"
  }
]
```

## The challenge starts here

You have to **fork** this repository to complete the following challenges in your own `github` account. **Feel free to solve the challenge you want**.

Once completed, don't forget to send back the solution.

If you have any doubt, don't hesitate to [open an issue](https://github.com/vigilantcc/devops-challenge/issues/new) to ask any question about any challenge.

### Challenge 1. The API returns a list instead of an object

As you can see, the API returns a list in the two exposed endpoints:

- `/api/v1/records`: Returns a list containing all the records.
- `/api/v1/records/{id}`: Returns a list with a single record that match the `id` path parameter.

We want to fix the second endpoint. Return a json object instead of a json array if there is a match or a http 204 status code if no match found.

### Challenge 2. Test the application in any CI/CD system

![CICD](./app/assets/ci.cd.png)

As a good devops engineer, you know the advantages of running tasks in an automated way. There are some CI/CD systems that can be used to make it happen.
Choose one, travis-ci, gitlab-ci, circleci or whatever you prefer. Give us a successful pipeline.

### Challenge 3. Dockerize the APP

What about containers? As this moment *(2018)*, containers are a standard in order to deploy applications *(cloud or in on-premise systems)*. So the challenge is to build the smaller image you can. Write a good Dockerfile :)

### Challenge 4. Dockerize the database

We need to have a mongodb database to make this application run. So, we need a mongodb container with some data. Please, use the [record](./data/record.json) dataset to load the mongodb collection before running the application.

The loaded mongodb collection must be named: `record`. Do you have to write code or just write a Docker file?

### Challenge 5. Docker Compose it

Once you've got dockerized all the API components *(python app and database)*, you are ready to make a docker-compose file.

### Final Challenge. Deploy it on kubernetes

If you are a container hero, an excellent DevOps... We want to see your expertise. Use a kubernetes system to deploy the `API`. We recommend you to use tools like [minikube](https://kubernetes.io/docs/setup/minikube/) or [microk8s](https://microk8s.io/).

Write the deployment file *(yaml file)* used to deploy your `API` *(python app and mongodb)*.


### Results & How to

All the challenges have been solved and here is a small brief to know how to run my solution.

The stack is composed of three docker containers:

- python-app 
- mongodb 
- mongo-seed (to seed the database with the data)

#### docker-compose 

To start the stack with docker-compose, you will need some .env files gathering the environment variables necessary to run the app:

.app-secret

```
MONGO_URI=mongodb:/USER:PASSWORD@mongodb:27017/DB_NAME
```

.mongo-secret

```
MONGO_INITDB_ROOT_USERNAME=ROOT_USERNAME
MONGO_INITDB_ROOT_PASSWORD=ADMIN_PASS
MONGO_INITDB_DATABASE=DB_NAME
MONGO_NON_ROOT_USERNAME=USER
MONGO_NON_ROOT_PASSWORD=PASSWORD
MONGO_HOST=mongodb
```

`docker-compose up -d` 

And then you can call your API on your `localhost:8080`

#### kubernetes

If you want to run it on kubernetes, you can go on into the kubernetes folder:

You will first need to set a few environment variables, modify some files to make sure all credentials are properly set:

in `app-secret.yaml` you need to add the base64 encoded string for the `MONGO_URI` connection string.

WARNING: Because we are using a different version of mongodb than in docker-compose the string has to be like this:

`MONGO_URI=mongodb:/USER:PASSWORD@my-release-mongodb:27017/DB_NAME?authSource=DB_NAME`

to generate base64 string: 

`echo mongodb://USER:PASSWORD@my-release-mongodb:27017/DB_NAME?authSource=DB_NAME | base64`

To set the credentials for mongodb go to `./mongodb/values.yaml`, example:

```
mongodbUsername: guillaume
mongodbPassword: vJh5oW8r^46TV
mongodbDatabase: vigilant
```

which set up the config for the non-root database and user
You will also need to modify `seed-conf.yaml` if you change the user or service name.

To deploy the stack you will need on your computer:

```
kubectl (tested with 1.15.2)
helm (tested with 2.12.2)
```
and kubectl configured to a running cluster.
You can run the deployment script:

`./deploy-app.sh`

This will install all the components necessary on the cluster and initialize the mongodb database with some data.

Once it is done you can check pods are running with:

`kubectl get pods --all-namespaces`

and if you want to reach the application you can use:
`kubectl get svc`
to find out on which port the service `python-svc` has been exposed. I intentionnally used a `NodePort` type of service because I have been testing this on a local kubernetes cluster (docker-for-mac). You could easily change the service type to LoadBalancer on a cloud provider to expose publicly the API via a public IP (port 80)

Check the API at `http://localhost:PORT/api/v1/records`

You are all set!

I hope you will appreciate this work as much as I enjoyed doing it. If you have any questions or remarks feel free to contact me or open an issue!

Best regards,
