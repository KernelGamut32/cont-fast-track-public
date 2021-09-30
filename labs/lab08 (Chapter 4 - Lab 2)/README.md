# Lab 08 (Chapter 4 - Lab 2) - Secrets

Use https://github.com/KernelGamut32/kiamol/tree/master/ch04 

* Adminer, a web UI for administering SQL databases, can be a handy tool to run in Kubernetes when you’re troubleshooting database issues.

* Start by deploying the YAML files in the ch04/lab/postgres folder, then deploy the ch04/lab/adminer.yaml file to run Adminer in its basic state.

* Find the external IP for your Adminer Service, and browse to port 8082. Note that you need to specify a database server and that the UI design is stuck in the 1990s. You can confirm the connection to Postgres by using postgres as the database name, username, and password.

* Your job is to create and use some config objects in the Adminer Deployment so that the database server name defaults to the lab’s Postgres Service, and the UI uses the much nicer design called price.

* You can set the default database server in an environment variable called ADMINER_DEFAULT_SERVER. Let’s call this sensitive data, so it should use a Secret.

* The UI design is set in the environment variable ADMINER_DESIGN; that’s not sensitive, so a ConfigMap will do nicely.