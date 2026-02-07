# StreamNTT-VTR Benchmark

This repository provides a reproducible benchmarking harness to evaluate StreamNTT sub-kernels with the Verilog-to-Routing (VTR) toolchain for architecture-level benchmarking, not a specific commercial FPGA.
It includes ready-to-run wrappers/constraints and VTR outputs for:
- **ICBU (bf_unit)**
- **L-stage**
- **X-stage**
- **StreamNTT instance without HBM and AXI** (on-chip only)

We use the COFFE 22nm architecture model [`k6FracN10LB_mem20K_complexDSP_customSB_22nm`](https://github.com/verilog-to-routing/vtr-verilog-to-routing/blob/896108bb1b6f4e7858932b3a7753f950fc18fa34/vtr_flow/arch/COFFE_22nm/k6FracN10LB_mem20K_complexDSP_customSB_22nm.xml).

## What this repo produces

For each run, VTR generates:
- **Resource usage** (CLB  / I/O / Mem / Mult, etc.)
- **Post-P&R estimated Freq** (from VPR timing analysis)
- Intermediate netlists and reports are under `temp/`, e.g. **post-synthesis netlist / SDF**
- A parsed summary file: **results/parse_results.txt**

## Folder Structure

```
StreamNTT-VTR-benchmark/
├── Makefile                    
├── README.md                   
├── verilog/                                      # Verilog benchmark files
│   ├── top.v                                     # Example top-level Verilog file (should be replaced by “transparent wrapper” for each kernel (bf_unit / l_stages / x_stages / ntt_core) so the kernel can be synthesized and P&R’ed by VTR)
│   └── ...                                       # Additional Verilog files
├── results/                                      # Output directory for parsed results
├── temp/                                         # Temporary files from VTR runs
├── vtr-verilog-to-routing/                       # VTR submodule
├── parse_config.txt                              # Configuration for result parsing
└── N1024_BU4_CH16_q3221225473/                   # Example parameter setting
    ├── ICBU/                                     
    │   ├── verilog/                              # wrapper RTL + top.sdc + ROM .dat (if any)
    │   ├── temp/                                 # VTR working dir + reports + (optional) post_synth netlist/SDF
    │   └── results/                              # parsed summary (e.g., parse_results.txt)
    ├── L-stage/                                  
    ├── X-stage/                                  
    └── StreamNTT_instance_without_HBM_and_AXI/   
```

## Re-run VTR (Flow B) on the provided benchmarks

1. **Clone the Repo**:
   ```bash
   git clone https://github.com/Xiaoyi-1017/StreamNTT-VTR-benchmark.git
   cd StreamNTT-VTR-benchmark
   ```

2. **Add Benchmark Files**:
   - The way to reproduce/rerun a specific BENCH's VTR (recommended reproducibility) is:
   ```bash
   rm -rf verilog/* temp/* results/*
   cp -a N1024_BU4_CH16_q3221225473/<BENCH>/verilog/* verilog/
   mkdir -p temp
   cp -a verilog/*.dat temp/
   ```
   - Some HLS-generated ROMs reference `.dat` via relative paths. Since VTR runs synthesis in `temp/`, we copy `.dat` into `temp/` to satisfy relative-path lookup.
   ```bash
   mkdir -p temp
   cp -a verilog/*.dat temp/
   ```
   - Ensure the top-level module in `verlog/` is named `top.v` (or update the Makefile's `run-vtr-flow` target accordingly) if you want to change the wrapper.

3. **Setup and Build VTR**:
   ```bash
   make setup
   ```
   This will initialize submodules, install dependencies, build VTR, and run a basic test to verify installation.

4. **Run the VTR Flow**:
   ```bash
   make run
   ```
   This executes the VTR flow on your Verilog files and parses the results into the `results/` directory. You can read our frozen results by checking `N1024_BU4_CH16_q3221225473/<BENCH>/results/parse_results.txt`. But CLB here refers to VTR’s logic blocks in the COFFE 22nm model and does not map 1:1 to AMD/Xilinx CLB.

5. **Clean Up**:
   ```bash
   make clean
   ```
   Removes temporary and result files.

## (Optional) Start from upstream StreamNTT (Flow A)

If you want to regenerate StreamNTT artifacts from scratch (TAPA/Vitis + RapidStream), start from [StreamNTT](https://github.com/applesforme/StreamNTT). Flow A is not required to use this repo; it is optional for regenerating XO/RTL and comparing with commercial toolchains.

## Available Make Targets

- `make help`: Show available targets.
- `make setup`: Build VTR and run tests.
- `make test-vtr`: Run VTR regression tests.
- `make run`: Execute VTR flow and parse results.
- `make clean`: Clean temporary files.
