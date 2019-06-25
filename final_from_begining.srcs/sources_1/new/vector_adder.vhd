----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/24/2019 04:50:00 PM
-- Design Name: 
-- Module Name: vector_adder - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library xil_defaultlib;
use xil_defaultlib.package_util.ALL;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;



-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;


entity vector_adders is
    Port (
        inp1 : in vector_real (0 to 7);
        inp2 : in vector_real (0 to 7);
        outp: out vector_real (0 to 7));
end vector_adders;

architecture Behavioral of vector_adders is
begin
process(inp1, inp2)
begin
    for i in 0 to 7 loop
    if (inp1(i) = -0.0) and (inp2(i) = -0.0) then
    outp(i) <= 0.0;
      elsif inp1(i) = -0.0 then
        outp(i) <= inp2(i);
      elsif inp2(i) = -0.0 then 
        outp(i) <= inp1(i);
        else
      outp(i) <= inp1(i) + inp2(i);
      end if;
    end loop;
end process;
end Behavioral;