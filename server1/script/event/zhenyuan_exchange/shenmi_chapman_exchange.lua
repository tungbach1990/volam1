Include("\\script\\event\\\zhenyuan_exchange\\zhenyuan_head.lua")--��Ԫ�һ�
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")

function zhenyuan_exchange()
	local nAvailExp = GetExp()
	g_AskClientNumberEx(1, %nMaxNum, "Xin h�y nh�p v�o s� l��ng mu�n ��i", {Zhenyuan_award, {nAvailExp}})
end 

--pEventType:Reg("Th�n B� Th��ng Nh�n", "�i�m kinh nghi�m ��i Ch�n Nguy�n", zhenyuan_exchange)
