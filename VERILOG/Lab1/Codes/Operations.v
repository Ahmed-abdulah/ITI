module Operations #(parameter Seq_width=4) (Seq1,Seq2,Seq3,Seq_out);

//--------------- Design Inputs ---------------
input wire [Seq_width-1:0] Seq1;
input wire [Seq_width-1:0] Seq2;
input wire [Seq_width-1:0] Seq3;

//--------------- Design Outputs ---------------
output reg [7:0] Seq_out;

//--------------- Internal reg ---------------
reg [1:0] Seq_And ;
reg [5:0] Seq_Concat ; 
//--------------- Design Implementation ---------------

	always@(*) begin
	
	Seq_And 	= Seq1[3:2] & Seq2[1:0] ;
	Seq_Concat	= {Seq_And,Seq3} ;
	Seq_out		= {{2{Seq_Concat[5]}}, Seq_Concat };	

	end

endmodule