--change TKLSV: Ban bac nen - Created by ThanhLD - 20130514
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\lib\\awardtemplet.lua")

function Sell_item()	
	Say("Ch� ta b�n<color=yellow>  B�c N�n <color> v�i gi� 250 v�n l��ng 1 c�i. C�c h� c� mu�n mua kh�ng", 
		     2, 
			"Ta mua/BuySillver",       
			"�� khi kh�c/no")
end

function BuySillver ()
	if CalcFreeItemCellCount() < 1 then
		Talk(1, "", "H�y ch�a 1 �  tr�ng trong h�nh trang" )
		return
	end
	if (GetCash()<2500000) then
		Talk(1, "", "C�c h� kh�ng mang theo �� ng�n l��ng, h�y quay l�i sau")
		return
	end
	Pay(2500000)
	local tbAward = {szName = "B�c n�n", tbProp = {6,1,3036,0,0,0}, nCount = 1}	
	tbAwardTemplet:Give(tbAward, 1, {"TongKimLienServer", "BanBacNentaiNpcHangRong"})	
end

local pEventType = EventSys:GetType("AddNpcOption")
pEventType:Reg("H�ng rong", "Mua B�c N�n", Sell_item)



