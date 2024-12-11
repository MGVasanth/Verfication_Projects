
class piso_driver extends uvm_driver#(piso_sequence_item);
  `uvm_component_utils(piso_driver)
  
  virtual piso_interface vif;
  piso_sequence_item item;
  
  
  //--------------------------------------------------------
  //Constructor
  //--------------------------------------------------------
  function new(string name = "piso_driver", uvm_component parent);
    super.new(name, parent);
    `uvm_info("DRIVER_CLASS", "Inside Constructor!", UVM_HIGH)
  endfunction: new
  
  
  //--------------------------------------------------------
  //Build Phase
  //--------------------------------------------------------
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("DRIVER_CLASS", "Build Phase!", UVM_HIGH)
    
    if(!(uvm_config_db #(virtual piso_interface)::get(this, "*", "vif", vif))) begin
      `uvm_error("DRIVER_CLASS", "Failed to get VIF from config DB!")
    end
    
  endfunction: build_phase
  
  
  //--------------------------------------------------------
  //Connect Phase
  //--------------------------------------------------------
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("DRIVER_CLASS", "Connect Phase!", UVM_HIGH)
    
  endfunction: connect_phase
  
  
  //--------------------------------------------------------
  //Run Phase
  //--------------------------------------------------------
  task run_phase (uvm_phase phase);
    super.run_phase(phase);
    `uvm_info("DRIVER_CLASS", "Inside Run Phase!", UVM_HIGH)
    
    forever begin
      item = piso_sequence_item::type_id::create("item"); 
      seq_item_port.get_next_item(item);
      drive(item);
      seq_item_port.item_done();
    end
    
  endtask: run_phase
  
  
  //--------------------------------------------------------
  //[Method] Drive
  //--------------------------------------------------------
  task drive(piso_sequence_item item);
    @(posedge vif.clock);
    vif.reset <= item.reset;
    vif.load <= item.load;
    vif.parallel_in <= item.parallel_in;
    vif.serial_out <= item.serial_out;
  endtask: drive
  
  
endclass: piso_driver