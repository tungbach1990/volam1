Include("\\script\\event\\funv_jieri\\200903\\class.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\missions\\basemission\\lib.lua")

Include("\\script\\lib\\string.lua")
local tbExpAward = 
{
	--[nSex] = {nExp = nExp}
	[0] = {nExp = 2000000},
	[1] = {nExp = 3000000},
	
}


local tbBless = 
{
	"N� c��i th�n th��ng, trong v�t, th� ng�y lu�n gi� m�i tr�n m�i",
	"Lu�n lu�n vui v� v� h�nh ph�c",
	"Lu�n g�p nhi�u may m�n v� h�nh ph�c",
	"�� ��p, ng�y c�ng ��p h�n, khi�n hoa ph�i ghen, tr�ng ph�i th�n",
	"Nh�ng �i�u t�t ��p lu�n �i k� b�n",
	"Lu�n lu�n m�nh m�, t� tin trong cu�c s�ng",
	"Con ���ng �i lu�n t��i th�m nh� ���c r�i ��y hoa h�ng",
	"D� d�ng v��t qua nh�ng kh� kh�n trong cu�c s�ng",
	"Th�i gian s� kh�ng l�m phai m� nhan s�c",
	"Lu�n c�m th�y vui v� v� tho�i m�i",
	"Lu�n gi� v�ng ni�m tin v�o cu�c s�ng",
	"Lu�n m�i xinh ��p, d�u d�ng nh� c� T�m",
	"Lu�n m�i ��p nh� ��ng c� v�i ng�n hoa khoe s�c",
	"Lu�n ���c s�ng trong t�nh c�m c�a b�n b� v� nh�ng ng��i th�n y�u",
	"V�ng tin v� th�nh c�ng trong s� nghi�p",
	"M�i lu�n ��p d�u d�ng v� ��y quy�n r�",
	"Lu�n ��ng l�n m�i khi v�p ng�, ��y �� d�ng kh� v��t qua gian kh�",
	"M�t ng�y 8-3 th�t vui v� nhi�u � ngh�a",
	"S�m t�m ���c ch� d�a �� lu�n v�ng b��c trong ���ng ��i",
	"C� gia ��nh lu�n lu�n vui v�, h�nh ph�c, kh�e m�nh",
}
local _AddRoseCardExp = function (nItemIndex)
	local nSex = GetSex()
	if tbFunv0903.tbTask:CheckExpFromRose() ~= 1 then
		Msg2Player(format("M�i nh�n v�t ch� nh�n ���c t�i �a %u kinh nghi�m t� thi�p hoa h�ng", tbFunv0903.tbTask.nMaxExpFromRose))	
	else
		local tbExp = %tbExpAward[nSex]
		tbAwardTemplet:GiveAwardByList(tbExp, "use "..GetItemName(nItemIndex))
		tbFunv0903.tbTask:AddCurExpFromRose(tbExp.nExp)
	end
	
end

function main(nItemIndex)
	
	if GetItemParam(nItemIndex, 1) ~= 0 and GetItemParam(nItemIndex, 1) <= tonumber(GetLocalDate("%Y%m%d")) then
		Talk(1,"", "V�t ph�m n�y �� h�t h�n")
		return 0
	end
	
	local nTeamSize = GetTeamSize()
	if GetSex() ~= 0 then
		Talk(1, "", "V�t ph�m n�y ch� c� nh�n v�t nam m�i s� d�ng ���c")
		return 1
	end
	if nTeamSize ~= 2 then
		Talk(1, "", "Ph�i t� ��i 2 ng��i 1 nam 1 n� m�i s� d�ng ���c.")
		return 1
	end
	local nSexFlag = 0
	local szName_Male = GetName()
	local szName_Female = ""
	for i=1, nTeamSize do
		local nPlayerIndex = GetTeamMember(i)
		local nSex = doFunByPlayer(nPlayerIndex, GetSex)
		local szName = doFunByPlayer(nPlayerIndex, GetName)
		local bRet, szFailMsg = doFunByPlayer(nPlayerIndex, tbFunv0903.IsPlayerEligible, tbFunv0903)
		if bRet ~= 1 then
			local szMsg = format("<color=yellow>%s<color>%s",szName, szFailMsg)
			Msg2Team(szMsg)
			Talk(1, "", szMsg)
			
			return 1
		end
		
		nSexFlag = nSexFlag + nSex
		if szName ~= szName_Male then
			szName_Female = szName
		end
	end
	
	if nSexFlag ~= 1 then --2����ӵ�����£�ͬ�Ա���ӱض�Ϊ0+0=0����1+1=2������Ϊ0+1=1
		Talk(1, "", "Ph�i t� ��i 2 ng��i 1 nam 1 n� m�i s� d�ng ���c.")
		return 1
	end
	local nColor = toColor(random(0,255), random(0,255), random(0,255)) 
	local szBless = format("<color=%s>%s<color>", tostring(nColor), %tbBless[random(1, getn(%tbBless))])
	local szMsg = format("<color=yellows>%s<color>Ch�c<color=yellows>%s<color>: %s", szName_Male, szName_Female, szBless)
	AddGlobalNews(szMsg)
	Msg2SubWorld(szMsg)
	for i=1, nTeamSize do
		local nPlayerIndex = GetTeamMember(i)
		doFunByPlayer(nPlayerIndex, %_AddRoseCardExp, nItemIndex)
	end
	
	
	
	
	
end