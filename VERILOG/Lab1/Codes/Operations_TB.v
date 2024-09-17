module Operations_TB;

reg [3:0] Seq1_TB;
reg [3:0] Seq2_TB;
reg [3:0] Seq3_TB;
wire [7:0] Seq_out_TB;

 ////////Block instantiation/////////// 
Operations Operations_inst (
	.Seq1(Seq1_TB),
	.Seq2(Seq2_TB),
	.Seq3(Seq3_TB),
	.Seq_out(Seq_out_TB)
);

initial
begin
	// Initialize input signals
	Seq1_TB = 0;
	Seq2_TB = 0;
	Seq3_TB = 0;

	// Apply test cases here
	#2 ;
	Seq1_TB = 4'b1011;
	Seq2_TB = 4'b0011;
	Seq3_TB = 4'b1010;
	$monitor("Time= %0t,Seq1_TB = %b, Seq2_TB = %b, Seq3_TB = %b --> Seq_out_TB = %b", $time,Seq1_TB, Seq2_TB, Seq3_TB,Seq_out_TB);

	#2 ;
	Seq1_TB = 4'b1100;
	Seq2_TB = 4'b1101;
	Seq3_TB = 4'b1000;
	$monitor("Time= %0t,Seq1_TB = %b, Seq2_TB = %b, Seq3_TB = %b --> Seq_out_TB = %b", $time,Seq1_TB, Seq2_TB, Seq3_TB,Seq_out_TB);
	
	#2 ;
	Seq1_TB = 4'b0000;
	Seq2_TB = 4'b0011;
	Seq3_TB = 4'b1100;
	$monitor("Time= %0t,Seq1_TB = %b, Seq2_TB = %b, Seq3_TB = %b --> Seq_out_TB = %b", $time,Seq1_TB, Seq2_TB, Seq3_TB,Seq_out_TB);
	
end



endmodule
