class first;
  
  bit [3:0] a; 
  bit [3:0] b;
  bit [3:0] c;
  
  task add(input bit [3:0] a,input bit [3:0] b,input bit [3:0] c);
    bit [6:0] sum;
    sum=(a+b+c);
    $display("a:%0d,b:%0d,c:%0d,sum:%0d",a,b,c,sum);
  endtask
  
endclass

module tb();
  
  first f;
  
  initial begin
   f=new();
   f.add(.a(1),.b(2),.c(4));
  end
  
endmodule
    
  
