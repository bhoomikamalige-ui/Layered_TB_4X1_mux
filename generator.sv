class generator;
  transaction trans;
  mailbox gen2drv;
  
  function new(mailbox gen2drv);
    this.gen2drv=gen2drv;
  endfunction
  
  task main();
    repeat(10)
      begin
        trans = new();
        assert(trans.randomize());
        gen2drv.put(trans);
        $display("GENERATOR: in=%b sel=%b", trans.in, trans.sel);
      end
  endtask
endclass
