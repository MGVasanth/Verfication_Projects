
class piso_monitor extends uvm_monitor;
  `uvm_component_utils(piso_monitor)
  
  virtual piso_interface vif;
  piso_sequence_item item;
  
  uvm_analysis_port #(piso_sequence_item) monitor_port;
  
  
  //--------------------------------------------------------
  //Constructor
  //--------------------------------------------------------
  function new(string name = "piso_monitor", uvm_component parent);
    super.new(name, parent);
    `uvm_info("MONITOR_CLASS", "Inside Constructor!", UVM_HIGH)
  endfunction: new
  
  
  //--------------------------------------------------------
  //Build Phase
  //--------------------------------------------------------
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("MONITOR_CLASS", "Build Phase!", UVM_HIGH)
    
    monitor_port = new("monitor_port", this);
    
    if(!(uvm_config_db #(virtual piso_interface)::get(this, "*", "vif", vif))) begin
      `uvm_error("MONITOR_CLASS", "Failed to get VIF from config DB!")
    end
    
  endfunction: build_phase
  
  //--------------------------------------------------------
  //Connect Phase
  //--------------------------------------------------------
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("MONITOR_CLASS", "Connect Phase!", UVM_HIGH)
    
  endfunction: connect_phase
  
  
  //--------------------------------------------------------
  //Run Phase
  //--------------------------------------------------------
  task run_phase (uvm_phase phase);
    super.run_phase(phase);
    `uvm_info("MONITOR_CLASS", "Inside Run Phase!", UVM_HIGH)
    
    forever begin
      item = piso_sequence_item::type_id::create("item");
      
      wait(!vif.reset);
      
      //sample inputs
      @(posedge vif.clock);
      vif.reset <= item.reset;
      vif.load <= item.load;
      vif.parallel_in <= item.parallel_in;
      vif.serial_out <= item.serial_out;
      //sample output
      @(posedge vif.clock);
      item.serial_out = vif.serial_out;
      
      // send item to scoreboard
      monitor_port.write(item);
    end
        
  endtask: run_phase
  
  
endclass: piso_monitor