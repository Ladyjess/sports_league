##Sports League Team Tracker

This app is very useful for organizing your teams and keeping track of
players who have performed or not.

##Author

Jessica Hori

##Install

This app is used in connection with Sinatra and ActiveRecord. You do not have to run Rails.

Download or fork the repository and bundle in terminal in order to use the required gems
and dependencies.

I have 2 extra files but you dont need those if you set up correctly from the beginning.
If you are starting from scratch you should first make an important folder:  'config' -- with a ```database.yml``` file inside it.

In your yml file will be :  

```ruby
development:
  adapter: postgresql
  database: sports_league_development

test:
  adapter: postgresql
  database: sports_league_test
```

Make sure those are lined up correctly. If you put the adapter and database words aligned
to the left wall of the text editor, your database will only make the development database
and ignore everything else under it.

1. Run ```rake db:create```

then:  ```rake db:test:prepare```

This will create the main and test databases.


2. Run ```rake db:create_migration NAME=create_players```
A db folder with a sub folder called ```migrate``` with migration files will automatically be created.
In "CreatePlayers" class should be:

```ruby
class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :player_name
      t.integer :team_id
      t.boolean :performed
      t.timestamps null: false
    end
  end
end
```

Next we will run ```rake db:create_migration NAME=create_teams```
A file is automatically created.
In your CreateTeams class should be:

```ruby
class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :team_name
      t.timestamps null: false
    end
  end
end
```

Run ```rake db:migrate```  Very Important because you changed the files!

And then run ```rake db:test:prepare``` again!!  Every time there is a change to the files, you should
always run the test prepare to keep up with latest changes, otherwise some specs will fail and you wont know why.


After that you make your lib folder and put ```player.rb``` and ```team.rb``` files

```ruby
class Team < ActiveRecord::Base
  has_many :players
end
```

```ruby

class Player < ActiveRecord::Base

  scope :has_not_performed, -> do
    where({:performed => false})
  end

  belongs_to :team
end
```


Check the repository files for more information on spec set up, Rakefile, Gemfile,and views.


##License

GNU GPL v.2.0

Free to copy and improve via fork and pull requests.


Check the user stories if you would like to add more features and functionality.


##User Stories

1. As the league manager, I want to create teams.
2. As the league manager, I want to add players to team so I can keep track of who plays for what team.
3. As the league manager, I want to be able to move a player from one team to another. (Basically you need tp implement a separate update/delete function for the players, then you can delete players without deleting an entire team and all of their players)
4. As the league manager, I want to see a history of a player's teams, so I can keep track what teams they've played for.(I believe a jopin table needs to go in here somewhere so that some players can play for multiple teams)
5. As the league manager, I want to set up games between teams, so I can keep track of scores and win-loss records.
6. As the league manager, I want to generate tournament ladder that pits the teams with the best records against each other, so I can find out who the best team is. (Hint: Just pick an even number like 8 or 16 so every team in the tournament always has a match.)
