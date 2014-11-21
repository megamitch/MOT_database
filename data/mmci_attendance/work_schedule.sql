USE `mmci_attendance`;

INSERT INTO `work_schedule` (hpw, sun, mon, tue, wed, thu, fri, sat) VALUES
    -- REGULAR 40hrs/week
    -- MON to FRI
    (40, '0', '1', '1', '1', '1', '1', '0'),
    -- TUE to SAT
    (40, '0', '0', '1', '1', '1', '1', '1'),
    -- WED to SUN
    (40, '1', '0', '0', '1', '1', '1', '1'),
    -- THU to MON
    (40, '1', '1', '0', '0', '1', '1', '1'),
    -- FRI to TUE
    (40, '1', '1', '1', '0', '0', '1', '1'),
    -- SAT to WED
    (40, '1', '1', '1', '1', '0', '0', '1'),
    -- SUN to THU
    (40, '1', '1', '1', '1', '1', '0', '0'),

    -- REGULAR 48hours/week or 8hrs/day for 6 days
    -- MON to SAT
    (48, '0', '1', '1', '1', '1', '1', '1'),
    -- TUE to SUN
    (48, '1', '0', '1', '1', '1', '1', '1'),
    -- WED to MON
    (48, '1', '1', '0', '1', '1', '1', '1'),
    -- THU to TUE
    (48, '1', '1', '1', '0', '1', '1', '1'),
    -- FRI to WED
    (48, '1', '1', '1', '1', '0', '1', '1'),
    -- SAT to THU
    (48, '1', '1', '1', '1', '1', '0', '1'),
    -- SUN to FRI
    (48, '1', '1', '1', '1', '1', '1', '0');