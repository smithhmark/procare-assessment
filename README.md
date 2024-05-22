# Procare Online Engineering Exercise
## Setting the stage
This project is a technical assessment. In it, one is presented with a Ruby on Rails project and is asked to find and make one's own contributions.

## My approach
I am choosing to view this project the way I would any project I was brought into. I want to make sure that this project is positioned for rapid, sustainable progress. That meant it must have the following:
* reasonable minimal documentation, including
   * a clear mission statement
   * some notion of requirements or at least a product description
     * "functional" requirements (mostly derived from user stories or the mission)
     * "non-functional"( or sometimes "technical requirements"), examples include
       * expected peak API usage rates
       * maximal expected simultaineous active users
       * maximal acceptable latencies for APIs and web
    * a destription of the deployment environment
* be technologically easy to:
   * run
   * test
   * deploy
   * debug
   * monitor

Given the nature of this task, much of the documentation, and the engineering efforts that would flow from it, I have chosen to focus on facilitating technical ease of running the project, both as a brand new contributor, and an existing developer/tester.

Given the option, I would prefer to be working with project stakeholders from accross the organization to identify and produce the needed minimal documentation while working on initial cleanup. That would then flow naturally into working on the appropriate follow-on engineering tasks. The following list calls out some types of documentation and the specific engineering tasks that are unlocked/empowered once that documentation is produced.

* product descripton/user stories
  * QA senarios (integration tests, acceptance tests, etc)
  * go-no-go criteria for deployments
  * automated tests (eg selenium, or in locust)
* non-functional requirments
  * load testing architecture and test planning
  * storage capacity planning
  * budgets (money, time, risk)
