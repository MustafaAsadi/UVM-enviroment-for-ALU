
class alu_env extends uvm_env;
`uvm_component_utils(alu_env)
operation_sequencer sqr;

input_agent i_agt;
output_agent o_agt;

virtual alu_int vif;

scoreboard score;

function new(string name ="uvm_env" , uvm_component parent);
	super.new(name,parent);
	`uvm_info("TRACE",$sformatf("%m"),UVM_HIGH);
endfunction

virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
`uvm_info("TRACE",$sformatf("%m"),UVM_HIGH);

i_agt=input_agent::type_id::create("i_agt",this);
o_agt=output_agent::type_id::create("o_agt",this);
score=scoreboard::type_id::create("score",this);


uvm_config_db#(virtual alu_int)::get(this,"","vif",vif);
uvm_config_db#(virtual alu_int)::set(this,"*","vif",vif);
uvm_config_db#(operation_sequencer)::set(this, "i_agt", "op_sqr", sqr);

endfunction

virtual function void connect_phase(uvm_phase phase);
super.connect_phase(phase);
     i_agt.iM.a_port.connect(score.before_export);
     o_agt.oM.a_port.connect(score.after_export);


endfunction

endclass
