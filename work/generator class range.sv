class generator;
  randc bit [7:0] x;
  randc bit [7:0] y;
  randc bit [7:0] z;
  
  constraint data{x inside {[0:50]};y inside {[0:50]};z inside {[0:50]};};
  
endclass

module tb;
  generator g;
  int i = 0;
  
  initial begin
   
    
    for(i=0;i<20;i++) begin
      g = new();
      g.randomize();
      $display("Value of x :%0d, y: %0d, z: %0d", g.x,g.y,g.z);
      #20;
    end
    
  end
  
  
endmodule
