Include("\\script\\petsys\\head.lua")
Include("\\script\\petsys\\lang.lua")
Include("\\script\\activitysys\\playerfunlib.lua")



function main()
	-- 		do 
	-- 	return Talk(1, "", "Ch�c n�ng ch�a m�!")
	-- end
	--���ʹ�õȼ�����150����ʾ ����1
	local nTransLife = ST_GetTransLifeCount()
	if nTransLife < 2  or (nTransLife == 2 and GetLevel() < 150) then 
		Talk(1, "", format(%MSG_NOT_ENOUGH_LEVEL, %MIN_LEVEL))
		return 1
	end

	--�������ͬ�к��Ѿ���ʾ���ܴ���
	if PET_IsCreate() == 1 then 
		Talk(1, "", %ALREADY_CREATE_PET)
		return 1
	end
	
	local nFeatureLevel = ceil(1 / %PET_LEVEL_STEP)
	local tbFeature = PetSys.tbFeature[nFeatureLevel]
	local nFeatureIdIndex = random(1, getn(tbFeature))
	
	--Nh�n ng�u nhi�n pet - Modified By NgaVN - 20130607
	local nRet = PetSys:GivRandomPet(PetSys.tbPetSkill )
	SetTask(3061, nRet)
	
	PET_Create(tbFeature[nFeatureIdIndex][2], tbFeature[nFeatureIdIndex][1])
	PetSys:Summon()
	Talk(1, "", format(%ALREADY_SKILL_PET,PetSys.tbPetSkill [nRet].szSkillName))
end
