Include("\\script\\petsys\\head.lua")
Include("\\script\\petsys\\lang.lua")

function PetSys:DeletePet()
	if PET_IsCreate() ~= 1 then
		return
	end
	
	Say(%DELETE_TITLE, 2,
			format("%s/#PetSys:ConfirmDelete()", %CONFIRM),
			%CANCEL)
end

function PetSys:ConfirmDelete()
	PET_UnSummon()
	PET_Delete()
	--���������������������ᱣ��
end
