import matplotlib.pyplot as plt

# Data
job_titles = ["Data Analyst", "Director of Analytics", "Associate Director", "Data Analyst (Marketing)", "Data Analyst (Hybrid/Remote)", "Principal Data Analyst (Remote)", "Director, Data Analyst - HYBRID", "Principal Data Analyst", "ERM Data Analyst"]
salaries = [650000, 336500, 255829.5, 232423, 217000, 205000, 189309, 189000, 186000]

# Create bar graph
plt.figure(figsize=(10,6))
plt.barh(job_titles, salaries, color='skyblue')
plt.xlabel('Average Salary (Yearly)')
plt.ylabel('Job Titles')
plt.title('Average Salary by Job Title')
plt.gca().invert_yaxis()  # Invert y-axis to display the job titles from top to bottom
plt.tight_layout()

# Show plot
plt.show()