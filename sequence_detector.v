
module sequence_detector(sequence_detected,in_sequence,clk,rst);
  input in_sequence,clk,rst;
  output sequence_detected;
  reg [1:0] state;
  parameter s0=2'b00;
  parameter s1=2'b01;
  parameter s2=2'b10;
  parameter s3=2'b11;
  always@(posedge clk,negedge rst)
    begin
    if (!rst)
      state<=s0;
  else
    case (state)
      s0:if(in_sequence)
        state<=s1;
      else
        state<=s0;
      s1:if(in_sequence)
        state<=s2;
      else
        state<=s0;
      s2:if(in_sequence)
        state<=s3;
      else
        state<=s0;
      s3:if(in_sequence)
        state<=s3;
      else
        state<=s0;
      default:state<=s0;
    endcase
    end
   
  assign sequence_detected=(state==s3);
endmodule
        
  