
# a log of things I've see/done
## starting out on my windows box
1. run the docker compose file... no errors
1. create a repo in my github and pushed the code into it
1. create this log
1. began ruby install
1. got ruby cmdln stuff working (restarted powershell)
1. bundle install failed with 
```shell 
Fetching gem metadata from https://rubygems.org/.
Resolving dependencies...
Installing diffend 0.2.54
Diffend configuration is missing project_id key
Diffend configuration is missing shareable_id key
Diffend configuration is missing shareable_key key
Diffend configuration value for project_id is invalid.
Diffend configuration value for shareable_id is invalid.
Diffend configuration value for shareable_key is invalid.
```
1. adding a .gitignore from github
1. "worked around" `bundle install` problems by disabling diffend. 
1. under the assumption that since the targeted ruby version is not documented I have too new a ruby version, tried removing ALL version information from teh GEM file
   - result: can't build...
1. root of problem isolated to inability for my windows machine to build the necessary libary. 
```shell
Extracting v2.3.0 into tmp/x86_64-w64-mingw32/ports/librdkafka/2.3.0... OK
Running 'configure' for librdkafka 2.3.0... ERROR. Please review logs to see
what happened:
----- contents of
'C:/Ruby32-x64/lib/ruby/gems/3.2.0/gems/karafka-rdkafka-0.15.1/ext/tmp/x86_64-w64-mingw32/ports/librdkafka/2.3.0/configure.log'
-----
mklove/modules/configure.base: line 2126: source: configure.self: file not found
```
1. next step: reset everything. and try on my linux box

## Trying on my tiny linux laptop

1. `snap install ruby --classic` gives me ruby 3.3.1, the windows installation had ruby 3.2.4
1. bundle install gives wanting about versions but works. 
1. possible error source: permissions. does bundle try to install for everyone by default. ... try again with `bundle config set --local path 'vendor/bundle'`
1. yes, I know that did make a ton of sense, if it did make sense I wouldn't have had the bundle command create a .bundle directory
1. I remain unable to get ruby building native gems. the build is failing to find lib_pthread, but build-essential is installed
1. rebuilt ruby env
   - removed all ruby's
   - used apt-get to rebuild it (wanted all the paths to place nice)
   - apt-get install build-essential
   - apt-get install ruby
   - apt-get install ruby-dev
   - apt-get install ruby-bundler
1. set ruby bundle dest to be ./.bundle (`bundle config set --local path "./bundle"`)
1. `bundle install` tried to install a lot of stuff. but STILL dies in native extentions. 
   - runing `bundle check` results in a huge list of stuff that is missing

1. giving up on linux for now.
1. JK...
1. realized that I never burned the lock file...
   - removed Gemfile.lock
   - reran `bundle install`
1. progress! 
   - don't have postgres installed on this tiny laptop, fixing now.
1. installed!
   - don't have postgres installed on this tiny laptophttps://github.com/nvm-sh/nvm?tab=readme-ov-file#installing-and-updating, fixing now.
   - sudo apt-get install postgresql
   - sudo apt-get install libyaml-dev
   - sudo apt-get install libpq-dev
   - bundle install
1. runing `bundle exec rspec spec` fails on 2 tests becuase of uninitialized constants... 
1. finish setting up docker on this tiny toy laptop
1. and try runing the bootstrap again.
1. `npm install yarn` not really working b/c npm needs love
   - following advice from : https://askubuntu.com/questions/426750/how-can-i-update-my-nodejs-to-the-latest-version
1. use info from following to clean up node and get latest
   - https://askubuntu.com/questions/426750/how-can-i-update-my-nodejs-to-the-latest-version
1. install yarn: `npm install --global yarn`
1. ./bin/bootstrap seems to run
1. `bundle exec rspec spec` still fails
1. add dev log to gitignore

## plan of action
- [X] containerize this dev env **NOTE: the right answer is [here](https://github.com/nickjj/docker-rails-example/tree/main) but I'm gonna cheat**
   - [x] initial postgresql container
   - [x] ruby server container
   - [x] karafka container
   - [x] .env file
- [x] stub out a CONTRIBUTING.md file to walk new devs through setting up the environment
   - [ ] optionally, build a development container that is setup and ready to go 
- [ ] add a justfile, or maybe a makefile, to hide the `bundle` garbage
   - [ ] add installation of `just` to CONTRIBUTING
   - [ ] `just test`
   - [ ] `just up` + `just down`
   - [ ] `just deploy` stub 

### containerization log
- wow. kinda the worst. I'm abandoning doing this gently and attacking this like I mean it.
- intial containerization complete!
- merged 