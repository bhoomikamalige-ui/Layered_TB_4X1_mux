class scoreboard;
  mailbox mon2ref;
  mailbox mon2scb;
  
  function new(mailbox mon2ref,mailbox mon2scb);
    this.mon2ref=mon2ref;
    this.mon2scb=mon2scb;
  endfunction
  
  task main();
    transaction trans_in,trans_out;
    bit expected;
    repeat(10)
      begin
        mon2ref.get(trans_in);
        mon2scb.get(trans_out);
        expected = trans_in.in[trans_in.sel];
        if(expected == trans_out.y)
          $display("SCOREBOARD: PASS|Expected=%b Actual=%b",expected,trans_out.y);
        else
          $display("SCOREBOARD: FAIL|Expected=%b Actual=%b",expected,trans_out.y);
      end
  endtask
endclass
