----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/25/2019 05:58:20 PM
-- Design Name: 
-- Module Name: neural_network - Behavioral
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

entity neural_network is
Port ( 
clk : in std_logic;
enable : in std_logic;
Xs: in vec_vec_real(0 to 19);
outp: out vector_real(0 to 1);
valid_out: out std_logic
);
end neural_network;

architecture Behavioral of neural_network is
component cells is
    Port (
        clk : in std_logic;
        enable : in std_logic;
        x_in : in vector_real (0 to 3);
        h_in : in vector_real (0 to 7);
        c_in : in vector_real (0 to 7);
        valid_out: out std_logic;
        h_out : out vector_real (0 to 7);
        c_out : out vector_real (0 to 7));
end component;
component classify is
 Port (
       clk : in std_logic;
       enable : in std_logic;
       inp : in vector_real (0 to 7);
       outp : out vector_real (0 to 1));
end component;
type for_cf is array(integer range<>) of vector_real(0 to 7);
signal enables : std_logic_vector(0 to 20):="000000000000000000000";
signal hs, cs: for_cf(0 to 19);
signal zeros: vector_real(0 to 7) := (others => 0.0);
signal enable_for_classifier: std_logic_vector(0 to 5) := "000000";
signal clsfr_en: std_logic;
begin
    enables(0) <= enable;
    cell0: cells
        Port map (
            clk => clk ,
            enable => enables(0),
            x_in => Xs(0),
            h_in => zeros,
            c_in => zeros,
            valid_out => enables(1),
            h_out => hs(0),
            c_out => cs(0));
    
    one: for i in 1 to 19 generate
        cellsi : cells
        Port map (
            clk => clk ,
            enable => enables(i),
            x_in => Xs(i),
            h_in => hs(i-1),
            c_in => cs(i-1),
            valid_out => enables(i+1),
            h_out => hs(i),
            c_out => cs(i));
    end generate one;

clsfr: classify Port map (
       clk => clk,
       enable => clsfr_en,
       inp => hs(19),
       outp => outp);

clsfr_en <= enable_for_classifier(0) or enable_for_classifier(1) or enable_for_classifier(2) or enable_for_classifier(3) or enable_for_classifier(4) or enable_for_classifier(5);
--<for classifys enable>
process(clk)
    begin
        if rising_edge(clk) then
                enable_for_classifier(0) <= enables(20);
        end if;
end process;
process(clk)
    begin
        if rising_edge(clk) then
                enable_for_classifier(1) <= enable_for_classifier(0);
        end if;
end process;
process(clk)
    begin
        if rising_edge(clk) then
                enable_for_classifier(2) <= enable_for_classifier(1);
        end if;
end process;
process(clk)
    begin
        if rising_edge(clk) then
                enable_for_classifier(3) <= enable_for_classifier(2);
        end if;
end process;
process(clk)
    begin
        if rising_edge(clk) then
                enable_for_classifier(4) <= enable_for_classifier(3);
        end if;
end process;
process(clk)
    begin
        if rising_edge(clk) then
                enable_for_classifier(5) <= enable_for_classifier(4);
        end if;
end process;
process(clk)
    begin
        if rising_edge(clk) then
                valid_out <= enable_for_classifier(5);
        end if;
end process;
--</for classifys enable>

end Behavioral;
