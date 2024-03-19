
--Question 2. 11.
select BusinessEntityID
from Person.Person;


--12.
select PersonType
from Person.Person;

--13.

SELECT 
    FirstName + 
    CASE 
        WHEN MiddleName IS NOT NULL THEN ' ' + MiddleName + ' '
        ELSE ' '
    END +
    LastName AS FullName
FROM Person.Person;




