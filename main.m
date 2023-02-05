clear all;
l1=1;
l2=1;
L1=20.6;
L2=8.1;
l3=11.8;
l4=10.8;
ma=0.2;
mb=0.1;
mc=0.1;
md=0.1;
g=9.8;
Da=@fun1;
set(gcf,'DoubleBuffer','on');
[t,x]=ode45(Da,[0,10],[pi/2,pi/2,0,0]);%改这里设置初始状态（后面两个0不用管）
axis([-(l1+l2)-1,(l1+l2)+1,-(l1+l2)*1.8,2]);
axis square;hold on;%下面的i为复数标志，并非循环定义的i
gh1=plot([0,l1*exp(i*(x(1)-pi/2))],'r-');
set(gh1,'linewidth',2,'markersize',10,'marker','o');
gh3=plot([-0.8*exp(i*(x(1)-pi/2)),0],'r-');   %gh3与gh1是对称关系（红色杆）
set(gh3,'linewidth',2,'markersize',10,'marker','o');
gh2=plot([l1*exp(i*(x(1)-pi/2)),l1*exp(i*(x(1)-pi/2))+l2*exp(i*(x(2)-pi/2))],'b-');%gh2与gh8是点对称关系
set(gh2,'linewidth',2,'markersize',6,'marker','o');
gh8=plot([3*(0.48*exp(i*(x(1)-pi/2)))-0.4*exp(i*(x(1)-pi/2))-0.8*exp(i*(x(2)-pi/2)),l1*exp(i*(x(1)-pi/2))],'b-');%0.48位置处的系数越小越好
set(gh8,'linewidth',2,'markersize',6,'marker','o');

%下面的底座：
gh4=plot([0,-3],'k-');
set(gh4,'linewidth',5,'markersize',10,'marker','o');
gh5=plot([-1-3.5*i,-3*i],'k-');
set(gh5,'linewidth',5,'markersize',10,'marker','o');
gh6=plot([1-3.5*i,-3*i],'k-');
set(gh6,'linewidth',5,'markersize',10,'marker','o');

for k=2:size(x,1)
    C1=[0,1*exp(i*(x(k,1)-pi/2))];
    C2=[l1*exp(i*(x(k,1)-pi/2)),l1*exp(i*(x(k,1)-pi/2))+1*exp(i*(x(k,2)-pi/2))];
    C3=[-0.8*exp(i*(x(k,1)-pi/2)),0];
    C4=[0,-3];
    C5=[-1-3.5*i,-3*i];
    C6=[1-3.5*i,-3*i];
    C8=[3*(0.48*exp(i*(x(k,1)-pi/2)))-0.41*exp(i*(x(k,1)-pi/2))-0.8*exp(i*(x(k,2)-pi/2)),l1*exp(i*(x(k,1)-pi/2))];
    
    set(gh1,'xdata',real(C1),'ydata',imag(C1));
    set(gh2,'xdata',real(C2),'ydata',imag(C2));
    set(gh3,'xdata',real(C3),'ydata',imag(C3));
    set(gh4,'xdata',imag(C4),'ydata',real(C4));
    set(gh5,'xdata',real(C5),'ydata',imag(C5));
    set(gh6,'xdata',real(C6),'ydata',imag(C6));
    set(gh8,'xdata',real(C8),'ydata',imag(C8));
    title(['t=',num2str(t(k))],'fontsize',12);
    pause(0.1);
end
 figure;
 set(0,'defaultfigurecolor','w')
 subplot(2 ,3 ,1);plot(t,x(:,1));title('t-\theta_1');
 xlabel('t');ylabel('\theta_1');
 subplot(2 ,3 ,2);plot(t,x(:,2));title('t-\theta_2');
 xlabel('t');ylabel('\theta_2');
 subplot(2 ,3 ,3);plot(t,x(:,3));title('t-\omega_1');
 xlabel('t');ylabel('\omega_1');
 subplot(2,3,4);plot(t,x(:,4));title('t-\omega_2');
 xlabel('t');ylabel('\omega_2');
 subplot(2,3,5);plot(x(:,1),x(:,3));title('\theta_1-\omega_1');
 xlabel('\theta_1');ylabel('\omega_1');
 subplot(2,3,6);plot(x(:,2),x(:,4));title('\theta_2-\omega_2');
 
%注释清除可以单独运行解
[t,y] = ode45(Da,[0 10],[pi/2,pi/2,0,0]);
 set(0,'defaultfigurecolor','w')
 plot(t,y(:,1),'-o',t,y(:,2),'-o');
 title('Solution of with ODE45');
 xlabel('Time t');ylabel('Solution');
 legend('theta_1(t)','theta_2(t)','Location','southwest')
 legend('boxoff')
