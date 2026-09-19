module tb;

  reg [3:0] t_a;
  reg [3:0] t_b;
  reg       t_op;

  wire [3:0] t_result;

  alu U1 (
    .a(t_a),
    .b(t_b),
    .op(t_op),
    .result(t_result)
  );

  initial begin
    t_a = 4'd3; t_b = 4'd2; t_op = 1'b0;
    #5;

    t_b = 4'd5;
    #5;

    t_a = 4'd7;
    #5;

    t_a = 4'd7; t_b = 4'd3; t_op = 1'b1;
    #5;

    t_b = 4'd2;
    #5;

    t_a = 4'd5;
    #5;

    t_a = 4'd2; t_b = 4'd7; t_op = 1'b1;
    #5;

    t_op = 1'b0;
    #5;

    $finish;
  end

  initial
    $monitor($time,
             " a=%d b=%d op=%b | result=%d",
             t_a, t_b, t_op, t_result);


endmodule