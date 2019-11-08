# Rails Docker Template

This is a template to start a new rails app using docker. It doesn't have any dependencies other than docker and docker-compose.

You can adjust the rails version/ruby version by updating the Gemfile.

To start a new rails project run command:
`docker-compose run web rails new . --force --no-deps --database=postgresql`

Afterwords you will need to update the file permissions: `sudo chown -R $USER:$USER .`

Now build the container: `docker-compose build`

To connect the database make sure to update the host in `config/database.yml`

```
default: &default
  adapter: postgresql
  encoding: unicode
  host: db
  username: postgres
  password:
  pool: 5

development:
  <<: *default
  database: app_development


test:
  <<: *default
  database: app_test
```

Next you will need to create the db: `docker-compose run app rails db:create`

That is everything. You should now be able to run `docker-compose up` and visit http://localhost:3000 to see the rails welcome page.