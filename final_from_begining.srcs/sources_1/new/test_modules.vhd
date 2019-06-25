library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.math_real.all;
use IEEE.numeric_std.all;
library xil_defaultlib;
use xil_defaultlib.package_util.ALL;
use xil_defaultlib.constants_package.ALL;

entity test_modules is
end test_modules;

architecture Behavioral of test_modules is

    component neural_network is
Port ( 
clk : in std_logic;
enable : in std_logic;
Xs: in vec_vec_real(0 to 19);
outp: out vector_real(0 to 1);
valid_out: out std_logic
);
end component;


   signal clk :  std_logic := '0';
   signal enable :  std_logic := '0';
   signal Xs : vec_vec_real(0 to 19):=((others => (others => 1.0)));
   signal outp : vector_real(0 to 1);
   signal valid_out : std_logic;
   
begin
      
    --inputx <= 2.25, -13.4 after 200 ns;
    --inputy <= 8.4, 29.4 after 200 ns;
    clk <= not clk after 1 ns;
    enable <= '1';
    nn: neural_network
    Port map( 
    clk => clk,
    enable => enable,
    Xs => Xs,
    outp => outp,
    valid_out => valid_out 
    );
    end Behavioral;