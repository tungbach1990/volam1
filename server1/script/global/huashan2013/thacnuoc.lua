--Edit by Youtube PGaming--
Include("\\script\\dailogsys\\dailogsay.lua")
function main() 
if (GetTask(169) == 67) then
	DelCommonItem(6,1,3954)
	SetTask(169,68)
	AddNote("C�c h� ng�m nh�n th�c n��c, nh� �� l�nh ng� ���c �u mi�u b�n trong, �� c� th� ki�m tra c�m nang r�i.") 
Msg2Player("C�c h� ng�m nh�n th�c n��c, nh� �� l�nh ng� ���c �u mi�u b�n trong, �� c� th� ki�m tra c�m nang r�i.") 
end
end


