
# a log of things I've see/done

1. run the docker compose file... no errors
1. create a repo in my github and pushed the code into it
1. create this log
1. began ruby install
1. got ruby cmdln stuff working (restarted powershell)
1. bundle install failed with 
'''
Fetching gem metadata from https://rubygems.org/.
Resolving dependencies...
Installing diffend 0.2.54
Diffend configuration is missing project_id key
Diffend configuration is missing shareable_id key
Diffend configuration is missing shareable_key key
Diffend configuration value for project_id is invalid.
Diffend configuration value for shareable_id is invalid.
Diffend configuration value for shareable_key is invalid.
'''
1. adding a .gitignore from github
1. "worked around" `bundle install` problems by disabling diffend. 
1. under the assumption that since the targeted ruby version is not documented I have too new a ruby version, tried removing ALL version information from teh GEM file
  - result: can't build...
1. root of problem isolated to inability for my windows machine to build the necessary libary. 
'''Extracting v2.3.0 into tmp/x86_64-w64-mingw32/ports/librdkafka/2.3.0... OK
Running 'configure' for librdkafka 2.3.0... ERROR. Please review logs to see
what happened:
----- contents of
'C:/Ruby32-x64/lib/ruby/gems/3.2.0/gems/karafka-rdkafka-0.15.1/ext/tmp/x86_64-w64-mingw32/ports/librdkafka/2.3.0/configure.log'
-----
mklove/modules/configure.base: line 2126: source: configure.self: file not found'''
1. next step: reset everything. and try on my linux box
-----
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

