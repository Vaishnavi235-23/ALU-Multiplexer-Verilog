// Code your design here
// ------------------------------
// Basic ALU Design (8-bit)
// ------------------------------
module ALU (
    input  [7:0] A,      // Operand A
    input  [7:0] B,      // Operand B
    input  [2:0] SEL,    // Select Line
    output reg [7:0] RESULT
);

always @(*) begin
    case (SEL)
        3'b000: RESULT = A + B;   // ADD
        3'b001: RESULT = A - B;   // SUB
        3'b010: RESULT = A & B;   // AND
        3'b011: RESULT = A | B;   // OR
        3'b100: RESULT = ~A;      // NOT (only A)
        default: RESULT = 8'b00000000;
    endcase
end

endmodule
