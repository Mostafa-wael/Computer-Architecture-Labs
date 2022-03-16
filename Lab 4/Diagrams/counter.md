# Entity: counter

- **File**: counter.vhd
## Diagram

![Diagram](counter.svg "Diagram")
## Generics

| Generic name   | Type    | Value | Description |
| -------------- | ------- | ----- | ----------- |
| addressBusSize | integer | 4     |             |
## Ports

| Port name | Direction | Type                                          | Description |
| --------- | --------- | --------------------------------------------- | ----------- |
| clk       | in        | std_logic                                     |             |
| rst       | in        | std_logic                                     |             |
| Count     | out       | std_logic_vector(addressBusSize - 1 downto 0) |             |
## Signals

| Name     | Type                                  | Description |
| -------- | ------------------------------------- | ----------- |
| preCount | unsigned(addressBusSize - 1 downto 0) |             |
## Processes
- decrement: ( clk, rst )
