class output_agent extends uvm_agent;
	`uvm_component_utils(output_agent)
	operation_sequencer op_sqr;
	oMonitor oM;
	virtual alu_int vif;
	uvm_analysis_port#(operation) a_port;

	function new(string name="output_agent",uvm_component parent);
		super.new(name,parent);
		`uvm_info("TRACE",$sformatf("%m"),UVM_HIGH)


	endfunction

	virtual function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	`uvm_info("TRACE",$sformatf("%m"),UVM_HIGH);
	op_sqr=operation_sequencer::type_id::create("op_tr",this);
	oM = oMonitor::type_id::create("oM",this);
	a_port=new("a_port",this);
	uvm_config_db#(virtual alu_int)::get(this,"","vif",vif);
	uvm_config_db#(virtual alu_int)::set(this,"*","vif",vif);
	endfunction


virtual function void connect_phase(uvm_phase phase);
oM.a_port.connect(this.a_port);


endfunction




endclass
