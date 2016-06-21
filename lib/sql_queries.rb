# CREATE TABLE projects (
#   id INTEGER PRIMARY KEY,
#   title TEXT,
#   category TEXT,
#   funding_goal TEXT,
#   start_date DATE,
#   end_date DATE
# );

# CREATE TABLE users (
#   id INTEGER PRIMARY KEY,
#   name TEXT,
#   age INTEGER
# );

# CREATE TABLE pledges (
#   id INTEGER PRIMARY KEY,
#   amount INTEGER,
#   user_id TEXT,
#   project_id TEXT
# );

def selects_the_titles_of_all_projects_and_their_pledge_amounts
  "SELECT projects.title, SUM(pledges.amount) 
  FROM projects
  JOIN pledges
  ON pledges.project_id = projects.id
  GROUP BY projects.title;"
end

def selects_the_user_name_age_and_pledge_amount_for_all_pledges
  "SELECT users.name, users.age, SUM(pledges.amount)
  FROM users
  JOIN pledges
  ON users.id = pledges.user_id
  GROUP BY users.name;"
end

def selects_the_titles_and_amount_over_goal_of_all_projects_that_have_met_their_funding_goal
  "SELECT projects.title, (SUM(pledges.amount) - projects.funding_goal)
  FROM projects
  JOIN pledges
  ON pledges.project_id = projects.id
  GROUP BY projects.title
  HAVING (SUM(pledges.amount) - projects.funding_goal) >= 0;"
end

def selects_user_names_and_amounts_of_all_pledges_grouped_by_name_then_orders_them_by_the_amount
  "SELECT users.name, SUM(pledges.amount)
  FROM users
  JOIN pledges
  ON pledges.user_id = users.id
  GROUP BY users.name
  ORDER BY SUM(pledges.amount);"
end

def selects_the_category_names_and_pledge_amounts_of_all_pledges_in_the_music_category
  "SELECT projects.category, pledges.amount
  FROM projects 
  JOIN pledges
  ON pledges.project_id = projects.id
  WHERE projects.category = 'music';"
end

def selects_the_category_name_and_the_sum_total_of_the_all_its_pledges_for_the_book_category
  "SELECT projects.category, SUM(pledges.amount)
  FROM projects
  JOIN pledges
  ON pledges.project_id = projects.id
  WHERE projects.category = 'books'
  GROUP BY projects.category

  ;"
  ##ordering of WHERE and GROUP BY
end
