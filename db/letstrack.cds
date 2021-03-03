namespace app.letstrack;

entity Customer {
    key Mail : String(100);
    Name : String(100);
    Password : String(100);
};

entity Orders {
    key Id : Integer;
    Customer : String(100);
    Hub : Integer;
    Route : Integer;
    Carrier : Integer;
    Time : Time;
    Date : Date;
};

entity Hub {
    key Id : Integer;
    City : Integer;
    Employees : Integer;
};

entity City {
    key Id : Integer;
    Name : String(100);
    Location : String(200);
};

entity Carrier {
    key Id : Integer;
    Name : String(100);
    Cost : Integer;
};

entity History {
    key Id : Integer;
    key Order_ : Integer;
    City : Integer;
    Time : Time;
    Date : Date;
};

entity Route {
    key Id : Integer;
    Time : Integer;
    Distance : Integer;
};

entity Connection {
    key Route : Integer;
    key Sub_Route : Integer;
};

entity Sub_Route {
    key Id : Integer;
    Starts : Integer;
    Ends : Integer;
    Time : Integer;
    Distance : Integer;
};

view Connection_Statistics AS SELECT FROM ( SELECT COUNT(*) AS c FROM Connection GROUP BY Route) AS CS{
    (AVG(c)) AS AVGConnection : Decimal(25,6)
};

view Customer_Statistics AS SELECT FROM ( 
		SELECT LENGTH(Mail) AS m, 
	      	       LENGTH(Name) AS n, 
	      	       LENGTH(Password) AS p 
	      	       FROM Customer 
	      	       GROUP BY Mail,Name,Password
	    ) AS CS {
            (AVG(m)) AS AVGLenM : Decimal(16,6), 
            (AVG(n)) AS AVGLenN : Decimal(16,6), 
            (AVG(p)) AS AVGLenP : Decimal(16,6)
        };

view History_Statistics AS SELECT FROM ( SELECT Order_, COUNT(*) AS c FROM History GROUP BY Order_) AS HS {
    (AVG(c)) AS AVGCity : Decimal(25,6)
};

view Orders_Statistics AS SELECT AVGOrders : Decimal(25,6), MFHub : Integer, AVGDistance : Decimal(25,6), AVGTime : Decimal(25,6) FROM ( 
		SELECT (AVG(c)) AS AVGOrders
		FROM ( SELECT COUNT(*) AS c FROM Orders GROUP BY Orders.Customer ) AS OT
	) AS AVGOrders, 
	( 
		SELECT Hub AS MFHub
		FROM ( SELECT Hub, COUNT(*) AS Times FROM Orders AS O GROUP BY Hub ) AS M
			WHERE M.Times = ( SELECT MAX(MF.Times) AS MAX FROM ( SELECT Hub, COUNT(*) AS Times FROM Orders AS O GROUP BY Hub ) AS MF ) 
	) AS MFHub,
	(
		SELECT (AVG(TDistance)) AS AVGDistance
		FROM ( SELECT SUM(CAST(Distance AS Integer64)) AS TDistance FROM Route JOIN Orders ON Orders.Route=Route.Id GROUP BY Orders.Id ) AS TD
	) AS AVGDistance,
	(
		SELECT (AVG(TTime)) AS AVGTime
		FROM ( SELECT SUM(CAST(Route.Time AS Integer64)) AS TTime FROM Route JOIN Orders ON Orders.Route=Route.Id GROUP BY Orders.Id ) AS TT
	) AS AVGTime;

view Route_Statistics AS SELECT FROM ( SELECT SUM(Distance) AS d, SUM(Time) AS t FROM Route GROUP BY Id ) AS RS{
    (AVG(d)) AS AVGDistance : Decimal(16,6),(AVG(t)) AS AVGTime : Decimal(16,6)
};

view Sub_Route_Statistics AS SELECT FROM ( SELECT SUM(Distance) AS d, SUM(Time) AS t FROM Sub_Route GROUP BY Id ) AS SS {
    (AVG(d)) AS AVGDistance : Decimal(16,6),(AVG(t)) AS AVGTime : Decimal(16,6)
};

view StatCustomer AS SELECT key Customer : String, Name : String, days/orders AS AVGDays : Decimal(13,6) FROM  
		(SELECT Customer, Name, DAYS_BETWEEN(min(Date), max(Date)) as days, COUNT(Id) AS orders FROM Orders JOIN Customer ON Orders.Customer = Customer.Mail
			GROUP BY Customer,Name
) AS TB;