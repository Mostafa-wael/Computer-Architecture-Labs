# Entity: memCount

- **File**: memCount.vhd
## Diagram

![Diagram](memCount.svg "Diagram")
## Generics

| Generic name   | Type    | Value | Description |
| -------------- | ------- | ----- | ----------- |
| addressBusSize | integer | 4     |             |
| dataBusSize    | integer | 32    |             |
## Ports

| Port name | Direction | Type                                        | Description |
| --------- | --------- | ------------------------------------------- | ----------- |
| W_RE      | in        | std_logic                                   |             |
| dataBus   | inout     | std_logic_vector (dataBusSize - 1 downto 0) |             |
| Clk       | in        | std_logic                                   |             |
| rst       | in        | std_logic                                   |             |
## Signals

| Name             | Type                                           | Description |
| ---------------- | ---------------------------------------------- | ----------- |
| addressFromCount | std_logic_vector (addressBusSize - 1 downto 0) |             |
## Instantiations

- ramUnit: ram
- counterUnit: counter
