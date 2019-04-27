![Spina CMS](http://www.spinacms.com/spinacms.png)

[Visit the website](http://www.spinacms.com)

### Getting Started

This is a Portfolio plugin for Spina CMS based on projects.

```ruby
  gem 'spina-projects'
```

Run the migration installer to get started.

```ruby
  rails g spina_projects:install
```

This should copy the migration file required to create the Spina::Project model.

Restart your server and head over to '/admin', you should see your plugin located below the Media Library.

That's all it takes to get the plugin working :)

### Consumer views

##### Note: This plugin does not include the controller or view for the customer facing website, just the admin only.

To get you going you'll need to add the routes:

```ruby
  Spina::Engine.routes.draw do
    resources :projects, only: [:show, :index]
  end
```

Then create the the controller `projects_controller.rb` inside controllers > spina > projects and include your index and show actions:

```ruby
  def index
    @projects = Spina::Project.newest_first
  end

  def show
    @project Spina::Project.friendly.find(params[:id])
  end
```

##### TODO: Create admin UI to manage `ProjectCategory`, in the short term, fire up the `$ rails console` and run:

```ruby
  Spina::ProjectCategory.create(name: 'Commercial')
```

This project rocks and uses MIT-LICENSE.
