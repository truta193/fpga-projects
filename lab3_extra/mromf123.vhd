LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

ENTITY romf123 IS
  PORT (
	CS_ROM : in std_logic;
	ADDR : in std_logic_vector(3 downto 0);
	D_ROM : out std_logic_vector(2 downto 0)
    );
END romf123;

ARCHITECTURE mt OF romf123 IS
	type MATRIX is array(0 to 15) of std_logic_vector(2 downto 0);
	constant memory : MATRIX := ("011", "100", "101", "000", "010", "101", "111", "000", "010", "001", "011", "100", "000", "100", "000", "100");
	signal mat : MATRIX;
BEGIN
	mat <= memory;
	process(CS_ROM, ADDR)
	begin
		if (CS_ROM = '0') then
			D_ROM <= "000";
		else 
			D_ROM <= mat(conv_integer(ADDR));
		end if;
	end process;
	

END mt;
