
`include "uvm_macros.svh"
import uvm_pkg::*;
 

class operation_sequence extends uvm_sequence #(operation);

  `uvm_object_utils(operation_sequence)
  operation op_tr;
  virtual alu_int vif;
  int sequence_conter = 0;

  function new(string name = "operation_sequence");
    super.new(name);
    `uvm_info("TRACE", "Constructor", UVM_HIGH);
  endfunction

  virtual task body();

    `uvm_info("TRACE", "Starting body of operation_sequence", UVM_HIGH);

while($get_coverage() < 99) begin

`uvm_do(op_tr);
op_tr.alu_in_cov.sample();
      $display("SEQUENCE: A = %0h, B = %0h, OPCODE = %0h", op_tr.A, op_tr.B, op_tr.opcode);
      $display("COVERAGE: %0.2f",$get_coverage());
      $display("SEQUENCE #%0d",sequence_conter++);
      $display("--------------------------------------------------------------------------------------------------------------------------------------------");

    end
  endtask: body

  `ifdef UVM_VERSION_1_1
  virtual task pre_start(); 
    `uvm_info("TRACE", "pre_start", UVM_HIGH)
    if ((get_parent_sequence() == null) && (starting_phase != null)) begin
      starting_phase.raise_objection(this);
    end
  endtask

  virtual task post_start();
    `uvm_info("TRACE", "post_start", UVM_HIGH)
    if ((get_parent_sequence() == null) && (starting_phase != null)) begin
      starting_phase.drop_objection(this);
    end
  endtask
  `endif

endclass

