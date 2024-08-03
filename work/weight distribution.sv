class generator;
  
rand bit wr; 
rand bit rst; 
  
  
  
  
  constraint cntrl {
  
    wr dist {0 := 30 , 1 := 50};
    
    rst dist {0 := 50 , 1 := 50};
  
  }  
  
  
 
  
endclass
 
 
module tb;
  
  generator g;
  
  initial begin
    g = new();
    
    for(int i = 0; i < 20; i++) begin
      g.randomize();
      $display("Value of wr : %0d and rst : %0d", g.wr, g.rst);    
    end
    
  end
   
  
endmodule
