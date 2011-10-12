```
rails new expressionlab -d mysql --skip-test-unit
cd expressionlab/
git init
git add .
git commit -m 'rails new expressionlab -d mysql --skip-test-unit'
git remote add origin git@github.com:hatem/expressionlab.git
git push -u origin master
echo "gem 'rspec-rails', :group => [:development, :test]" >> Gemfile
bundle update
rails g rspec:install
echo "gem 'activeadmin'" >> Gemfile
bundle update
rails generate active_admin:install
rake db:migrate
AdminUser.create!(:email => 'admin@example.com', :password => 'password', :password_confirmation => 'password')
rails g resource article title:string summary:string content:text
rake db:migrate
```