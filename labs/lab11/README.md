# Lab 11 - Scaling

Your job in this lab is to take an app spec that uses some older approaches and update it to use the controllers you’ve learned about.

Start by deploying the app in ch06/lab/numbers—it’s the random-number app from chapter 3 but with a strange configuration. And it’s broken.

You need to update the web component to use a controller that supports high load. We’ll want to run dozens of these in production.

The API needs to be updated, too. It needs to be replicated for high availability, but the app uses a hardware random-number generator attached to the server, which can be used by only one Pod at a time. Nodes with the right hardware have the label rng=hw (you’ll need to simulate that in your cluster).

This isn’t a clean upgrade, so you need to plan your deployment to make sure there’s no downtime for the web app.