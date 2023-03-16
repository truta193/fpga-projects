LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY bdcto7seg IS
  PORT (
	A : in std_logic_vector(3 downto 0);
	B: out std_logic_vector(6 downto 0);
	LD : out std_logic_vector(3 downto 0)
	
    );
END bdcto7seg;

--------------------------------------------------------------------------------
--Complete your VHDL description below
--------------------------------------------------------------------------------

ARCHITECTURE comportm OF bdcto7seg IS

BEGIN
	LD <= "0001";

	process(A)
	begin
		case A is
			when "0000" => B <= "1111110";
			when "0001" => B <= "0110000";
			when "0010" => B <= "1101101";
			when "0011" => B <= "1111001";
			when "0100" => B <= "0110011";
			when "0101" => B <= "1011011";
			when "0110" => B <= "1011111";
			when "0111" => B <= "1110000";

			when "1000" => B <= "1111111";
			when "1001" => B <= "1111011";
			when "1010" => B <= "1110111";
			when "1011" => B <= "0011111";
			when "1100" => B <= "1001110";
			when "1101" => B <= "0111101";
			when "1110" => B <= "1001111";
			when "1111" => B <= "1000111";
			when others => B <= "0000000";
		end case;

	end process;
END comportm;
