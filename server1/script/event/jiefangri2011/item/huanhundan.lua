--Forbid use item in seven city - Modified by DinhHQ - 20110425
Include("\\script\\vng_feature\\forbiditem\\vngforbidspecialitem.lua")

function main(nIndexItem)
	--Forbid use item in seven city - Modified by DinhHQ - 20110425
	if tbVNGForbidItem:IsForbidMap("Ho�n H�n ��n", {tbVNGForbidItem.SEVEN_CITY}) == 1 then
		return 1
	end
	if tbVNGForbidItem:IsForbidMap("Ho�n H�n ��n", {tbVNGForbidItem.VLDNB}) == 1 then
		return 1
	end
	AddSkillState(462, 6, 0, 60)		-- ÿ���������ظ�������3000��(���ָ�20000������) ��ʱ6s
	Msg2Player("Ng��i �� s� d�ng 1 Ho�n H�n ��n")
	return 0
end
