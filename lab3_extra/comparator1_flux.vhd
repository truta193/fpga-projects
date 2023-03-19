LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY comparator1 IS
  PORT (
	A, B: in std_logic;
	LESS, GREATER, EQUAL: out std_logic
    );
END comparator1;


ARCHITECTURE flux OF comparator1 IS

BEGIN
	GREATER <= A and (not B);
	EQUAL <= A xnor B;
	LESS <= (not A) and B;

END flux;
