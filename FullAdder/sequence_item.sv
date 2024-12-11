//Object class


class fadd_sequence_item extends uvm_sequence_item;
  `uvm_object_utils(fadd_sequence_item)

  //--------------------------------------------------------
  //Instantiation
  //--------------------------------------------------------
  rand logic reset;
  rand logic a, b, cin;
  
  
   logic S;//output
   logic Cout;// output
  
  
  
  //--------------------------------------------------------
  //Constructor
  //--------------------------------------------------------
  function new(string name = "fadd_sequence_item");
    super.new(name);

  endfunction: new

endclass: fadd_sequence_item