--======================================================================
--Author:   Tan Qingyu
--Date:     2012-4-5 17:39:42
--Describe: �꾩�ع� ��ս��״̬��ս��״̬
--======================================================================

function main()
	if GetFightState() == 0 then
		SetProtectTime(18*3) --���뱣��ʱ��
		AddSkillState(963, 1, 0, 18*3)
		SetFightState(1)
	end
end
