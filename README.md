# README FOR BONIFACE HIERS AUTOMOTIVE DETAIL APP
***
## Version Info
`version 1.0.1`  
`ruby version 2.4.1`  
`rails version 5.2`  
***
## Install
To install for dev or modification, clone repo and run `bundle install`

## About
This program is utilized by dealership personnel to submit work completed tickets for payroll purposes. These tickets are then approved by a manager and subsequently await payroll clerk to run payroll. 
When Payroll is ran from the admin interface, an email is sent to the Payroll Clerk’s email as well as a CSV file is created and downloaded to their computer for record purposes. 

Each work order holds a Stock Number/Last6 of VIN Date, Worker completing the work, the services being rendered to the vehicle and any comments for management to see. 

Management can either approve these requests for payroll or reject and place a comment into the work order as well. 

Users can only edit submitted and Rejected work orders whereas managers can edit approved, submitted and rejected work orders. 

Admins have full control of all tickets in all stores. 

### Work Flow
- User signs in with credentials provided by admin.
- User creates new work order and fills in required information. Data validation makes sure all required fields are filled out.
- At end of day managers log in and approve/reject that day’s work orders.
- This continues for whole cycle. Users can edit and re-submit work orders that have been rejected.
- At end of pay cycle payroll clerk logs in and runs payroll. If there are any outstanding work orders payroll cannot be run and a manager must approve all outstanding submitted orders before payroll can be ran.
- Once `Run Payroll` has been clicked by the Payroll Clerk, all orders in `Accepted` Status will be marked `PAID` and a CSV file as well as an email will be given to the clerk for records and to be input into payroll system.
