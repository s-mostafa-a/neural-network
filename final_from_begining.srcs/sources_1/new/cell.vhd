

----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/26/2019 04:45:13 PM
-- Design Name: 
-- Module Name: cell - Behavioral
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


entity cells is
    Port (
        clk : in std_logic;
        enable : in std_logic;
        x_in : in vector_real (0 to 3);
        h_in : in vector_real (0 to 7);
        c_in : in vector_real (0 to 7);
        valid_out: out std_logic;
        h_out : out vector_real (0 to 7);
        c_out : out vector_real (0 to 7));
end cells;

architecture Behavioral of cells is
component Fts is
    Port (
    clk : in std_logic;
    enable : in std_logic;
    h_in : in vector_real (0 to 7);
    x_in : in vector_real (0 to 3);
    outp : out vector_real (0 to 7));
end component;
component Its is
    Port (
    clk : in std_logic;
    enable : in std_logic;
    h_in : in vector_real (0 to 7);
    x_in : in vector_real (0 to 3);
    outp : out vector_real (0 to 7));
end component;
component Ots is
    Port (
    clk : in std_logic;
    enable : in std_logic;
    h_in : in vector_real (0 to 7);
    x_in : in vector_real (0 to 3);
    outp : out vector_real (0 to 7));
end component;
component Ctildets is
    Port (
    clk : in std_logic;
    enable : in std_logic;
    h_in : in vector_real ( 0 to 7);
    x_in : in vector_real ( 0 to 3);
    outp : out vector_real ( 0 to 7));
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
component hadamards is
Port (
        enable : in std_logic;
        inp1 : in vector_real (0 to 7);
        inp2 : in vector_real (0 to 7);
        outp : out  vector_real (0 to 7));
end component;
signal outs: vector_real(0 to 7);
signal f, i, ctilde, o, temp_hadamard_of_f_cin, temp_hadamard_of_ctilde_i, temp_hadamard_of_o_tanhcout, temp_ct, temp_out_of_tanh, c_in_fifo0, c_in_fifo1, c_in_fifo2, c_in_fifo3, c_in_fifo4, c_in_fifo5, c_out_fifo0, c_out_fifo1, c_out_fifo2: vector_real(0 to 7);
signal enable_of_ot, enable_of_functions, hadamard1_enable, hadamard2_enable, hadamard3_enable, tanh_enable, en_for_6fifo, en_for_4fifo: std_logic;
signal enable_register: std_logic_vector(0 to 10):= "00000000000";
--hadamard1 = f and ct-1
--hadamard2 = i and ctilde
--hadamard3 = o and tanh(c_out)
begin
enable_of_functions <= enable_register(0) or enable_register(1) or  enable_register(2) or enable_register(3) or  enable_register(4) or enable_register(5);
enable_of_ot <= enable_register(0) or enable_register(1) or  enable_register(2) or enable_register(3) or  enable_register(4) or enable_register(5) or  enable_register(6) or enable_register(7) or  enable_register(8) or enable_register(9);
en_for_6fifo <= enable_of_functions;
tanh_enable <= enable_register(6) or enable_register(7) or  enable_register(8) or enable_register(9);
en_for_4fifo <= tanh_enable;
hadamard1_enable <= '1';
hadamard2_enable <= '1';
hadamard3_enable <= '1';
    fs: Fts port map(
        clk => clk,
        enable => enable_of_functions,
        h_in => h_in,
        x_in => x_in,
        outp => f);
    iis: Its port map(
        clk => clk,
        enable => enable_of_functions,
        h_in => h_in,
        x_in => x_in,
        outp => i);
    cts: Ctildets port map(
        clk => clk,
        enable => enable_of_functions,
        h_in => h_in,
        x_in => x_in,
        outp => ctilde);
    os: Ots port map(
        clk => clk,
        enable => enable_of_ot,
        h_in => h_in,
        x_in => x_in,
        outp => o);
    h1: hadamards port map(
        enable => hadamard1_enable, -- i think it will be soori
        inp1 => f,
        inp2 => c_in_fifo5,
        outp => temp_hadamard_of_f_cin);
    h2: hadamards port map(
        enable => hadamard2_enable, -- i think it will be soori
        inp1 => i,
        inp2 => ctilde,
        outp => temp_hadamard_of_ctilde_i);
    ma: vector_adders port map (
        inp1 => temp_hadamard_of_f_cin,
        inp2 => temp_hadamard_of_ctilde_i,
        outp => temp_ct);
    mt: matrix_tanhs port map (
        clk => clk,
        enable => tanh_enable,
        inp => temp_ct,
        outp => temp_out_of_tanh);
    h3: hadamards port map(
        enable => hadamard3_enable, -- i think it will be soori
        inp1 => temp_out_of_tanh,
        inp2 => o,
        outp => temp_hadamard_of_o_tanhcout);
