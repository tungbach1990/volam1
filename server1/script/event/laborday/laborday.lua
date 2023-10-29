--5.1�Ͷ��ڻ�ű�
--By LiuKuo 2005.4.20
IncludeLib("NPCINFO")

BOSSLASTDATE = tonumber(date("%d")) --��һ�λƽ�Boss���ٻ������� ֻ��¼��
BOSSMAXCOUNT = 3	--ÿ�쵥�������ٳ��Ļƽ�Boss���������ÿ̨gameserver�����ޣ���24��
BOSSNOWCOUNT = 0 --��ǰ�ٻ��Ļƽ�Boss��

--���µ�ͼ����
ForbiddenMap = {44, 209, 210, 211, 212, 213, 214, 215, 216, 217, 218, 219, 220, 221, 222, 223, 326, 327, 328, 329, 330, 331, 334, 335, 337, 338, 339, 344, 345, 346, 347, 348, 349, 350, 351, 352, 353, 354, 355, 356, 357, 358, 359, 360, 361, 362, 363, 364, 365, 366, 367, 368, 369, 370, 371, 372, 373, 374}

--�ƽ�Boss	{ID,Name,Series}
GoldenBoss = {{562, "��o Thanh Ch�n Nh�n", 4},
			  {563, "Gia Lu�t T� Ly", 3},
			  {564, "Ho�n Nhan Tuy�t Y", 3},
			  {565, "�oan M�c Du� ", 3},
			  {566, "C� B�ch", 0},
			  {567, "Chung Linh T� ", 2},
			  {568, "H� Linh Phi�u", 2},
			  {582, "Lam Y Y", 1},
			  {583, "M�nh Th��ng L��ng", 3},
			  {739, "V��ng T� ", 0},
			  {740, "Huy�n Gi�c ��i S� ", 0},
			  {741, "���ng B�t Nhi�m", 1},
			  {742, "B�ch Doanh Doanh", 1},
			  {743, "Thanh Hi�u S� Th�i ", 2},
			  {744, "Y�n Hi�u Tr�i", 2},
			  {745, "H� Nh�n Ng� ", 3},
			  {746, "��n T� Nam", 4},
			  {747, "Tuy�n C� T� ", 4},
			  {748, "H�n M�ng", 1},
			  {751, "��i M� H� ", 0}}

--����Boss {ID,Name,Series}
DamahuBoss = {{751, "��i M� H� ", 0},
			  {752, "��i M� H� ", 0},
			  {753, "��i M� H� ", 1},
			  {754, "��i M� H� ", 1},
			  {755, "��i M� H� ", 2},
			  {756, "��i M� H� ", 2},
			  {757, "��i M� H� ", 3},
			  {758, "��i M� H� ", 3},
			  {759, "��i M� H� ", 4},
			  {760, "��i M� H� ", 4}}
			  
--СBoss	{ID,Name}
NormalBoss = {{511, "Tr��ng T�ng Ch�nh"},
			  {513, "Di�u Nh� "},
			  {523, "Li�u Thanh Thanh"},
			  {725, "Th�y t�c ��u l�nh"}}
			  
--ɱ������Boss	{ID,Name,��߱��}
MiniBoss = {{851, "B� Hi�u Tr�n", 79},
			{852, "Ki�u ��nh Thi�n", 80},
			{853, "�i�u D�ch �ao", 81},
			{854, "T�y M�n V� Gi�i", 82},
			{855, "H�u  Kh�t Ki�m", 83},
			{856, "�ng  Ti�u Phong", 84},
			{857, "Vi�n Ni�m T�ch", 85},
			{858, "Tr� Thi�n M�n", 86}}

--����npc	{ID,Name}	ͬһ�в�ͬ��id��Ӧ��ͬ�ȼ����ֵ�droprate
GoldenNpc = {{859, 859, 859, 859, 860, 861, 862, 863, "B�ch h� "},
			 {864, 864, 864, 864, 865, 866, 867, 868, "H�c Di�p H�u "},
			 {869, 869, 869, 869, 870, 871, 872, 873, "S�n T�c "},
			 {874, 874, 874, 874, 875, 876, 877, 878, "Th�y T�c "},
			 {879, 879, 879, 879, 880, 881, 882, 883, "Phi Sa "},
			 {884, 884, 884, 884, 885, 886, 887, 888, "L�nh Th��ng"},
			 {889, 889, 889, 889, 890, 891, 892, 893, "Ng�n Nha "},
			 {894, 894, 894, 894, 895, 896, 897, 898, "Th�a Phong"},
			 {899, 899, 899, 899, 900, 901, 902, 903, "M�ng C� V� s� "},
			 {904, 904, 904, 904, 905, 906, 907, 908, "S��ng �ao"}}
			 
--��ͨnpc	{ID,Name}
NormalNpc = {{2, "B�ch h� "},
			 {37, "H�c Di�p H�u "},
			 {169, "S�n T�c "},
			 {674, "Th�y T�c "},
			 {703, "Phi Sa "},
			 {708, "L�nh Th��ng"},
			 {589, "Ng�n Nha "},
			 {713, "Th�a Phong"},
			 {673, "M�ng C� V� s� "},
			 {598, "S��ng �ao"}}

