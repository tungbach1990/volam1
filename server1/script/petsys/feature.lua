Include("\\script\\lib\\log.lua")
Include("\\script\\petsys\\head.lua")

function PetSys:ChangeFeatureDlg()
	-- 		do 
	-- 	return Talk(1, "", "Ch�c n�ng ch�a m�!")
	-- end

	if PET_IsCreate() ~= 1 then 
		return
	end
	
	if GetCashCoin() < %CHANGE_FEATURE_COIN then
		Talk(1, "", format(%NOT_ENOUGH_COIN, %CHANGE_FEATURE_COIN))
		return
	end
	
	local szTitle = %CHANGE_FEATURE_DLG1_TITLE
	local tbOpt = {}
	tinsert(tbOpt, format("%s/#PetSys:ChangeFeatureChooseFeatureLevel()", "Ta mu�n s�a"))
	tinsert(tbOpt, "M�c qu�, kh�ng s�a n�a")
	
	Say(%CHANGE_FEATURE_DLG1_TITLE, getn(tbOpt), unpack(tbOpt))
end

function PetSys:ChangeFeatureChooseFeatureLevel()
	local szTitle = "Ch�n ngo�i quan t��ng �ng v�i ��ng c�p"
	local tbOpt = {}
	local nFeatureLevelLimit = ceil(PET_GetLevel() / %PET_LEVEL_STEP)
	
	for nFeatureLevel=1, nFeatureLevelLimit do
		local szFeatureRange = ((nFeatureLevel-1)*%PET_LEVEL_STEP + 1) .. " - " .. (nFeatureLevel*%PET_LEVEL_STEP)
		tinsert(tbOpt, format("%s/#%s(%d)",szFeatureRange, "PetSys:ChangeFeatureChooseFeature", nFeatureLevel))
	end
	tinsert(tbOpt, %END_DLG)
	Say(szTitle, getn(tbOpt), unpack(tbOpt))
end

function PetSys:ChangeFeatureChooseFeature(nFeatureLevel)
	-- 		do 
	-- 	return Talk(1, "", "Ch�c n�ng ch�a m�!")
	-- end
	
	local szTitle = "Xin l�a ch�n ngo�i quan"
	local tbOpt = {}
	local tbFeatureGroup = self.tbFeature[nFeatureLevel]
	if not tbFeatureGroup then return end

	local nFeatureLimit = ceil(PET_GetLevel() / %PET_LEVEL_STEP)
	if nFeatureLevel > nFeatureLimit then return end
	
	for i=1,getn(tbFeatureGroup) do
		tinsert(tbOpt, format("%s/#%s(%d)", tbFeatureGroup[i][1], "PetSys:ConfirmChangeFeature", tbFeatureGroup[i][2]))
	end
	tinsert(tbOpt, format("%s/#%s()",%BACK, "PetSys:ChangeFeatureChooseFeatureLevel"))
	tinsert(tbOpt, %END_DLG)
	Say(szTitle, getn(tbOpt), unpack(tbOpt))
end

function PetSys:ConfirmChangeFeature(nFeatureId)
	if GetCashCoin() < %CHANGE_FEATURE_COIN then
		Talk(1, "", format(%NOT_ENOUGH_COIN, %CHANGE_FEATURE_COIN))
		return
	end
	if PayCoin(%CHANGE_FEATURE_COIN) == 1 then
		if self.summon == 1 then --if PET_IsSummon() == 1 then
			PET_UnSummon()
			self.summon = 0 --test
		end
		PET_SetFeatureId(nFeatureId)
		Msg2Player(%MSG_CHANGE_FEATURE)
		%tbLog:PlayerActionLog("PetSys", "ChangeFeature", PET_GetLevel())
		--ͬ�Ժ��ѽ��洦����Ӧ�޸�
	end
end