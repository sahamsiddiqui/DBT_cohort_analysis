# Data Modeling with DBT: Cohort Analysis

In this project, I will transform raw data in my BigQuery data platform to perform cohort analysis to understand player retention on the web application from Day 1 until Day 10 for a gaming industry client.

                 ![image](https://github.com/sahamsiddiqui/DBT_cohort_analysis/assets/52113462/05fb0bf0-dae1-48d7-9d6f-4686cdcb17dd)

## Project Overview
This project demonstrates how to perform cohort analysis using dbt (Data Build Tool). The goal is to simulate a real-life project using dbt, git, to perform cohort analysis, which are crucial for any analytics engineer or data engineer.

## Introduction to dbt
dbt (Data Build Tool) is a command-line tool that enables data analysts and engineers to transform data in their warehouse more effectively. Unlike traditional ETL tools, dbt focuses on the "T" in ETL—transformation. For this project, I used the dbt Cloud IDE, which provides a convenient way of working with dbt without worrying about the setup. With dbt, you can:
- Write modular SQL queries.
- Version control your transformations using git.
- Test and document your transformations to ensure data quality.
- Structure data models and YAML files in appropriate folders to ensure efficient running of dbt commands.

## Understanding Cohort Analysis
Cohort analysis is a method used to understand user behavior by grouping users into cohorts based on shared characteristics, typically the time when they first interacted with the product. This analysis helps in understanding user retention and engagement over time. In this project:
- **Cohort Criteria**: The criteria used to group users into different segments based on some similarity like event date or any other specific characteristic depending on your analysis goal.
- **Metric Event**: This is the event for which you want to study the group's behavior over time. For example, in this project, I want to see highly quality engaged users, so I chose the retention rate for players playing a match after login.
By analyzing the retention rates of different cohorts, we can gain insights into how user engagement evolves and which acquisition channels bring the most engaged users.

## Technology Stack
- **BigQuery**: Data platform used to store and query large datasets.
- **dbt**: Used for transforming raw data into meaningful metrics.
- **Looker**: Visualization tool used to create interactive dashboards and reports.

## Project Structure
- **models/**: Contains the dbt models.
  - **staging/**: Staging models, schema, and source configuration YAML files.
  - **marts/**: Data mart models for cohort analysis.
- **seeds/**: Seed data if any.
- **tests/**: Tests to ensure data quality.
- **snapshots/**: Snapshot definitions.
- **analyses/**: Analysis queries.
- **docs/**: Project documentation.
- **dbt_project.yml**: dbt project configuration.

## Steps to Reproduce
1. Clone the repository using `git clone`.
2. Set up the dbt environment and install dependencies.
3. Configure your `profiles.yml` to connect to your own data warehouse.
4. Run `dbt build` to build the models.
5. Connect Looker to your data warehouse and visualize the cohort analysis.

## Results
- The project includes a Looker dashboard visualizing cohort retention rates over time.
- Detailed documentation on how to set up and run the project.

## Conclusion
This project simulates working with dbt and git to perform cohort analysis and create BI consumables for downstream users.
