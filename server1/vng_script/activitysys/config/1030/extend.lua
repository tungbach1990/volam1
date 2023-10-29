Include("\\vng_script\\activitysys\\config\\1030\\head.lua") --!!!!!
Include("\\vng_script\\activitysys\\config\\1030\\variables.lua")
Include("\\vng_script\\activitysys\\config\\1030\\awardlist.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\activitysys\\functionlib.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\log.lua")
Include("\\script\\vng_lib\\bittask_lib.lua")

pActivity.nPak = curpack()

function pActivity:OnServerStart()

end

function pActivity:CheckLimitUseTienDon()
	local nUseTienDon = tbVNG_BitTask_Lib:getBitTask(tbBITTSK_LIMIT_USE_TIENDON)
	local nCurUseVanNien = tbVNG_BitTask_Lib:getBitTask(tbBITTSK_LIMIT_USE_VANNIEN_TL)
	local nMaxUse = MOC_2000 + MOC_1000*nUseTienDon
	--print("=====CheckLimitUseHHDB nMaxUse: "..nMaxUse)
	if nCurUseVanNien >= nMaxUse then
		if nUseTienDon == 0 then
			Talk(1,"",format("C�c h� c� th� s� d�ng t�i �a: <color=yellow>%d V�n Ni�n Tr�n L�<color>, S� d�ng <color=yellow>Ti�n ��n<color> c� th� t�ng gi�i h�n s� d�ng V�n Ni�n Tr�n L�.",nMaxUse))			
		else
			Talk(1,"",format("C�c h� c� th� s� d�ng t�i �a: <color=yellow>%d V�n Ni�n Tr�n L�<color>, �� ��t gi�i h�n s� d�ng, kh�ng th� s� d�ng th�m.",nMaxUse))			
		end
		return nil
	end
	return 1
end

