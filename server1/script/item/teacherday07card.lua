Include("\\script\\event\\teacher_day_200711\\head.lua");
Include("\\script\\event\\teacher_day_200711\\card.lua");
TeacherDay200711_IntervalTime = 60*10;--ʮ����

function main(nItemIndex)
	if (GetTask(TSK_TeacherDay200711_CardUseTime) + TeacherDay200711_IntervalTime > GetCurServerTime()) then
		Say("M�i l�n s� d�ng thi�p ch�c ph�i ��i 10 ph�t m�i c� th� s� d�ng ti�p.",0)
		return 1;
	end
	local _, _, nParti = GetItemProp(nItemIndex);
	TeacherDay200711_card_main(nParti);
	return 1
end