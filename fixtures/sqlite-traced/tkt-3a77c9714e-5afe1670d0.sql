SELECT
    SrcWord, Beginnings.Title
    FROM 
      (SELECT 'FACTORING' AS SrcWord UNION SELECT 'SWIMMING' AS SrcWord )
    LEFT JOIN 
      Beginnings
    WHERE Beginnings.Id= (
      SELECT BeginningId FROM (
        SELECT SrcWord, B.Id as BeginningId, B.Title || E.Title As Connected
        FROM Beginnings B LEFT JOIN Endings E ON B.EndingId=E.EndingId
        WHERE Connected=SrcWord LIMIT 1
      )
    )
