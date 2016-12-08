-- cron: 0 0 * * * osascript ~/.bin/exchange-sync.applescript >/dev/null 2>&1

property today : current date
property bfCal : "Calendar"
property iCal : "Work"


tell application "Calendar" to launch
tell application "Calendar" to reload calendars
-- wait for reload to happen
delay 30

tell application "Calendar"

	set iEvents to events of calendar iCal
	set bfEvents to events of calendar bfCal

	-- delete existing events in source calendar
	repeat with calEvent in iEvents
		delete calEvent
	end repeat

	repeat with calEvent in bfEvents
		try
			-- copy over all recurring events
			if recurrence of calEvent is not missing value then
				copy calEvent to end of events of calendar iCal
				-- otherwise, only copy events occuring today or in the future
			else if start date of calEvent ≥ today then
				copy calEvent to end of events of calendar iCal
			end if
		end try
	end repeat

end tell
