--Forbid use item in seven city - Modified by DinhHQ - 20110425
Include("\\script\\vng_feature\\forbiditem\\vngforbidspecialitem.lua")
function main(nIndexItem)
	--Forbid use item in seven city - Modified by DinhHQ - 20110425
	if tbVNGForbidItem:IsForbidMap("Ti�u Di�u T�n", {tbVNGForbidItem.SEVEN_CITY}) == 1 then
		return 1
	end
	if tbVNGForbidItem:IsForbidMap("Ti�u Di�u T�n", {tbVNGForbidItem.VLDNB}) == 1 then
		return 1
	end
	CastSkill(1052, 1)
	Msg2Player("Ng��i �� s� d�ng 1 Ti�u Di�u T�n")
	return 0
end
