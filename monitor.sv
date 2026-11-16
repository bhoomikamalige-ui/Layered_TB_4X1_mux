class monitor1;
  virtual intf vif;
  mailbox mon2ref;
  
  function new(virtual intf vif, mailbox mon2ref);
    this.vif=vif;
    this.mon2ref=mon2ref;
  endfunction
  
  task main();
    transaction trans;
    repeat(10)
      begin
        @(negedge vif.clk);
        @(posedge vif.clk);
        #1;
        trans = new();
        trans.in=vif.in;
        trans.sel=vif.sel;
        mon2ref.put(trans);
        $display("MONITOR 1: in=%b sel=%b",trans.in,trans.sel);
      end
  endtask
endclass

class monitor2;
  virtual intf vif;
  mailbox mon2scb;
  
  function new(virtual intf vif, mailbox mon2scb);
    this.vif=vif;
    this.mon2scb=mon2scb;
  endfunction
  
  task main();
    transaction trans;
    repeat(10)
      begin
        @(negedge vif.clk);
        @(posedge vif.clk);
        #1;
        trans=new();
        trans.y=vif.y;
        mon2scb.put(trans);
        $display("MONITOR 2: y=%b", trans.y);
      end
  endtask
endclass
