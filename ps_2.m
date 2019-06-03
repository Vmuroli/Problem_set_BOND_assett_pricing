clear;
clc;
load dataset.mat
%% Ex 1.1
F=100+zeros(619,1);
vector1=1+zeros(619,1);
YTM_1=(F./(price1(2:end)))-(vector1);
YTM_2=(F./(price2(2:end))).^(1/2)-(vector1);
YTM_3=(F./(price3(2:end))).^(1/3)-(vector1);
YTM_4=(F./(price4(2:end))).^(1/4)-(vector1);
YTM_5=(F./(price5(2:end))).^(1/5)-(vector1);
monthlyYTM_1=(1+YTM_1).^(1/12)-1;
monthlyYTM_2=(1+YTM_2).^(1/12)-1;
monthlyYTM_3=(1+YTM_3).^(1/12)-1;
monthlyYTM_4=(1+YTM_4).^(1/12)-1;
monthlyYTM_5=(1+YTM_5).^(1/12)-1;
set_30_52=[monthlyYTM_1(4) monthlyYTM_2(4) monthlyYTM_3(4) monthlyYTM_4(4) monthlyYTM_5(4)];
mar_31_78=[monthlyYTM_1(310) monthlyYTM_2(310) monthlyYTM_3(310) monthlyYTM_4(310) monthlyYTM_5(310)];
dec_31_03=[monthlyYTM_1(619) monthlyYTM_2(619) monthlyYTM_3(619) monthlyYTM_4(619) monthlyYTM_5(619)];
figure(1)
plot(set_30_52);
hold on
plot(mar_31_78);
hold on
plot(dec_31_03);
%COMMENTO
%% Ex 1.2
FWD1_2=(price1(2:end))./(price2(2:end))-1;
FWD2_3=(price2(2:end))./(price3(2:end))-1;
FWD3_4=(price3(2:end))./(price4(2:end))-1;
FWD4_5=(price4(2:end))./(price5(2:end))-1;

