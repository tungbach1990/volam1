Include("\\script\\activitysys\\playerfunlib.lua")
function main()
	PlayerFunLib:AddSkillState(980,2,3,46656000,1)--18*60*60*24*30=46656000 30��
	PlayerFunLib:AddSkillState(966,2,3,46656000,1)--18*60*60*24*30=46656000 30��
	WriteLog(date("%Y%m%d %H%M%S").."\t".."S� d�ng C�n Kh�n Song Tuy�t B�i".."\t".. GetAccount().."\t"..GetName())
end

