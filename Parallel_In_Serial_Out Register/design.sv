

// Code your design here
module piso_shift_register(
    input wire clock,         // Clock signal
    input wire reset,       // Synchronous reset signal
    input wire load,        // Load enable signal
  	input wire [3:0] parallel_in, // Parallel input data
    output wire serial_out  // Serial output
);
    // Internal register to store the shift register data
  	reg [3:0] shift_reg;

    // Shift register operation
  always @(posedge clock) begin
        if (reset) begin
            shift_reg <= 0;          // Reset the shift register to all zeros
        end else if (load) begin
            shift_reg <= parallel_in; // Load parallel data into the shift register
        end else begin
          shift_reg <= {shift_reg[2:0], 1'b0}; // Shift left and insert 0
        end
    end

    // Assign serial_out to the most significant bit of the shift register
  assign serial_out = shift_reg[3];

endmodule
