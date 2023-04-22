-- ****************
-- Search path
-- ****************
-- Use this to show the current search_path
-- Should return: "$user",public
SHOW search_path;

-- Create another schema
GRANT ALL ON SCHEMA s1 TO s1;

-- To change search_path on a connection-level
SET search_path TO s1;

-- To change search_path on a database-level
ALTER database "testdb" SET search_path TO s1;
