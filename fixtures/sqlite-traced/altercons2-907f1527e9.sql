CREATE TABLE "Test" ( 
      "IsActive" INTEGER, 
      CONSTRAINT "BooleanZeroOrOne" CHECK ("IsActive" IN (0, 1)) 
  );
