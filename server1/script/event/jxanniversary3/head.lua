
--�������
Include("\\script\\task\\random\\task_head.lua");

JXANNIVERSARY3_OPENDATE	= 20060901;			--��������ʼʱ��
JXANNIVERSARY3_ENDDATE	= 20060926;			--����������ʱ��
JXANNIVERSARY3_SHOUTAONUM	= 3;					--ÿ������������ҵĸ���
JXANNIVERSARY3_MAXOWNEXP	= 100000000;	--��ɳ��������þ���ֵ
JXANNIVERSARY3_ONCEEXP		= 3000000;		--��ɳ����ÿ�θ���ľ���

tb_JXAN_SHOUTAOKIND = {
	{	szstart="<dec><npc>��ɳ������Ҫ2�ݰ��׷ۡ�2�ݰ�ɰ�ǡ�1�����ʵĶ�ɳ,",
		szend="<dec><npc>��,����ɿڵĶ�ɳ�����Ѿ������ˡ�",
							--g,d,p,count
		resource={ {6,1,1175,2},{6,1,1176,2},{6,1,1177,1} },
		shoutao={6,1,1179}},
	{	szstart="<dec><npc>����������Ҫ2�ݰ��׷ۡ�2�ݰ�ɰ�ǡ�1�����ʵ�����,",
		szend="<dec><npc>��,����ɿڵ����������Ѿ������ˡ�",
		resource={ {6,1,1175,2},{6,1,1176,2},{6,1,1178,1} },
		shoutao={6,1,1180}},
};

tb_JXAN_RESOURCERATE = {
	{ {6, 1, 1175}, "���׷�", 40 },
	{ {6, 1, 1176}, "��ɰ��", 40 },
	{ {6, 1, 1177}, "���ʵĶ�ɳ", 10 },
	{ {6, 1, 1178}, "���ʵĺ���",   10 },
}

tb_JXAN_SHOUXIGIFT = {
	{{6,1,147,4}, "�ļ�����", 150},
	{{6,1,147,5}, "�弶����", 285},
	{{6,1,147,6}, "��������", 10},
	{{6,1,147,7}, "�߼�����", 3},
	{{6,1,147,8}, "�˼�����", 1},
	{{6,1,398,1}, "���ؿ�ʯ", 1},
	{{4,238,1,1}, "��ˮ��", 50},
	{{4,240,1,1}, "��ˮ��", 50},
	{{4,239,1,1}, "��ˮ��", 50},
	{{6,2,2,0}, "�������", 400},
}

tb_JXAN_TSK_ADDR =
{
	{{2, 293*8, 218*16}, "��ɽ"},
	{{21, 328*8, 281*16}, "���ɽ" },
	{{193, 238*8, 176*16}, "����ɽ"},
	{{167, 190*8, 200*16}, "���ɽ"}
} 

---------Task ID-------------
TASKID_JXAN_SHOUTAODATE	= 2473;				--�����������������
TASKID_JXAN_SHOUTAONUM	= 2474;				--���������ĸ���
TASKID_DOUSHASHOUTAO_EXP	= 2475;			--��ɳ���һ�þ��飨����1�ڣ�


---------Function------------
function JxAn_cloud_join()
	if (IsCharged() ~= 1) then
		Msg2Player("ֻ�г�ֵ�û����ܲμ������", 0);
		return -1;
	end;
	if (GetLevel() < 80) then
		Msg2Player("��ĵȼ�������80�������ܲμ������", 0);
		return -1;
	end;
	return 1;
end;

-- ��ָ���������Ŵ���һ���������
function shouxi_CreateBook()
	-- ѡ��һ���ڶ�����������
	local nRandomTaskID = TaskNo(selectNextTask());
	
	if nRandomTaskID~=nil and nRandomTaskID~=0 then
		-- ����һ���������
		nRandomItemIndex = AddItem(6, 2, 2, 0, 1, 0, 0);
		SetItemMagicLevel(nRandomItemIndex, 1, nRandomTaskID);
		-- ͬ����Ʒħ������
		SyncItem(nRandomItemIndex);
		Msg2Player("���õ���<color=green>�������һ����<color>");
		WriteLog(date().."\t[����������]\tName:"..GetName().."\tAccount:"..GetAccount().."\t����������л��һ�����������������Ϊ��"..nRandomTaskID.." ����Ϊ��"..nRandomItemIndex)
	else
		WriteLog(date().."\t[����������]\tName:"..GetName().."\tAccount:"..GetAccount().."\t����������л���������ʧ��")
	end;
end;

--�ж�����Ƿ�����
function IsCharged()
	if( GetExtPoint( 0 ) >= 1 ) then
		return 1;
	else
		return 0;
	end;
end;
