# RVYNQ-v1
## Single Cycle RISC-V/32I CPU

RISC V is an open-source Load-Store architecture-based ISA which, supported by many international companies. Thanks to the open-source licensing it provides, it takes a place itself more and more in today's computer technologies. Thanks to the expandable features it supports, it can be used in many places from embedded devices to supercomputers. In this study, we introduce the RISC-V ISA sets selected for our 32-Bit microprocessor implementation comprising base integer RV32I. This base ISA includes six different instruction types which are R, I, S, B, U and J. With this classification structure, the implementation of the instructions in hardware has become easier.

The open-source nature of this RISCV architecture paves the way for improvements to the architecture's instruction set and can adapt to various security needs. The 32-bit processor using the RISCV instruction set architecture will be developed in line with the advantages of open source of micro-architecture which are mentioned slightly above. We will design and develop our custom system in the hardware side at VHDL-level. Our custom RISC-V system will be developed and implemented on ZedBoard development card. The performance tests of the developed processor will be done with the benchmark applications that are currently used as common. 


## Feature Work   ✨ 

- Development of multi-cycle processor
- Development of pipelined processor 
- Adding a new instruction to accelerate specific operation

## Project Structure
##
|Directory|Definition|
|---------|----------|
| **/docs**| Resources used during development. |
|**/project_2016_v4**| Vivado 2016.4 project to test the study.|
|**/rtl**| RTL implementations of modules in VHDL.|
|**/tests**| Test bench files to see functionality.|
|**/utils**| Other helpful tools.|

## Who we are ?
- **Supervisor** : Dr. Ismail San
- **Contributor** : Bachelor Student Beyazit Isik
- **Contributor** : Bachelor Student Dogukan Gozler

## License

MIT


