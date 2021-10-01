# Lab 09 (Chapter 3) - Services (Exercise 1)

Use https://github.com/KernelGamut32/kiamol/tree/master/ch03

## Part 1

`# run the website and API as separate Deployments:`
kubectl apply -f numbers/api.yaml -f numbers/web.yaml
 
`# wait for the Pod to be ready:`
kubectl wait --for=condition=Ready pod -l app=numbers-web
 
`# forward a port to the web app:`
kubectl port-forward deploy/numbers-web 8080:80
 
`# browse to the site at http://localhost:8080 and click the Go button`
`# --you'll see an error message`
 
`# exit the port forward:`
ctrl-c

## Part 2

`# deploy the Service from listing 3.2:`
kubectl apply -f numbers/api-service.yaml
 
`# check the Service details:`
kubectl get svc numbers-api

`# forward a port to the web app:`
kubectl port-forward deploy/numbers-web 8080:80
 
`# browse to the site at http://localhost:8080 and click the Go button`
 
`# exit the port forward:`
ctrl-c

## Part 3

`# check the name and IP address of the API Pod:`
kubectl get pod -l app=numbers-api -o custom-columns=NAME:metadata.name,POD_IP:status.podIP
 
`# delete that Pod:`
kubectl delete pod -l app=numbers-api
 
`# check the replacement Pod:`
kubectl get pod -l app=numbers-api -o custom-columns=NAME:metadata.name,POD_IP:status.podIP 
 
`# forward a port to the web app:`
kubectl port-forward deploy/numbers-web 8080:80
 
`# browse to the site at http://localhost:8080 and click the Go button`
 
`# exit the port forward:`
ctrl-c

## Part 4

`# deploy the LoadBalancer Service for the website--if your firewall checks`
`# that you want to allow traffic, then it is OK to say yes:`
kubectl apply -f numbers/web-service.yaml
 
`# check the details of the Service:`
kubectl get svc numbers-web
 
`# use formatting to get the app URL from the EXTERNAL-IP field:`
kubectl get svc numbers-web -o jsonpath='http://{.status.loadBalancer.ingress[0].*}:8080'

## Part 5

`# delete the current API Service:`
kubectl delete svc numbers-api
 
`# deploy a new ExternalName Service:`
kubectl apply -f numbers-services/api-service-externalName.yaml
 
`# check the Service configuration:`
kubectl get svc numbers-api
 
`# refresh the website in your browser and test with the Go button`

## Part 6

`# setup the sleep-1 deployment`
kubectl apply -f sleep/sleep1.yaml

`# run the DNS lookup tool to resolve the Service name:`
kubectl exec deploy/sleep-1 -- sh -c 'nslookup numbers-api | tail -n 5'

## Part 7

`# remove the existing Service:`
kubectl delete svc numbers-api
 
`# deploy the headless Service:`
kubectl apply -f numbers-services/api-service-headless.yaml
 
`# check the Service:`
kubectl get svc numbers-api
 
`# check the endpoint:`
kubectl get endpoints numbers-api
 
`# verify the DNS lookup:`
kubectl exec deploy/sleep-1 -- sh -c 'nslookup numbers-api | grep "^[^*]"'
 
`# browse to the app--it will fail when you try to get a number`

# Lab 09 (Chapter 3) - Services (Exercise 2)

The goal is to deploy Services for an updated version of the random-number app, which has had a UI makeover. Here are your hints:

    - The lab folder for this chapter has a deployments.yaml file. Use that to deploy the app with kubectl.
    - Check the Pods—there are two versions of the web application running.
    - Write a Service that will make the API available to other Pods at the domain name numbers-api.
    - Write a Service that will make version 2 of the website available externally, on port 8088.
    - You’ll need to look closely at the Pod labels to get the correct result.