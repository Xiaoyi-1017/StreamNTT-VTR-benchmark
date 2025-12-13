# WDSFPGA Benchmark Template

This repository provides a template for submitting benchmarks to the [2nd Workshop on Domain-Specialized FPGAs](https://sites.google.com/view/domain-specialized-fpgas-2026).


- **Test Using VTR**: Before submitting your benchmark to WDSFPGA2026, ensure your design runs successfully with VTR. Use `make run` to verify the flow completes without errors and check the results in the `results/` directory.
- Customize the Makefile or scripts as needed for your specific architecture or requirements.
- Follow the [WDSFPGA2026 submission guidelines](https://sites.google.com/view/domain-specialized-fpgas-2026/calls) for additional requirements.

## Folder Structure

```
WDSFPGA-benchmark-template/
├── Makefile                    
├── README.md                   
├── verilog/                    # Verilog benchmark files
│   ├── top.v                   # Example top-level Verilog file (replace with your design)
│   └── ...                     # Additional Verilog files
├── results/                    # Output directory for parsed results
├── temp/                       # Temporary files from VTR runs
├── vtr-verilog-to-routing/     # VTR submodule
└── parse_config.txt            # Configuration for result parsing
```

## Usage

1. **Fork the Repository**:
   - Fork this [WDSFPGA Benchmark Template](https://github.com/your-repo/WDSFPGA-benchmark-template) on GitHub to create your own copy of the repository.
   - Rename your fork to something descriptive of your benchmark design (e.g., `WDSFPGA-packet-processing-benchmark`).

2. **Clone Your Fork**:
   ```bash
   git clone https://github.com/your-username/your-fork-name.git
   cd your-fork-name
   ```

3. **Add Your Benchmark Files**:
   - Place your Verilog design files in the `verilog/` directory.
   - Ensure your top-level module is named `top.v` (or update the Makefile's `run-vtr-flow` target accordingly).
   - Remove or replace any example Verilog files in `verilog/` with your own.

4. **Setup and Build VTR**:
   ```bash
   make setup
   ```
   This will initialize submodules, install dependencies, build VTR, and run a basic test to verify installation.

5. **Run the VTR Flow**:
   ```bash
   make run
   ```
   This executes the VTR flow on your Verilog files and parses the results into the `results/` directory.

6. **Clean Up**:
   ```bash
   make clean
   ```
   Removes temporary and result files.

## Available Make Targets

- `make help`: Show available targets.
- `make setup`: Build VTR and run tests.
- `make test-vtr`: Run VTR regression tests.
- `make run`: Execute VTR flow and parse results.
- `make clean`: Clean temporary files.

For more details on VTR, see the [VTR Documentation](https://docs.verilogtorouting.org/en/latest/).
