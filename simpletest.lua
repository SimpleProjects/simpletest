local test = {}
test._COPYRIGHT   = "Copyright (C) 2013-2014 Simple Project"
test._DESCRIPTION = "Simple Testing Framework"
test._VERSION = "0.1.0"
test.run = false
test.bugs = 0
test.name = "base"

test.check = function (self,question)
	if(self.run == false) then return end
	local f = loadstring("return "..question)
	if(f() == false) then
		local buginfo = debug.getinfo(2,"Sl")
		self.bugs = self.bugs + 1
		print(buginfo.source,buginfo.currentline,question)
	end
end

test.report = function (self,wait)
	if(self.run == false) then return end
	if(self.bugs) then
		print("You have "..self.bugs.." bugs")
		if(wait) then
			io.read()
		end
	end
end

test.new = function (self)
	t = {}
	setmetatable(t,self)
	self.__index = self
	return t
end

return test
