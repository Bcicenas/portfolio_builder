# Portfolio builder
Rails application for building portfolio. Great for single page websites.

# To do
- Upload images
- Use css files with html templates


# Basic installation(development environment - ubuntu server 22.04)
- Clone repo 
 ```sudo git clone https://github.com/Bcicenas/portfolio_builder.git```
- Install ruby 
 ```
 	sudo apt update
 	sudo apt install bundler
 ```
 - Create mysql db and user
 ```
 	CREATE DATABASE portfolio_builder;
 	CREATE USER 'portfolio_builder'@'localhost' IDENTIFIED BY 'Portfolio_build3r';
 	GRANT ALL PRIVILEGES ON portfolio_builder.* TO 'portfolio_builder'@'localhost' WITH GRANT OPTION;
 	FLUSH PRIVILEGES;
 ```
 - Run rails
 ```
 	cd /portfolio_builder
 	sudo bundle update
 	sudo bundle install
 	sudo rails db:migrate
 	sudo rails server
 ```


