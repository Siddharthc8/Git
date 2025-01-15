`timescale 1ns / 1ps

//     To trigger an event use :  "->event_name"
//     @() operator is a blcoking statement
// wait operator is a non-blocking statement

module tb_event_ipc();

    event a1, a2;
    
    initial begin
//        #10;
        -> a1;
        #10;
        -> a2;         // Triggering an event 
    end
    
//  "@" operator takes in just the event name to sense
    initial begin
        @(a1);         // Blocking assignment          // Edge triggered
        $display("a1 Event --> Received at : %0t", $time);
        
        @(a2);         // Blocking assignment          // Edge triggered  
        $display("a1 Event --> Received at : %0t", $time);
    end
    
//  "wait" operator takes in the event_name followed by triggered function call
    initial begin
        wait(a1.triggered);         // Non - Blocking assignment            // Level triggered
        $display("Wait Op --> Received Event at : %0t", $time);
        
        wait(a2.triggered);         // Non - Blocking assignment            // Level triggered
        $display("Wait Op --> Received Event at : %0t", $time);
    end
    
endmodule
