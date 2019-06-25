----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/25/2019 04:51:28 PM
-- Design Name: 
-- Module Name: classify - Behavioral
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
use xil_defaultlib.constants_package.ALL;
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

entity classify is
 Port (
       clk : in std_logic;
       enable : in std_logic;
       inp : in vector_real (0 to 7);
       outp : out vector_real (0 to 1));
end classify;

architecture Behavioral of classify is
component matrix_multiplers is
    generic (N, P: integer := 1);
    Port (
        enable : in std_logic;
        first_matrix : in vector_real (0 to N-1);
        second_matrix : in matrix_real (0 to N-1, 0 to P-1);
        outp_matrix : out vector_real (0 to P-1)); 
end component;
component sigmoid_module_real is
    Port (
           clk : in std_logic;
           enable : in std_logic;
           input : in real;
           output : out real);
end component;
signal multiply_out, sum_out, sig_out: vector_real(0 to 1);
begin
mm: matrix_multiplers
    generic map (8,2)
    Port map (
        enable => enable,
        first_matrix => inp,
        second_matrix => w_of_outp,
        outp_matrix => multiply_out);
 sum_out(0) <= multiply_out(0) + b_of_outp(0);
 sum_out(1) <= multiply_out(1) + b_of_outp(1);
 s1: sigmoid_module_real
     Port map(
            clk => clk,
            enable => enable,
            input => sum_out(0),
            output => sig_out(0));
s2: sigmoid_module_real
                 Port map(
                        clk => clk,
                        enable => enable,
                        input => sum_out(1),
                        output => sig_out(1));
outp <= sig_out;
end Behavioral;
