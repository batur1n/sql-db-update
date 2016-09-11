::This batch script and sql-scripts must be located in the same folder in order to successfully run.
::SQL-script names mus match the following pattern: 045.createtable.sql, 047createtable.sql, etc.

set /p ver="Please specify current database version: "

for /f "tokens=*" %%f in ('dir /l /a-d /b *.sql') do (
    for /f "tokens=1 delims=abcdefghijklmnopqrstuvwxyz." %%n in ("%%~nf") do (
   	IF %ver% GEQ %%n (
	    rem			::do nothing
	) ELSE (
	    echo Executing script: %%~nxf >> log.txt	::running sql-script
	    set ver=%%n		::updating database version
        )
    )
)

echo Current database version: %ver% >> log.txt
