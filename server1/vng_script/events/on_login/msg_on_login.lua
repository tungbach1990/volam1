Include("\\script\\misc\\eventsys\\type\\player.lua")
IncludeLib("SETTING")
Include("\\script\\activitysys\\functionlib.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\global\\login_head.lua")

if not tbVngMsgTVL2Player then
	tbVngMsgTVL2Player = {}
end
tbVngMsgTVL2Player.nStartDate = 201512180000
tbVngMsgTVL2Player.nEndDate = 201512202400
function tbVngMsgTVL2Player:OnLogin()
	--print("========tbVngMsgTVL2Player:OnLogin")
	if self:IsActive() ~= 1 then
		print("return het han")
		return
	end
	local szMsg = format("<color=green>Tr�i nghi�m nh�ng t�nh n�ng h�p d�n v� chinh ph�c th� th�ch kh�c nghi�t lu�n l� ni�m kh�t khao c�a c�c Anh H�ng.<color><color=yellow>Chi ti�t t�i: tvl.360game.vn<color>")
	
	Talk(1,"Talk2",szMsg)
	
--	Msg2Player(szMsg)
--	Msg2Player(szMsg1)	
	--print("========tbVngMsgTVL2Player:OnLogin Thong Bao")
end
function Talk2()
	local szMsg1 = format("<color=green>��i h�i Vang Danh Thi�n H� ch�nh th�c di�n ra t�:<color> <color=yellow>14h00 ng�y 20/12/2015 t�i nh� v�n h�a Thanh Ni�n (TP HCM) <color><color=green>c�ng nhi�u t�ng ph�m v� Code c�c VIP. H�y nh� m�t cu�c h�n, kh�ng g�p kh�ng v�.<color>")
	Talk(1,"",szMsg1)
end
function tbVngMsgTVL2Player:IsActive()
	local nCurDate = nCurDate or tonumber(GetLocalDate("%Y%m%d%H%M"))
	if nCurDate >= self.nStartDate  and nCurDate <= self.nEndDate  then
		return 1
	end	
	return 0
end
EventSys:GetType("OnLogin"):Reg(0, tbVngMsgTVL2Player.OnLogin, tbVngMsgTVL2Player)
