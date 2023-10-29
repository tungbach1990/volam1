--T�i ch�a b� trang b� H�ng �nh ng�u nhi�n  -by thanhld 20160106
IncludeLib("ITEM")
IncludeLib("SETTING")
Include("\\script\\lib\\log.lua")
Include("\\vng_script\\vng_lib\\checkinmap.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

LOG_TITLE = "LOG_EVENT_CTC"
function main(nItemIdx)	
	if VngPlayerFunLib:VnCheckInCity("default") ~= 1 then
		return 1
	end
	
	local szTitle = ""
	local tbOpt = {}
	szTitle = format("S� d�ng v�t ph�m n�y c�c h� nh�n ���c m�t B� trang b� <color=yellow>H�ng �nh ng�u nhi�n thu�c t�nh <color>.")
	tinsert(tbOpt,format("Ta ��ng �/#GetAwardHongAnhRandom(%d)",nItemIdx))
	tinsert(tbOpt, "Tho�t/no")
	if getn(tbOpt) > 0 then		
		Say(szTitle, getn(tbOpt), tbOpt)
	end
	return 1	
end

function GetAwardHongAnhRandom(nItemIdx)
	if IsMyItem(nItemIdx) ~=1 then
		return
	end	
	if PlayerFunLib:CheckFreeBagCellWH(2, 10, 1, "default") ~= 1  then			
		return
	end
	
	RemoveItemByIndex(nItemIdx)
	local tbHongAnh = {
		{szName="H�ng �nh Th�m Vi�n Uy�n",tbProp={0,204},nCount=1,nQuality = 1,},
		{szName="H�ng �nh Ki�m B�i",tbProp={0,205},nCount=1,nQuality = 1,},
		{szName="H�ng �nh M�c T�c	",tbProp={0,206},nCount=1,nQuality = 1,},
		{szName="H�ng �nh T� Chi�u",tbProp={0,207},nCount=1,nQuality = 1,},	
	}	
	tbAwardTemplet:Give(tbHongAnh,1,{LOG_TITLE,"Use_TuiQuaHongAnh"})	
	Talk(1,"","Ch�c m�ng c�c h� nh�n ���c b� trang b� <color=yellow>H�ng �nh<color>, t� n�y giang h� th�m ph�n n� ph�c!")
end


