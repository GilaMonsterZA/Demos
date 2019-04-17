
SELECT mf.Name,
       b.Title,
       b.Genre,
	   r.StartDate
FROM dbo.Members m, 
	dbo.Friends f, 
	dbo.Members mf, 
	dbo.Reading r, 
	dbo.Books b
WHERE m.Name = 'Joe'
	AND MATCH(m-(f)->mf-(r)->b)
	AND r.StartDate IS NOT NULL
	AND r.EndDate IS NULL





/*
g.V().hasLabel('Member').has('Name', 'Joe').outE('friend').inV().
	outE('read').has('Started').hasNot('Finished').inV()
*/