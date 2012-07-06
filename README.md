# Simple RHEx Web Application

This is a basic web application that shows how OpenID Connect can be applied to the healthcare domain. It will allow for the upload and viewing of clinical documents.

## Requirements

This application relies on the [OpenID Connect Gateway](https://github.com/project-rhex/openid_connect_gateway) for restricting access. The gateway will authenticate users before they
can access the web application. Once the user is authenticated, they will be passed along to this application with the user information available in the HTTP_X_AUTH HTTP header.

## Architecture



                                 +-------------------+
                                 | OpenID Connect    |
                                 | Identity Provider |
                                 +-------------------+
                                          ^
                                          |
                                          |
                                          |
                                          |
                                          |
                                          +
    +------+                     +----------------+                   +-------------+
    |      |                     | OpenID Connect |                   | Simple Web  |
    | User |+------------------->| Relying Party  |+----------------->| Application |
    |      |                     | Gateway        |                   |             |
    +------+                     +----------------+                   +-------------+

## Installation

The following instructions will set up the Simple Web Application with the OpenID Connect Relying Party Gateway authenticating users. 

### Prerequisites

* [Git](http://git-scm.com/)
* [Ruby 1.9.2](http://www.ruby-lang.org/en/), we recommend installing Ruby with [RVM](https://rvm.io/)
* [Bundler](http://gembundler.com/)
* [MySQL](http://www.mysql.com/)

### To install the OpenID Connect Relying Party Gateway

    git clone https://github.com/project-rhex/openid_connect_gateway.git
    cd openid_connect_gateway
    bundle install

Edit openid.yml to point to the OpenID Connect Identity Provider of your choice. Once that is configured, you can run:

    bundle exec rackup -p 3000

### To install the Simple Web Application

Set up the MySQL database:

    mysql -u root
    mysql> create database simple_rhex_dev

Install the Ruby on Rails application

    git clone https://github.com/project-rhex/simple_rhex.git
    cd simple_rhex
    bundle install

Initialize the database

    bundle exec rake db:migrate

Run the application

    bundle exec rails server -p 3002

### Accessing the application

You should now be able to access the application at http://localost:3000/patients. Upon hitting the URL, you will be redirected to your OpenID Connect Identity Provider.

## License

Copyright 2012 The MITRE Corporation

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.