# Entity: partB

- **File**: partB.vhd
## Diagram

![Diagram](partB.svg "Diagram")
## Ports

| Port name | Direction | Type                           | Description |
| --------- | --------- | ------------------------------ | ----------- |
| a         | in        | std_logic_vector (15 downto 0) |             |
| b         | in        | std_logic_vector (15 downto 0) |             |
| s         | in        | std_logic_vector (1 downto 0)  |             |
| f         | out       | std_logic_vector (15 downto 0) |             |
## Processes
- partBLogic: ( s, a, b )
