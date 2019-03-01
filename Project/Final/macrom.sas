FILENAME REFFILE '/home/yxg1728300/sasuser.v94/GroupProject/sasgive.csv';

PROC IMPORT DATAFILE=REFFILE
	DBMS=CSV
	OUT=WORK.GPnew;
	GETNAMES=YES;
RUN;

PROC CONTENTS DATA=WORK.GPnew; RUN;




%web_open_table(WORK.GPnew);

data work.gp0;
set work.gpnew;
where cluster=0;
run;

proc freq data=work.gp0;
table mail_cnt sms_cnt email_cnt;run;

data work.gp1;
set work.gpnew;
where cluster=1;
run;

proc freq data=work.gp1;
table mail_cnt sms_cnt email_cnt;run;

data work.gp2;
set work.gpnew;
where cluster=2;
run;

proc freq data=work.gp2;
table mail_cnt sms_cnt email_cnt;run;

data work.gp3;
set work.gpnew;
where cluster=3;
run;

proc freq data=work.gp3;
table mail_cnt sms_cnt email_cnt;run;

data work.gp4;
set work.gpnew;
where cluster=4;
run;

proc freq data=work.gp4;
table mail_cnt sms_cnt email_cnt;run;

data work.gp5;
set work.gpnew;
where cluster=5;
run;

proc freq data=work.gp5;
table mail_cnt sms_cnt email_cnt;run;


Data work.gp0macrom;
set work.gp0;
total_net_sales= sew_ns+paper_ns+pct_ns+needle_ns+quilt_ns	
+impulse_ns+other_ns+kids_ns+jewelry_ns
+ribbon_ns+paint_ns+seasfloral_ns
+celeb_ns+fabric_ns+fleece_ns+special_ns
+warm_ns+homedec_ns+public_ns+foam_ns+bccomp_ns;run;

Data work.gp1macrom;
set work.gp1;
total_net_sales= sew_ns+paper_ns+pct_ns+needle_ns+quilt_ns	
+impulse_ns+other_ns+kids_ns+jewelry_ns
+ribbon_ns+paint_ns+seasfloral_ns
+celeb_ns+fabric_ns+fleece_ns+special_ns
+warm_ns+homedec_ns+public_ns+foam_ns+bccomp_ns;run;

Data work.gp2macrom;
set work.gp2;
total_net_sales= sew_ns+paper_ns+pct_ns+needle_ns+quilt_ns	
+impulse_ns+other_ns+kids_ns+jewelry_ns
+ribbon_ns+paint_ns+seasfloral_ns
+celeb_ns+fabric_ns+fleece_ns+special_ns
+warm_ns+homedec_ns+public_ns+foam_ns+bccomp_ns;run;


Data work.gp3macrom;
set work.gp3;
total_net_sales= sew_ns+paper_ns+pct_ns+needle_ns+quilt_ns	
+impulse_ns+other_ns+kids_ns+jewelry_ns
+ribbon_ns+paint_ns+seasfloral_ns	
+celeb_ns+fabric_ns+fleece_ns+special_ns
+warm_ns+homedec_ns+public_ns+foam_ns+bccomp_ns;run;

Data work.gp4macrom;
set work.gp4;
total_net_sales= sew_ns+paper_ns+pct_ns+needle_ns+quilt_ns
+impulse_ns+other_ns+kids_ns+jewelry_ns
+ribbon_ns+paint_ns+seasfloral_ns	
+celeb_ns+fabric_ns+fleece_ns+special_ns
+warm_ns+homedec_ns+public_ns+foam_ns+bccomp_ns;run;

Data work.gp5macrom;
set work.gp5;
total_net_sales= sew_ns+paper_ns+pct_ns+needle_ns+quilt_ns
+impulse_ns+other_ns+kids_ns+jewelry_ns
+ribbon_ns+paint_ns+seasfloral_ns	
+celeb_ns+fabric_ns+fleece_ns+special_ns
+warm_ns+homedec_ns+public_ns+foam_ns+bccomp_ns;run;


