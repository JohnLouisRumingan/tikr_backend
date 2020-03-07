# README

TIKR is a small stock trading platform with historical trading data. Due to API limitations, historical data is limited but app can scale with more companies. 

To run, please install Ruby and React.  
This is the backend of the app. Please also go to the front end at https://github.com/jmr-1/tikr_frontend . Navigate to the installed directory on your terminal and run:
>rails db:migrate
>rails db:seed
>rails server

On the front end, run:
>npm install
>npm start 

Login uses a basic Username check. Use "John-Louis" as the username. Auth has not been implemented for this app. 
