![Spina CMS](http://www.spinacms.com/spinacms.png)

[Visit the website](http://www.spinacms.com)

### Getting Started

This is a Portfolio plugin for Spina CMS based on projects.

```
gem 'spina-projects'
```

Run the migration installer to get started.

```
rails g spina_projects:install
```

This should copy the migration file required to create the Spina::Project model.

Restart your server and head over to '/admin', you should see your plugin located below the Media Library.

That's all it takes to get the plugin working :)

### Consumer views

##### Note: This plugin does not include the controller or view for the customer facing website, just the admin only.

To get you going you'll need to add the routes:

    Spina::Engine.routes.draw do
        resources :projects, only: [:show, :index]
    end

Then create the the controller `projects_controller.rb` inside controllers > spina > projects and include your index and show actions:

    def index
      @projects = Spina::Project.order(created_at: :desc).all
    end

    def show
      @project ||= Project.find_by(slug: params[:id])
    end

##### TODO: Create admin UI to manage `ProjectCategories`, in the short term, fire up the `$ rails console` and run:

    pc = Spina::ProjectCategory.new(name: 'Foo bar', slug: 'foo-bar')
    pc.save

This project rocks and uses MIT-LICENSE.
