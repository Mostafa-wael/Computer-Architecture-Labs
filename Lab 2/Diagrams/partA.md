# Entity: partA

- **File**: partA.vhd
## Diagram

![Diagram](partA.svg "Diagram")
## Generics

| Generic name | Type    | Value | Description |
| ------------ | ------- | ----- | ----------- |
| n            | integer | 16    |             |
## Ports

| Port name | Direction | Type                              | Description |
| --------- | --------- | --------------------------------- | ----------- |
| a         | in        | std_logic_vector (n - 1 downto 0) |             |
| b         | in        | std_logic_vector (n - 1 downto 0) |             |
| sel       | in        | std_logic_vector (1 downto 0)     |             |
| cIn       | in        | std_logic                         |             |
| cOut      | out       | std_logic                         |             |
| f         | out       | std_logic_vector (n - 1 downto 0) |             |
## Signals

| Name   | Type                             | Description |
| ------ | -------------------------------- | ----------- |
| inputB | std_logic_vector(n - 1 downto 0) |             |
## Processes
- setInputs: ( sel, a, b, cIn )
## Instantiations

- nFullAdderUnit: nFullAdder
