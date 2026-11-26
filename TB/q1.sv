//sorting of dynamic array with and without array methods
...
module test;
 class AB;
     rand int da[];
     constraint da_val_1{da.size == 10;
       foreach (da[i])
         da[i] inside {[1:100]};}

    function void post_randomize();
        $display("before sorting,the content of array is %p",da);
           for(int i=0;i<10;i++)
              begin
                 for(int j=i+1;j<10;j++)
                       if(da[i]>da[j])
                           begin
                            da[i]=da[i]+da[j];
                            da[j]=da[i]-da[j];
                            da[i]=da[i]-da[j];
                           end
              end
         $display("After sorting,content of array in %p",da);
    endfunction
 endclass


    AB a_h = new();
       initial
          begin
              void'(a_h.randomize());
          end

endmodule
...


// insert one queue into another queue with and without array methods
...
module test;

   int q1[$] = '{0,1,5,6,7,8};
   int q2[$] = '{2,3,4};

    initial
       begin
         foreach(q2[i])
             q1.insert(i+2,q2[i]);
                $display("first time loop statement%p",q1);
        // foreach(q2[i])i
             q1={q1[0:1],q2,q1[2:$]};
           $display("after inserting ,the conmtent of q are %p",q1);
       end
endmodule
...


//foreach loop for popping all the elements in a queue
...
module test;
 int q1[$]='{0,1,5,6,7,8};
 int x;

    initial
       begin
          foreach(q1[i])
             begin
                x=q1.pop_back();
                $display("x=%d",x);
             end
          $display("size of the queue is %0d",q1.size());
       end
endmodule
...


//ouput of snippet
...
module top;
   int i_num1;
   int r_num2;

   initial
      begin
          i_num1=int'(10.0-1.8);
          $display("The integer value is:%d",i_num1);
          r_num2=int'(5/3);
          $display("The integer value is:%d",r_num2);
      end
endmodule
...

