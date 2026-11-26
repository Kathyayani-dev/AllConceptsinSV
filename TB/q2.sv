// output of code
...
module test();
   int d,result;
   int a=2,b=3;
        function automatic mult(input int a,input int b,output int c);
                begin
                         c=(a*b)+2;
                         a++;
                         $display("Inside function @time t=%0t:a=%0d and b=%0d and c=%0d",$time,a,b,c);
                end
        endfunction

        initial
                fork
                        begin
                           #1;
                           mult(2,3,d);
                           $display("Begin block1 @time t=%0t:a=%0d and b=%0d and d=%0d",$time ,a,b,d);
                        end
                        begin
                           #2;
                           mult(2,4,d);
                           $display("Begin block2 @time t=%0t:a=%0d and b=%0d and d=%0d",$time,a,b,d);
                        end
                join
endmodule
...


//output of code
...
module test();
        int d,result;
        int a=2,b=3;

                function automatic mult(ref int a,ref int b,output int c);
                        c=(a*b)+2;
                        a++;
                        $display("Inside function @time t=%0t: a=%0d and b=%0d and c=%0d",$time,a,b,c);
                endfunction

                        initial
                                fork
                                        begin
                                          #1;
                                          mult(a,b,d);
                                          $display("Begin block1 @time t=%0t:a=%0d and b=%0d and d=%0d",$time,a,b,d);
                                        end

                                        begin
                                          #2;
                                          mult(a,b,d);
                                          $display("Begin block2 @time t=%0t: a=%0d and b=%0d and d=%0d",$time,a,b,d);
                                        end
                                join
endmodule
...


// output of code
...
module test();
   int d,result;
   int a=2,b=3;
        function  mult(input int a,input int b,output int c);
                c=(a*b)+2;
                a++;
                $display("Inside function @time t=%0t:a=%0d and b=%0d and c=%0d",$time,a,b,c);
        endfunction

        initial
                fork
                        begin
                           #1;
                           mult(a,b,d);
                           $display("Begin block1 @time t=%0t:a=%0d and b=%0d and d=%0d",$time ,a,b,d);
                        end
                        begin
                           #2;
                           mult(a,b,d);
                           $display("Begin block2 @time t=%0t:a=%0d and b=%0d and d=%0d",$time,a,b,d);
                        end
                join
endmodule
...


// output of code
...
module test();
        int d,result;
        int a=2,b=3;

                task automatic mult(input int a,input int b,output int c);
                        #5;
                        c=(a*b)+2;
                        a++;
                        $display("Inside function @time t=%0t: a=%0d and b=%0d and c=%0d",$time,a,b,c);
                endtask

                        initial
                                fork
                                        begin
                                          #1;
                                          mult(a,b,d);
                                          $display("Begin block1 @time t=%0t:a=%0d and b=%0d and d=%0d",$time,a,b,d);
                                        end

                                        begin
                                          #2;
                                          mult(a,b,d);
                                          $display("Begin block2 @time t=%0t: a=%0d and b=%0d and d=%0d",$time,a,b,d);
                                        end
                                join
endmodule
...


//output of code
...
module test();
        int d,result;
        int a=2,b=3;

                task automatic mult(input int a,input int b,output int c);
                        #5;
                        c=(a*b)+2;
                        a++;
                        $display("Inside function @time t=%0t: a=%0d and b=%0d and c=%0d",$time,a,b,c);
                endtask

                        initial
                                fork
                                        begin
                                          #1;
                                          mult(2,3,d);
                                          $display("Begin block1 @time t=%0t:a=%0d and b=%0d and d=%0d",$time,a,b,d);
                                        end

                                        begin
                                          #2;
                                          mult(2,4,d);
                                          $display("Begin block2 @time t=%0t: a=%0d and b=%0d and d=%0d",$time,a,b,d);
                                        end
                                join
endmodule
...


//output code
...
class pass_by_ref;
        int refr=2;
        int val=2;

                function automatic int check_refer(ref int r);
                        $display("\n ==============PASS BY REFERENCE=============\n");
                        $display("Initial value of REFR %d",r);
                        r++;
                        $display("value of REFR after incrementing %d",r);
                endfunction

                function int check_val(int v);
                        $display("\n ==============PASS BY VALUE===============\n");
                        v++;
                        $display("value of VAL after incrementing %d",v);
                endfunction
endclass

pass_by_ref h1;

module test;
        initial
            begin
                h1=new();
                h1.check_refer(h1.refr);
                h1.check_val(h1.val);
                $display("\n============IN MEMORY============\n");
                $display("value of REFR after incrementing %d",h1.refr);
                $display("value of VAL after incrementing %d",h1.val);
            end
endmodule
...


// output code
...
module test();
        task dummy_task(input int x,string str);
                fork
                      begin
                        #x;
                      end

                      begin
                        #10;
                      end
                join_any
                disable fork;
                $display("%s is disabled at t=%0t",str,$time);
        endtask

initial
        fork
           begin
             #2;
             dummy_task(5,"call_1");
           end

           begin
             #1;
             dummy_task(15,"call_2");
           end
        join
endmodule
...
