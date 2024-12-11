
module full_adder(input a, b, cin,clock,reset ,output reg S, Cout);
  
  always @(posedge clock)
    if(reset)
      begin
       S<=0;
  	   Cout <= 0;
      end
    else 
      begin
        S <= (a ^ b ^ cin);
  	   Cout <= (a & b) | (b & cin) | (a & cin);
    end
endmodule
