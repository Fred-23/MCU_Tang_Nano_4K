--Copyright (C)2014-2022 Gowin Semiconductor Corporation.
--All rights reserved.
--File Title: Template file for instantiation
--GOWIN Version: V1.9.8.05
--Part Number: GW1NSR-LV4CQN48PC6/I5
--Device: GW1NSR-4C
--Created Time: Sat Jan 21 12:37:21 2023

--Change the instance name and port connections to the signal names
----------Copy here to design--------

component Gowin_PLLVR
    port (
        clkout: out std_logic;
        clkin: in std_logic
    );
end component;

your_instance_name: Gowin_PLLVR
    port map (
        clkout => clkout_o,
        clkin => clkin_i
    );

----------Copy end-------------------
