class scoreboard extends uvm_scoreboard;
	`uvm_component_utils(scoreboard)
	uvm_analysis_export#(operation) before_export;
	uvm_analysis_export#(operation) after_export;
  	uvm_analysis_imp#(operation, scoreboard) before_imp;
  	uvm_analysis_imp#(operation, scoreboard) after_imp;
	
	operation before_q[$]; 
	int i = 0;
	int j = 0;

	parameter ADD = 3'd0;
	parameter SUB = 3'd1;
	parameter AND = 3'd2;
	parameter OR  = 3'd3;
	parameter MUL = 3'd4;
	parameter DIV = 3'd5;
	

	
	function new(string name="scoreboard",uvm_component parent);
		super.new(name,parent);
		`uvm_info("TRACE",$sformatf("%m SCOREBOARD HAS BEEN CREATED"),UVM_HIGH)	
		
	endfunction


	virtual function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	`uvm_info("TRACE",$sformatf("%m"),UVM_HIGH)
	before_export = new("before_export",this);
	after_export = new("after_export",this);
   	before_imp = new("before_imp", this);
   	after_imp  = new("after_imp", this);
	

endfunction


	virtual function void connect_phase(uvm_phase phase);
	super.connect_phase(phase);
	`uvm_info("TRACE",$sformatf("%m connect phase has exectued"),UVM_HIGH)
   	 before_export.connect(before_imp);
    	after_export.connect(after_imp);

  endfunction


	virtual function void write_before(operation op);
	`uvm_info("SCOREBOARD", $sformatf("Before Monitor Received: %s", op.convert2string()), UVM_MEDIUM);
	 $display("BEFORE_SCOREBOARD A:%0h B:%0h OPCODE:%0h",op.A,op.B,op.opcode);
	 before_q.push_back(op);
	 i++;


endfunction





virtual function void write_after(operation op);
    `uvm_info("SCOREBOARD", $sformatf("After Monitor Received: %s", op.convert2string()), UVM_MEDIUM);
    $display("AFTER_SCOREBORAD RESULT:%0h, OVERFLOW:%0h, ZERO:%0h, CARRY:%0h", op.result, op.overflow, op.zero, op.carry);

    case(before_q[j].opcode)
        ADD: begin
            logic [15:0] full_result;
            full_result = before_q[j].A + before_q[j].B;
            assert((op.result == before_q[j].A + before_q[j].B) && 
                   (op.overflow == ((before_q[j].A[7] == before_q[j].B[7]) && (op.result[7] != before_q[j].A[7]))) && 
                   op.carry == full_result[8] && (op.zero == (op.result == 0))) 
            else 
                `uvm_fatal("FAIL", $sformatf("ADD OPERATION HAS FAILED  => result=%0h , A=%0h , B=%0h , overflow=0%h , zero=%0h , carry=%0h", 
                                            op.result, before_q[j].A, before_q[j].B, op.overflow, op.zero, op.carry));
            $display("ADD OPERATION HAS SUCCEEDED");
        end

        SUB: begin
            logic [15:0] full_result;
            full_result = before_q[j].A - before_q[j].B;
            assert((op.result == before_q[j].A - before_q[j].B) && 
                   (op.overflow == ((before_q[j].A[7] != before_q[j].B[7]) && (op.result[7] != before_q[j].A[7]))) && 
                   op.carry == ~(full_result[8]) && (op.zero == (op.result == 0))) 
            else 
                `uvm_fatal("FAIL", $sformatf("SUB OPERATION HAS FAILED  => result=%0h , A=%0h , B=%0h , overflow=%0h , zero=%0h , carry=%0h", 
                                            op.result, before_q[j].A, before_q[j].B, op.overflow, op.zero, op.carry));
            $display("SUB OPERATION HAS SUCCEEDED");
        end

        AND: begin
            assert((op.result == (before_q[j].A & before_q[j].B)) && 
                   (op.overflow == 0) && 
                   (op.carry == 0) && 
                   (op.zero == (op.result == 0)))
            else 
                `uvm_fatal("FAIL", $sformatf("AND OPERATION HAS FAILED  => result=%0h , A=%0h , B=%0h , overflow=%0h , carry=0%h , zero=0%h", 
                                            op.result, before_q[j].A, before_q[j].B, op.overflow, op.carry, op.zero));
            $display("AND OPERATION HAS SUCCEEDED");
        end

        OR: begin
            assert((op.result == (before_q[j].A | before_q[j].B)) && 
                   (op.overflow == 0) && 
                   (op.carry == 0) && 
                   (op.zero == (op.result == 0)))
            else 
                `uvm_fatal("FAIL", $sformatf("OR OPERATION HAS FAILED  => result=%0h , A=%0h , B=%0h , overflow=%0h , carry=0%h , zero=0%h", 
                                            op.result, before_q[j].A, before_q[j].B, op.overflow, op.carry, op.zero));
            $display("OR OPERATION HAS SUCCEEDED");
        end

        MUL: begin
            logic [15:0] full_result;
            full_result = before_q[j].A * before_q[j].B;
            assert((op.result == full_result[7:0]) &&
                   (op.overflow == (full_result[15:8] != 0)) &&
                   (op.carry == full_result[8]) &&
                   (op.zero == (op.result == 0)))
            else 
                `uvm_fatal("FAIL", $sformatf("MUL OPERATION HAS FAILED => result=%0h , A=%0h , B=%0h , overflow=%0h , carry=0%h , zero=0%h", 
                                            op.result, before_q[j].A, before_q[j].B, op.overflow, op.carry, op.zero));
            $display("MUL OPERATION HAS SUCCEEDED");
        end

	DIV: begin
	
	           assert((((op.result == before_q[j].A/before_q[j].B) &&
                   (op.overflow == 0)) &&
                   (op.carry == 0) &&
                   (op.zero == (op.result == 0))) || ((before_q[j].B == 0) && (op.result==0) && (op.carry==0) && (op.overflow==1) && (op.zero == (op.result == 0))))
            else 
                `uvm_fatal("FAIL", $sformatf("DIV OPERATION HAS FAILED => result=%0h , A=%0h , B=%0h , overflow=%0h , carry=0%h , zero=0%h", 
                                            op.result, before_q[j].A, before_q[j].B, op.overflow, op.carry, op.zero));
            $display("DIV OPERATION HAS SUCCEEDED");
	


	end

    endcase 

    j++;

endfunction




function void write(operation t);
    if (t.source_id == "before") begin
        write_before(t);
    end
    else if (t.source_id == "after") begin
        write_after(t);
    end
    else begin
        `uvm_warning("UNKNOWN_SRC", "Received operation from unknown source");
    end
endfunction



endclass
