
Include("\\script\\activitysys\\playerfunlib.lua")
function main()
	if PlayerFunLib:CheckLevel(80,"default",">=") ~= 1 then
		return 1
	end
	PlayerFunLib:AddSkillState(966,1,3,46656000,1)
	PlayerFunLib:AddSkillState(979,1,3,46656000,1)
	WriteLog(date("%Y%m%d %H%M%S").."\t".."S� d�ng Nh�t K� C�n Kh�n Ph�".."\t".. GetAccount().."\t"..GetName())
end