# code 1
...
class parent;
        rand bit[2:0]a;
        constraint a_size{a==3;}
endclass:parent

class child1 extends parent;
        rand bit[2:0]a;
        constraint a_size{a==2;}
        constraint c_size {super.a==a;}
endclass:child1

parent p1_h;
child1 ch1_h;

module parent_child_same_prop;
        initial
                begin
                        ch1_h=new();
                        for(int i=0;i<7;i++)
                                begin
                                        assert(ch1_h.randomize());
                                        $display("ch1_h: %d",ch1_h.a);
                                 end
                end
endmodule
...


# code 2
...
class parent;
        rand bit[2:0]a;
        constraint a_size{a==3;}
endclass:parent

class child1 extends parent;
        rand bit[2:0]a;
        constraint b_size{a==2;}
        constraint c_size {super.a==a;}
endclass:child1

parent p1_h;
child1 ch1_h;

module parent_child_same_prop;
        initial
                begin
                        ch1_h=new();
                        for(int i=0;i<7;i++)
                                begin
                                        assert(ch1_h.randomize());
                                        $display("ch1_h: %d",ch1_h.a);
                                 end
                end
endmodule
...


# code 3
...
class parent;
        rand bit[2:0]a;
        constraint a_size{a<3;}
endclass:parent

class child1 extends parent;
        rand bit[2:0]a;
        constraint a_size{a>3;}
        constraint c_size {super.a==a;}
endclass:child1

parent p1_h;
child1 ch1_h;

module parent_child_same_prop;
        initial
                begin
                        ch1_h=new();
                        for(int i=0;i<7;i++)
                                begin
                                        assert(ch1_h.randomize());
                                        $display("ch1_h: %d",ch1_h.a);
                                 end
                end
endmodule
...


# code 4
...
class parent;
        rand bit[2:0]a;
        constraint a_size{a<3;}
endclass:parent

class child1 extends parent;
        rand bit[2:0]a;
        constraint a_size{a<5;}
        constraint c_size {super.a==a;}
endclass:child1

parent p1_h;
child1 ch1_h;

module parent_child_same_prop;
        initial
                begin
                        ch1_h=new();
                        for(int i=0;i<7;i++)
                                begin
                                        assert(ch1_h.randomize());
                                        $display("ch1_h: %d",ch1_h.a);
                                 end
                end
endmodule
...


# code 5
...
class parent;
        rand bit[2:0]a;
        constraint a_size{a<3;}
endclass:parent

class child1 extends parent;
        rand bit[2:0]a;
        constraint b_size{a<5;}
        constraint c_size {super.a==a;}
endclass:child1

parent p1_h;
child1 ch1_h;

module parent_child_same_prop;
        initial
                begin
                        ch1_h=new();
                        for(int i=0;i<7;i++)
                                begin
                                        assert(ch1_h.randomize());
                                        $display("p1_h: %d",ch1_h.a);
                                 end
                end
endmodule
...


# code 6
//write a code to randomly generate 10 real numbers between 1.356 to 2.683
...

module tb;

        class real_num;
                rand real r_num[];

                constraint size1{r_num.size==10;}
                constraint real_num{foreach(r_num[i])
                                        r_num[i]inside{[1.356:2.683]};}


        endclass


        /*class real_num;
                rand int r_num[];
                real num[10];
                constraint size1{r_num.size==10;}
                constraint real_num{foreach(r_num[i])
                                        r_num[i]inside{[1356:2683]};}

                function void post_randomize();
                        foreach(num[i])
                                begin
                                        num[i]=r_num[i]/1000.0;
                                        $display("real =%f",num[i]);
                                end
                endfunction
        endclass*/
        real_num rn=new();
        initial
                begin
                        assert(rn.randomize());
                        $display("%p",rn);
                end
endmodule
...
