learning-style-manager
======================

A Ruby on Rails web application to manage student learning styles (DOL, STAR, Gardner, AusIdentities), built for [QASMT](http://qasmt.eq.edu.au). Licensed under GPLv3 to Liam Edwards-Playne (and any contributors).

This app is specifically adapted for the IT systems of Education Queensland, however due to the modularity of its code, it can be easily changed for any other systems. Please [contact me](http://liamz.co/contact) for more information.

## How to use
 1. Install Ruby 1.9 or later. Install Bundler.
 2. Install Ruby on Rails 3/4 and other dependencies using `bundle install` and `bundle update`
 3. **IMPORTANT:** Run `rake secret` to generate a new secret key.
 4. Set the authentication server URL `AUTH_SERVER_URL` in `config/application.rb`.
 5. Run `rails server` and access at `127.0.0.1:3000` — run in **production** mode only. If you want to host on port 80 (recommended), then run `rvmsudo rails server -p80`.

## Technicals
 - Ruby 1.9 and Ruby on Rails 3/4
 - CookieStore for session storage
 - Bootstrap 3 and LESS CSS for styling webpages
 - [jqBootstrapValidation](http://reactiveraven.github.io/jqBootstrapValidation/) for form validation
 - [bootstrap-sortable](https://github.com/drvic10k/bootstrap-sortable) for table column sorting

## Notes
 - All four tests took me just about 10 minutes to complete.

## Screenshots
![Student Dashboard](/screenshots/student-dash.png "Student Dashboard")
![Student Learning Tests](/screenshots/student-test.png "Student Learning Tests")
![Student Results](/screenshots/student-results.png "Student Results")
![Teacher View for Student Results](/screenshots/teacher-view-student-results.png "Teacher View for Student Results")
