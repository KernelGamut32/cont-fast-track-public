# Lab 07 - ConfigMaps

Use https://github.com/KernelGamut32/kiamol/tree/master/ch04 

## Part 1

`# deploy the app with a Service to access it:`
kubectl apply -f todo-list/todo-web.yaml
 
`# wait for the Pod to be ready:`
kubectl wait --for=condition=Ready pod -l app=todo-web
 
`# get the address of the app:`
kubectl get svc todo-web -o jsonpath='http://{.status.loadBalancer.ingress[0].*}:8080'
 
`# browse to the app and have a play around
# then try browsing to /config`
 
`# check the application logs:`
kubectl logs -l app=todo-web

## Part 2

`# create the JSON ConfigMap:`
kubectl apply -f todo-list/configMaps/todo-web-config-dev.yaml
 
`# update the app to use the ConfigMap:`
kubectl apply -f todo-list/todo-web-dev.yaml
 
`# refresh your web browser at the /config page for your Service `

## Part 3

`# show the default config file:`
kubectl exec deploy/todo-web -- sh -c 'ls -l /app/app*.json'
 
`# show the config file in the volume mount:`
kubectl exec deploy/todo-web -- sh -c 'ls -l /app/config/*.json'
 
`# check it really is read-only:`
kubectl exec deploy/todo-web -- sh -c 'echo ch04 >> /app/config/config.json'

## Part 4

`# check the current app logs:`
kubectl logs -l app=todo-web
 
`# deploy the updated ConfigMap:`
kubectl apply -f todo-list/configMaps/todo-web-config-dev-with-logging.yaml
 
`# wait for the config change to make it to the Pod:`
sleep 120
 
`# check the new setting:`
kubectl exec deploy/todo-web -- sh -c 'ls -l /app/config/*.json'
 
`# load a few pages from the site at your Service IP address`
 
`# check the logs again:`
kubectl logs -l app=todo-web

## Part 5

`# deploy the badly configured Pod:`
kubectl apply -f todo-list/todo-web-dev-broken.yaml
 
`# browse back to the app and see how it looks`

`# check the app logs:`
kubectl logs -l app=todo-web
 
`# and check the Pod status:`
kubectl get pods -l app=todo-web

## Part 6

`# apply the change:`
kubectl apply -f todo-list/todo-web-dev-no-logging.yaml
 
`# list the config folder contents:`
kubectl exec deploy/todo-web -- sh -c 'ls /app/config'
 
`# now browse to a few pages on the app`
 
`# check the logs:`
kubectl logs -l app=todo-web
 
`# and check the Pods:`
kubectl get pods -l app=todo-web