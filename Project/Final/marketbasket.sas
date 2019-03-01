**market basket;

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

data work.gp1;
set work.gpnew;
where cluster=1;
run;

data work.gp2;
set work.gpnew;
where cluster=2;
run;

data work.gp3;
set work.gpnew;
where cluster=3;
run;

data work.gp4;
set work.gpnew;
where cluster=4;
run;

data work.gp5;
set work.gpnew;
where cluster=5;
run;


** cluster0 homedecor;

data work.gp0market;
set work.gp0;

logit_homedec_qty=0; logit_warm_qty=0; logit_celeb_qty=0;logit_seasfloral_qty=0;

if homedec_qty > 0 then logit_homedec_qty = 1;
if warm_qty > 0 then logit_warm_qty=1;
if celeb_qty> 0 then logit_celeb_qty= 1;
if seasfloral_qty> 0 then logit_seasfloral_qty= 1;
run;

proc means data = work.gp0market;
var logit_homedec_qty; logit_warm_qty; logit_celeb_qty;logit_seasfloral_qty;
run;


proc logistic descending data =work.gp0market ;
model logit_homedec_qty = logit_warm_qty logit_celeb_qty logit_seasfloral_qty; run;

** warm: 49.36% celeb: -4.24% seasfloral: 61.46%

** cluster1 kids no bundle analysis 


** cluster2 sew;

data work.gp2market;
set work.gp2;
logit_sew_qty=0; logit_needle_qty=0; logit_foam_qty=0;

if sew_qty > 0 then logit_sew_qty = 1;
if needle_qty > 0 then logit_needle_qty=1;
if foam_qty > 0 then logit_foam_qty= 1;

run;

proc means data = work.gp2market;
var logit_sew_qty logit_needle_qty logit_foam_qty;
run;


proc logistic descending data =work.gp2market ;
model logit_sew_qty = logit_needle_qty  logit_foam_qty; run;

* needle: 189.05% foam: 392.34%

**cluster3 impluse no bundle analysis

** cluster4 fabric;

data work.gp4market;
set work.gp4;
logit_quilt_qty=0; logit_fabric_qty=0; logit_fleece_qty=0;

if quilt_qty> 0 then logit_quilt_qty = 1;
if fabric_qty > 0 then logit_fabric_qty=1;
if fleece_qty > 0 then logit_fleece_qty= 1;
run;

proc means data = work.gp4market;
var logit_quilt_qty logit_fabric_qty logit_fleece_qty;
run;


proc logistic descending data =work.gp4market ;
model logit_quilt_qty=logit_fabric_qty logit_fleece_qty;
run;

*fabric: 244.04% fleece: 97.62%

** cluster5 craft;

data work.gp5market;
set work.gp5;
logit_ribbon_qty=0; logit_bccomp_qty=0; logit_paint_qty=0; logit_paper_qty=0; logit_pct_qty=0;

if ribbon_qty > 0 then logit_ribbon_qty = 1;
if bccomp_qty > 0 then logit_bccomp_qty=1;
if paint_qty > 0 then logit_paint_qty= 1;
if paper_qty > 0 then logit_paper_qty= 1;
if pct_qty > 0 then logit_pct_qty= 1;
run;

proc means data = work.gp5market;
var logit_ribbon_qty logit_bccomp_qty logit_paint_qty logit_paper_qty logit_pct_qty;
run;


proc logistic descending data =work.gp5market ;
model logit_ribbon_qty=logit_bccomp_qty logit_paint_qty logit_paper_qty logit_pct_qty;
run;

* bccmop: 107.1349% paint:140.7527% paper: 155.9981% pct: -14.40%





