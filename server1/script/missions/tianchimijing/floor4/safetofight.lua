Include("\\script\\missions\\tianchimijing\\floor4\\gamefloor4.lua")

function main()
	GameFloor4:MoveToTrap(PlayerIndex, "\\settings\\maps\\tianchimijing\\floor4\\safetofight2.txt")
	SetProtectTime(18*3) --���뱣��ʱ��
	AddSkillState(963, 1, 0, 18*3) 	
	SetFightState(1)
end