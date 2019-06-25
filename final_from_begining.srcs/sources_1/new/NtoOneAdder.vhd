----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/24/2019 04:21:06 PM
-- Design Name: 
-- Module Name: NtoOneAdder - Behavioral
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

entity NtoOneAdders is
    generic ( N: integer := 2);
    Port (
        INP : in vector_real (0 to N-1);
        OUTP : out real);
end NtoOneAdders;
architecture Behavioral of NtoOneAdders is
begin
process (INP)
    variable sum_of_products : real;
    begin
        for k in 0 to N-1 loop
            sum_of_products := sum_of_products + INP(k);
        end loop;  
        OUTP <= sum_of_products;
    end process;
end Behavioral;
