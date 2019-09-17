
/*______________________ VARIABLE DECLARATIONS _________________________*/

DECLARE
  @intLastID      INT,
  @intIDToHandle  INT,   -- define the ID to be handled
  @intValue       INT

/*_______________________________ INIT _________________________________*/

SET @intLastID = 0

/*_______________________________ MAIN _________________________________*/

SELECT TOP 1
  @intIDToHandle = P.ID,
  @intValue      = P.Value
  --... You can select more values here

FROM
  Products P

WHERE (P.ID > @intLastID)

ORDER BY
  P.ID

-- Loop to update/insert data
WHILE @intIDToHandle IS NOT NULL
BEGIN
  -- Insert/Update data here
  -- ....

  -- set the last record handled to the one we just handled
  SET @intLastID = @intIDToHandle
  SET @intIDToHandle = NULL

  -- select next record to handle
  SELECT TOP 1
    @intIDToHandle = P.ID,
    @intValue      = P.Value
    --... You can select more values here

  FROM
    Products P

  WHERE (P.ID > @intLastID )

  ORDER BY
    P.ID

END -- While