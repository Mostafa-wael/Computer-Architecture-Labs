# Entity: partB

- **File**: partB.vhd
## Diagram

![Diagram](partB.svg "Diagram")
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
| f         | out       | std_logic_vector (n - 1 downto 0) |             |
## Processes
- partBLogic: ( sel, a, b )
