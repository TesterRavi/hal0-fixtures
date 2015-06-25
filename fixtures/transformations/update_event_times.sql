/* updating events with current time stamp */

use hautelook;


select * from members;

UPDATE events
SET start_date = CURRENT_TIMESTAMP
WHERE event_id = 21712;

UPDATE events
SET start_date = CURRENT_TIMESTAMP
WHERE event_id = 9998;

UPDATE events
SET start_date = CURRENT_TIMESTAMP
WHERE event_id = 38568;
