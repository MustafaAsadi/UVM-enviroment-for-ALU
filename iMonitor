`include "uvm_macros.svh"
import uvm_pkg::*;
class iMonitor extends uvm_monitor;
    uvm_analysis_port#(operation) a_port;
    virtual alu_int vif;
    `uvm_component_utils(iMonitor)
    
    operation op_tr;

    
    function new(string name = "iMonitor", uvm_component parent);
        super.new(name, parent);
        `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
    endfunction
    
    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
     
        uvm_config_db#(virtual alu_int)::get(this, "", "vif", vif);
        if (vif == null) begin
            `uvm_fatal("VIF_NULL", "Virtual interface 'vif' is not set in iMonitor!");  
    end
        
           a_port = new("a_port", this);
        
               op_tr = operation::type_id::create("op_tr", this);
    endfunction

    virtual function void end_of_elaboration_phase(uvm_phase phase);
        super.end_of_elaboration_phase(phase);
        `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
              if (vif == null) begin
            `uvm_fatal("CFGERR", "Interface for iMonitor not set"); 
    end
    endfunction

    virtual function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        `uvm_info("CONNECT_PHASE", "iMonitor's connect_phase is executing", UVM_HIGH);
    endfunction
    
    virtual task run_phase(uvm_phase phase);
        super.run_phase(phase);
        
        forever begin
            #1;              
            op_tr = operation::type_id::create("op_tr", this);
            
            op_tr.A = vif.A;    
            op_tr.B = vif.B;   
	    op_tr.opcode = vif.opcode; 
	    op_tr.source_id="before";
            a_port.write(op_tr);             
            op_tr.print();  
	    $display("IN_MONITOR: A = %0h, B = %0h, OPCODE = %0h", vif.A, vif.B, vif.opcode);  
    end
    endtask
endclass


