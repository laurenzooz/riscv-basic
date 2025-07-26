
// Define a module for an AND gate
module and_gate (
    input wire a,
    input wire b,
    output wire out
);
    // The behavior of the AND gate
    assign out = a & b;
endmodule

