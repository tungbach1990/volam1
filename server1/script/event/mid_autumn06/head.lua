--by ��־ɽ [2006-09-12]
--2006����֮�������,��������
--Illustration: ���� -- lightcage au06- -- midautumn2006

if (not __H_MIDAUTUMN_06__) then
	__H_MIDAUTUMN_06__ = 1;

Include([[\script\lib\pay.lua]]);
Include([[\script\lib\gb_taskfuncs.lua]]);

EXP_AWARD_LIMIT = 50000000;
AU06_TK_EXP = 1776;

AU06_BEGINDATE = 20060930;
AU06_ENDDATE = 20061013;

AU06_COLORED_LIMITED = 3000;


--�������ݱ�
tab_Lightcage = {
--		1	2		3		4		5		6		7	8		9
	{1229, 1221, "L�ng ��n b��m b��m", "Gi�y ki�ng v�ng (V�t li�u l�m l�ng ��n)", 1000, 1241, 1235, "B�nh trung thu th��ng", 2},
	{1230, 1222, "L�ng ��n ng�i sao", "Gi�y ki�ng lam (V�t li�u l�m l�ng ��n)", 2000, 1242, 1236, "B�nh trung thu ��u xanh", 2},
	{1231, 1223, "L�ng ��n �ng", "Gi�y ki�ng l�c (V�t li�u l�m l�ng ��n)", 3000, 1243, 1237, "B�nh trung thu nh�n tr�ng", 2},
	{1232, 1224, "L�ng ��n tr�n", "Gi�y ki�ng �� (V�t li�u l�m l�ng ��n)", 4000, 1244, 1238, "B�nh trung thu ��c bi�t", 2},
	{1233, 1225, "L�ng ��n c� ch�p", "Gi�y ki�ng cam (V�t li�u l�m l�ng ��n)", 5000, 1245, 1239, "B�nh trung thu h�t sen", 1},
	{1234, 1225, "L�ng ��n k�o qu�n", "Gi�y ki�ng cam (V�t li�u l�m l�ng ��n)", 5000, 1245, 1240, "B�nh trung thu con heo", 5},
}

tab_BasicMaterial = {
	{1226, "Thanh tre (V�t li�u l�m l�ng ��n)"},
	{1227, "D�y c�i (V�t li�u l�m l�ng ��n)"},
	{1228, "N�n"},
}

--�Ƿ��ڻ�ڼ� ���أ�1�� ,0 ���ڻ�ڼ�
function au06_is_inperiod()
	if (gb_GetTask("midautumn2006_city_all", 1) ~= 0) then
		return 0
	end;
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if (nDate >= AU06_BEGINDATE and nDate <= AU06_ENDDATE) then --
		return 1;
	end;
	return 0;
end;

--�Ƿ�Ϊ50����ֵ�û�
function au06_IsPayed_player()
	if (IsCharged() == 0) then
		return 0;
	end;
	return 1;
end;

function oncancel()
end;

end;	--//end of __H_MIDAUTUMN_06__