function CallBoss( Level, Series )
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
	local nNowDate = tonumber(date("%d"));
	
	if ( nNowDate == BOSSLASTDATE ) then	--����ϴ��ٻ������ǵ���Ļ�
		if ( BOSSNOWCOUNT >= BOSSMAXCOUNT ) then	--�����ٻ�������������ٻ��ƽ�Boss
			print("S� Boss Ho�ng Kim b�n g�i �� qu� gi�i h�n.")
			nBossRate =  random( 101, 10000);
		else
			nBossRate = random( 1, 10000);
		end
	else	--����ϴ��ٻ������뵱ǰ����ͬһ��
		BOSSLASTDATE = nNowDate;	--�������������
		BOSSNOWCOUNT = 0;	--��ǰ�ٻ�����0
		nBossRate = random( 1, 10000);
	end
	
	if( Level < 90 ) then
		nBossRate =  random( 101, 10000);
	end
	
	if( nBossRate <= 100 ) then		--�ٻ��ƽ�Boss
		local i = random( 1, getn(GoldenBoss));
		local GoldenBossId = GoldenBoss[i][1];
		local GoldenBossName = GoldenBoss[i][2];
		local GoldenBossSeries = GoldenBoss[i][3];
		if( GoldenBossId == 748 ) then	--�����������
			GoldenBossSeries = random( 0, 4);
		end
		if( GoldenBossId == 751 ) then	--�������
			i = random( 1, getn(DamahuBoss));
			GoldenBossId = DamahuBoss[i][1];
			GoldenBossName = DamahuBoss[i][2];
			GoldenBossSeries = DamahuBoss[i][3];
		end
		AddNpcEx( GoldenBossId, 95, GoldenBossSeries, SubWorldID2Idx(W), X * 32, (Y +  5)* 32, 1, GoldenBossName, 1 );
		BOSSNOWCOUNT = BOSSNOWCOUNT + 1;	--��ǰ�ٻ��Ļƽ�Boss����1
		WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."] g�i Boss Ho�ng Kim:"..GoldenBossName);
		Msg2Player("B�n g�i Boss Ho�ng Kim:"..GoldenBossName);
	elseif ( nBossRate > 100 and nBossRate <= 300 ) then	--�ٻ�СBoss
		local i = random( 1, getn(NormalBoss));
		local NormalBossId = NormalBoss[i][1];
		local NormalBossName = NormalBoss[i][2];
		AddNpcEx( NormalBossId, 95, Series, SubWorldID2Idx(W), X * 32, (Y +  5) * 32, 1, NormalBossName, 1 );
		WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."] G�i m�t ti�u boss:"..NormalBossName);
		Msg2Player("B�n g�i m�t ti�u Boss:"..NormalBossName);
	elseif ( nBossRate > 300 and nBossRate <= 3000 ) then	--�ٻ�ɱ��Boss
		local i = floor( Level - 20 ) / 10 + 1;	--����ɱ��ﵵĵȼ�ѡ���ٻ���ɱ��Boss
		local MiniBossId = MiniBoss[i][1];
		local MiniBossName = MiniBoss[i][2];
		local MaskId = MiniBoss[i][3];
	 	AddNpcEx( MiniBossId, Level + 5, Series, SubWorldID2Idx(W), X * 32, (Y +  5) * 32, 1, MiniBossName, 1 );
	 	Msg2Player("B�n g�i m�t Boss s�t th�:"..MiniBossName);
	 	AddItem( 0, 11, MaskId, 1, 0, 0 );	--�����ٳ���Boss�����һ�����
	 	Msg2Player("B�n nh�n ���c m�t M�t n� ");
	elseif ( nBossRate > 3000 and nBossRate <= 6000 ) then	--�ٻ�����
		local i =  random( 1, getn(GoldenNpc));		--���ѡһ������npc
		local j =  floor( Level - 20 ) / 10 + 1;	--����ɱ��ﵵĵȼ�ȡ��Ӧdroprate������
		local GoldenNpcId = GoldenNpc[i][j];
		local GoldenNpcName = GoldenNpc[i][9];
		NPCINFO_AddBlueNpc( Series, GoldenNpcId, Level, SubWorldID2Idx(W), X * 32, (Y +  5) * 32, 1, GoldenNpcName, 15 );	--�������ֵĽű������һ����������ģ��
		Msg2Player("B�n g�i m�t boss xanh:"..GoldenNpcName);
	else	--�ٻ���ͨ��
		local i = random( 1, getn(NormalNpc));
		local NormalNpcId = NormalNpc[i][1];
		local NormalNpcName = NormalNpc[i][2];
		AddNpcEx( NormalNpcId, Level + 5, Series, SubWorldID2Idx(W), X* 32, (Y +  5) * 32, 1, NormalNpcName, 0 );
		AddNpcEx( NormalNpcId, Level + 5, Series, SubWorldID2Idx(W), X * 32, (Y -  5) * 32, 1, NormalNpcName, 0 );
		Msg2Player("B�n ch� c� th� g�i m�t s� qu�i th�ng th��ng ");
	end
	return 0	
end
