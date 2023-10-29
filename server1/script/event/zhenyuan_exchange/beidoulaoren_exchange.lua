Include("\\script\\event\\\zhenyuan_exchange\\zhenyuan_head.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")

local nLevel = 200
local szPrompt_level = format("Ch�a ��t ��n %d c�p xin h�y ��n Th�n B� Th��ng Nh�n � L�m An �� ��i Ch�n Nguy�n.", nLevel)

function zhenyuan_exchange()
	if GetLevel()>= %nLevel then
		local nAvailExp = GetExp() + 0.5 * GetLevelExp(GetLevel(), ST_GetTransLifeCount())
		g_AskClientNumberEx(1, %nMaxNum, "Xin h�y nh�p v�o s� l��ng mu�n ��i", {Zhenyuan_award, {nAvailExp}})
	else
		Msg2Player(%szPrompt_level) 
	end
end 

--pEventType:Reg("B�c ��u L�o Nh�n", "�i�m kinh nghi�m ��i Ch�n Nguy�n", zhenyuan_exchange)

