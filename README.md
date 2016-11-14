Deis Deploy Ruby
================

[![Gem Version](https://badge.fury.io/rb/deis_deploy_redant.svg)](https://badge.fury.io/rb/deis_deploy_redant)

This gem allows you to deploy and notify your deploy to the Red Ant Deis cluster.

If you're not a developer at Red Ant this gem will not be immediately useful but may be a nice starting point for Deis deploy notifications.

Pre-requisites
--------------

* `deis` executable signed in to the Red Ant deis cluster
* permissions on the deis app your're trying to deploy
* a valid git remote to your deis app, defaults to a git remote called 'deis'
* the app created in the [deis-billing portal](https://billing.k8s.redant.com.au)

Setup
-----

In your `Gemfile`

```ruby
gem 'deis_deploy_redant'
```

Create an initialiser to configure the gem

```ruby
# config/initializers/deis_deploy.rb

DeisDeployRedant.configure do |config|
  config.billing_app_url = 'http://example.com' # checkout the Deis playbook for the url
  config.deploy_message_merges = true
end
```

To deploy

```bash
$ bundle exec rails deis:deploy[REMOTE_NAME]
```

Or to notify without pushing a new deploy

```bash
$ bundle exec rails deis:report[REMOTE_NAME]
```

Tests
-----

```bash
$ rspec
```
