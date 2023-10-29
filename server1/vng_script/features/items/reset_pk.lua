--Change role name 1 -by thanhld 20150818
IncludeLib("ITEM")
IncludeLib("SETTING")
Include("\\script\\lib\\log.lua")
Include("\\vng_script\\vng_lib\\checkinmap.lua")
Include("\\script\\dailogsys\\dailogsay.lua")

if not tbVngResetPK then
	tbVngResetPK = {}
end

tbVngResetPK.LOG_TITLE = "LOG_FEATURE_CTC"
function main(nItemIdx)	
	if VngPlayerFunLib:VnCheckInCity("default") ~= 1 then
		return 1
	end
	local nCurPK = GetPK()
	if nCurPK <= 0 then
		Talk(1,"","Ng��i t�t th� kh�ng c�n d�ng v�t ph�m n�y!!!")
		return 1
	end	
	local szMsg = format("<npc>S� d�ng v�t ph�m n�y s� gi�m  <color=yellow>%d PK<color> hi�n c�.",nCurPK)
	local tbOpt = {}	
	tinsert(tbOpt, {format("��ng �"), tbVngResetPK.ResetPK, {tbVngResetPK, nItemIdx}})	
	tinsert(tbOpt, {"�� sau"})
	CreateNewSayEx(szMsg, tbOpt)	
	return 1	
end


function tbVngResetPK:ResetPK(nItemIdx)
	if IsMyItem(nItemIdx) ~=1 then
		return
	end	
	RemoveItemByIndex(nItemIdx)
	SetPK(0)
	Msg2Player("S� d�ng ��i X� L�nh B�i tr� s� PK hi�n th�i: 0")
	tbLog:PlayerActionLog(self.LOG_TITLE,"ResetAllPK" )
end
