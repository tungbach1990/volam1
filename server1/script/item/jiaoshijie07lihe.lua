--��ʦ��07���
Include("\\script\\lib\\award.lua");
Include("\\script\\event\\teacher_day_200711\\head.lua");
function main()
	local nDate = tonumber(GetLocalDate("%y%m%d%H"));
	if (nDate >= TeacherDay200711_START_TIME and nDate <= TeacherDay200711_UseLimitTime) then--2007��11��17�� ��2007��12��02�� 24��00
		local tbAwardItemPic =
		{
			{nGID =6, nDID = 1, nPID = 1599, szName = "T�n", nRate = 10},--������	
			{nGID =6, nDID = 1, nPID = 1600, szName = "�S��", nRate = 10},  --��ʦ����	
			{nGID =6, nDID = 1, nPID = 1601, szName = "Tr�ng", nRate = 10},   --���ء���	
			{nGID =6, nDID = 1, nPID = 1602, szName = "��o", nRate = 10},   --��������	
			{nGID =6, nDID = 0, nPID = 20, szName = "Mai Kh�i Hoa V� ", nRate = 60},   --õ�廨��
		}
		local nItemIndex=TeacherDay200711_RandomGetOne(tbAwardItemPic,1,getn(tbAwardItemPic));
		AddItem(tbAwardItemPic[nItemIndex]["nGID"],tbAwardItemPic[nItemIndex]["nDID"],tbAwardItemPic[nItemIndex]["nPID"],1,0,0);
		Msg2Player(format("Nh�n ���c %d %s",1,tbAwardItemPic[nItemIndex]["szName"]))
		WriteLog(format("[%s]\t%s\tName:%s\tAccount:%s\tGetItem %d %s.","Ho�t ��ng Nh� gi�o Vi�t Nam 2007",GetLocalDate("%Y-%m-%d %H:%M"),GetName(), GetAccount(),1,tbAwardItemPic[nItemIndex]["szName"] ));
		return 0;
	else
		Say("Ho�t ��ng Nh� gi�o Vi�t Nam �� k�t th�c",0)
		return 0;
	end
end

--�������ѡ�е�һ��λ��
function TeacherDay200711_RandomGetOne(Item_Talbe,start_index,end_index)
	local rtotal=100000;
	local rcur=random(1,rtotal);
	local rstep=0;
	for i=start_index,end_index do
		Item_Talbe[i]["nRate"] = Item_Talbe[i]["nRate"] or 100;
		rstep=rstep+floor(Item_Talbe[i]["nRate"]*rtotal/100);
		if(rcur <= rstep) then
			return i
		end
	end
	return -1
end