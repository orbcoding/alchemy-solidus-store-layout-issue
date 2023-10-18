# README

## Running app
```BASH
git clone git@github.com:orbcoding/alchemy-solidus-store-layout-issue.git alchemy-solidus-store-layout-issue/alchemy-solidus-store-layout-issue
cd alchemy-solidus-store-layout-issue/alchemy-solidus-store-layout-issue
docker-compose --env-file .env run --rm web bundle install
docker-compose --env-file .env run --rm web rake db:setup
docker-compose --env-file .env up -d

# Visit http://localhost:3000/admin/pages/1/edit
# User: admin@example.com
# Pw: test123
# Try to render the application.html.erb layout including storefront logic as added from last commit.
```

## Description
This repo shows some issues I had with the alchemy solidus integration gem. See `git log` for steps and details.

### Overall issues

- The install generator fails a couple of times.
- Difficulties in rendering alchemy pages within the store starter layout. For me this is the main goal of the integration. Found no documentation and all required helpers are missing.


#### Workaround for missing helpers
- Prefix all calls to standard rails `*_path` helpers in store views with `Rails.application.routes.url_helpers.` 
- Add all store helpers to `ApplicationController`. If trying to add rails route helpers here, alchemy admin views break instead.

`ApplicationController` - what I added

```RUBY
  include ActiveStorage::SetCurrent
  include Spree::Core::ControllerHelpers::Auth
  include Spree::Core::ControllerHelpers::Common
  include Spree::Core::ControllerHelpers::PaymentParameters
  include Spree::Core::ControllerHelpers::Search
  include Spree::Core::ControllerHelpers::Store
  include Spree::Core::ControllerHelpers::StrongParameters
  
  include Spree::Core::ControllerHelpers::Pricing
  include Spree::Core::ControllerHelpers::Order
  include Taxonomies
  
  helper Spree::BaseHelper
  helper Spree::TaxonsHelper
  helper Spree::StoreHelper
  helper Spree::ProductsHelper

  def unauthorized
    render 'shared/auth/unauthorized', layout: Spree::Config[:layout], status: 401
  end

  def cart_link
    render partial: 'shared/cart/link_to_cart'
    fresh_when(current_order, template: 'shared/cart/_link_to_cart')
  end
```
