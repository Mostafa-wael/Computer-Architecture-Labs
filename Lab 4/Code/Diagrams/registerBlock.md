# Entity: DFFregister

- **File**: registerBlock.vhd
## Diagram

![Diagram](registerBlock.svg "Diagram")
## Generics

| Generic name | Type    | Value | Description |
| ------------ | ------- | ----- | ----------- |
| unitSize     | integer | 32    |             |
## Ports

| Port name | Direction | Type                                    | Description |
| --------- | --------- | --------------------------------------- | ----------- |
| d         | in        | std_logic_vector(unitSize - 1 downto 0) |             |
| q         | out       | std_logic_vector(unitSize - 1 downto 0) |             |
| Clk       | in        | std_logic                               |             |
| rst       | in        | std_logic                               |             |
| enW       | in        | std_logic                               |             |
## Processes
- registerLogic: ( Clk )
