
class test_base extends uvm_test;
  `uvm_component_utils(test_base)
   virtual alu_int vif;
  alu_env env_t;
  operation_sequence op_sqe;
  operation_sequencer sqr;
  
  function new(string name = "test_base", uvm_component parent);
    super.new(name, parent);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
  endfunction

  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
       `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
       

    env_t = alu_env::type_id::create("env_t", this);
  
    uvm_config_db#(virtual alu_int)::get(this,"","vif",vif);
     uvm_config_db#(virtual alu_int)::set(this,"*","vif",vif);
uvm_config_db#(operation_sequencer)::get(this, "env.i_agt", "op_sqr", sqr);

  endfunction



  virtual function void start_of_simulation_phase(uvm_phase phase);
    super.start_of_simulation_phase(phase);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);


    uvm_top.print_topology();            
    uvm_factory::get().print();          
  endfunction

  virtual task reset_phase(uvm_phase phase);
    phase.raise_objection(this);
  #10;
  phase.drop_objection(this);
  endtask


   function void connect_phase(uvm_phase phase);

	   super.connect_phase(phase);

   endfunction

 task run_phase(uvm_phase phase);
	 super.run_phase(phase);
	 op_sqe = operation_sequence::type_id::create("op_sqe",this);
	 phase.raise_objection(this);
	 op_sqe.start(env_t.i_agt.op_sqr);
	 #1ns;    
	 phase.drop_objection(this);
	


 endtask


endclass

