

class fadd_scoreboard extends uvm_test;
  `uvm_component_utils(fadd_scoreboard)
  
  uvm_analysis_imp #(fadd_sequence_item, fadd_scoreboard) scoreboard_port;
  
  fadd_sequence_item transactions[$];
  
  
  //--------------------------------------------------------
  //Constructor
  //--------------------------------------------------------
  function new(string name = "fadd_scoreboard", uvm_component parent);
    super.new(name, parent);
    `uvm_info("SCB_CLASS", "Inside Constructor!", UVM_HIGH)
  endfunction: new
  
  
  //--------------------------------------------------------
  //Build Phase
  //--------------------------------------------------------
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("SCB_CLASS", "Build Phase!", UVM_HIGH)
   
    scoreboard_port = new("scoreboard_port", this);
    
  endfunction: build_phase
  
  
  //--------------------------------------------------------
  //Connect Phase
  //--------------------------------------------------------
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("SCB_CLASS", "Connect Phase!", UVM_HIGH)
    
   
  endfunction: connect_phase
  
  
  //--------------------------------------------------------
  //Write Method
  //--------------------------------------------------------
  function void write(fadd_sequence_item item);
    transactions.push_back(item);
  endfunction: write 
  
  
  
  //--------------------------------------------------------
  //Run Phase
  //--------------------------------------------------------
  task run_phase (uvm_phase phase);
    super.run_phase(phase);
    `uvm_info("SCB_CLASS", "Run Phase!", UVM_HIGH)
   
    forever begin
      /*
      // get the packet
      // generate expected vfadde
      // compare it with actual vfadde
      // score the transactions accordingly
      */
      fadd_sequence_item curr_trans;
      wait((transactions.size() != 0));
      curr_trans = transactions.pop_front();
      compare(curr_trans);
      
    end
    
  endtask: run_phase
  
  
  
  //--------------------------------------------------------
  //Compare : Generate Expected Result and Compare with Actual
  //--------------------------------------------------------
  task compare(fadd_sequence_item curr_trans);
    
   
    
    logic expected;
    logic actual;
  
    expected = (curr_trans.a ^ curr_trans.b ^ curr_trans.cin);
    
    actual = curr_trans.S;
    
    if(actual != expected) begin
      `uvm_error("COMPARE", $sformatf("Transaction failed! ACT=%d, EXP=%d", actual, expected))
    end
    else begin
      // Note: Can display the input and op_code as well if you want to see what's happening
      `uvm_info("COMPARE", $sformatf("Transaction Passed! ACT=%d, EXP=%d", actual, expected), UVM_LOW)
    end
    
  endtask: compare
  
  
endclass: fadd_scoreboard