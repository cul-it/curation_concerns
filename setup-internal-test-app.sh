#! /bin/sh
echo "regenerating test app ..."
rake engine_cart:regenerate
echo "gem 'hydra-role-management'" >> .internal_test_app/Gemfile
cd .internal_test_app
echo "bundle install internal_test_app ..."
bundle install
echo "generating roles in internal_test_app ..."
rails generate roles
echo "running db:migrate ..."
rake db:migrate
echo "creating admin_user ..."
rake admin_user
echo "loading workflows ..."
rake curation_concerns:workflow:load
echo "DONE"
