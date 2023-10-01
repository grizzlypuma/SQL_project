use [MusicDB]

select 
	*
from
	Invoice


--- 1: We display the purchase number, the purchase amount, as well as the cashback level.
select 
  invoiceid, 
  billingcountry, 
  total, 
  case when total > 10 then 4 when total > 15 then 8 when billingcountry = 'USA' 
  and total > 10 then 6 when billingcountry = 'USA' 
  and total > 15 then 10 else null end as cashback 
from 
  Invoice

--- 2: ??????? ?????????? ??????? ?? ??????? ?????? ???????.
select 
  sum(
    case when total > 10 
    and BillingCountry <> 'USA' then 1 else 0 end
  ) as cashback_4_notUS, 
  sum(
    case when total > 15 
    and BillingCountry <> 'USA' then 1 else 0 end
  ) as cashback_8_notUS, 
  sum(
    case when total > 10 
    and BillingCountry = 'USA' then 1 else 0 end
  ) as cashback_6_US, 
  sum(
    case when total > 15 
    and BillingCountry = 'USA' then 1 else 0 end
  ) as cashback_10_US 
from 
  invoice

--- 3: Calculate how much money (percentage * purchase amount) should you allocate for 
--- cashback on all purchases?
select 
  invoiceid, 
  billingcountry, 
  total, 
  case when total > 10 
  and BillingCountry <> 'USA' then total * 4 / 100 when total > 15 
  and BillingCountry <> 'USA' then total * 8 / 100 when billingcountry = 'USA' 
  and total > 10 then total * 6 / 100 when billingcountry = 'USA' 
  and total > 15 then total * 10 / 100 else null end as cashback 
from 
  Invoice

--- 4: Calculate what amount of cashback (percent * purchase amount) and how many purchases 
--- should you allocate to each client?

select 
  CustomerId, 
  sum(
    case when total > 10 
    and BillingCountry <> 'USA' then total * 4 / 100 when total > 15 
    and BillingCountry <> 'USA' then total * 8 / 100 when billingcountry = 'USA' 
    and total > 10 then total * 6 / 100 when billingcountry = 'USA' 
    and total > 15 then total * 10 / 100 else null end
  ) as cashback_sum, 
  sum(
    case when total > 10 
    and BillingCountry <> 'USA' then 1 when total > 15 
    and BillingCountry <> 'USA' then 1 when billingcountry = 'USA' 
    and total > 10 then 1 when billingcountry = 'USA' 
    and total > 15 then 1 else 0 end
  ) as cashback_count 
from 
  Invoice 
group by 
  CustomerId

--- 5: Which client will receive the maximum cashback amount?
select 
  top 1 CustomerId, 
  sum(
    case when total > 10 
    and BillingCountry <> 'USA' then total * 4 / 100 when total > 15 
    and BillingCountry <> 'USA' then total * 8 / 100 when billingcountry = 'USA' 
    and total > 10 then total * 6 / 100 when billingcountry = 'USA' 
    and total > 15 then total * 10 / 100 else null end
  ) as cashback_sum, 
  sum(
    case when total > 10 
    and BillingCountry <> 'USA' then 1 when total > 15 
    and BillingCountry <> 'USA' then 1 when billingcountry = 'USA' 
    and total > 10 then 1 when billingcountry = 'USA' 
    and total > 15 then 1 else 0 end
  ) as cashback_count 
from 
  Invoice 
group by 
  CustomerId 
order by 
  cashback_sum desc
