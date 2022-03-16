# Entity: addressDecoder

- **File**: addressDecoder.vhd
## Diagram

![Diagram](addressDecoder.svg "Diagram")
## Generics

| Generic name | Type    | Value | Description |
| ------------ | ------- | ----- | ----------- |
| inputSize    | integer | 2     |             |
## Ports

| Port name  | Direction | Type                                             | Description |
| ---------- | --------- | ------------------------------------------------ | ----------- |
| inputAdd   | in        | std_logic_vector (inputSize - 1 downto 0)        |             |
| decodedAdd | out       | std_logic_vector ((2 ** inputSize) - 1 downto 0) |             |
| en         | in        | std_logic                                        |             |
## Processes
- decoding: ( inputAdd, en )
