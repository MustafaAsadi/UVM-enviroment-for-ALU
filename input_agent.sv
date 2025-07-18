`include "uvm_macros.svh"
import uvm_pkg::*;

class input_agent extends uvm_agent;
`uvm_component_utils(input_agent)

operation_sequencer op_sqr;
alu_driver alu_dr;
iMonitor iM;
virtual alu_int vif;
uvm_analysis_port#(operation) a_port;

function new(string name="input_agent",uvm_component parent);
super.new(name,parent);
`uvm_info("TRACE",$sformatf("%m"),UVM_HIGH);
endfunction

virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
`uvm_info("TRACE",$sformatf("%m"),UVM_HIGH);
uvm_config_db#(uvm_active_passive_enum)::set(this, "env_t.i_agt", "is_active", UVM_ACTIVE);

a_port=new("a_port",this);



op_sqr=operation_sequencer::type_id::create("op_sqr",this);
alu_dr=alu_driver::type_id::create("alu_dr",this);


iM=iMonitor::type_id::create("iM",this);

uvm_config_db#(virtual alu_int)::get(this,"","vif",vif);
uvm_config_db#(virtual alu_int)::set(this,"*","vif",vif);
`uvm_info("TRACE vif has been set",$sformatf("%m"),UVM_HIGH);

endfunction

virtual function void connect_phase(uvm_phase phase);
super.connect_phase(phase);
alu_dr.seq_item_port.connect(op_sqr.seq_item_export);

iM.a_port.connect(this.a_port);

endfunction



endclass
