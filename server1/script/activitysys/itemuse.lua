
Include("\\script\\lib\\baseclass.lua")
Include("\\script\\lib\\functionset.lua")
Include("\\script\\lib\\rangevalue.lua")

ScriptItemClass = tbBaseClass:new()


function ScriptItemClass:_init()
	
	self.szKey = ""
	self.pFunctionSet = FunctionSetClass:new()
	self.DateRange = RangeValueClass:new()
end

function ScriptItemClass:Use(nItemIndex, nCurDate)
	
	
	if self.DateRange:CheckDate(nCurDate) ~= 1 then
		Talk(1, "", "V�t ph�m n�y �� h�t h�n")
		return 1
	end
	
	 if self.pFunctionSet:Exec(self, nItemIndex) then
	 	return 0; --ʹ�óɹ�ɾ����Ʒ
	end
	return 1; --ʹ��ʧ�ܣ�������Ʒ
	
end



