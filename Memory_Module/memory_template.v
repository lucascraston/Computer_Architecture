
// Lucas Craston
// 101183686
// Lab 1: designing a read/write memory

module Memory 
  (
     // define interfaces here
     
     input  wire MRead_request, MWrite_request, clk, rst,
     input  wire [9:0] read_adress, write_adress,
     input  wire [7:0] write_data,
     output reg [7:0] read_data
	 
  );
  
  // define a two-dimensional array of register to form a memory
  // specify the size based on the functional description
  reg [7:0] mem_block [0:1023];
  integer i;
  
  
  // define any other wire, register or variable you may need here
  
  
  // note that this is a clocked always block, choose proper assignments
  always @(posedge clk) begin
    if (rst) begin
        //reset values
      // Reset memory values to 0 using a for loop
	  // loop variable must be defined before
      
      for(i = 0; i<1024; i=i+1)
      begin
        mem_block[i] <= 0;
      end

    end else begin
      // Read operation
      if (MRead_request) begin
        read_data <= mem_block[read_adress];

		
	  end 
	  
      // Write operation
      if (MWrite_request) begin
        mem_block[write_adress] <= write_data;
		
		
      end
	  
    end
  end
endmodule

