--����֮��
Include("\\script\\event\\teacher_day_200711\\head.lua");

-- ÿ����ɫֻ��ͨ���Ҵ�֮����߻��5�ھ���ֵ������ ��
--

function main()
	local nDate = tonumber(GetLocalDate("%y%m%d%H"));
	local nExpLimit = GetTask(TSK_TeacherDay200711_UseExpLimit); 
	if ( nExpLimit >= TeacherDay200711_UseExpLimit) then
		Say("S� d�ng b� k�p gia truy�n �� ��t gi�i h�n �i�m kinh nghi�m, kh�ng th� s� d�ng n�a.",0)
		return 1;
	end
	if (GetLevel() < 50) then
		Say("Th�t ��ng ti�c, ch� c� ng��i ch�i <color=yellow>c�p tr�n 50<color> m�i c� th� s� d�ng b� k�p n�y.",0)
		return 1;
	end
	if (nDate < TeacherDay200711_START_TIME or nDate > TeacherDay200711_UseLimitTime) then
		Say("Ho�t ��ng �� k�t th�c, kh�ng th� s� d�ng!",0);
		return 0;
	end
	--2.000.000 ����ֵ
	--1,5% ���ʻ��1���ɺ챦ʯ
	AddOwnExp(2000000);
	SetTask(TSK_TeacherDay200711_UseExpLimit,nExpLimit+2000000);
	if (random(1,10000) <= 150) then
		AddItem(4,353,1,1,0,0)
		Msg2Player(format("Nh�n ���c %d %s",1,"Tinh H�ng B�o Th�ch"))
		WriteLog(format("[%s]\t%s\tName:%s\tAccount:%s\tGetItem %d %s.","Ho�t ��ng Nh� gi�o Vi�t Nam 2007",GetLocalDate("%Y-%m-%d %H:%M"),GetName(), GetAccount(),1,"Tinh H�ng B�o Th�ch"));			
	end
	return 0;
end