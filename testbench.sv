`include "interface.sv"
`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"
`include "environment.sv"
`include "test.sv"

module testbench;
  intf vif();
  mux4to1 dut(
    .in(vif.in),
    .sel(vif.sel),
    .y(vif.y));
  
  test t;
  initial
    begin
      vif.clk = 0;
      forever #5 vif.clk = ~vif.clk;
    end
  initial
    begin
      t=new(vif);
      t.main();
      #1;
      $display("SIMULATION COMPLETED");
      $finish;
    end
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(0, testbench);
    end
endmodule
