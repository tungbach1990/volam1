Include("\\vng_script\\activitysys\\config\\1029\\head.lua") --!!!!!
Include("\\vng_script\\activitysys\\config\\1029\\variables.lua")
Include("\\vng_script\\activitysys\\config\\1029\\awardlist.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\lib\\awardtemplet.lua")
IncludeLib("ITEM")
Include("\\script\\lib\\progressbar.lua")

pActivity.nPak = curpack()

--Function t�t Bit ExtPoint khi �� nh�n th� HLLB
function pActivity:CheckBitExtPoint(tbBitExt)		
	if (VngExtPointLib:GetBitValueByVersion(tbBitExt) ~= 1) then
		Talk(1,"","C�c h� ch�a nh�p code tr�n trang ch�, kh�ng th� nh�n th��ng.")
		return nil
	end
	return 1
end