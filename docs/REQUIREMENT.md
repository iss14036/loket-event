Constraints and Requirement
====

- One event will have exactly one location
- One location might have one or more event
- One event will have exactly one schedule
- One schedule might start and end at different day
- One event might have more than one ticket type
- One ticket type must have price and quota, if quota is less than 1 then the ticket cannot be purchased
- Customer will be able to make transaction to purchase ticket event
- Customer can purchase ticket event many times
- For each transaction, customer only can purchase ticket within same event
- Within one transaction, customer can purchase more than 1 ticket type, and more than 1 qty per ticket type


Task
----
1. Create Database Schema using RDBMS based on Constraints and Requirements above.

2. Create Web Service JSON API with these functionalities:

Endpoint | Relative Path | Method | Description
--- | --- | --- | ---
Create Event | */event/create* | POST | Endpoint to create new event
Create Location | */location/create* | POST | Endpoint to create new location
Create Ticket | */event/ticket/create* | POST | Endpoint to create new ticket type on one specific event
Get Event | */event/get_info* | GET | Endpoint to retrieve event information, including location data and ticket data
Purchase Ticket | */transaction/purchase* | POST | Endpoint to make a new purchase, customer data is sent via this API
Transcation Detail | */transaction/get_info* | GET | Endpoint to retrieve transaction created using endpoint *Purchase Ticket*


Assesment
----

1. Development flow, using spec is preferred
2. Clean and Readable code
3. Versioning using git is a must
4. Input validation handling
5. Response consistency on each API Endpoint

Notes
----

- For each endpoint it's up to you to decide which parameter is required and which parameter is optional
- Ignore authentication, all API endpoint must be accessible **without** any authentication
- Please document your assumption in a ASSUMPTIONS.md
- Dump your database in SQL format, and include it in git repository
- After you finish with your assignment, you can share your git repository url and send it to dev@loket.com
or alternatively you can send ZIP Tarball archive and send it via email, make sure you include .git folder when sending
assignment, failed to do so will affecting your overall mini project assignment assesment
- If you can't complete your assignment in time and need extra day to complete, send your request to recruitment@loket.com, 
explaining your condition and state how much extra days you need.
