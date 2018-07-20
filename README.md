# Ruby Masterclass 1 - The Ruby class

## Installation instructions

### Prerequisites

You will need the following software installed:
- Homebrew - a package manager
- Rbenv - ruby version manager
- Bundler - ruby gem manager


#### Homebrew

https://brew.sh

Copy and paste the commandline on the above page to install

#### Rbenv

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

#### Bundler

- Once you've checked this repo out, cd into the directory, and run:
```apple js
gem install bundler
bundle install
```

## How to run the tests

```apple js
bundle exec rspec    # this will run all _spec.rb files in the spec directory
```


## Homework

### Add an expiry date to the credit card class.

This should be held as a ruby Date object - it is a class just like everything else in ruby.
The documentation for the Date class is https://ruby-doc.org/stdlib-2.3.1/libdoc/date/rdoc/Date.html

- quick examples
    ```
    my_date = Date.new(2018, 7, 1)   # my_date now contains a ruhy Date object set to 1st, July, 2018
    td = Date.today                  # td now contains a Ruby Date object set to today
    ``` 


### Check that the expiry date hasn't expired before charging the credit card.

