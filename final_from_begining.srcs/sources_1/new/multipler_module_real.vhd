library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.math_real.all;
use IEEE.numeric_std.all;

entity multipler_module_real is
    Port (
   inputx : in real;
   inputy : in real;
   output : out real);
end multipler_module_real;

architecture high_level_sim of multipler_module_real is

begin
      process(inputx, inputy)
      begin
      if inputx = -0.0 then
      output <= 0.0;
      elsif inputy = -0.0 then
      output <= 0.0;
      else
      output <= trunc(inputx * inputy);
      end if;
      end process;
end high_level_sim;

