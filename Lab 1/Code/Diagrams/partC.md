# Entity: partC

- **File**: partC.vhd
## Diagram

![Diagram](partC.svg "Diagram")
## Ports

| Port name | Direction | Type                           | Description |
| --------- | --------- | ------------------------------ | ----------- |
| a         | in        | std_logic_vector (15 downto 0) |             |
| b         | in        | std_logic_vector (15 downto 0) |             |
| s         | in        | std_logic_vector (1 downto 0)  |             |
| cIn       | in        | std_logic                      |             |
| cOut      | out       | std_logic                      |             |
| f         | out       | std_logic_vector (15 downto 0) |             |
## Processes
- partCLogic: ( s, a, b, cIn )
