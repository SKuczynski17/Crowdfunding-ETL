-- Challenge Bonus queries.
-- 1. (2.5 pts)
-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 
SELECT outcome, cf_id, backers_count
from campaign
WHERE outcome = ( 'live')


-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.
SELECT COUNT(cf_id) , cf_id
FROM backers
group by cf_id;


-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 

SELECT co.first_name, co.last_name, co.email, (ca.goal - ca.pledged) as remaining_goal
INTO contact_information_remaining_goal
From campaign as ca
INNER JOIN contacts as co
ON (ca.contact_id = co.contact_id)
WHERE (ca.outcome = 'live')
Order by remaining_goal


-- Check the table
SELECT * FROM contact_information_remaining_goal

-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 
SELECT ba.email, ba.first_name, ba.last_name, ca.cf_id, ca.company_name, ca.description, ca.end_date, (ca.goal - ca.pledged) as Left_of_Goal
INTO email_backers_remaining_goal_amount
From campaign as ca
INNER JOIN backers as ba
ON (ca.cf_id = ba.cf_id)
WHERE (ca.outcome = 'live')
Order by ba.last_name;


-- Check the table
SELECT * FROM email_backers_remaining_goal_amount

