test = require "simpletest" 				-- use require - simpletest is lua module
test1 = test:new()							-- create test object by using new member
test2 = test:new()

test1.name = "test1"						-- change test name/description
test2.name = "test2"

test1.run = true							-- from now tests are activated
test2.run = true

test1:check("true")							-- everything ok nothing happend
test1:check("false")						-- should show where this 'bug' is

test2:check("true")
test2:check("false")

test1:check([[test1.name == "test1"]])		-- check is name equal name :) there are 2 different instances (in lua is not so trivial :)
test1:check("test2.name == 'test2'")

test1:report()								-- show report... how many bugs you have :)
test2:report(true)							-- show report... and stop that you can read, after key go

