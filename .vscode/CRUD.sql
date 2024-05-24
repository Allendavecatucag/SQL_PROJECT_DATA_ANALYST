create TABLE job_applied(
    job_id INT,
    application_sent_date Date,
    custom_resume BOOLEAN,
    resume_file_name VARCHAR(255),
    cover_letter_sent BOOLEAN,
    cover_letter_file_name VARCHAR(255),
    status VARCHAR(50)
);

--CRUD ON SQL--

ALTER TABLE job_applied
      ADD contact VARCHAR(50);  --add contact column on table job_applied

ALTER TABLE job_applied
      RENAME COLUMN contat_name TO contact_name; -- Rename column on job_applied table

ALTER TABLE job_applied
      ALTER column contact_name TYPE TEXT;  --update Data type of the column from VARCHAR to TEXT

ALTER TABLE job_applied
      DROP COLUMN contact_name;  -- deleting the column contact_name from job_applied table

  -- Drop TABLE job_applied; -- DELETE INTIRE TABLE


UPDATE job_applied
       set contact = 'Marco'
       where job_id = 1;   --UPDATE OR INSERT VALUE ON COLUMN FROM JOB_APPLIED TABLE

UPDATE job_applied
       set contact = 'jericho'
       where job_id = 2;      

UPDATE job_applied
       set contact = 'james'
       where job_id = 3;


  -- Drop TABLE job_applied; -- DELETE INTIRE TABLE

  --ROLLBACK
      

/* -- INSERT VALUE ON JOB_APPLIED TABLE
INSERT INTO job_applied(

        job_id,
        application_sent_date,
        custom_resume,
        resume_file_name,
        cover_letter_sent,
        cover_letter_file_name,
        status)

VALUES ( 3,
        '2024-05-15',
        FALSE,
        'resume_03.pdf',
        FALSE,
        'cover_letter_03.pdf',
        'submitted')
     

    */

SELECT * FROM job_applied;
