# SYS_LOG
SQL server generic loggin solution for logging sql jobs, ssis jobs, application messages

1. LOG data is columstored , optimized for reporting
2. Keep few levels of hierarchy (object,obeject_sub, step)
3. keep duration of each step as float data
4. keep an extra value (eg number of records updated, deleted etc)
5. keep server name, session
6. keep site
7. keep result of the step
8. keep long data , for input parameters, outputs or use A_FN_SYS_ErrorJson function to store full error information in json format

Use cases: 
1. Applications data processing
2. SQL Server agent jobs 
