Include("\\vng_script\\features\\huynhdelenhbai\\mainfuc.lua")
--Include("\\script\\vng_feature\\getskills.lua")
Include("\\vng_script\\vng_lib\\checkinmap.lua")
Include("\\script\\global\\vipsys\\head.lua") --check actived the hao hiep

tbHuynhdelenhbai = tbHuynhdelenhbai or {};

function main(nItemIdx)	
	if GetLevel() < 50 then
		 Talk(1,"","Tr��c ��ng c�p 50 h�y �i t�m V� Danh � c�c th�n tr�n, �ng ta s� h��ng d�n ng��i l�m nhi�m v�.")
		return 1
	end
	if GetLevel() > 110 then
		 Talk(1,"","Huynh �� T��ng Ph�ng l�nh b�i ch� c� t�c d�ng ��n ��ng c�p 110.")
		return 1
	end
	--kich hoat the hao hiep
	local nActieved, szMsg = VipSys:IsActived()
	if 	nActieved ~= 1 then
		lib:ShowMessage("Ch�a k�ch ho�t Th� H�o Hi�p, kh�ng th� d�ng Huynh �� T��ng Ph�ng l�nh b�i")
		return 1
	end	
	tbHuynhdelenhbai:MainDialog()
	return 1
end

function tbHuynhdelenhbai:MainDialog()
	local tbOpt = {}		
	tinsert(tbOpt, {"Nhi�m v� Huynh �� T��ng Ph�ng l�nh b�i", self.onDialogNpcGiveTask, {self}})	
	tinsert(tbOpt, {"Xem t�nh h�nh nhi�m v� hi�n t�i", self.onDialogNpcGiveAward, {self}})
	tinsert(tbOpt, {"H�y b� "})
	CreateNewSayEx("Huynh �� T��ng Ph�ng l�nh b�i:", tbOpt)
end