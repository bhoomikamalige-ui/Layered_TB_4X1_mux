class test;
  environment env;
  virtual intf vif;
  
  function new(virtual intf vif);
    this.vif=vif;
  endfunction
  
  task main();
    env=new(vif);
    env.main();
  endtask
endclass