%% Ex 1.3
HPR_1year=((vector1(1:end-1)+monthlyYTM_1(2:end)).^(12))./((vector1(2:end)+monthlyYTM_1(1:end-1)).^(11));
HPR_2year=((vector1(1:end-1)+monthlyYTM_2(2:end)).^(12))./((vector1(2:end)+monthlyYTM_2(1:end-1)).^(11));
HPR_3year=((vector1(1:end-1)+monthlyYTM_3(2:end)).^(12))./((vector1(2:end)+monthlyYTM_3(1:end-1)).^(11));
HPR_4year=((vector1(1:end-1)+monthlyYTM_4(2:end)).^(12))./((vector1(2:end)+monthlyYTM_4(1:end-1)).^(11));
HPR_5year=((vector1(1:end-1)+monthlyYTM_5(2:end)).^(12))./((vector1(2:end)+monthlyYTM_5(1:end-1)).^(11));
grossRet_1year=((monthlyYTM_1(2:end))+(vector1(2:end)));
HPexcessR_2year=HPR_2year-grossRet_1year;
HPexcessR_3year=HPR_3year-grossRet_1year;
HPexcessR_4year=HPR_4year-grossRet_1year;
HPexcessR_5year=HPR_5year-grossRet_1year;
%% EX 1.4
AVG_HPR_1year=mean(HPR_1year);
AVG_HPR_2year=mean(HPR_2year);
AVG_HPR_3year=mean(HPR_3year);
AVG_HPR_4year=mean(HPR_4year);
AVG_HPR_5year=mean(HPR_5year);
SD_HPR_1year=std(HPR_1year);
SD_HPR_2year=std(HPR_2year);
SD_HPR_3year=std(HPR_3year);
SD_HPR_4year=std(HPR_4year);
SD_HPR_5year=std(HPR_5year);
SE_HPR_1year=SD_HPR_1year/((618)^(1/2));
SE_HPR_2year=SD_HPR_2year/((618)^(1/2));
SE_HPR_3year=SD_HPR_3year/((618)^(1/2));
SE_HPR_4year=SD_HPR_4year/((618)^(1/2));
SE_HPR_5year=SD_HPR_5year/((618)^(1/2));
AVG_HPR=[AVG_HPR_1year;AVG_HPR_2year;AVG_HPR_3year;AVG_HPR_4year;AVG_HPR_5year];
SD=[SD_HPR_1year;SD_HPR_2year;SD_HPR_3year;SD_HPR_4year;SD_HPR_5year];
SE=[SE_HPR_1year;SE_HPR_2year;SE_HPR_3year;SE_HPR_4year;SE_HPR_5year];
Tab1=table(AVG_HPR,SD,SE);
%% Ex 1.5
X1=FWD1_2-YTM_1;
X2=FWD2_3-YTM_1;
X3=FWD3_4-YTM_1;
X4=FWD4_5-YTM_1;
Y2_EX_1_5=YTM_1(2:end)-YTM_1(1:end-1);
Y3_EX_1_5=YTM_1(3:end)-YTM_1(1:end-2);
Y4_EX_1_5=YTM_1(4:end)-YTM_1(1:end-3);
Y5_EX1_5=YTM_1(5:end)-YTM_1(1:end-4);
for2_EX1_5=fitlm(X1(2:end),Y2_EX_1_5);
for3_EX1_5=fitlm(X2(3:end),Y3_EX_1_5);
for4_EX1_5=fitlm(X3(4:end),Y4_EX_1_5);
for5_EX1_5=fitlm(X4(5:end),Y5_EX1_5);
Labels_EX_1_5=['for2_EX1_5';'for3_EX1_5';'for4_EX1_5';'for5_EX1_5'];
a_Intercepets_EX_1_5=[0.00059398;0.0015911;0.0022575;0.0026095];
SE_a_EX_1_5=[0.00024971;0.0003893;0.00047323;0.00051876];
b_EX_1_5=[-0.13939;-0.21203;-0.24266;-0.28113];
SE_b_EX_1_5=[0.02881;0.029625;0.029648;0.031];
adj_R_sqrd_EX_1_5=[0.035;0.0754;0.0969;0.117];
Tab_EX_1_5=table(Labels_EX_1_5,a_Intercepets_EX_1_5,SE_a_EX_1_5,b_EX_1_5,SE_b_EX_1_5,adj_R_sqrd_EX_1_5)
%% EX 1.6
X1=FWD1_2-YTM_1;
X2=FWD2_3-YTM_1;
X3=FWD3_4-YTM_1;
X4=FWD4_5-YTM_1;
Y2_EX_1_6=HPR_1year(2:end)-YTM_1(2:end-1);
Y3_EX_1_6=HPR_2year(2:end)-YTM_1(2:end-1);
Y4_EX_1_6=HPR_3year(2:end)-YTM_1(2:end-1);
Y5_EX_1_6=HPR_4year(2:end)-YTM_1(2:end-1);

for1_EX1_6=fitlm(X1(2:end-1),Y2_EX_1_6);
for2_EX1_6=fitlm(X2(2:end-1),Y3_EX_1_6);
for3_EX1_6=fitlm(X3(2:end-1),Y4_EX_1_6);
for4_EX1_6=fitlm(X1(2:end-1),Y5_EX_1_6);
Labels_EX_1_6=['for1_EX1_6';'for2_EX1_6';'for3_EX1_6';'for4_EX1_6'];
a_Intercepets_EX_1_6=[0.94247;0.93875;0.93905;0.93905];
SE_a_EX_1_6=[0.0013448;0.0013565;0.0013795;0.0013379];
b_EX_1_6=[0.78242;0.96213;0.76183;0.7818];
SE_b_EX_1_6=[0.15528;0.10347;0.08676;0.15449];
adj_R_sqrd_EX_1_6=[0.0381;0.122;0.11;0.0384];
Tab_EX_1_6=table(Labels_EX_1_6,a_Intercepets_EX_1_6,SE_a_EX_1_6,b_EX_1_6,SE_b_EX_1_6,adj_R_sqrd_EX_1_6);
