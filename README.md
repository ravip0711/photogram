##Background

Photogram is a simplier Instagram clone using Rails with Bootstrap.

Thanks Ben Walker at [www.devwalks.com] for an amazing tutorial that has helped solidify some of my Rails knowledge and his humor makes it entertaining.

##Install

- Clone the files on to your local machine:

  $ git clone https://github.com/ravip0711/photogram.git

- Using your terminal, navigate to the application directory and run bundle install to gather the necessary gems:

  $ bundle install

- Run the rake commands to create, migrate, and seed the postgres db:

  $ rake db:seed db:migrate db:seed

- Launch the rails server:
  
  $ rails s

- Open up your browser and navigate to localhost:3000

##Testing

This application is built on Test Driven Development using Rspec and the Capybara gem.
