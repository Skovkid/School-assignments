* Överblick på dokumentet
use "SOMdata.dta",clear


***Question 1**
*Behålla somliga variabler
*  year, trust_polit, like_party, female, yearofbirth, rural, edu3

keep year trust_polit like_party female yearofbirth rural edu3

keep if year > 2009

* **Question 2**

*Enligt texten, beräknar central tendency

summarize

***Question 3**

* question a) generate age
generate age = year - yearofbirth

* question b) indicator of higher education

*Education indicator
generate higher_education = 0
replace higher_education = 1 if edu3 == 3

*browse


* question b) 

generate mil_par = 0
replace mil_par = 1 if like_party == 7

generate sve_dem = 0
replace sve_dem = 1 if like_party == 10
replace sve_dem =. if like_party ==.
replace mil_par=. if like_party ==.

summarize sve_dem mil_par

***Question 4** 

*Question a)

*Share of votes in 2018 survey vs election

summarize sve_dem if year == 2018
summarize mil_par if year == 2018

*Question b)

*2010-2018

*SD
*Kvinnor
summarize sve_dem if year > 2009 & year < 2019 & female == 1
*Män
summarize sve_dem if year > 2009 & year < 2019 & female == 0 


*MP
*Kvinnor
summarize mil_par if year > 2009 & year < 2019 & female == 1 
*Män
summarize mil_par if year > 2009 & year < 2019 & female == 0

*statistik rural

*SD
*rural
summarize sve_dem if year > 2009 & year < 2019 & rural == 1 
*urban
summarize sve_dem if year > 2009 & year < 2019 & rural == 0 


*MP
*rural
summarize mil_par if year > 2009 & year < 2019 & rural == 1 
*urban
summarize mil_par if year > 2009 & year < 2019 & rural == 0 


*Question 5


keep if year == 2018

save "2018.dta", replace

*Draw a random sample


*20 sample
sample 20

ci mean sve_dem
ci mean mil_par

use "2018.dta", clear

*Dubbelkolla om det är rätt data
table


*50 sample
sample 50

ci mean sve_dem
ci mean mil_par

*Ursprungliga
use "2018.dta", clear

ci mean sve_dem
ci mean mil_par