# Delayed Job Maintenance

Extends the [capistrano-maitenance](https://github.com/capistrano/maintenance) to stop delayed job while the maintenance page is displayed.

## Usage

After capistrano-maintenence is installed and configured, your application's web
interface will be disabled when the maintenance page is written to the server.  To
also disable backend processing in delayed job, you need to configure
capistrano-maintenance to also write to the delayed-job servers.

In your deployment configuration, add the queue server, or whichever role you
use for capistrano deployments to your delayed job servers:

```ruby
set :maintenance_roles, -> { roles([:web, :queue]) }
```

By default, capistrano-maintnance will write the maintenance template to
`"#{shared_path}/public/system"`.  However, `shared_path` is a capistrano variable
and is not available in delayed_job.  If this is different than `Rails.root.join("public", "system")`
or you are using a different maintenance file, you will need to configure the maintenance file:

Add this as an initializer:
```ruby
DelayedJobMaintenance.configure do |config|
  config.maintenance_file = Rails.root.join("public", "system", "maintenance.html")
end
```

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'delayed_job_maintenance'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install delayed_job_maintenance
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
