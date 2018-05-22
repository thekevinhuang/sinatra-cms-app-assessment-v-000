# Overwatch GM

The purpose of this simple web application is to leverage Sinatra and ActiveRecord CRUD commands to navigate and manipulate data
in a realistic situation. This application allows the creation, editing, and deletion of users; fantasy leagues to participate in; and rosters of players in the leagues. The website has no affiliation with Blizzard Entertainment and was made purely for fun and as an exercise.

## Installation

run 'bundle install' prior to usage.

To set up the db structure, run 'rake db:migrate'

Currently there is some data in a seed file that can be added into the db using the 'rake db:seed' command.
If you would like to edit/add additional data, please add it to '/db/seeds.rb' I didn't want users to be able to modify core data.

Following these steps, use 'shotgun' to view and interact with the application.


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/thekevinhuang/sinatra-cms-app-assessment-v-000. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
