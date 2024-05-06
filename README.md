# Procare Online Engineering Exercise

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
