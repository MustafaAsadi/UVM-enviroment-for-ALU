
`include "uvm_macros.svh"
import uvm_pkg::*;




class alu_driver extends uvm_driver #(operation);
    virtual alu_int vif;  
    `uvm_component_utils(alu_driver)

    operation op_tr;

    function new(string name = "alu_driver", uvm_component parent);
        super.new(name, parent);
        `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
        uvm_config_db#(virtual alu_int)::get(this, "", "vif", vif);
        
        op_tr = operation::type_id::create("op_tr", this);
    endfunction

    virtual task run_phase(uvm_phase phase);
        super.run_phase(phase);
        `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
        
        forever begin
            seq_item_port.get_next_item(op_tr);
            uvm_config_db#(virtual alu_int)::set(this, "*", "vif", vif);
      
            vif.A = op_tr.A;
            vif.B = op_tr.B;
            vif.opcode = op_tr.opcode;
	    vif.valid=0;

	    #1;

	    vif.valid=1;
             $display("DRIVER: A = %0h, B = %0h, OPCODE = %0h", vif.A, vif.B, vif.opcode);

            seq_item_port.item_done();
        end
    endtask
endclass
