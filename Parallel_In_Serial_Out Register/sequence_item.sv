//Object class


class piso_sequence_item extends uvm_sequence_item;
  `uvm_object_utils(piso_sequence_item)

  //--------------------------------------------------------
  //Instantiation
  //--------------------------------------------------------
  rand logic reset;
  rand logic load;
  rand logic [3:0] parallel_in;
  
  logic serial_out; //output
   // output

  //--------------------------------------------------------
  //Default Constraints
  //--------------------------------------------------------
 
  
  //--------------------------------------------------------
  //Constructor
  //--------------------------------------------------------
  function new(string name = "piso_sequence_item");
    super.new(name);

  endfunction: new

endclass: piso_sequence_item