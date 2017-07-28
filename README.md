# Adamski Family Reunion Website

### STATUS - COMPLETE (Tweaks here and there)

### Live Site -- [Adamski Family Reunion 2017](www.adamskitree.com)

* This is a site designed to host images taken from my family's reunion party.
* It will feature a dual authentication (Devise & OAuth - Facebook/ *Maybe Google*)
* Image hosting will be taken care of with AWS and CarrierWave
* Backend will be Rails and PostgreSQL with the front-end being mostly Rails
* React to be used for User Index page for a more dynamic experience (scrolling list of users and stateful rendering of associated user cards to the right)
* Entire web app is designed mobile-first and fully responsive for all size screens thanks to a combination of Foundation, Bootstrap and Media Queries
* How it Works page for explaining the functionality of the site with full responsive design and gifs

### Instructions

* Clone
* Run `bundle install`
* Run `npm install`
* If using Atom - Hit CMD+Shift+F and Replace all instances of `www.adamskitree.com` with `localhost:3000`
* If you want to see some seeded data for the User Index, run `rake db:seed` from the terminal (Uses Faker Gem)
* Run `rails s` in your terminal and `npm start` in another tab from your terminal
* Go to `localhost:3000`

### ER Diagram

![](http://i.imgur.com/kO43lM8.png)
