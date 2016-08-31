---
title: Kappa Delta Lambda
subtitle: Serverless Programming
theme: solarized
---

# conway's law

## organizations which design systems ... are constrained to produce designs which are copies of the communication structures of these organizations

# jim {data-background="#073642" .center}

## initech

>- ### 300 developers
>- ### code review culture
>- ### post in slack when opening a PR
>- ### post in slack when upgrading or releasing a project
>- ### but slow to action, slow to release, slow to respond

## manual labour

>- ### post in slack when actioning a project task
>- ### no one get's distracted by slack, right?
>- ### 10 minutes a day * 300 devs === $500,000 a year

## post in our company chat whenever:

>- ### someone opens or reopens a PR
>- ### someone publishes, deprecates or unpublishes an npm module

# what does serverless mean? {data-background="#073642" .center}

---

```javascript
module.exports = function handler(event, context, cb) {
  return cb({ status: 200, data: "Hello World!" });
}
```

## what does it really mean?

>- ### containers running in the cloud
>- ### automatically provisioned
>- ### automatically scaled

## it's php shared hosting meets heroku

# what used to get in our way? {data-background="#073642" .center}

## cost

## scalability

## ease of deployment

## time to delivery

# should we use it? {data-background="#073642" .center}

## cost

&nbsp; | EC2 | Lambda
--- | --- | ---
$ per GB/h | 0.013 | 0.06

## server: cost

>- ### running costs
>- ### losing money whenever inactive
>- ### scaling costs
>- ### storage costs (provider specific)

## lambda: cost

>- ### charged per 100ms
>- ### no charge for storage, retrieval
>- ### no running costs
>- ### no charge for inactivity

## scalable

>- ### auto-replicate
>- ### auto-scaled
>- ### unlimited concurrency

## distributed

>- ### multi region
>- ### micro microservices

## someone else's problem

# frameworks {data-background="#073642" .center}

## serverless

>- ### massive community
>- ### configuration over convention
>- ### plugins and modules for almost everything
>- ### terraform and cloudformation templates

## claudia

>- ### very simple
>- ### small community
>- ### not as many out-of-the-box solutions

## many many more

# use cases {data-background="#073642" .center}

## distributed rendering engine

>- ### push javascript rendering into the cloud
>- ### use whatever language you want on the server
>- ### SEO for all

## etl

>- ### listen for s3 bucket events
>- ### stream and split docs into chunks
>- ### process chunks asynchronously
>- ### run on hooks, only processing when required

## load testing

>- ### micro ui + controller
>- ### swarm created and aggregated by controller

## chatbots

>- ### easy to deploy, test, build interactions
>- ### only "live" on interactions

## ci/cd

>- ### use organisation webhooks
>- ### run tests/tasks/emit events
>- ### expose results to DynamoDB for aggregation / reporting

# demo {data-background="#073642" .center}

# serverless: the bad parts {data-background="#073642" .center}

## running binaries

>- ### download aws linux AMI
>- ### build binary on AMI
>- ### ship binary along with code
>- ### place binary in PATH

## latency

>- ### RTT +/- 300ms
>- ### Spinup +/- 3s
>- ### CPU, RAM and HD bound

## mgmt

>- ### aws console
>- ### framework lock-in

## offline dev

>- ### mock apig
>- ### mock/stub all aws deps
