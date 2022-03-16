# Entity: registerFileModule

- **File**: registerFile.vhd
## Diagram

![Diagram](registerFile.svg "Diagram")
## Generics

| Generic name   | Type    | Value | Description |
| -------------- | ------- | ----- | ----------- |
| addressBusSize | integer | 2     |             |
| dataBusSize    | integer | 32    |             |
## Ports

| Port name          | Direction | Type                                           | Description |
| ------------------ | --------- | ---------------------------------------------- | ----------- |
| dataBus            | inout     | std_logic_vector (dataBusSize - 1 downto 0)    |             |
| sourceAddress      | in        | std_logic_vector (addressBusSize - 1 downto 0) |             |
| destinationAddress | in        | std_logic_vector (addressBusSize - 1 downto 0) |             |
| clk                | in        | std_logic                                      |             |
| rst                | in        | std_logic                                      |             |
| W_E                | in        | std_logic                                      |             |
| R_E                | in        | std_logic                                      |             |
## Signals

| Name                      | Type                                                  | Description |
| ------------------------- | ----------------------------------------------------- | ----------- |
| sourceAddressDecoded      | std_logic_vector ((2 ** addressBusSize) - 1 downto 0) |             |
| destinationAddressDecoded | std_logic_vector ((2 ** addressBusSize) - 1 downto 0) |             |
## Instantiations

- sourceDecoderUnit: addressDecoder
- destinationDecoderUnit: addressDecoder
- registersBlockUnit: registersBlock
