class driver;
  virtual intf vif;
  mailbox gen2drv;
  
  function new(virtual intf vif, mailbox gen2drv);
    this.vif = vif;
    this.gen2drv = gen2drv;
  endfunction
  
  
  task main();
    transaction trans;
    repeat(10)
      begin
        gen2drv.get(trans);
        @(negedge vif.clk);
        vif.in=trans.in;
        vif.sel=trans.sel;
        $display("DRIVER: in=%b sel=%b",trans.in,trans.sel);
      end
  endtask
endclass
