Include("\\vng_script\\activitysys\\config\\1028\\head.lua") --!!!!!
Include("\\vng_script\\activitysys\\config\\1028\\awardlist.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\activitysys\\functionlib.lua")
Include("\\vng_script\\vng_lib\\extpoint.lua")

pActivity.nPak = curpack()

function pActivity:CheckExtPointValue(tbExtPoint)
	if (VngExtPointLib:GetBitValueByVersion(tbExtPoint) == 0) then
		return Talk(1,"","Ph�n th��ng ch� gi�nh cho b�ng h�u k�ch ho�t code th�nh c�ng tr�n trang ch�. M�i t�i kho�n ch� nh�n ���c 1 l�n.")
	end
	return 1
end
function pActivity:SetBitExPoint_Success(tbExtPoint)
	if (VngExtPointLib:SetBitValueByVersion(tbExtPoint,0) ~= 1) then
		return Talk(1,"","C� l�i khi nh�n th��ng, xin li�n h� B�H")
	end
end