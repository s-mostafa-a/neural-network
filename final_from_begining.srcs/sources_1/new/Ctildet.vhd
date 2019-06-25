

----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/26/2019 04:45:13 PM
-- Design Name: 
-- Module Name: Ctildet - Behavioral
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


entity Ctildets is
    Port (
        clk : in std_logic;
        enable : in std_logic;
        h_in : in vector_real ( 0 to 7);
        x_in : in vector_real ( 0 to 3);
        outp : out vector_real ( 0 to 7));
end Ctildets;

architecture Behavioral of Ctildets is
component matrix_multiplers is
    generic (N, P: integer := 1);
Port (
    enable : in std_logic;
    first_matrix : in vector_real (0 to N-1);
    second_matrix : in matrix_real (0 to N-1, 0 to P-1);
    outp_matrix : out vector_real (0 to P-1));
end component;
component vector_adders is
    Port (
        inp1 : in vector_real (0 to 7);
        inp2 : in vector_real (0 to 7);
        outp: out vector_real (0 to 7));
end component;
component matrix_tanhs is
    Port (
    clk : in std_logic;
    enable : in std_logic;
    inp : in vector_real (0 to 7);
    outp : out vector_real (0 to 7));
end component;
signal frst, scnd, thrd, frth : vector_real (0 to 7);
signal fifo0, fifo1: vector_real(0 to 7);
begin
mp1: matrix_multiplers generic map (4, 8) 
    port map(
        enable => enable,
        first_matrix => x_in,
        second_matrix => w_c,
        outp_matrix => frst);
mp2: matrix_multiplers generic map (8, 8) 
    port map(
        enable => enable,
        first_matrix => h_in,
        second_matrix => u_c,
        outp_matrix => scnd);
        
ma: vector_adders port map(
                inp1 => frst,
                inp2 => scnd,
                outp => frth);
ma2: vector_adders port map(
                        inp1 => frth,
                        inp2 => b_f,
                        outp => thrd);
                        
mt: matrix_tanhs
    port map(
        clk => clk,
        enable => enable,
        inp => thrd,
        outp => fifo0);
process(clk)
          begin
            if rising_edge(clk) then
              if enable='1' then
                  fifo1 <= fifo0;
              end if;
            end if;
          end process;
process(clk)
                    begin
                      if rising_edge(clk) then
                        if enable='1' then
                            outp <= fifo1;
                        end if;
                      end if;
                    end process;
end Behavioral;