* production environment
  * delivery and deployment pipelines
  * monitoring (volumes, costs, app-tracing, malicious behavior scanning)
  * cost models (so we don't get financially surprized by a change in usage)

Many of the above can be worked in parallel to more tactical changes like what I have done in this repository.
### What I have delivered
This repo contains a working, self-contained development deployment for this project. the bootstrap script now builds the entire thing, all the dependencies are documented (in the Gemfile, the Dockerfiles, and in the compose file), and `docker compose up` will run the entire application locally.

## Thoughts on other options
### "CI/CD"
Automating a deployment of a containerized service is easy. just 
* deliver:
   * docker build
   * docker tag
   * docker login
   * docker push
* deploy, ie tell your execution environment to deploy the new image

making an image delivery script is three steps:
1. do it once by hand in the console
2. dump recent shell history into a file
3. clean that file up into a script

The problem is that isn't **CI/CD**. that would require:
* having real tests that run quickly
* merging main
* pushing to the test environment
* having automated gates to deployment/delivery (go-no-go is a **critical** part of automated deployment)

The interesting engineering around this is "what do we need to feel confident and how do we test for those things?" not, can we push some images around and trigger deployments.
  
### Scalability testing/improvements
There is basically no point in load testing this application without having some idea of what the requirements are and where it will be running. As a science fair project we can easily setup a [locust](https://locust.io/) cluster and get beautiful graphs and metrics and identify the saturation point on a given deployment. But testing a random configuration to failure means nothing. 

The key things we would use this type of testing for are:
* pre-deployment validation that the system meets a requirement to pass a go-no-go test
* capacity planning
* design validiation
all of those demand actual business requirements and targeted platforms and configurations. 

### designing a "realtime" reporting system
This particular suggestion is very doable in this context, at least as a white board exercise. For 1000rps this is fairly straightforward for toy problems:
* reporting API enqueues events
* run a worker process to consume events. the worker maintains an in memory representation of the report and serves if up if asked, or just stores it in something like Redis. Depending on the size of the report it might emit updated reports as its own event stream for interested subscribers.

Interesting things happen though when we ask "how do we recover from a crash?", "how do we scale to many thousands of rps?" or even more fun, "how do we fail this thing over to another region?" and that is no longer a toy problem, even on a whiteboard.

## Summary of changes
### Logging
First, I have kept a log from the very beginning of this task. That is in the file `./task_log_mhs.md`. This is actually a standard practice I use, although I wouldn't normally commit it to the repo. That file has a near play-by-play of my thought process, steps taken, and intermediate results. 

### Containerization
The project as initially recieved was... challenging to get running. The onboarding documentation was incomplete, lacking things like, which Ruby versions are acceptable for use on this project and which postgres versions are supported/targeted. The `docker_compose.yml` file only had a kafka container in it. This means that developers working on this project could have dependency conflicts between this and any other ruby or postgres project on there machines. It also makes managing the state of the development environment trickier as reseting the schema or doing migrations might demand excalated priviledges. Furthermore, by relying on developer local infrastructure makes drift between production, testing, and each developer's environment all but certain. 

Therefore, as a high priority, I set out to fully dockerize the development environment. The compose file now manages every resource needed to run the project, furthermore it functions as a form of industry standard, living documentation about the architecture of the system. Currently there are two Dockerfiles, one for the rails service and one for the karafka "worker" service. Since there is not enough information about the eventual deployment of this system I feel that two dockerfiles is an ok placeholder until a decision about using a single image with two different startup commands or actually splitting the service into two deployed images is made. (currently, deploying only a single image and invoking it with different commands is likely the correct decision for the short term.)

#### Next Steps
As of this writing, the containers are DEV-ONLY. There is not yet a docker target or file coping all the production critical code into a container image. Said another way, we are only bind-mounting the source into our containers, addressing that is a necessary step before deployment pipeline work can proceed.

### new bootstrap script
The starting project had a bootstrapping script provided (`./bin/bootstrap`). However it had hidden prerequesites, (like starting a database). The new script leverages the new containers. It uses `docker compose` to build/retrieve the necessary images, then runs appropriate bootstrapping scripts for each of the two in-project services. This approach leverages the technology, and creates futher living documentation of how this system is built and is intended to work.

#### next steps
Currently the karafka service container bootstrap fails the first time it is run. This is because the kafka service starts slowly. If the bootstrap script is run multiple times the boot strapping will work. Fixing this can be done in the compse file where waiting for a passing healthcheck on the kafka node should be enough to fix this annoyance.

# Original README below

We strive to be a practical and pragmatic engineering team. That extends to the way that we work with you to understand if this team is a great fit for you. We want you to come away with a great understanding of the kind of things that we actually do day to day and what it is like to work in our teams.

We realize that taking on this assignment represents a time commitment for you, and we do not take that lightly. Throughout the recruitment process we will be respectful of your time and commit to working quickly and efficiently. This will be the only technical assessment you'll be asked to do. Your submission will be reviewed by our team, and we will provide feedback, no matter what. Your work will not go unreviewed, should you choose to submit it. This project is deliberately open-ended, so if you don't want to spend time on something you don't find meaningful, you don't have to!


## Challenge Guidelines

Think of this like an open source project. Create a repo on Github or Bitbucket, use git for source control, and use a Readme file to document what you built for the newcomer to your project.

Simply choose *one* of the adventures suggested below, implement it using the sample app in this repo as you see fit, and share it with us when you're done. 


## Available Adventure(s)

### Delivery Adventure
Get this app working somewhere. Preferrably, somewhere you can share with us in the real world, but if you can only get it working on your local machine in the time given, that's OK too.

Bonus: show us how you could deploy this, with passing CI/CD, using just one console command.


### Scalability Adventure
How could we build real-time view of visits, assuming over 1,000 visits are being recorded every second? Build a page into the app where users can see this.

Bonus: show this in action with Load testing!


### BYO Adventure
You tell us! Show off. Be creative. We're really interested in what you might build with this starter pack.


## Suggestions:

 - Show us you are team player by thoughtfully documenting your work, and delivering it with a Git commit history that shows how you got there
 - Write a Readme outlining why you chose the adventure you chose, tradeoffs you made, time considerations, etc.
 - Remember: this is a Rails app. Please show us your knowledge of Rails in one form or another.


## Usage Tips

1. Start Kafka using the `docker-compose.yml` by running: `docker-compose up`
2. Run the setup script `./bin/bootstrap` (it will help!)
3. Run `bundle exec rails server` to start the Rails web server
4. Run `bundle exec karafka server` to start Karafka consumption server
5. Visit `localhost:3000` and refresh the page couple of times
6. Visit `localhost:3000/karafka` to see and explore the Karafka Web UI

You can also run RSpec specs to see how the testing RSpec library integrates with Rails:

```
bundle exec rspec spec
```
