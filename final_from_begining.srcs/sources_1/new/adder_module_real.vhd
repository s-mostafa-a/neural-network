library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.math_real.all;
use IEEE.numeric_std.all;


entity add_module_real is
    Port (
       inputx : in real;
       inputy : in real;
       output : out real);
end add_module_real;

architecture high_level_sim of add_module_real is
begin
    output <= inputx + inputy;
end high_level_sim;
