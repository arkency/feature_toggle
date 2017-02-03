# FeatureToggle

A simple feature Toggle for a Rails app.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'arkency-feature_toggle'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install arkency-feature_toggle

## Usage

### Defining toggles

```ruby
FT = FeatureToggle.new.tap do |ft|
  ft.for(:new_user_profile) do |user_id:|
    Admin.where(user_id: user_id).exists?
  end
end
```

### Enabling given feature via toggle

```ruby
class UserProfilesController < ApplicationController
  def show
    FT.with(:new_user_profile, user_id: current_user.id) do
      return render :new_user_profile, locals: { user: NewUserProfilePresenter.new(current_user) }
    end

    render :show, locals: { user: UserProfilePresenter.new(current_user) }
  end
end
```

### Convenience alias

```ruby
require 'arkency/feature_toggle/alias'
```

From now on you can use top-level `::FeatureToggle`.

### Read more

[A simple feature toggle for a Rails app] (http://blog.arkency.com/2015/11/simple-feature-toggle-for-rails-app/) on Arkency blog.

## About

<img src="http://arkency.com/images/arkency.png" alt="Arkency" width="20%" align="left" />

Feature Toggle funded and maintained by Arkency. Check out our other [open-source projects](https://github.com/arkency).

You can also [hire us](http://arkency.com) or [read our blog](http://blog.arkency.com).

