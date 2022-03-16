# Entity: ALU

- **File**: ALU.vhd
## Diagram

![Diagram](ALU.svg "Diagram")
## Generics

| Generic name | Type    | Value | Description |
| ------------ | ------- | ----- | ----------- |
| n            | integer | 16    |             |
## Ports

| Port name | Direction | Type                            | Description |
| --------- | --------- | ------------------------------- | ----------- |
| A         | in        | std_logic_vector (n-1 downto 0) |             |
| B         | in        | std_logic_vector (n-1 downto 0) |             |
| SEL       | in        | std_logic_vector (3 downto 0)   |             |
| C_IN      | in        | std_logic                       |             |
| C_OUT     | out       | std_logic                       |             |
| F         | out       | std_logic_vector (n-1 downto 0) |             |
## Signals

| Name  | Type                           | Description |
| ----- | ------------------------------ | ----------- |
| fA    | std_logic_vector(n-1 downto 0) |             |
| fB    | std_logic_vector(n-1 downto 0) |             |
| fC    | std_logic_vector(n-1 downto 0) |             |
| fD    | std_logic_vector(n-1 downto 0) |             |
| cOutA | std_logic                      |             |
| cOutC | std_logic                      |             |
| cOutD | std_logic                      |             |
## Instantiations

- unitA: partA
- unitB: partB
- unitC: partC
- unitD: partD
