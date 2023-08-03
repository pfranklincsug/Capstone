/* Generated Code (IMPORT) */
/* Source File: MIS445TelcoExtraCSU-Global-FINAL.xlsx */
/* Source Path: /home/u63302721/myfolders/MIS445 */
/* Code generated on: 8/2/23, 5:16 PM */

%web_drop_table(WORK.IMPORT);


FILENAME REFFILE '/home/u63302721/myfolders/MIS445/MIS445TelcoExtraCSU-Global-FINAL.xlsx';

PROC IMPORT DATAFILE=REFFILE
	DBMS=XLSX
	OUT=WORK.IMPORT;
	GETNAMES=YES;
RUN;

PROC FREQ;
	TABLES CHURN;
RUN;

PROC REG;
	MODEL CHURN = AGE TENURE GENDER ED INCOME;
RUN;

ods graphics / reset width=6.4in height=4.8in imagemap;

proc sort data=WORK.IMPORT out=_HistogramTaskData;
	by churn;
run;

proc sgplot data=_HistogramTaskData;
	by churn;
	histogram age /;
	yaxis grid;
run;

ods graphics / reset;

proc datasets library=WORK noprint;
	delete _HistogramTaskData;
	run;

PROC CONTENTS DATA=WORK.IMPORT; RUN;

%web_open_table(WORK.IMPORT);