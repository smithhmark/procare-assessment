
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