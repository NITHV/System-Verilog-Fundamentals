class transaction;
 
rand bit [7:0] a;
rand bit [7:0] b;
rand bit wr;
 
endclass

class generator;
    transaction t;
    mailbox #(transaction) mbx;
    

    function new(mailbox #(transaction) mbx);
    this.mbx = mbx;  
    endfunction

    task run();
      for(int i=0;i<10;i++)begin
        t = new();
        assert(t.randomize())else $display("randomization failed");
        $display("[GEN] SENT a:%0d b:%0d wr:%0d", t.a, t.b, t.wr);
        mbx.put(t);
        #10;
      end
    endtask

endclass

class driver;
    transaction data;
    mailbox #(transaction) mbx;
    function new(mailbox #(transaction) mbx);
        this.mbx = mbx;
    endfunction

    task run();
      forever begin
        data = new();
        mbx.get(data);
      $display("[DRV] RCVD a:%0d b:%0d wr:%0d", data.a, data.b, data.wr);
        #10;
      end
    endtask
endclass

module TB;
    generator g;
    driver d;
    mailbox #(transaction) mbx;
    
    initial begin
        mbx = new();
        g = new(mbx);
        d = new(mbx);
        

        fork
            g.run();
            d.run();
        join
    end
endmodule
