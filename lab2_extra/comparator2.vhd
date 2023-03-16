LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY comparator2 IS
  PORT (
	A, B : in std_logic_vector(1 DOWNTO 0);
	LESS, GREATER, EQUAL : out std_logic
    );
END comparator2;

--------------------------------------------------------------------------------
--Complete your VHDL description below
--------------------------------------------------------------------------------

ARCHITECTURE TypeArchitecture OF comparator2 IS


BEGIN
	process(A, B)
	begin
		if A(1) > B(1) then
			LESS <= '0';
			GREATER <= '1';
			EQUAL <= '0';
		elsif A(1) < B(1) then
			LESS <= '1';
			GREATER <= '0';
			EQUAL <= '0';
		else 
			if A(0) > B(0) then
				LESS <= '0';
				GREATER <= '1';
				EQUAL <= '0';
			elsif A(0) < B(0) then
				LESS <= '1';
				GREATER <= '0';
				EQUAL <= '0';
			else
				LESS <= '0';
				GREATER <= '0';
				EQUAL <= '1';
			end if;
		end if;
	end process;

END TypeArchitecture;
