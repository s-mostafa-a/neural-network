----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/24/2019 04:58:16 PM
-- Design Name: 
-- Module Name: matrix_tanh - Behavioral
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


entity matrix_tanhs is
    Port (
        clk : in std_logic;
        enable : in std_logic;
        inp : in vector_real (0 to 7);
        outp : out vector_real (0 to 7));
end matrix_tanhs;

architecture Behavioral of matrix_tanhs is
component tanh_module_real is
    Port (
           clk : in std_logic;
           enable : in std_logic;
           input : in real;
           output : out real);
end component;
begin
    one: for i in 0 to 7 generate
        sgmd: tanh_module_real Port map (
            clk => clk,
            enable => enable,
            input => inp(i),
            output => outp(i));
    end generate one;
end Behavioral;
