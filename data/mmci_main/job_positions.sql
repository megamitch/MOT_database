INSERT INTO job_position (job_code, title, is_executive, is_manager, is_supervisor) VALUES
    ("CEO", "Chief Executive Officer", 1, 1, 1),
    ("Pres.", "President", 1, 0, 0),
    ("Exec. Sec.", "Executive Secretary", 1, 0, 0),
    ("Int. Auditor", "Internal Auditor", 1, 0, 0),
    ("Gen. Manager", "General Manager", 1, 0, 0),
    
    ("HR Manager", "Human Resource Manager", 0, 1, 0),
    ("SM Manager", "Sales and Marketing Manager", 0, 1, 0),
    ("Fin. Manager", "Finance Manager", 0, 1, 0),
    ("Leg. Manager", "Legal Manager", 0, 1, 0),
    ("ICT Manager", "Information and Communications Technology Manager", 0, 1, 0),
    
    ("HR Exec. Sec.", "Human Resource Executive Secretary", 0, 1, 0),
    ("HR Asst.", "Human Resource Assistant", 0, 1, 0),

    ("BM", "Branch Manager", 0, 1, 0),
    ("BS", "Branch Supervisor", 0, 0, 1),

    ("CS", "Credit Supervisor", 0, 0, 1),
    ("CO", "Credit Officer", 0, 0, 0),
    ("JCO", "Junior Credit Officer", 0, 0, 0),
    ("Tel", "Teller", 0, 0, 0),
    ("Col", "Collector", 0, 0, 0),

    ("ChA", "Chief Accountant", 0, 0, 0),
    ("A", "Accountant", 0, 0, 0),
    ("JA", "Junior Accountant", 0, 0, 0),
    ("JA", "Junior Accountant", 0, 0, 0),
    ("CA", "Credit Analyst", 0, 0, 0),

    ("LO", "Legal Officer", 0, 0, 0),
    
    ("ISS", "Information Systems Supervisor", 0, 0, 1),
    ("ICT Asst.", "Information and Communications Technology Assistant", 0, 0, 0),
    ("BOS", "Building and Office Supplies Officer", 0, 0, 0),
    
    ("SA", "Solutions Architect", 0, 0, 0),
    ("SSDL", "Server-side Development Lead", 0, 0, 0),
    ("CSDL", "Client-side Development Lead", 0, 0, 0),
    
    ("Assoc. SSD", "Associate Server-side Developer", 0, 0, 0),
    ("SSD I", "Server-side Developer I", 0, 0, 0),
    ("SSD II", "Server-side Developer II", 0, 0, 0),

    ("Assoc. CSD", "Assoc. Client-side Developer", 0, 0, 0),
    ("CSD I", "Client-side Developer I", 0, 0, 0),
    ("CSD II", "Client-side Developer II", 0, 0, 0);