process (temp_hadamard_of_o_tanhcout) begin
    if temp_hadamard_of_o_tanhcout = ((-0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0, -0.0)) then
        h_out <= ((0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0));
     else
        h_out <= temp_hadamard_of_o_tanhcout;
     end if;
end process;
--<6 ff for ct-1 inp>
process(clk)
    begin
        if rising_edge(clk) then
            if en_for_6fifo='1' then
                c_in_fifo0 <= c_in;
            end if;
        end if;
end process;
process(clk)
    begin
        if rising_edge(clk) then
            if en_for_6fifo='1' then
                c_in_fifo1 <= c_in_fifo0;
            end if;
        end if;
end process;
process(clk)
    begin
        if rising_edge(clk) then
            if en_for_6fifo='1' then
                c_in_fifo2 <= c_in_fifo1;
            end if;
        end if;
end process;
process(clk)
    begin
        if rising_edge(clk) then
            if en_for_6fifo='1' then
                c_in_fifo3 <= c_in_fifo2;
            end if;
        end if;
end process;
process(clk)
    begin
        if rising_edge(clk) then
            if en_for_6fifo='1' then
                c_in_fifo4 <= c_in_fifo3;
            end if;
        end if;
end process;
process(clk)
    begin
        if rising_edge(clk) then
            if en_for_6fifo='1' then
                c_in_fifo5 <= c_in_fifo4;
            end if;
        end if;
end process;
--</6 ff for ct-1 inp>
---------------------------------------------------------------------------------
--<4 ff for ct outp>
process(clk)
    begin
        if rising_edge(clk) then
            if en_for_4fifo='1' then
                c_out_fifo0 <= temp_ct;
            end if;
        end if;
end process;
process(clk)
    begin
        if rising_edge(clk) then
            if en_for_4fifo='1' then
                c_out_fifo1 <= c_out_fifo0;
            end if;
        end if;
end process;
process(clk)
    begin
        if rising_edge(clk) then
            if en_for_4fifo='1' then
                c_out_fifo2 <= c_out_fifo1;
            end if;
        end if;
end process;
process(clk)
    begin
        if rising_edge(clk) then
            if en_for_4fifo='1' then
                c_out <= c_out_fifo2;
            end if;
        end if;
end process;
--</4 ff for ct outp>
-------------------------------------------------------------------------------------
--<10 ff for enables>
process(clk)
    begin
        if rising_edge(clk) then
            enable_register(0) <= enable;
        end if;
end process;
process(clk)
    begin
        if rising_edge(clk) then
            enable_register(1) <= enable_register(0);
        end if;
end process;
process(clk)
    begin
        if rising_edge(clk) then
            enable_register(2) <= enable_register(1);
        end if;
end process;
process(clk)
    begin
        if rising_edge(clk) then
            enable_register(3) <= enable_register(2);
        end if;
end process;
process(clk)
    begin
        if rising_edge(clk) then
            enable_register(4) <= enable_register(3);
        end if;
end process;
process(clk)
    begin
        if rising_edge(clk) then
            enable_register(5) <= enable_register(4);
        end if;
end process;
process(clk)
    begin
        if rising_edge(clk) then
            enable_register(6) <= enable_register(5);
        end if;
end process;
process(clk)
    begin
        if rising_edge(clk) then
            enable_register(7) <= enable_register(6);
        end if;
end process;
process(clk)
    begin
        if rising_edge(clk) then
            enable_register(8) <= enable_register(7);
        end if;
end process;
process(clk)
    begin
        if rising_edge(clk) then
            enable_register(9) <= enable_register(8);
        end if;
end process;
process(clk)
    begin
        if rising_edge(clk) then
            enable_register(10) <= enable_register(9);
        end if;
end process;
valid_out <= enable_register(10);

--</10 ff for enables>




end Behavioral;