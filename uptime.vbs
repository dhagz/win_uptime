Set objWMIService = GetObject("winmgmts:\\.\root\cimv2")
Set colOS = objWMIService.ExecQuery ("Select * From Win32_PerfFormattedData_PerfOS_System")
 
For Each objOS in colOS
    Uptime = Int(objOS.SystemUpTime / 60)
	If Uptime < 60 Then
		Wscript.Echo "System uptime: " & Uptime & " minutes"
	ElseIf (Uptime / 60) < 24 Then
		hours = Uptime / 60
		Wscript.Echo "System uptime: " & hours & " hours"
		If hours > 9.5 Then
			Wscript.Echo "ULI NA OI!"
		Else
			Wscript.Echo "Ayaw sa uli, UNDERTIME pa ka!"
		End If
	Else 
		Wscript.Echo "System uptime: " & (Uptime / 60 /24) & " days"
	End If
Next
