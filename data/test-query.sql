-- CREATE NEW TIMECLOCK ENTRY
INSERT INTO employee_time_log (employee_id, log_date, keylog) 
    SELECT * FROM 
        (SELECT '01-0012' AS empid, CURDATE() AS curdate, md5(CONCAT('01-0012', CURDATE())) as keylogid) as tmp 
    WHERE 
        NOT EXISTS (SELECT keylog FROM employee_time_log WHERE keylog = keylogid AND employee_id = empid AND log_date = curdate )
    LIMIT 1;

--automatic insert new timeclock entry using trigger
INSERT INTO timeclock (keylog, log_type, clockin) 
    SELECT * FROM 
        (SELECT (SELECT keylog from employee_time_log WHERE employee_id = '01-0012' and log_date = CURDATE()) as keylogid, 'timeclock', CURTIME()) AS tmp
    WHERE 
        NOT EXISTS (SELECT keylog FROM timeclock WHERE keylog = keylogid and log_type = 'timeclock' and update_date = '0000-00-00 00:00:00')
    LIMIT 1;


-- how to insert new ob entry
INSERT INTO timeclock (keylog, log_type, clockin) 
    SELECT * FROM 
        (SELECT (SELECT keylog from employee_time_log WHERE employee_id = '01-0012' and log_date = CURDATE()) as keylogid, 'ob', CURTIME()) AS tmp 
    WHERE 
        NOT EXISTS (SELECT keylog FROM timeclock WHERE keylog = keylogid AND log_type = 'ob' and update_date = '0000-00-00 00:00:00') 
        AND EXISTS 
            (SELECT keylog FROM timeclock WHERE keylog = keylogid AND log_type = 'timeclock' AND update_date = '0000-00-00 00:00:00' AND NOT EXISTS (SELECT keylog FROM timeclock WHERE keylog = keylogid AND log_type = 'break' AND update_date = '0000-00-00 00:00:00'))
    LIMIT 1;


-- how to insert new break entry
INSERT INTO timeclock (keylog, log_type, clockin) 
    SELECT * FROM 
        (SELECT (SELECT keylog from employee_time_log WHERE employee_id = '01-0012' and log_date = CURDATE()) as keylogid, 'break', CURTIME()) AS tmp 
    WHERE 
        NOT EXISTS (SELECT keylog FROM timeclock WHERE keylog = keylogid AND log_type = 'break' and update_date = '0000-00-00 00:00:00') 
        AND EXISTS 
            (SELECT keylog FROM timeclock WHERE keylog = keylogid AND log_type = 'timeclock' AND update_date = '0000-00-00 00:00:00' AND NOT EXISTS (SELECT keylog FROM timeclock WHERE keylog = keylogid AND log_type = 'ob' AND update_date = '0000-00-00 00:00:00')) 
    LIMIT 1;


-- update (using triggers: http://stackoverflow.com/questions/3164505/mysql-insert-record-if-not-exists-in-table)

UPDATE timeclock 
    SET clockout = curtime() 
    WHERE log_type = 'timeclock' AND update_date = '0000-00-00 00:00:00' 
        AND keylog = ((SELECT keylog from employee_time_log WHERE employee_id = '01-0012' and log_date = curdate())) 
    LIMIT 1;

UPDATE timeclock 
    SET clockout = curtime() 
    WHERE log_type = 'break' AND update_date = '0000-00-00 00:00:00' 
        AND keylog = ((SELECT keylog from employee_time_log WHERE employee_id = '01-0012' and log_date = curdate())) 
    LIMIT 1;

UPDATE timeclock 
    SET clockout = curtime() 
    WHERE log_type = 'ob' AND update_date = '0000-00-00 00:00:00' 
        AND keylog = ((SELECT keylog from employee_time_log WHERE employee_id = '01-0012' and log_date = curdate())) 
    LIMIT 1;


