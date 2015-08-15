def selects_the_titles_of_all_projects_and_their_pledge_amounts
  <<-SQL
  SELECT projects.title, SUM(pledges.amount)
  FROM projects
  JOIN pledges
  ON projects.id = pledges.project_id
  GROUP BY projects.id
  ORDER BY projects.title;
  SQL
end

def selects_the_user_name_age_and_pledge_amount_for_all_pledges
  <<-SQL
  SELECT users.name, users.age, SUM(pledges.amount)
  FROM pledges
  JOIN users
  ON pledges.user_id = users.id
  GROUP BY users.id
  ORDER BY users.name;
  SQL
end

def selects_the_titles_of_all_projects_that_have_met_their_funding_goal
  <<-SQL
  SELECT projects.title, (projects.funding_goal - SUM(pledges.amount)) AS difference
  FROM projects
  JOIN pledges
  ON pledges.project_id = projects.id
  GROUP BY projects.id
  HAVING difference <= 0;
  SQL
end

def selects_user_names_and_amounts_of_all_pledges_grouped_by_name_then_orders_them_by_the_amount
  <<-SQL
  SELECT users.name, SUM(pledges.amount) AS total
  FROM pledges
  JOIN users
  ON pledges.user_id = users.id
  GROUP BY users.name
  ORDER BY total;
  SQL
end

def selects_the_category_names_and_pledge_amounts_of_all_pledges_in_the_music_category
  <<-SQL
  SELECT projects.category, pledges.amount
  FROM projects
  JOIN pledges ON projects.id = pledges.project_id
  WHERE category = 'music';
  SQL
end

def selects_the_category_name_and_the_sum_total_of_the_all_its_pledges_for_the_book_category
  <<-SQL
  SELECT projects.category, SUM(pledges.amount)
  FROM projects
  JOIN pledges ON projects.id = pledges.project_id
  GROUP BY projects.category
  HAVING projects.category = 'books';
  SQL
end
