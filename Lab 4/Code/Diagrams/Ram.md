# Entity: ram

- **File**: Ram.vhd
## Diagram

![Diagram](Ram.svg "Diagram")
## Generics

| Generic name   | Type    | Value | Description |
| -------------- | ------- | ----- | ----------- |
| addressBusSize | integer | 4     |             |
| dataBusSize    | integer | 32    |             |
## Ports

| Port name | Direction | Type                                          | Description |
| --------- | --------- | --------------------------------------------- | ----------- |
| clk       | in        | std_logic                                     |             |
| W_RE      | in        | std_logic                                     |             |
| address   | in        | std_logic_vector(addressBusSize - 1 downto 0) |             |
| datain    | in        | std_logic_vector(dataBusSize - 1 downto 0)    |             |
| dataout   | out       | std_logic_vector(dataBusSize - 1 downto 0)    |             |
## Signals

| Name | Type     | Description |
| ---- | -------- | ----------- |
| ram  | ram_type |             |
## Types

| Name     | Type | Description |
| -------- | ---- | ----------- |
| ram_type |      |             |
## Processes
- unnamed: ( clk )
