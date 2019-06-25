----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/24/2019 04:17:49 PM
-- Design Name: 
-- Module Name: matrix_multipler - Behavioral
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
entity matrix_multiplers is
    generic (N, P: integer := 1);
    Port (
        enable : in std_logic;
        first_matrix : in vector_real (0 to N-1);
        second_matrix : in matrix_real (0 to N-1, 0 to P-1);
        outp_matrix : out vector_real (0 to P-1));
end matrix_multiplers;

architecture Behavioral of matrix_multiplers is
component multipler_module_real is
    Port (
       inputx : in real;
       inputy : in real;
       output : out real
       );
end component;
component NtoOneAdders is
    generic (N: integer := 2);
    Port (
        INP : in vector_real (0 to N-1);
        OUTP : out real);
end component;
type matrix_32_3d is array (integer range <>, integer range<>) of vector_real(0 to N-1);
signal matrix_kasif_3d : matrix_32_3d(0 to 0, 0 to P-1);
begin
    one: for i in 0 to 0 generate
        two: for j in 0 to P-1 generate
            three: for k in 0 to N-1 generate
                mymp: multipler_module_real port map(
                    inputx =>first_matrix(k),
                    inputy =>second_matrix(k,j),
                    output  => matrix_kasif_3d(i,j)(k));
            end generate three;
          --  matrix_kasif_3d(i,j)(k)) <= v ;
            addr: NtoOneAdders generic map(N) port map(
            matrix_kasif_3d(i,j),
            outp_matrix(j));
        end generate two;
    end generate one;
end Behavioral;
