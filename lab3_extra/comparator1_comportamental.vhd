LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY comparator1 IS
  PORT (
	A, B: in std_logic;
	LESS, GREATER, EQUAL: out std_logic
    );
END comparator1;


ARCHITECTURE comportamental OF comparator1 IS
BEGIN

	process(A,B) 
	begin
		if A < B then 
			LESS <= '1';
			GREATER <= '0';
			EQUAL <= '0';
		elsif A > B then
			GREATER <= '1';
			LESS <= '0';
			EQUAL <= '0';
		else
			LESS <= '0';
			GREATER <= '0';
			EQUAL <= '1';
		end if;
	end process;

END comportamental;
