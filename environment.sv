class environment;
  generator gen;
  driver drv;
  monitor1 mon1;
  monitor2 mon2;
  scoreboard scb;
  mailbox gen2drv;
  mailbox mon2ref;
  mailbox mon2scb;
  virtual intf vif;
  
  function new(virtual intf vif);
    this.vif = vif;
    gen2drv = new();
    mon2ref = new();
    mon2scb = new();
    gen = new(gen2drv);
    drv = new(vif, gen2drv);
    mon1 = new(vif, mon2ref);
    mon2 = new(vif, mon2scb);
    scb = new(mon2ref, mon2scb);
  endfunction
  
  task main();
    fork
      gen.main();
      drv.main();
      mon1.main();
      mon2.main();
      scb.main();
    join
  endtask
endclass
