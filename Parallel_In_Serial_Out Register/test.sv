
class piso_test extends uvm_test;
  `uvm_component_utils(piso_test)

  piso_env env;
  piso_base_sequence reset_seq;
  piso_test_sequence test_seq;

  
  //--------------------------------------------------------
  //Constructor
  //--------------------------------------------------------
  function new(string name = "piso_test", uvm_component parent);
    super.new(name, parent);
    `uvm_info("TEST_CLASS", "Inside Constructor!", UVM_HIGH)
  endfunction: new

  
  //--------------------------------------------------------
  //Build Phase
  //--------------------------------------------------------
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("TEST_CLASS", "Build Phase!", UVM_HIGH)

    env = piso_env::type_id::create("env", this);

  endfunction: build_phase

  
  //--------------------------------------------------------
  //Connect Phase
  //--------------------------------------------------------
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("TEST_CLASS", "Connect Phase!", UVM_HIGH)

  endfunction: connect_phase

  
  //--------------------------------------------------------
  //Run Phase
  //--------------------------------------------------------
  task run_phase (uvm_phase phase);
    super.run_phase(phase);
    `uvm_info("TEST_CLASS", "Run Phase!", UVM_HIGH)

    phase.raise_objection(this);

    //reset_seq
    reset_seq = piso_base_sequence::type_id::create("reset_seq");
    reset_seq.start(env.agnt.seqr);
    #10;

    repeat(100) begin
      //test_seq
      test_seq = piso_test_sequence::type_id::create("test_seq");
      test_seq.start(env.agnt.seqr);
      #10;
    end
    
    phase.drop_objection(this);

  endtask: run_phase


endclass: piso_test