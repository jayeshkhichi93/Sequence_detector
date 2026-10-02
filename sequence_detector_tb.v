
module sequence_detector_tb;
  reg in_sequence,clk,rst;
  wire sequence_detected;
  wire [1:0] state;
   
  sequence_detector uut (.sequence_detected(sequence_detected),.in_sequence(in_sequence),.clk(clk),.rst(rst));
  
  assign state=uut.state;
  
  always #2 clk=~clk;
  
  initial begin
    clk=0;
    rst=0;
    in_sequence=0;
    #4; rst=1;
    @(posedge clk) #1 in_sequence=1;
    @(posedge clk) #1 in_sequence=1;
    @(posedge clk) #1 in_sequence=1;
    
    @(posedge clk) #1 in_sequence=0;
    @(posedge clk) #1 in_sequence=1;
    @(posedge clk) #1 in_sequence=1;
    @(posedge clk) #1 in_sequence=1;
    @(posedge clk) #1 in_sequence=1;
    @(posedge clk) #1 in_sequence=0;
    #12;
    $finish;
  end
  initial begin
    $monitor("Time:%0t, state:%b, in_sequence:%b, in_detected:%b ",$time,state,in_sequence,sequence_detected);
    $dumpfile("dump.vcd");
    $dumpvars(1,sequence_detector_tb);
  end
endmodule