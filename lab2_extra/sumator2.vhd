LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity sumator2 is 
	port (
	A,B : in std_logic_vector(1 downto 0);
	CIN: in std_logic;
	S: out std_logic_vector(1 downto 0);
	COUT: out std_logic
	);
end sumator2;

architecture structural of sumator2 is
	component sumator1
		PORT (
			A, B, CIN : IN std_logic;
			S, COUT : OUT std_logic
		);
	END component;

	signal carry : std_logic;

begin
	C1: sumator1 port map(A(0), B(0), CIN, S(0), carry);
	C2: sumator1 port map(A(1), B(1), carry, S(1), COUT);

end architecture structural;


LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY sumator1 IS
	PORT (
		A, B, CIN : IN std_logic;
		S, COUT : OUT std_logic
	);
END sumator1;

ARCHITECTURE structural OF sumator1 IS
	COMPONENT POARTA_SI
		PORT (
			X, Y : IN std_logic;
			Z : OUT std_logic
		);
	END COMPONENT;
 
	COMPONENT POARTA_XOR
		PORT (
			W, X, Y : IN std_logic;
			Z : OUT std_logic
		);
	END COMPONENT;
 
	COMPONENT POARTA_SAU
		PORT (
			W, X, Y : IN std_logic;
			Z : OUT std_logic
		);
	END COMPONENT;
 
	SIGNAL N1, N2, N3 : std_logic;
 
BEGIN
	C1 : POARTA_SI
	PORT MAP(A, B, N1);
	C2 : POARTA_SI
	PORT MAP(B, CIN, N2);
	C3 : POARTA_SAU
	PORT MAP(N1, N2, N3, COUT);
C4 : POARTA_SI
PORT MAP(A, CIN, N3);
C5 : POARTA_XOR
PORT MAP(A, B, CIN, S);
 
END ARCHITECTURE structural;


LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY POARTA_SI IS
	PORT (
	X, Y : IN std_logic;
	Z : OUT std_logic
	);
END ENTITY;

ARCHITECTURE flux OF POARTA_SI IS
BEGIN
	Z <= X AND Y;
END ARCHITECTURE;

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY POARTA_SAU IS
	PORT (
	W, X, Y : IN std_logic;
	Z : OUT std_logic
	);
END ENTITY;

ARCHITECTURE flux OF POARTA_SAU IS
BEGIN
	Z <= X OR Y OR W;
END ARCHITECTURE;
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY POARTA_XOR IS
	PORT (
	W, X, Y : IN std_logic;
	Z : OUT std_logic
	);
END ENTITY;

ARCHITECTURE flux OF POARTA_XOR IS
BEGIN
	Z <= X XOR Y XOR W;
END ARCHITECTURE;