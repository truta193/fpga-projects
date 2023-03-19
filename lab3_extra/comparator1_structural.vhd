LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY comparator1 IS
  PORT (
	A, B : in std_logic;
	X, Y, Z: out std_logic
    );
END comparator1;

ARCHITECTURE structural OF comparator1 IS
	component ANDG 
		port ( A, B : in std_logic;
			O : out std_logic
			);
	end component;
	component XNORG 
		port ( A, B : in std_logic;
			O : out std_logic
			);
	end component;
		component NOTG 
		port ( A : in std_logic;
			O : out std_logic
			);
	end component;
	signal W1, W2 : std_logic;

BEGIN
	N1: NOTG port map(A, W1);
	N2: NOTG port map(B, W2);
	A1: ANDG port map(A, W2, X);
	A2: ANDG port map(W1, B, Z);
	XN1: XNORG port map(A, B, Y);
END structural;



LIBRARY ieee;
USE ieee.std_logic_1164.all;
entity ANDG is
	port ( A, B : in std_logic;
		O : out std_logic
		);
end ANDG;

architecture flux of ANDG is
begin
	O <= A and B;
end architecture flux;



LIBRARY ieee;
USE ieee.std_logic_1164.all;
entity XNORG is
	port ( A, B : in std_logic;
		O : out std_logic
		);
end XNORG;

architecture flux of XNORG is
begin
	O <= A xnor B;
end architecture flux;



LIBRARY ieee;
USE ieee.std_logic_1164.all;
entity NOTG is
	port ( A : in std_logic;
		O : out std_logic
		);
end NOTG;

architecture flux of NOTG is
begin
	O <= not A;
end architecture flux;



