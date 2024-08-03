module tb;
  
  int e1,e2;
  event done;
 
  task task1;
    forever begin
	#20;
    $display("task1 triggered");
    e1++;
    end
    ->done;
	endtask
  
  task task2;
    forever begin
	#40;
    $display("task2 triggered");
    e2++;
    end
    ->done;
	endtask
  
 task task3();
  #200;
  ->done;
endtask


initial
    begin
    fork 
        task1();
        task2();
        task3();  
    join_any
    wait(done.triggered);
    begin
      $display("Number of times Task1 triggered =%0d and Number of times Task2 triggered =%0d",e1,e2); 
    $finish();
    end
    end
endmodule