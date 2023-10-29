Include("\\vng_script\\features\\trongkhaihoan\\head.lua")
Include("\\vng_script\\features\\trongkhaihoan\\drum_npc.lua")
Include("\\vng_script\\vng_lib\\checkinmap.lua")
Include("\\script\\tong\\tong_header.lua")
Include("\\script\\global\\judgeoffline_limit.lua")
Include("\\vng_script\\vng_lib\\reset_daily_task.lua")

IncludeLib("TONG")

function main(nItemIndex)
	--kiem tra reset exp daily
	tbCheckTaskDaily2ReSet:OnLogin()
	
	return tbVNGTriumphDrum:OnUse(nItemIndex)
end

function tbVNGTriumphDrum:OnUse(nItemIndex)	

	if VngPlayerFunLib:VnCheckInCity("default") ~= 1 then
		return 1
	end
	
	if tbVNGTriumphDrum:IsCarryOn() ~= 1 then
		Talk(1,"","Tr�ng kh�i ho�n b� h� b�i v� l�u gi� qu� l�u.")
		return 0
	end	

	if GetLevel() < self.nLimit_Level then
		Talk(1,"","��ng c�p c�a c�c h� kh�ng ��!")
		return 1
	end 	

	local szTongName, nTongId = GetTongName()
	if nTongId == 0 then
		Talk(1,"","C�c h� v�n ch�a gia nh�p bang h�i!")
		return 1
	end	

	local nFigure = GetTongFigure()
	if nFigure ~= 0 and nFigure ~= 1 then
		Talk(1,"","��i hi�p kh�ng ph�i l� bang ch� ho�c l� tr��ng l�o!")
		return 1
	end	

	if GetFightState() == 1 then
		Talk(1,"","Xin h�y s� d�ng t�i khu v�c phi chi�n ��u!")
		return 1
	end
	--Kiem tra gan xa phu, hieu thuoc ...
	if offlineCheckPermitRegion() ~= 1 then
		Talk(1,"","Xin h�y s� d�ng t�i khu v�c �t ng��i! Tr�nh xa c�c c�a ti�m, xa phu ...")
		return 1
	end	

	local nTime = tonumber(GetLocalDate("%H%M"))
	local nCurDay = tonumber(GetLocalDate("%Y%m%d"))
	
	if nTime < self.nStartTime or nTime > self.nCloseTime then
		Talk(1,"",format("H�y s� d�ng trong th�i gian ho�t ��ng: <color=yellow>%s - %s<color>","19h30","20h00"))
		return 1
	end
	
	if not tbVNGTriumphDrum[nTongId] then
		tbVNGTriumphDrum[nTongId] ={
			nLastUseDay = 0,
			nTongId = nTongId,
			szNameUsedDrump = GetName(),
			nTimeUse = nTime,
		}
	end
	
	local nLastUseDay = tbVNGTriumphDrum[nTongId].nLastUseDay
	local szNameUsedDrump = tbVNGTriumphDrum[nTongId].szNameUsedDrump
	local nTimeUse = tbVNGTriumphDrum[nTongId].nTimeUse
	

	
	if nCurDay == nLastUseDay then 
		Talk(1,"",format("H�m nay Bang H�i �� s� d�ng Tr�ng Kh�i Ho�n r�i, ng��i �� s� d�ng: <color=yellow>%s<color> l�c: %d",szNameUsedDrump,nTimeUse))
		return 1
	end	

	tbVNGTriumphDrum[nTongId] = {
		nLastUseDay = nCurDay,
		nTongId = nTongId,
		szNameUsedDrump = GetName(),
		nTimeUse = nTime,
	}

	tbVNGDrumNpc:New(szTongName, nTongId)
	return 0
end
