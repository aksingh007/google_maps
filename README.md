Dynamic Google Maps

This is a single page Rails web app that interacts with Google's Geocoder API. Input any address and it returns the longitude, latitude, and fully, properly formatted version of your address.

To run this application, first:

Generate a Google Geocoder's API Developer Key at: developers.google.com/maps/documentation/geocoding/intro

Add this line into your config/maps.yml file:

The application includes one API endpoint that accepts a GET request, which expects a query
parameter to hold the address query string and it returns coordinates for the string location.

Design:

The simple rails design pattern was included to support MVC framework.
Sevices are being called directly from the controller because of the fact that the
controller and the model are already for slim for this application and hence doesn't require to
have separate service or a storage layer


API:

https://developers.google.com/maps/documentation/geocoding/intro
http://pro.arcgis.com/en/pro-app/help/data/geocoding/what-is-geocoding-.htm

1. Google Static Map Api
2. Google Geocoder Map Api

Testing the app:

fork / clone the repo
run bundle install to install missing gems
run rails db:create and rails db:migrate to create the DB and set up its scheme
rails db:seed to populate your database
rails s to test the app
