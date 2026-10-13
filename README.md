# UART Transmitter and Receiver in Verilog

A Verilog learning project exploring a simple UART-style serial transmitter, receiver, and top-level loopback connection. The RTL includes serial framing logic, a parity bit, a baud-rate generator module, and separate testbenches for the transmitter, receiver, and integrated top level.

> **Project status:** This repository is an educational RTL implementation. The baud-rate generator currently only drives `clk_tx` (the `clk_rx` output is not implemented), and the testbenches provide stimulus rather than comprehensive self-checking verification. Validate the design in simulation before using it as a complete UART peripheral.

## Features represented in the RTL

- 8-bit transmit data.
- Transmit framing with a start bit, eight data bits, a parity bit, and a stop bit.
- Receiver state machine that detects a low start condition, collects serial bits, and checks parity.
- Top-level module connecting the transmitter output to the receiver input for a basic loopback experiment.
- Separate testbenches for TX, RX, and the top-level connection.

## Architecture

| File | Purpose |
|---|---|
| `rtl/uart_top.v` | Connects `uart_tx` to `uart_rx` in a loopback path. |
| `rtl/uart_tx.v` | Loads the input byte into a shift register and serializes it with framing/parity bits. |
| `rtl/uart_rx.v` | Samples the serial input using a state machine and produces an 8-bit received value after its parity check. |
| `rtl/baud_rate_gen.v` | Contains a parameterized transmit-clock divider; receive-clock generation is not currently implemented. |
| `testbench/tb_tx.v` | Applies a sample byte and enable pulse to the transmitter. |
| `testbench/tb_rx.v` | Applies a manually timed serial input sequence to the receiver. |
| `testbench/tb_uart.v` | Exercises the top-level TX-to-RX connection. |

## Interfaces

### Transmitter — `uart_tx`

Inputs: `clk`, `enable`, `data_in[7:0]`

Output: `data_out_tx`

When enabled, the module loads a frame into a shift register. When enable is low, it shifts the frame out serially.

### Receiver — `uart_rx`

Inputs: `clk`, `reset`, `data_in`

Output: `data_out_rx[7:0]`

The receiver waits for a low start condition, collects bits into an internal shift register, and checks the received parity before updating the output.

### Top level — `uart_top`

Inputs: `clk`, `reset`, `enable`, `data_in[7:0]`

Output: `data_out[7:0]`

The top-level module connects the serial TX output to the RX input, allowing a basic loopback experiment.

## Simulation

Compile the files under `rtl/` with the desired testbench under `testbench/`, selecting one of the following as the simulation top:

- `tb_tx`
- `tb_rx`
- `tb_uart`

The testbenches use clocked stimulus and delays to exercise sample input patterns. They do not include a complete automated pass/fail scoreboard.

## Notes and possible improvements

- Implement and connect the receive baud-rate timing.
- Define and verify a consistent UART sampling rate and bit timing.
- Add reset/idle behavior and a ready/busy interface to the transmitter.
- Add assertions or a self-checking loopback test for data and parity errors.

## Tools

- Verilog HDL
- Event-driven digital logic simulation (for example, QuestaSim, ModelSim, or Icarus Verilog)
