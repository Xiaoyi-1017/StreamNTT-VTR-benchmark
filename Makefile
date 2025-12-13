# WDSFPGA Benchmark Template Makefile
# This Makefile provides targets for setting up, building, testing, and running VTR (Verilog-to-Routing).

VTR_DIR := vtr-verilog-to-routing
RESULTS := results
TEMP := temp
NPROC := $(shell nproc)

.PHONY: help setup test run clean

help:
	@echo "Usage: make <target>"
	@echo ""
	@echo "Available targets:"
	@echo "  help         - Show this help message."
	@echo "  setup        - Setup VTR environment and build."
	@echo "  test         - Run basic regression test to verify VTR installation."
	@echo "  run          - Run VTR flow on Verilog files."
	@echo "  clean        - Clean VTR run files."

# Setup VTR environment and build
setup: build-vtr test

build-vtr:
	@echo "Building VTR ..."
	git submodule update --init --recursive
	cd $(VTR_DIR) && \
		./install_apt_packages.sh && \
		make env && \
		.venv/bin/pip install -r requirements.txt && \
		make -j$(NPROC)
	@echo "VTR build complete."
	

# Run basic regression test to verify VTR installation
test:
	@echo "Running basic regression test..."
	$(VTR_DIR)/.venv/bin/python3 $(VTR_DIR)/vtr_flow/scripts/run_vtr_task.py $(VTR_DIR)/vtr_flow/tasks/regression_tests/vtr_reg_basic/basic_timing
	@echo "Test complete."

# Run VTR flow on Verilog files and parse results
run: run-vtr-flow parse-vtr-flow

run-vtr-flow:
	@echo "Running VTR flow on Verilog files..."
	$(VTR_DIR)/.venv/bin/python3 $(VTR_DIR)/vtr_flow/scripts/run_vtr_flow.py ./verilog/top.v $(VTR_DIR)/vtr_flow/arch/COFFE_22nm/k6FracN10LB_mem20K_complexDSP_customSB_22nm.xml -include $(filter-out ./verilog/top.v, $(wildcard ./verilog/*.v))
	@echo "VTR flow run complete."

parse-vtr-flow:
	@echo "Parsing VTR flow results..."
	@mkdir -p $(RESULTS)
	$(VTR_DIR)/.venv/bin/python3 $(VTR_DIR)/vtr_flow/scripts/python_libs/vtr/parse_vtr_flow.py $(TEMP) parse_config.txt > $(RESULTS)/parse_results.txt || true
	@sh -c 'cp -f $(TEMP)/*.pre-vpr.blif $(RESULTS)/ 2>/dev/null || true'
	@echo "Parsing complete."
	    
# clean run files
clean:
	@echo "Cleaning run files..."
	@rm -rf $(TEMP)
	@rm -f $(RESULTS)/parse_results.txt $(RESULTS)/*.pre-vpr.blif
	@echo "Run files cleaned."