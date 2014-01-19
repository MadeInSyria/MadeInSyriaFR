MadeInSyriaFR
=============

MadeInSyriaFR is not only the way I learned Ruby on Rails, it is also the actual code base for my blog, [MadeInSyria.fr].

It is based on :
  - Ruby 2.0.0
  - Rails 4

It requieres a database supported by [ActiveRecord]

Installation
------------
Preparing the Rails 4 environement :
```sh
git clone https://github.com/MadeInSyria/MadeInSyriaFR.git
cd MadeInSyriaFR
bundle install
```

Create a database for your blog, then build your config/database.yml file. This a working example for MySQL.

```yaml
#   gem install mysql
#
#   Ensure the MySQL gem is defined in your Gemfile
#   gem 'mysql'
production:
  adapter: mysql2
  database: MadeInSyriaFR_prod
  username: root
  password: password 
  host: localhost
  socket: /tmp/mysql.sock

# Warning: The database defined as "test" will be erased and
# re-generated from your development database when you run "rake".
# Do not set this db to the same as development or production.
test:
  adapter: mysql2
  database: MadeInSyriaFR_test
  username: root
  password: password
  host: localhost
  socket: /tmp/mysql.sock

development:
  adapter: mysql2
  database: MadeInSyriaFR_dev
  username: root
  password: password
  host: localhost
  socket: /tmp/mysql.sock
```
You can now prepare the database :
```sh
rake db:migrate RAILS_ENV=production
rake db:seed RAILS_ENV=production
```

Your blog is ready to be launched :
```sh
rails server RAILS_ENV=production
```

Your blog is now up and running! The default user name and password are admin@admin.com and foobar123. Once connected, edit your profile, and trash the first post to replace it by yours!

PS
--
This is not by any mean supposed to be the best blog engine on the web. It is a demo, training and a good way get familiar with RoR. Do not use for production purpose if you are not planning to improve the code!

[MadeInSyria.fr]:http://madeinsyria.fr/
[ActiveRecord]:http://api.rubyonrails.org/classes/ActiveRecord/Migration.html
