Use bank_loan;

select * from financial_loan;

select * from financial_loan;

set sql_safe_updates = 0;

update financial_loan
set next_payment_date = str_to_date(next_payment_date, "%d-%m-%Y");

ALTER table financial_loan
modify column  `next_payment_date` date;

select count(id) as total_applications
from financial_loan;

#TOTAL LOAN APPLICATIONS
select count(id) as MTD_total_applications from financial_loan
where month(issue_date) = 12 and year(issue_date) = 2021;

select count(id) as PMTD_total_applications from financial_loan
where month(issue_date) = 11 and year(issue_date) = 2021;

#TOTAL FUNDED AMOUNT
Select sum(loan_amount) as total_funded_amount from financial_loan;

Select sum(loan_amount) as MTD_funded_amount from financial_loan
where month(issue_date) = 12;

Select sum(loan_amount) as PMTD_funded_amount from financial_loan
where  month(issue_date) = 11;

#TOTAL AMOUNT RECEIVED
select sum(total_payment) as total_amount_received from financial_loan;

select sum(total_payment) as MTD_total_amount_received from financial_loan
where month(issue_date) = 12;

select sum(total_payment) as PMTD_total_amount_received from financial_loan
where month(issue_date) = 11;

#AVERAGE INTEREST RATE
Select avg(int_rate)*100 as avg_int_rate from financial_loan;

Select avg(int_rate)*100 as MTD_avg_int_rate from financial_loan
where month(issue_date) = 12;

Select avg(int_rate)*100 as PMTD_avg_int_rate from financial_loan
where month(issue_date) = 11;

#AVERAGE DEBT-TO-INCOME RATIO(DTI)
Select avg(dti) *100 as avg_dti from financial_loan;

Select avg(dti) *100 as MTD_avg_dti from financial_loan
where month(issue_date) =12;

Select avg(dti) *100 as PMTD_avg_dti from financial_loan
where month(issue_date) =11;


#GOOD LOAN VS BAD LOAN

#GOOD LOAN
select 
	(count(case when loan_status = "fully Paid" or loan_status = "Current" then id end)*100)
    / count(id) as good_loan_percentage
from financial_loan;

Select count(id) as good_loan_applications from financial_loan
where loan_status = "fully Paid" or Loan_status = "Current";

Select sum(loan_amount) as good_loan_funded_amount from financial_loan
where loan_status = "fully Paid" or Loan_status = "Current";

Select sum(total_payment) as good_loan_amount_received from financial_loan
where loan_status = "fully Paid" or Loan_status = "Current";

#BAD LOAN
select
	(count(case when loan_status = "charged off" then id end)*100)
    / count(id) as bad_loan_percentage
from financial_loan;

select count(id) as bad_loan_applications from financial_loan
where loan_status = "charged off";

select sum(loan_amount) as bad_loan_funded_amount from financial_loan
where loan_status = "charged off";

select sum(total_payment) as bad_loan_amount_received from financial_loan
where loan_status = "charged off";

select 
	loan_status,
	count(id) as total_applications,
    sum(loan_amount) as total_funded_amount,
    sum(total_payment) as total_amount_received,
    avg(int_rate)*100 as avg_int_rate,
    avg(dti)*100 as avg_dti
    from financial_loan
group by loan_status;

select 
	Loan_status,
	count(id) mtd_loan_applications,
    sum(loan_amount) as MTD_total_funded_amount,
    sum(total_payment) as MTD_amount_received
from financial_loan
where month(issue_date) =12
group by loan_status;

#MONTHLY TRENDS
select 
	month(issue_date) as month_number,
    dayname(month(issue_date)) as month_name,
    count(id) as total_loan_applications,
    sum(loan_amount) as total_funded_amount,
    sum(total_payment) as total_amount_received;

#ADDRESS STATE
    
select
	address_state as state,
    count(id) as total_loan_applications,
    sum(loan_amount) as total_funded_amount,
    sum(total_payment) as total_amount_received
    from financial_loan
group by address_state
order by address_state;

#TERM
    
select 
		term as Term,
        count(id) as total_loan_applications,
    sum(loan_amount) as total_funded_amount,
    sum(total_payment) as total_amount_received
    from financial_loan
group by term
order by term;

# EMPLOYEE LENGTH

select 
	emp_length as employee_length,
    count(id) as total_loan_applications,
    sum(loan_amount) as total_funded_amount,
    sum(total_payment) as total_amount_received
    from financial_loan
group by emp_length
order by emp_length;

#PURPOSE

Select
	purpose as Purpose,
    count(id) as total_loan_applications,
    sum(loan_amount) as total_funded_amount,
    sum(total_payment) as total_amount_received
    from financial_loan
group by purpose
order by purpose;

#HOME OWNERSHIP

select
	home_ownership as Home_Ownership,
    count(id) as total_loan_applications,
    sum(loan_amount) as total_funded_amount,
    sum(total_payment) as total_amount_received
    from financial_loan
group by home_ownership
order by home_ownership;

select
	 purpose as Purpose,
     count(id) as total_loan_applications,
    sum(loan_amount) as total_funded_amount,
    sum(total_payment) as total_amount_received
    from financial_loan
where grade= 'A'
group by purpose
order by purpose;

select 
max(total_payment), address_state
from financial_loan
group by address_state
order by address_state desc;
