# BearBnB

Welcome to BearBnB. A webapp that allows users to request from available spaces, upload your available personal spaces together and manage bookings.

A team project web app created in Week 5 of Makers Academy.

![homepage](public/home.png)


## Languages and frameworks
* Ruby
* Sinatra
* PostgresQL
* Bcrypt

## Testing
* Rspec
* Capybara

## Getting started 
Run in terminal  

    fork this repo  
    git clone path-to-your-repo  
    bundle install



## Local Database Setup
Create database

    psql BearBnB

Set up Database Tables  

    sqlcmd -S db/migrations/01_create_users_table.sql  
    sqlcmd -S db/migrations/02_create_spaces_table.sql
    sqlcmd -S db/migrations/03_create_bookings_table.sql
    sqlcmd -S db/migrations/04_create_available_spaces_table.sql

## How to Run
    rackup  

visit localhost:9292 on your browser  


## Users Stories Implemented

    As a user
    So I can request spaces
    I would like be able to sign up

    As a user
    So I can view my listings
    I would like to sign in 

    As a user
    So no one can create listings on my account
    I would like to be able to sign out

    As a user
    So that I can see what spaces are available
    I would to see a list of spaces

    As a user
    So I can book a space
    I want to be able to request a booking

## Specifications

* Any signed up user can list a space  
* Users can list multiple spaces  
* Users should be able to name their space, provide a short description of the space and a price for the night  
* Users should be able to offer a range of dates when their space is available  
* Any signed up user can request to hire any space for a night, and this should be approved by the user who owns the space  
* Nights for which a space has already been booked should not be available for users to book that space  
* Until a user has confirmed a booking request that space can still be booked for that night  




