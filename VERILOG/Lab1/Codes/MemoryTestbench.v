module Memory_TB ;

//--------------- Design Inputs and Outputs ---------------
reg Clk_TB;
reg Rst_n_TB;
reg En_w_TB;
reg En_r_TB;
reg [2:0] Address_TB;
reg [7:0] Data_in_TB;
wire Full_flag_TB;
wire Empty_flag_TB;
wire [7:0] Data_out_TB;

//--------------- DUT Instantiation ---------------

Memory #(.Address_width(3), .Data_width(8)) dut ( 
	.Clk (Clk_TB),
	.Rst_n (Rst_n_TB),
	.En_w (En_w_TB),
	.En_r (En_r_TB),
	.Address (Address_TB),
	.Data_in (Data_in_TB),
	.Full_flag (Full_flag_TB),
	.Empty_flag (Empty_flag_TB),
	.Data_out (Data_out_TB));

integer i ; 
integer j ; 
//--------------- Test Stimulus ---------------

initial begin

//-------- Generate Inputs --------
Rst_n_TB =1'b0 ;
#2 ;
Rst_n_TB =1'b1; En_w_TB =0 ; En_r_TB=1'b1 ;   Address_TB= 3'b100 ;  Data_in_TB = 3 ;
#2 ;
//Write_process 

for (i = 0 ; i < 9 ; i= i+1 ) begin 
En_w_TB =1'b1;
En_r_TB =1'b0;
Address_TB = i ; 
Data_in_TB = i * i ;
#2 ;
end


//Read_process 

for (j = 7 ; j >= 0 ; j= j-1 ) begin 
En_w_TB =1'b0;
En_r_TB =1'b1;
Address_TB = j ; 
#2 ;
end		
end

//-------- Clock Generation --------

initial begin
	Clk_TB = 1'b0;
	forever #1 Clk_TB = ~Clk_TB;
end


endmodule