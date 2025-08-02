module and_gate (
    input wire a,
    input wire b,
    output wire out
);
    // The behavior of the AND gate
    and (out, a, b);
endmodule

// Define testbench 
module and_gate_tb;
    // Declare variables for the inputs and output
    reg a, b;
    wire out;

    // Instantiate the AND gate module
    and_gate uut (
        .a(a),
        .b(b),
        .out(out)
    );

    // Stimulus generation
    initial begin
        // Initialize Inputs
        a = 0;
        b = 0;

        // Dump variables to VCD file
        $monitor("a = %b, b = %b, out = %b", a, b, out);

        $dumpfile("and_gate_tb.vcd");
        $dumpvars(0, and_gate_tb);

        // Apply input combinations
        #10 a = 0; b = 1;
        #10 a = 1; b = 0;
        #10 a = 1; b = 1;

        // End simulation
        #10 $finish;
    end
endmodule
