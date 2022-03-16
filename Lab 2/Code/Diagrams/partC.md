# Entity: partC

- **File**: partC.vhd
## Diagram

![Diagram](partC.svg "Diagram")
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
## Processes
- partCLogic: ( sel, a, b, cIn )
