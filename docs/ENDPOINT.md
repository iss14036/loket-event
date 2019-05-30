# List of End Point and Assumption of Loket Event


## List of End Point

Don't forget in the header put :

```
Content-Type : application/json

```

#### 1. Create Customer

In create customer, you can use this url with method POST to create a customer :
```
http://localhost:3000/event/create
```

And this is the body request :
```
{
	"customer": {
		"name": "dani",
		"email": "dani@dani.com",
		"phone": "084153"
    }
}
```

#### 2. Create Event

In create event, you can use this url with method POST to create an event :
```
http://localhost:3000/event/create
```

And this is the body request :
```
{
	"event": {
		"description": "Ruby meet up",
        "origanizer": "Gojek",
        "start_date": "2013-02-02 01:00:00",
        "end_date": "2013-02-02 01:00:00",
        "location_id": 1
    }
}
```

#### 3. Create Location

In create location, you can use this url with method POST to create a location :
```
http://localhost:3000/location/create
```

And this is the body request :
```
{
	"location": {
		"name": "Pasaraya Blok M",
		"address": "Jl. Patimmura Pasaraya",
		"longitude": 5.0,
		"latitude": 2.2
	}
}
```

#### 4. Create Ticket on Event

In create ticket, you can use this url with method POST to create a ticket :
```
http://localhost:3000/event/ticket/create
```

And this is the body request :
```
{
	"ticket": {
		"category": "Gold",
		"price": 50000,
		"quota": 10,
		"event_id": 1
    }
}
```

#### 5. Get info events

In get info events, you can use this url with method GET to get all of info about events :
```
http://localhost:3000/event/get_info
```

#### 6. Create Ticket Transaction Purchase on Ticket

In create transaction purchase, you can use this url with method POST to create a purchase transactin ticket :
```
http://localhost:3000/transaction/purchase
```

And this is the body request :
```
{
	"transaction": {
		"customer_id": "1",
		"tickets": [
			{
				"ticket_id": "1",
				"amount": 1
			}
		]
	}
}
```

or this :

```
{
	"transaction": {
		"customer_id": "1",
		"tickets": [
			{
				"ticket_id": "2",
				"amount": 1
			},
			{
				"ticket_id": "1",
				"amount": 1
			}
		]
	}
}
```

#### 7. Get Info Transaction

In get info transaction, you can use this url with method GET to get specific info of transaction :
```
http://localhost:3000/transaction/get_info/{id_transaction}
```
ex :
```
http://localhost:3000/transaction/get_info/1
```

You can try these end point using Postman, if you don't have. You can download [here](https://www.getpostman.com/downloads/)



## Assumption

- I change term Transaction to be TicketTransaction because in rails it will be conflict if we make relationship association because in active record itself there is already Transaction name. For further information click [here](https://stackoverflow.com/questions/35069257/association-name-conflicts-with-method-in-active-record?rq=1)
