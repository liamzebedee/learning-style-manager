learning-style-manager
======================

A Ruby on Rails web application to manage student learning styles (DOL, STAR, Gardner, AusIdentities), originally built for [QASMT](http://qasmt.eq.edu.au). Copyright [Liam Edwards-Playne](http://liamz.co) 2013, permission must be explicitly given for use and usage must adhere to the license in `public/LICENSE.html`.

## INSTALL/HOWTO
### Development
 1. Install Ruby 2.0 or later. Install Bundler.
 2. Install Ruby on Rails 4 and other dependencies using `bundle install` and `bundle update`
 3. Run `rake db:setup`
 4. **IMPORTANT:** Run `rake secret` to generate a new secret key.
 5. Set the authentication server URL `AUTH_SERVER_URL` in `config/application.rb`.
 6. Run `rails server -e production` and access at `127.0.0.1:3000` — run in **production** mode only. If you want to host on port 80 (recommended), then run `rvmsudo rails server -p80`.
 
# Production (Docker)


## Technicals
 - Ruby 2.0 and Ruby on Rails 4
 - Full test coverage for controllers/models
 - CookieStore for session storage
 - Bootstrap 3 and LESS CSS for styling webpages
 - [jqBootstrapValidation](http://reactiveraven.github.io/jqBootstrapValidation/) for form validation
 - [bootstrap-sortable](https://github.com/drvic10k/bootstrap-sortable) for table column sorting
 - webmock for testing authentication server
