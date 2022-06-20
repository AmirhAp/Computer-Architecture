module PC ( input clk,
            input is_jump,
            input is_jr,  input jr,
            input is_beq, input beq,
            input is_bne, input bne,
            input is_bgt, input bgt,
            input [31:0] j_address,
            input [31:0] jr_address,
            input [31:0] B_address,
            input [31:0] in,
            output reg [31:0] out 
            );

            always @ (clk)
            begin 
                  if (is_jump) 
                        out = j_address;
                  else if (is_jr & jr) 
                        out = jr_address;
                  else if ((is_beq & beq) | (is_bne & bne) | (is_bgt & bgt))
                        out = in + B_address;
                  else 
                        out = in + 1;
            end 
      
endmodule