* Macrom Valuation(ppt ols extension);

*cluster0;


* [To value marcom:
Run a marketing mix/media mix model with dependent variable as “revenue”
The independent variables are “number of e.g., emails sent, sms sent, direct mails sent, etc.”


Value = marcom coefficient * average number marcom sent
Often divide this by total average revenue to get percent contribution];

proc reg data = work.gp0macrom;
model total_net_sales =sms_cnt email_cnt mail_cnt/vif collin;
output out = marcom_resid p = Prev r = Rrev student = student;
run;quit;


proc means data = work.gp0macrom;
var sms_cnt email_cnt mail_cnt total_net_sales;
run;

* Aver revenue:0.1640354
sms: -0.09203*0.0144288=-0.001331 -0.001331/0.1640354=-0.00811
emai: 0.09266*0.0491107=0.00455/0.164=0.0277
mail: 0.10561*0.0789410=0.008337/0.164=0.05083

*cluster1;

proc reg data = work.gp1macrom;
model total_net_sales =sms_cnt email_cnt mail_cnt/vif collin;
output out = marcom_resid p = Prev r = Rrev student = student;
run;quit;


proc means data = work.gp1macrom;
var sms_cnt email_cnt mail_cnt total_net_sales;
run;


* Aver revenue:0.5238092
sms: 0.56774*0.0226953=-0.012885/0.5238=0.0246
emai: 0.03937*0.8725246=0.00455/0.5238092=0.0277
mail: 0.10561*0.0789410=0.05083/0.5238=0.06558


* cluster2;
proc reg data = work.gp2macrom;
model total_net_sales =sms_cnt email_cnt mail_cnt/vif collin;
output out = marcom_resid p = Prev r = Rrev student = student;
run;quit;


proc means data = work.gp2macrom;
var sms_cnt email_cnt mail_cnt total_net_sales;
run;

*Aver revenue: 0.5044877
*coefficient(sms_cnt)= 1.66882*	0.0110395=0.01842/0.5044877=0.036518
coefficient(email_cnt)=0.27832*0.0500722==0.01394/0.5044877=0.02762
coefficient(mail_cnt)=1.68488 Value= 1.68488*0.5044877 0.0661121/0.1277344=2.84%




* cluster3;
proc reg data = work.gp3macrom;
model total_net_sales =sms_cnt email_cnt mail_cnt/vif collin;
output out = marcom_resid p = Prev r = Rrev student = student;
run;quit;


proc means data = work.gp3macrom;
var sms_cnt email_cnt mail_cnt total_net_sales;
run;

* Aver revenue: 0.1921003
sms: -0.02594*0.0251022=-0.0006/0.1921003=-0.0033
email: 0.02285*0.7786303=0.01779/0.1921003=0.0926
mail: -0.11601*0.1210768=-0.014046/0.1921003=-0.07311

*cluster4;
proc reg data = work.gp4macrom;
model total_net_sales =sms_cnt email_cnt mail_cnt/vif collin;
output out = marcom_resid p = Prev r = Rrev student = student;
run;quit;
proc means data = work.gp4macrom;
var sms_cnt email_cnt mail_cnt total_net_sales;
run;
* Aver revenue: 0.4488599
sms: -0.16089*0.8878279=-0.14284/0.44886=-0.3182
email: -0.18452*0.2554512==0.0471/0.44886=-0.1050
mail: 1.00152*0.2377025=0.23806/0.44886=0.53037




*cluster5;
proc reg data = work.gp5macrom;
model total_net_sales =sms_cnt email_cnt mail_cnt/vif collin;
output out = marcom_resid p = Prev r = Rrev student = student;
run;quit;


proc means data = work.gp5macrom;
var sms_cnt email_cnt mail_cnt total_net_sales;
run;
* Aver revenue: 0.1781047
sms: 0.08807*0.3527767=-0.14284/0.44886=-0.1050
email: 0.25212*0.0143446=0.0036/0.44886=0.008
mail: 1.10084*0.0155079=0.23806/0.44886=0.53037=0.038

