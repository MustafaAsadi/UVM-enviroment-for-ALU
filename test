include "uvm_macros.svh"
import uvm_pkg::*;


  module top_testbench;
alu_int test_int();

  ALU dut (
        .A(test_int.A),
        .B(test_int.B),
        .opcode(test_int.opcode),
        .result(test_int.result),
        .zero(test_int.zero),
        .overflow(test_int.overflow),
	.carry(test_int.carry)
    );

	
initial begin
    uvm_config_db#(virtual alu_int)::set(null,"*","vif",test_int);
    run_test("test_base");
    
end

endmodule
