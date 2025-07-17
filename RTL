
module ALU (
    input  logic [7:0] A, B,
    input  logic [2:0] opcode,
    output logic [7:0] result,
    output logic       zero, overflow, carry
);

logic [15:0] result_overflow_checker;
parameter ADD = 3'd0;
parameter SUB = 3'd1;
parameter AND = 3'd2;
parameter OR  = 3'd3;
parameter MUL = 3'd4;
parameter DIV = 3'd5;

always_comb begin
    overflow = 1'b0;
    carry    = 1'b0;

    case (opcode)
        ADD: begin
            result_overflow_checker = A + B;
            result = result_overflow_checker[7:0];
            carry = result_overflow_checker[8];
            overflow = (A[7] == B[7]) && (result[7] != A[7]); 
        end

        SUB: begin
            result_overflow_checker = A - B;
            result = result_overflow_checker[7:0];
            carry = ~result_overflow_checker[8]; 
            overflow = (A[7] != B[7]) && (result[7] != A[7]); 
        end

        AND: begin
            result = A & B;
            overflow = 0;
            carry = 0;
        end

        OR: begin
            result = A | B;
            overflow = 0;
            carry = 0;
        end

        MUL: begin
            result_overflow_checker = A * B;
            result = result_overflow_checker[7:0];
            carry = result_overflow_checker[8];
	    overflow = (result_overflow_checker[15:8] != 0);
	   
    end

        DIV: begin
            if (B != 0) begin
                result = A / B;
                carry = 0;
                overflow = 0;
            end else begin
                result = 8'h00;
                carry = 0;
                overflow = 1; 
            end
        end
    endcase

    zero = (result == 8'd0);
end

endmodule

