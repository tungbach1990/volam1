
--zero 20070712 �ٻ�boss

IncludeLib("NPCINFO")
IncludeLib("TASKSYS");
Include("\\script\\global\\forbidmap.lua");


--���µ�ͼ����
ForbiddenMap = {44, 209, 210, 211, 212, 213, 214, 215, 216, 217, 218, 219, 220, 221, 222, 223, 326, 327, 328, 329, 330, 331, 334, 335, 337, 338, 339, 344, 345, 346, 347, 348, 349, 350, 351, 352, 353, 354, 355, 356, 357, 358, 359, 360, 361, 362, 363, 364, 365, 366, 367, 368, 369, 370, 371, 372, 373, 374}

--Boss	{ID,Name,Level,Series}
mengjiangBoss ={{562, "V� Danh ��o Nh�n",95,4},--1 ����
	{565, "V� Danh L�o Nh�n",95,3},--2
	{741, "V� Danh S�t Th�",95,1},--3
	{744, "V� Danh M� Nh�n",95,2},--4
	{1284, "Kim Quang T��ng Qu�n",95,-1},--5 ����
	{511, "Tr��ng T�ng Ch�nh",95,4},--6 ����
	{513, "Di�u Nh� ",95,2},--7
	{523, "Li�u Thanh Thanh",95,1},--8
	{725,"Th�y t�c ��u l�nh",85,-1},--9 ͭ��
	{851, "B� Hi�u Tr�n",20,-1},--10 ������ľ��
	{852, "Ki�u ��nh Thi�n",30,-1},--11
	{853, "�i�u D�ch �ao",40,-1},--12
	{854, "T�y M�n V� Gi�i",50,-1},--13
	{855, "H�u  Kh�t Ki�m",60,-1},--14
	{856, "�ng  Ti�u Phong",70,-1},--15
	{857, "Vi�n Ni�m T�ch",80,-1},--16
	{858, "Tr� Thi�n M�n",90,-1}--17
}

function CallBoss( lingpai  )
	local W,X,Y = GetWorldPos();
	local nMapId = W;
	if ( GetFightState() == 0 ) then	--��ս��������
		Msg2Player("Kh�ng � trong tr�ng th�i chi�n ��u th� kh�ng th� s� d�ng");
		return 1
	end
	for i = 249, 318 do	--ϴ�赺ɽ��
		if ( i == nMapId ) then
			Msg2Player("N�i ��y kh�ng th� s� d�ng v�t ph�m n�y ");
			return 1
		end
	end	
	for i = 375, 415 do	--�����ν�ս����ͼ ���������ͼ �������ͼ
		if ( i == nMapId ) then
			Msg2Player("N�i ��y kh�ng th� s� d�ng v�t ph�m n�y ");
			return 1
		end
	end	
	for i = 1, getn( ForbiddenMap ) do		--�����ͼ����
		if( ForbiddenMap[i] == nMapId ) then
			Msg2Player("N�i ��y kh�ng th� s� d�ng v�t ph�m n�y ");
			return 1
		end
	end
	
	if (CheckAllMaps(nMapId) == 1) then
		Msg2Player("Tri�u h�i l�nh b�i kh�ng th� s� d�ng t�i khu v�c ��c th� n�y.");
		return 1
	end;
	if(lingpai == 1) then -- ľ��
		i = random(10,17);	
		summonBoss(i);
		WriteLog(format("[Tri�u h�i m�nh t��ng]\t%s\tAccount:%s\tName:%s\t%s s� d�ng th�nh c�ng",
			GetLocalDate("%Y-%m-%d %H:%M:%S"),
			GetAccount(),
			GetName(),
			"M�c B�i"));
	 elseif(lingpai == 2 ) then--ͭ��
		summonBoss(9)
		WriteLog(format("[Tri�u h�i m�nh t��ng]\t%s\tAccount:%s\tName:%s\t%s s� d�ng th�nh c�ng",
			GetLocalDate("%Y-%m-%d %H:%M:%S"),
			GetAccount(),
			GetName(),
			"��ng B�i"));
	elseif(lingpai == 3 ) then --����
		i= random(6,8);
		summonBoss(i);
		WriteLog(format("[Tri�u h�i m�nh t��ng]\t%s\tAccount:%s\tName:%s\t%s s� d�ng th�nh c�ng",
			GetLocalDate("%Y-%m-%d %H:%M:%S"),
			GetAccount(),
			GetName(),
			"Ng�n B�i"));
	elseif(lingpai == 4) then --����
		summonBoss(5);
		WriteLog(format("[Tri�u h�i m�nh t��ng]\t%s\tAccount:%s\tName:%s\t%s s� d�ng th�nh c�ng",
			GetLocalDate("%Y-%m-%d %H:%M:%S"),
			GetAccount(),
			GetName(),
			"Kim B�i"));
	elseif(lingpai == 5) then --����
		if( CalcFreeItemCellCount() < 10) then
			Say("H�nh trang �� ��y! H�y s�p x�p l�i h�nh trang �� c� t�i thi�u 10 � tr�ng.",0);
			return 1;
		end
		local equit_index=random(159,167);--�����������
		AddGoldItem(0,equit_index);
		for i=1,5 do
			summonBoss(i);
		end
		Msg2SubWorld(format("Ng��i ch�i %s t�i %s(%d,%d) �� s� d�ng %s, l�m cho Kim Quang T��ng Qu�n xu�t hi�n.",GetName(),SubWorldName(SubWorld),floor(X/8),floor((Y+5)/16),"Ng�c B�i"));
		WriteLog(format("[Tri�u h�i m�nh t��ng]\t%s\tAccount:%s\tName:%s\t%s s� d�ng th�nh c�ng",
			GetLocalDate("%Y-%m-%d %H:%M:%S"),
			GetAccount(),
			GetName(),
			"Ng�c B�i"));
	end
	return 0;
end
function summonBoss(mengjiang_index)
	local W,X,Y = GetWorldPos();
	BossId = mengjiangBoss[mengjiang_index][1];
	BossName = mengjiangBoss[mengjiang_index][2];
	BossLevel = mengjiangBoss[mengjiang_index][3];
	BossSeries = mengjiangBoss[mengjiang_index][4];
	if(BossSeries == -1) then BossSeries = random(0,4) end;
	AddNpcEx( BossId,BossLevel ,BossSeries, SubWorldID2Idx(W), X * 32, (Y +  5) * 32, 1,BossName, 1 );
	Msg2Player(format("B�n �� tri�u h�i ���c %s",BossName));
end
