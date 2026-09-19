module tb;

  reg [1:0] t_A;
  reg [1:0] t_B;

  wire t_GT;
  wire t_LT;
  wire t_EQ;

  comp2 U1 (
    .A(t_A),
    .B(t_B),
    .GT(t_GT),
    .LT(t_LT),
    .EQ(t_EQ)
  );

  integer a, b;
  integer errors;
  integer total;

  initial begin
    errors = 0;
    total = 0;

    for (a = 0; a < 4; a = a + 1) begin
      for (b = 0; b < 4; b = b + 1) begin

        t_A = a;
        t_B = b;

        #1;

        total = total + 1;

        if ((t_GT !== (a > b)) ||
            (t_LT !== (a < b)) ||
            (t_EQ !== (a == b))) begin

          $display("FAIL: A=%b B=%b | GT=%b LT=%b EQ=%b",
                   t_A, t_B, t_GT, t_LT, t_EQ);

          errors = errors + 1;

        end
        else begin

          $display("PASS: A=%b B=%b | GT=%b LT=%b EQ=%b",
                   t_A, t_B, t_GT, t_LT, t_EQ);

        end

      end
    end

    $display("SUMMARY: %0d/%0d tests passed, %0d errors",
             total - errors, total, errors);

    $finish;
  end


endmodule