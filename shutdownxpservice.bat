@echo off
::for xp

::fuck XP Security Center
sc stop wscsvc
sc config wscsvc start= disabled


sc stop helpsvc
sc config helpsvc start= disabled

::Automatic Updates

sc stop wuauserv
sc config wuauserv start= disabled

::Error Reporting Service
sc stop ersvc
sc config ersvc start= disabled

::
sc stop remoteregistry
sc config remoteregistry start= disabled


::System Restore Service
sc stop srservice 
sc config srservice start= disabled 

::for VM

sc stop lanmanworkstation
sc config lanmanworkstation start= disabled

net stop "Print Spooler"
sc config spooler start= disabled


::Distributed Link Tracking Client
sc stop trkwks
sc config trkwks start= disabled

pause

