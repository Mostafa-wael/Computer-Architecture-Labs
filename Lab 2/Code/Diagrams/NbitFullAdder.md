
# Entity: fullAdder

- **File**: NbitFullAdder.vhd
## Diagram

![Diagram](FullAdder.svg "Diagram")
## Ports

| Port name | Direction | Type      | Description |
| --------- | --------- | --------- | ----------- |
| a         | in        | std_logic |             |
| b         | in        | std_logic |             |
| cin       | in        | std_logic |             |
| cout      | out       | std_logic |             |
| sum       | out       | std_logic |             |



# Entity: nFullAdder

- **File**: NbitFullAdder.vhd
## Diagram

![Diagram](NbitFullAdder.svg "Diagram")
## Generics

| Generic name | Type    | Value | Description |
| ------------ | ------- | ----- | ----------- |
| n            | integer | 16    |             |
## Ports

| Port name | Direction | Type                              | Description |
| --------- | --------- | --------------------------------- | ----------- |
| a         | in        | std_logic_vector (n - 1 downto 0) |             |
| b         | in        | std_logic_vector (n - 1 downto 0) |             |
| cin       | in        | std_logic                         |             |
| cout      | out       | std_logic                         |             |
| sum       | out       | std_logic_vector (n - 1 downto 0) |             |
## Signals

| Name | Type                         | Description |
| ---- | ---------------------------- | ----------- |
| temp | std_logic_vector(n downto 0) |             |
