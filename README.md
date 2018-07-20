# Ruby Masterclass 1 - The Ruby class

##Installation instructions

###Prerequisites

You will need the following software installed:
- Homebrew - a package manager
- Rbenv - ruby version manager
- Bundler - ruby gem manager


####Homebrew

https://brew.sh

Copy and paste the commandline on the above page to install

####Rbenv

- Install using homebrew
    ```
    brew install rbenv
    rebenv init    # it will give instructions of what to add to your ~/.bash_profile
    ```
- Close and re-open terminal so that the new bash profile takes effect

- Install the version of ruby we'll be using for this project
    ```apple js
    rbenv install 2.3.1
    ```

####Bundler

- Once you've checked this repo out, cd into the directory, and run:
```apple js
gem install bundler
bundle install
```
