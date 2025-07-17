
`include "uvm_macros.svh"
import uvm_pkg::*;

class operation extends uvm_sequence_item;


rand bit[7:0] A,B;
rand bit[2:0]opcode;
bit [7:0]result;
bit zero,overflow,carry;

string source_id;


constraint opcode_range {
opcode inside {[0:5]};
};

covergroup alu_in_cov;
coverpoint A {
bins first_two_bits = {[0:3]};
bins low_mid_two_bits = {[4:15]};
bins high_mid_two_bits = {[16:63]};
bins last_two_bits={[64:255]};
bins even = {[0:255]} iff (A%2==0);
bins odd  = {[0:255]} iff (A&2!=0);
}
coverpoint B {
bins first_two_bits = {[0:3]};
bins low_mid_two_bits = {[4:15]};
bins high_mid_two_bits = {[16:63]};
bins last_two_bits={[64:255]};
bins even = {[0:255]} iff (B%2==0);
bins odd  = {[0:255]} iff (B&2!=0);
}
coverpoint opcode {
bins add = {0};
bins sub = {1};
bins and_op = {2};
bins or_op  = {3};
bins mul = {4};
bins div = {5};
}
cross A,B,opcode;
endgroup

`uvm_object_utils_begin(operation)
`uvm_field_int(A,UVM_ALL_ON | UVM_NOCOMPARE)
`uvm_field_int(B,UVM_ALL_ON | UVM_NOCOMPARE)
`uvm_field_int(opcode,UVM_ALL_ON | UVM_NOCOMPARE)
`uvm_field_int(result,UVM_ALL_ON)
`uvm_field_int(zero,UVM_ALL_ON)
`uvm_field_int(overflow,UVM_ALL_ON)
`uvm_object_utils_end

function new(string name="operation");
super.new(name);
`uvm_info("TRACE",$sformatf("%m"), UVM_HIGH)
alu_in_cov = new();
endfunction



endclass


