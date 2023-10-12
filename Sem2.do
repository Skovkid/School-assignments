*Get files

use "C:\Users\Viktor\Documents\Stockholms Universitet\Statasvet Stata\data_wa4.dta",clear


* överblick på datan

browse

*Skapa kvoter och variabler

generate share_outmigrants = outmigrants / population * 100
generate share_women =  women / population *100
generate share_employed= employed / population *100

*question 2 a)

summarize share_sd share_outmigrants share_women share_employed

*queston 2 b)

*Scatterplot 1: Outmigrants

graph twoway (lfit share_sd share_outmigrants)(scatter share_sd share_outmigrants) 

*sparar med detta kommando
*. graph save "Graph" "C:\Users\Viktor\Documents\Stockholms Universitet\Statasvet Stata\migrants.gph" file C:\Users\Viktor\Documents\Stockholms Universitet\Statasvet Stata\migrants.gph saved


*Scatterplot 2: Women

graph twoway (lfit share_sd share_women)(scatter share_sd share_women)
*sparar som ovan

*Scatterplot 3: Employed
graph twoway (lfit share_sd share_employed)(scatter share_sd share_employed) 

*sparar som ovan



*question 3 and 4

*Install estout package for graphics
ssc install estout

*Regression för migranter
regress share_sd share_outmigrants
eststo Model1

*Regression för kvinnor
regress share_sd share_women
eststo Model2

*Regression för arbetskraft
regress share_sd share_employed
eststo Model3


*skapar tabel med statistik signifikans. 
esttab Model1 Model2 Model3, 
    b(%9.3f) se(%9.3f) star(* 0.05 ** 0.01 *** 0.001) 
							*Stjärnor indikerar vilken nivå av stat signifikans

    title("Regression Results")
    label


eststo clear


