class oMonitor extends uvm_monitor;
	`uvm_component_utils(oMonitor);
	virtual alu_int vif;
	uvm_analysis_port#(operation) a_port;
	
	function new(string name="oMonitor" , uvm_component parent);
		super.new(name,parent);
		`uvm_info("TRACE",$sformatf("%m"),UVM_HIGH);
	endfunction

	virtual function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	`uvm_info("TRACE",$sformatf("%m"),UVM_HIGH);
	a_port = new("a_port",this);
	uvm_config_db#(virtual alu_int)::get(this,"","vif",vif);
endfunction
	
	virtual function void connect_phase(uvm_phase phase);
	super.connect_phase(phase);
	`uvm_info("CONNECT_PHASE","oMonitor's connection phase is executing",UVM_HIGH);

endfunction

	virtual task run_phase(uvm_phase phase);
	
	operation op_tr;
	forever begin
		#1;
		op_tr=operation::type_id::create("op_tr",this);
		op_tr.result=vif.result;
		op_tr.zero=vif.zero;
		op_tr.overflow=vif.overflow;
		op_tr.carry=vif.carry;
		op_tr.source_id="after";
		a_port.write(op_tr);
		$display("OUT_MONITOR: RESULT=%0h, OVERFLOW=%0d, ZERO=%0d, CARRY=%0d",op_tr.result,op_tr.overflow,op_tr.zero,op_tr.carry);
		
	end
endtask
