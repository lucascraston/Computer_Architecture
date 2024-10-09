// Lucas Craston
//101183686
// test bench for the memory module

`timescale 1ns/1ps

module memory_tb; 
wire [7:0] read_data;
reg[7:0]  write_data;
reg [9:0] read_adress,write_adress;
reg clk, rst, read_req, write_req;

Memory dut(.MRead_request(read_req), .MWrite_request(write_req), .clk(clk), .rst(rst),.write_adress(write_adress),.read_adress(read_adress),.read_data(read_data),.write_data(write_data));



initial begin
   clk =1'b0;
   forever begin
    #10 clk = ~clk;
   end
end

initial begin
 read_req = 1'b0;
 write_req = 1'b0;   
 rst = 1'b0;
 #10;
 rst = 1'b1;
 #10;
 rst = 1'b0;

//test 1
@(posedge clk) begin
write_adress<=5;
write_req <= 1'b1;
write_data <= 20;
end
#10;

//test 2 read
@(posedge clk) begin
read_adress<=5;
write_req <= 1'b0;
read_req <=1'b1;
end


//test 3 read and write
@(posedge clk) begin
read_req <=1'b1;
write_req <=1'b1;

write_data <= 33;
write_adress <= 10;
read_adress <=10;


end

#100 rst =1;
#10 rst = 0;









end






    
endmodule