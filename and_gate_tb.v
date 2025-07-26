
// Define a testbench module
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
        // Initialize inputs
        a = 0;
        b = 0;

        // Apply input combinations
        #10 a = 0; b = 1;
        #10 a = 1; b = 0;
        #10 a = 1; b = 1;

        // End simulation
        #10 $finish;
    end

    // Monitor the outputs
    initial begin
        $monitor("a = %b, b = %b, out = %b", a, b, out);
    end
endmodule

