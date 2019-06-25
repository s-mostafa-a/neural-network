----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/24/2019 04:06:18 PM
-- Design Name: 
-- Module Name: hadamard - Behavioral
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


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library xil_defaultlib;
use xil_defaultlib.package_util.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity hadamards is
Port (
        enable : in std_logic;
        inp1 : in vector_real (0 to 7);
        inp2 : in vector_real (0 to 7);
        outp : out  vector_real (0 to 7));
        end hadamards;

architecture Behavioral of hadamards is
component multipler_module_real is
    Port (
       inputx : in real;
       inputy : in real;
       output : out real
       );
end component;
begin
    one: for i in 0 to 7 generate
        mm: multipler_module_real Port map (
            inputx => inp1(i),
            inputy => inp2(i),
            output => outp(i));
    end generate one;
end Behavioral;
