// Code your testbench here
// or browse Examples
`timescale 1ns/1ps

module ALU_tb;

reg [7:0] A;
reg [7:0] B;
reg [2:0] SEL;
wire [7:0] RESULT;

// Instantiate ALU
ALU uut(
    .A(A),
    .B(B),
    .SEL(SEL),
    .RESULT(RESULT)
);

// Create VCD for EPWave/GTKWave
initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, ALU_tb);
end

initial begin
    // Print header
    $display("Time | A (dec) | B (dec) | SEL | Operation | RESULT (dec) | RESULT (bin)");
    $display("---------------------------------------------------------------");

    // Test cases
    A = 8'd10; B = 8'd5;   SEL = 3'b000; #20; // ADD: expect 15
    $display("%0t | %0d | %0d | %b | ADD | %0d | %b",$time,A,B,SEL,RESULT,RESULT);

    A = 8'd20; B = 8'd7;   SEL = 3'b001; #20; // SUB: expect 13
    $display("%0t | %0d | %0d | %b | SUB | %0d | %b",$time,A,B,SEL,RESULT,RESULT);

    A = 8'b11001100; B = 8'b10101010; SEL = 3'b010; #20; // AND
    $display("%0t | %0b | %0b | %b | AND | %0d | %b",$time,A,B,SEL,RESULT,RESULT);

    A = 8'b11001100; B = 8'b10101010; SEL = 3'b011; #20; // OR
    $display("%0t | %0b | %0b | %b | OR  | %0d | %b",$time,A,B,SEL,RESULT,RESULT);

    A = 8'b11110000; B = 8'b00000000; SEL = 3'b100; #20; // NOT
    $display("%0t | %0b | %0b | %b | NOT | %0d | %b",$time,A,B,SEL,RESULT,RESULT);

    // Additional tests: overflow checks
    A = 8'd200; B = 8'd100; SEL = 3'b000; #20; // ADD overflow check
    $display("%0t | %0d + %0d => %0d | %b",$time,A,B,RESULT,RESULT);

    $finish;
end

endmodule
