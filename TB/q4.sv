# code 1
...
module threads();

        initial
                begin
                fork
                        for(int H1_pointer=0; H1_pointer<2; H1_pointer++)
                        begin
                                #1 $display($time,"First Loop: value of H1=%g",H1_pointer);
                        end

                        for(int D1_channel=2; D1_channel>0; D1_channel--)
                        begin
                                #1 $display($time,"Second Loop: value of D1=%g",D1_channel);
                        end
                join

                $display("@%g Came out of FORK - JOIN\n",$time);
                #3 $finish;
                end
endmodule
...


# code 2
...
module threads();

        initial
                begin
                fork
                        for(int H1_pointer=0; H1_pointer<2; H1_pointer++)
                        begin
                                #1 $display($time,"First Loop: value of H1=%g",H1_pointer);
                        end

                        for(int D1_channel=2; D1_channel>0; D1_channel--)
                        begin
                                #1 $display($time,"Second Loop: value of D1=%g",D1_channel);
                        end
                join_any

                $display("@%g outside of FORK - JOIN - ANY\n",$time);
                #3 $finish;
                end
endmodule
...


# code 3
...
module threads();

        initial
                begin
                fork
                        for(int H1_pointer=0; H1_pointer<2; H1_pointer++)
                        begin
                                #1 $display($time,"First Loop: value of H1=%g",H1_pointer);
                        end

                        for(int D1_channel=2; D1_channel>0; D1_channel--)
                        begin
                                #1 $display($time,"Second Loop: value of D1=%g",D1_channel);
                        end
                join_none

                $display("@%g outside of FORK - JOIN - NONE\n",$time);
                #3 $finish;
                end
endmodule
...


# code 4
...
module threads();

        initial
                begin
                fork
                        for(int H1_pointer=0; H1_pointer<2; H1_pointer++)
                        begin
                                #1 $display($time,"First Loop: value of H1=%g",H1_pointer);
                        end

                        for(int D1_channel=2; D1_channel>0; D1_channel--)
                        begin
                                #1 $display($time,"Second Loop: value of D1=%g",D1_channel);
                        end
                join


                disable fork;

                $display("@%g Came out of FORK - JOIN\n",$time);
                #3 $finish;
                end
endmodule
...


# code 5
...
module threads();

        initial
                begin
                fork
                        for(int H1_pointer=0; H1_pointer<2; H1_pointer++)
                        begin
                                #1 $display($time,"First Loop: value of H1=%g",H1_pointer);
                        end

                        for(int D1_channel=2; D1_channel>0; D1_channel--)
                        begin
                                #1 $display($time,"Second Loop: value of D1=%g",D1_channel);
                        end
                join_any


                disable fork;


                $display("@%g outside of FORK - JOIN - ANY\n",$time);
                #3 $finish;
                end
endmodule
... 


# code 6
...
module threads();

        initial
                begin
                fork
                        for(int H1_pointer=0; H1_pointer<2; H1_pointer++)
                        begin
                                #1 $display($time,"First Loop: value of H1=%g",H1_pointer);
                        end

                        for(int D1_channel=2; D1_channel>0; D1_channel--)
                        begin
                                #1 $display($time,"Second Loop: value of D1=%g",D1_channel);
                        end
                join_none


                disable fork;


                $display("@%g outside of FORK - JOIN - NONE\n",$time);
                #3 $finish;
                end
endmodule
...
