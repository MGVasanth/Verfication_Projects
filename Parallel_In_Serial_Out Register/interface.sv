

interface piso_interface(input logic clock);

  logic reset,load;

  logic [3:0] parallel_in;
  logic serial_out;

endinterface: piso_interface