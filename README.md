# Loket Event API

## Problem Statement
Loket.com is a white-label event ticketing company, their main business is selling event ticket directly from promotor to customer or via affiliated partner. Loket will have many event at one time, each event will be held on specific location at specific date, also each event will have one or more ticket that can be purchased by customer. Your job here is to create database schedule to accomodate storing event data and export functionalities through HTTP API.

For further requirement, you can check [here](docs/REQUIREMENT.md)

## Dependencies

#### 1. Ruby

version : `2.5.3`

For Mac user, use this command on your terminal:

for Installing Ruby using RVM, we recommend you to use following command from `https://rvm.io/rvm/install`
```
curl -sSL https://get.rvm.io | bash
rvm install 2.5.3
```

You can also install ruby using rbenv, use following command from `https://github.com/rbenv/rbenv`
```
brew install rbenv
rbenv init
rbenv install 2.5.3
```

For Ubuntu user, use following command on your terminal:
For installing Ruby on Ubuntu, make sure you have an up-to-date system:
```
sudo apt update
sudo apt upgrade
```

next, install some prerequisites:
```
sudo apt install -y build-essential libssl-dev libreadline-dev zlib1g-dev
```

You can install rbenv, use following command:
```
wget -q https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-installer -O- | bash
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
rbenv init
echo 'if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi' >> ~/.bashrc
```

if you want to install particular ruby version, use following command:
```
rbenv install 2.5.3
rbenv global 2.5.3
```

#### 2. Bundler

version `2.0.1`

For Mac and Ubuntu user, use following command on your terminal:

We use [Bundler](https://bundler.io/) to manage [RubyGems](https://guides.rubygems.org/)

To install using gem, use this command below:
```
gem install bundler@2.0.1
```

or if you found problem with that, you can just install using this command:
```
gem install bundler
```

To install all gems needed in  this project, open this project directory and use this command below:
```
bundle install
``` 

#### 3. Rails

version `5.2.2.1`

For Mac and Ubuntu user, use following command on your terminal:

To install Rails, use following command provided by RubyGems:
```
gem install rails
```

To verify that you have everything installed correctly, you should be able to run the following:
```
rails --version
```

#### 4. Postgresql Database

version `11.2`

To install postgresql, you can follow this link:
```
https://www.postgresql.org/download/
```

## How to run spec

```
rake spec
```

for open the visualization of code coverage, in browser, you can use this command
```
open -a "Google Chrome" coverage/index.html
```

you can change "Google Chrome" with Browser that you have: (Tested Browser)
- Google Chrome
- Safari
