#step1

txt = csvread("train.csv");
X_train  = txt([2:10001],1);
Y_train  = txt([2:10001],2);

New_X_train = [ones(10000,1),X_train];

#step2

w = randn(2,1);

#step3

hold on;
scatter(X_train,Y_train,'b');

X_1 = New_X_train';
W_1 = w';
D = W_1*X_1;

hold on;
plot(X_train,D' ,'r');


xlabel ("feature");
ylabel ("label");
title ("Plot for step1");

print -dpdf "fig1.pdf";
close

#step4

w_direct = New_X_train' * New_X_train;
w_direct = inv(w_direct);
w_direct = w_direct * New_X_train';
w_direct = w_direct * Y_train;
W_1 = w_direct' * X_1;

hold on;
scatter(X_train,Y_train,'b');

hold on;
plot(X_train,W_1' ,'r');

xlabel ("x-axis");
ylabel ("y-axis");
title ("Plot for step4");

print -dpdf "fig2.pdf";
close;

#step5

for i = 1:4
	for j = 1:10000
		X_a = reshape(New_X_train(j,:),2,1);
		D_a = reshape(w,1,2)*X_a;
		D_b = D_a - Y_train(j,1);
		w = w - (.00000001)*D_b*X_a;
		W_1 = reshape(w,1,2);
		D = W_1*X_a;
	
		if (mod(j,100) ==0)
			hold on;
			plot(X_train(j,1),Y_train(j,1), 'b');
			hold on;
			plot( X_train(j,1),D(1,1),'r');
			xlabel ("x-axis");
			ylabel ("y-axis");
			title ("Plots for step5");
		endif
	endfor
	epoch = sprintf("%d",i);
	print(epoch,"-dpdf");
	close;
endfor

#step6

w_3 = w' * X_1;
plot(X_train,Y_train,  'b');
plot(X_train,w_3', 'r');
xlabel ("x-axis");
ylabel ("y-axis");
title ("Plot for step6");
			
print -dpdf "fig4.pdf";
close;

#step7

txt = csvread("test.csv");
X_test  = txt([2:10501],1);
Y_test  = txt([2:10501],2);

New_X_test = [ones(10500,1),X_test];
y_pred1 = New_X_test*w;
error = 0;

for n = 1:10500
	erro = y_pred1(n,1) - Y_test(n,1);
	error = error + erro*erro;
endfor	 

error1 = error/10500;
rms_error = sqrt(error1);

w_direct = New_X_train' * New_X_train;
w_direct = inv(w_direct);
w_direct = w_direct * New_X_train';
w_direct = w_direct * Y_train ;

y_pred2 = New_X_test * w_direct;

err=0;

for n = 1:10500
	erro = y_pred2(n,1) - Y_test(n,1);
	err = err + erro*erro;
endfor

error2 = err/10500;
rms_error2 = sqrt(error2);

disp ("The value of rms_error1 is:"), disp (rms_error);
disp ("The value of rms_error2 is:"), disp (rms_error2);




