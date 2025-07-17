
class operation_sequencer extends uvm_sequencer #(operation);
	`uvm_component_utils(operation_sequencer);
	operation op;
	function new(string name="operation_sequencer",uvm_component parent);
	super.new(name,parent);
	`uvm_info("TRACE",$sformatf("%m"),UVM_HIGH);
	endfunction

	virtual function void build_phase(uvm_phase phase);
       super.build_phase(phase);
 	`uvm_info("TRACE", $sformatf("%m Strating sequence"), UVM_HIGH);
	op=operation::type_id::create("op",this);
	
endfunction

	virtual task run_phase(uvm_phase phase);
	super.run_phase(phase);
	
endtask


endclass
