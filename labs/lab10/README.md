# Lab 10 - PersistentVolumes

We have a new deployment of the to-do app, which has a couple of issues. We’re using a proxy in front of the web Pod to improve performance and a local database file inside the web Pod because this is just a development deployment. We need some persistent storage configured at the proxy layer and the web layer, so you can remove Pods and deployments, and the data still persists.

Start by deploying the app manifests in the ch05/lab/todo-list folder; that creates the Services and Deployments for the proxy and web components.

Find the URL for the LoadBalancer, and try using the app. You’ll find it doesn’t respond, and you’ll need to dig into the logs to find out what’s wrong.

Your task is to configure persistent storage for the proxy cache files and for the database file in the web Pod. You should be able to find the mount targets from the log entries and the Pod spec.

When you have the app running, you should be able to add some data, delete all your Pods, refresh the browser, and see that your data is still there.

You can use any volume type or storage class that you like. This is a good opportunity to explore what your platform provides.