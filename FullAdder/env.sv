
class fadd_env extends uvm_env;
  `uvm_component_utils(fadd_env)
  
  fadd_agent agnt;
  fadd_scoreboard scb;
  
  
  //--------------------------------------------------------
  //Constructor
  //--------------------------------------------------------
  function new(string name = "fadd_env", uvm_component parent);
    super.new(name, parent);
    `uvm_info("ENV_CLASS", "Inside Constructor!", UVM_HIGH)
  endfunction: new
  
  
  //--------------------------------------------------------
  //Build Phase
  //--------------------------------------------------------
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("ENV_CLASS", "Build Phase!", UVM_HIGH)
    
    agnt = fadd_agent::type_id::create("agnt", this);
    scb = fadd_scoreboard::type_id::create("scb", this);
    
  endfunction: build_phase
  
  
  //--------------------------------------------------------
  //Connect Phase
  //--------------------------------------------------------
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("ENV_CLASS", "Connect Phase!", UVM_HIGH)
    
    agnt.mon.monitor_port.connect(scb.scoreboard_port);
    
  endfunction: connect_phase
  
  
  //--------------------------------------------------------
  //Run Phase
  //--------------------------------------------------------
  task run_phase (uvm_phase phase);
    super.run_phase(phase);
    
  endtask: run_phase
  
  
endclass: fadd_env