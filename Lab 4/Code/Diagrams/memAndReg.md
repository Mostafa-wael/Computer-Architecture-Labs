# Entity: memAndReg

- **File**: memAndReg.vhd
## Diagram

![Diagram](memAndReg.svg "Diagram")
## Generics

| Generic name          | Type    | Value | Description |
| --------------------- | ------- | ----- | ----------- |
| memAddressBusSize     | integer | 4     |             |
| regFileAddressBusSize | integer | 2     |             |
| dataBusSize           | integer | 32    |             |
## Ports

| Port name          | Direction | Type                                                  | Description |
| ------------------ | --------- | ----------------------------------------------------- | ----------- |
| mem_W_RE           | in        | std_logic                                             |             |
| reg_R_E            | in        | std_logic                                             |             |
| reg_W_E            | in        | std_logic                                             |             |
| sourceAddress      | in        | std_logic_vector (regFileAddressBusSize - 1 downto 0) |             |
| destinationAddress | in        | std_logic_vector (regFileAddressBusSize - 1 downto 0) |             |
| Clk                | in        | std_logic                                             |             |
| rst                | in        | std_logic                                             |             |
## Signals

| Name             | Type                                              | Description |
| ---------------- | ------------------------------------------------- | ----------- |
| addressFromCount | std_logic_vector (memAddressBusSize - 1 downto 0) |             |
| dataBus          | std_logic_vector (dataBusSize - 1 downto 0)       |             |
## Instantiations

- counterUnit: counter
- ramUnit: ram
- regFileUnit: registerFileModule
