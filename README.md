[![Dependabot Status](https://api.dependabot.com/badges/status?host=github&repo=dankmitchell/spina-projects)](https://dependabot.com)

### Getting Started

This is a Portfolio plugin for Spina CMS based on projects.

`gem 'spina-projects'`

Run the migration installer to get started.

`rails g spina_projects:install`

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

Then create the the controller `controllers/spina/projects_controller.rb` and include your index and show actions:

```ruby
module Spina
  class ProjectsController < ApplicationController
    before_action :set_page
    layout 'layouts/default/application'

    def index
      @projects = Spina::Project.order(created_at: :desc)
    end

    def show
      @project = Spina::Project.friendly.find(params[:id])
    end

    def set_page
      @page = Spina::Page.find_or_create_by(name: 'projects') do |page|
        page.title = 'Projects'
        page.link_url = '/projects'
        page.deletable = false
      end
    end
  end
end
```

##### TODO: Create admin UI to manage `ProjectCategory`, in the short term, fire up the `$ rails console` and run:

`Spina::ProjectCategory.create(name: 'Commercial')`

This project rocks and uses MIT-LICENSE.
