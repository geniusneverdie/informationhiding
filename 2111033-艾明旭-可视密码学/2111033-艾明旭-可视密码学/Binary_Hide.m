function[Y,Z] = Binary_Hide(A, B, C)
for i = 1: 256
    for j = 1: 256
        if(A(i,j)==0) %黑色情况
            
            %------------------------------------------------------------------%
            if( B(i,j)==0 && C(i,j)==0)
                random=rand()*4;
                if(random>=0&&random<1)
                    Y(2*i-1,2*j-1)=0;Y(2*i-1,2*j)=255;Y(2*i,2*j-1)=0;Y(2*i,2*j)=0;
                    Z(2*i-1,2*j-1)=255;Z(2*i-1,2*j)=0;Z(2*i,2*j-1)=0;Z(2*i,2*j)=0;
                elseif(random>=1&&random<2)
                    Y(2*i-1,2*j-1)=0;Y(2*i-1,2*j)=0;Y(2*i,2*j-1)=0;Y(2*i,2*j)=255;
                    Z(2*i-1,2*j-1)=0;Z(2*i-1,2*j)=0;Z(2*i,2*j-1)=255;Z(2*i,2*j)=0;
                elseif(random>=2&&random<3)
                    Y(2*i-1,2*j-1)=255;Y(2*i-1,2*j)=0;Y(2*i,2*j-1)=0;Y(2*i,2*j)=0;
                    Z(2*i-1,2*j-1)=0;Z(2*i-1,2*j)=255;Z(2*i,2*j-1)=0;Z(2*i,2*j)=0;
                else
                    Y(2*i-1,2*j-1)=0;Y(2*i-1,2*j)=0;Y(2*i,2*j-1)=255;Y(2*i,2*j)=0;
                    Z(2*i-1,2*j-1)=0;Z(2*i-1,2*j)=0;Z(2*i,2*j-1)=0;Z(2*i,2*j)=255;
                end
            end
            %------------------------------------------------------------------%
            %------------------------------------------------------------------%
            if( B(i,j)==0 && C(i,j)==255)
                random=rand()*4;
                if(random>=0&&random<1)
                    Y(2*i-1,2*j-1)=255;Y(2*i-1,2*j)=0;Y(2*i,2*j-1)=0;Y(2*i,2*j)=0;
                    Z(2*i-1,2*j-1)=0;Z(2*i-1,2*j)=0;Z(2*i,2*j-1)=255;Z(2*i,2*j)=255;
                elseif(random>=1&&random<2)
                    Y(2*i-1,2*j-1)=0;Y(2*i-1,2*j)=255;Y(2*i,2*j-1)=0;Y(2*i,2*j)=0;
                    Z(2*i-1,2*j-1)=255;Z(2*i-1,2*j)=0;Z(2*i,2*j-1)=255;Z(2*i,2*j)=0;
                elseif(random>=2&&random<3)
                    Y(2*i-1,2*j-1)=0;Y(2*i-1,2*j)=0;Y(2*i,2*j-1)=255;Y(2*i,2*j)=0;
                    Z(2*i-1,2*j-1)=255;Z(2*i-1,2*j)=255;Z(2*i,2*j-1)=0;Z(2*i,2*j)=0;
                else
                    Y(2*i-1,2*j-1)=0;Y(2*i-1,2*j)=0;Y(2*i,2*j-1)=0;Y(2*i,2*j)=255;
                    Z(2*i-1,2*j-1)=0;Z(2*i-1,2*j)=255;Z(2*i,2*j-1)=255;Z(2*i,2*j)=0;
                end
            end
            %------------------------------------------------------------------%
            %------------------------------------------------------------------%
            if( B(i,j)==255 && C(i,j)==0)
                random=rand()*4;
                if(random>=0&&random<1)
                    Y(2*i-1,2*j-1)=255;Y(2*i-1,2*j)=255;Y(2*i,2*j-1)=0;Y(2*i,2*j)=0;
                    Z(2*i-1,2*j-1)=0;Z(2*i-1,2*j)=0;Z(2*i,2*j-1)=0;Z(2*i,2*j)=255;
                elseif(random>=1&&random<2)
                    Y(2*i-1,2*j-1)=0;Y(2*i-1,2*j)=255;Y(2*i,2*j-1)=0;Y(2*i,2*j)=255;
                    Z(2*i-1,2*j-1)=255;Z(2*i-1,2*j)=0;Z(2*i,2*j-1)=0;Z(2*i,2*j)=0;
                elseif(random>=2&&random<3)
                    Y(2*i-1,2*j-1)=0;Y(2*i-1,2*j)=0;Y(2*i,2*j-1)=255;Y(2*i,2*j)=255;
                    Z(2*i-1,2*j-1)=0;Z(2*i-1,2*j)=255;Z(2*i,2*j-1)=0;Z(2*i,2*j)=0;
                else
                    Y(2*i-1,2*j-1)=255;Y(2*i-1,2*j)=0;Y(2*i,2*j-1)=0;Y(2*i,2*j)=255;
                    Z(2*i-1,2*j-1)=0;Z(2*i-1,2*j)=0;Z(2*i,2*j-1)=255;Z(2*i,2*j)=0;
                end
            end
            %------------------------------------------------------------------%
            %------------------------------------------------------------------%
            if( B(i,j)==255 && C(i,j)==255)
                random=rand()*4;
                if(random>=0&&random<1)
                    Y(2*i-1,2*j-1)=255;Y(2*i-1,2*j)=255;Y(2*i,2*j-1)=0;Y(2*i,2*j)=0;
                    Z(2*i-1,2*j-1)=0;Z(2*i-1,2*j)=0;Z(2*i,2*j-1)=255;Z(2*i,2*j)=255;
                elseif(random>=1&&random<2)
                    Y(2*i-1,2*j-1)=0;Y(2*i-1,2*j)=255;Y(2*i,2*j-1)=0;Y(2*i,2*j)=255;
                    Z(2*i-1,2*j-1)=255;Z(2*i-1,2*j)=0;Z(2*i,2*j-1)=255;Z(2*i,2*j)=0;
                elseif(random>=2&&random<3)
                    Y(2*i-1,2*j-1)=0;Y(2*i-1,2*j)=0;Y(2*i,2*j-1)=255;Y(2*i,2*j)=255;
                    Z(2*i-1,2*j-1)=255;Z(2*i-1,2*j)=255;Z(2*i,2*j-1)=0;Z(2*i,2*j)=0;
                else
                    Y(2*i-1,2*j-1)=255;Y(2*i-1,2*j)=0;Y(2*i,2*j-1)=0;Y(2*i,2*j)=255;
                    Z(2*i-1,2*j-1)=0;Z(2*i-1,2*j)=255;Z(2*i,2*j-1)=255;Z(2*i,2*j)=0;
                end
            end
            %------------------------------------------------------------------%
            %------------------------------------------------------------------%
        end
        if(A(i,j)==255) %白色情况
            %------------------------------------------------------------------%
            if( B(i,j)==0 && C(i,j)==0)
                random=rand()*4;
                if(random>=0&&random<1)
                    Y(2*i-1,2*j-1)=0;Y(2*i-1,2*j)=0;Y(2*i,2*j-1)=0;Y(2*i,2*j)=255;
                    Z(2*i-1,2*j-1)=0;Z(2*i-1,2*j)=0;Z(2*i,2*j-1)=0;Z(2*i,2*j)=255;
                elseif(random>=1&&random<2)
                    Y(2*i-1,2*j-1)=0;Y(2*i-1,2*j)=0;Y(2*i,2*j-1)=255;Y(2*i,2*j)=0;
                    Z(2*i-1,2*j-1)=0;Z(2*i-1,2*j)=0;Z(2*i,2*j-1)=255;Z(2*i,2*j)=0;
                elseif(random>=2&&random<3)
                    Y(2*i-1,2*j-1)=255;Y(2*i-1,2*j)=0;Y(2*i,2*j-1)=0;Y(2*i,2*j)=0;
                    Z(2*i-1,2*j-1)=255;Z(2*i-1,2*j)=0;Z(2*i,2*j-1)=0;Z(2*i,2*j)=0;
                else
                    Y(2*i-1,2*j-1)=0;Y(2*i-1,2*j)=255;Y(2*i,2*j-1)=0;Y(2*i,2*j)=0;
                    Z(2*i-1,2*j-1)=0;Z(2*i-1,2*j)=255;Z(2*i,2*j-1)=0;Z(2*i,2*j)=0;
                end
            end
            %------------------------------------------------------------------%
            %------------------------------------------------------------------%
            if( B(i,j)==0 && C(i,j)==255)
                random=rand()*4;
                if(random>=0&&random<1)
                    Y(2*i-1,2*j-1)=0;Y(2*i-1,2*j)=0;Y(2*i,2*j-1)=0;Y(2*i,2*j)=255;
                    Z(2*i-1,2*j-1)=0;Z(2*i-1,2*j)=0;Z(2*i,2*j-1)=255;Z(2*i,2*j)=255;
                elseif(random>=1&&random<2)
                    Y(2*i-1,2*j-1)=0;Y(2*i-1,2*j)=0;Y(2*i,2*j-1)=255;Y(2*i,2*j)=0;
                    Z(2*i-1,2*j-1)=0;Z(2*i-1,2*j)=255;Z(2*i,2*j-1)=255;Z(2*i,2*j)=0;
                elseif(random>=2&&random<3)
                    Y(2*i-1,2*j-1)=0;Y(2*i-1,2*j)=255;Y(2*i,2*j-1)=0;Y(2*i,2*j)=0;
                    Z(2*i-1,2*j-1)=255;Z(2*i-1,2*j)=255;Z(2*i,2*j-1)=0;Z(2*i,2*j)=0;
                else
                    Y(2*i-1,2*j-1)=255;Y(2*i-1,2*j)=0;Y(2*i,2*j-1)=0;Y(2*i,2*j)=0;
                    Z(2*i-1,2*j-1)=255;Z(2*i-1,2*j)=0;Z(2*i,2*j-1)=255;Z(2*i,2*j)=0;
                end
            end
            %------------------------------------------------------------------%
            %------------------------------------------------------------------%
            if( B(i,j)==255 && C(i,j)==255)
                random=rand()*4;
                if(random>=0&&random<1)
                    Y(2*i-1,2*j-1)=255;Y(2*i-1,2*j)=0;Y(2*i,2*j-1)=255;Y(2*i,2*j)=0;
                    Z(2*i-1,2*j-1)=0;Z(2*i-1,2*j)=0;Z(2*i,2*j-1)=255;Z(2*i,2*j)=255;
                elseif(random>=1&&random<2)
                    Y(2*i-1,2*j-1)=0;Y(2*i-1,2*j)=0;Y(2*i,2*j-1)=255;Y(2*i,2*j)=255;
                    Z(2*i-1,2*j-1)=0;Z(2*i-1,2*j)=255;Z(2*i,2*j-1)=255;Z(2*i,2*j)=0;
                elseif(random>=2&&random<3)
                    Y(2*i-1,2*j-1)=255;Y(2*i-1,2*j)=0;Y(2*i,2*j-1)=0;Y(2*i,2*j)=255;
                    Z(2*i-1,2*j-1)=255;Z(2*i-1,2*j)=255;Z(2*i,2*j-1)=0;Z(2*i,2*j)=0;
                else
                    Y(2*i-1,2*j-1)=255;Y(2*i-1,2*j)=255;Y(2*i,2*j-1)=0;Y(2*i,2*j)=0;
                    Z(2*i-1,2*j-1)=255;Z(2*i-1,2*j)=0;Z(2*i,2*j-1)=255;Z(2*i,2*j)=0;
                end
            end
            %------------------------------------------------------------------%
            %------------------------------------------------------------------%
            if( B(i,j)==255 && C(i,j)==0)
                random=rand()*4;
                if(random>=0&&random<1)
                    Y(2*i-1,2*j-1)=255;Y(2*i-1,2*j)=255;Y(2*i,2*j-1)=0;Y(2*i,2*j)=0;
                    Z(2*i-1,2*j-1)=255;Z(2*i-1,2*j)=0;Z(2*i,2*j-1)=0;Z(2*i,2*j)=0;
                elseif(random>=1&&random<2)
                    Y(2*i-1,2*j-1)=0;Y(2*i-1,2*j)=0;Y(2*i,2*j-1)=255;Y(2*i,2*j)=255;
                    Z(2*i-1,2*j-1)=0;Z(2*i-1,2*j)=0;Z(2*i,2*j-1)=255;Z(2*i,2*j)=0;
                elseif(random>=2&&random<3)
                    Y(2*i-1,2*j-1)=255;Y(2*i-1,2*j)=0;Y(2*i,2*j-1)=0;Y(2*i,2*j)=255;
                    Z(2*i-1,2*j-1)=0;Z(2*i-1,2*j)=0;Z(2*i,2*j-1)=0;Z(2*i,2*j)=255;
                else
                    Y(2*i-1,2*j-1)=255;Y(2*i-1,2*j)=255;Y(2*i,2*j-1)=0;Y(2*i,2*j)=0;
                    Z(2*i-1,2*j-1)=0;Z(2*i-1,2*j)=255;Z(2*i,2*j-1)=0;Z(2*i,2*j)=0;
                end
            end
            %------------------------------------------------------------------%
            %------------------------------------------------------------------%
        end
    end
end

                    
                    
                
                