# Entity: ALU

- **File**: ALU.vhd
## Diagram

![Diagram](ALU.svg "Diagram")
## Ports

| Port name | Direction | Type                           | Description |
| --------- | --------- | ------------------------------ | ----------- |
| A         | in        | std_logic_vector (15 downto 0) |             |
| B         | in        | std_logic_vector (15 downto 0) |             |
| S         | in        | std_logic_vector (3 downto 0)  |             |
| C_IN      | in        | std_logic                      |             |
| C_OUT     | out       | std_logic                      |             |
| F         | out       | std_logic_vector (15 downto 0) |             |
## Signals

| Name  | Type                          | Description |
| ----- | ----------------------------- | ----------- |
| fB    | std_logic_vector(15 downto 0) |             |
| fC    | std_logic_vector(15 downto 0) |             |
| fD    | std_logic_vector(15 downto 0) |             |
| cOutC | std_logic                     |             |
| cOutD | std_logic                     |             |
## Instantiations

- unitB: partB
- unitC: partC
- unitD: partD
