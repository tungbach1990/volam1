do return end
-- --zero 20070712 �ٻ�boss

-- IncludeLib("NPCINFO")
-- IncludeLib("TASKSYS");
-- Include("\\script\\global\\forbidmap.lua");


-- --���µ�ͼ����
-- MapBoss = {4}
-- Boss_Pos=
-- {
-- 	[1]={1757,3145},
-- 	[2]={1714,2910},
-- 	[3]={1524,2900},
-- 	[4]={1504,3102}
	
-- }

-- --Boss	{ID,Name,Level,Series}
-- mengjiangBoss ={
-- 	{1284, "Kim Quang T��ng Qu�n",95,-1}
-- }

-- function CallBoss_main()

-- 	Msg2SubWorld(format("Boss Kim Quang �� xu�t hi�n t�i Kim Quang ��ng !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"));)
-- 	--local W,X,Y = GetWorldPos();
-- 	BossId = mengjiangBoss[mengjiang_index][1];
-- 	BossName = mengjiangBoss[mengjiang_index][2];
-- 	BossLevel = mengjiangBoss[mengjiang_index][3];
-- 	BossSeries = random(0,4) 
-- 	local posRan = random(1,4)
-- 	--AddNpcEx( BossId,BossLevel ,BossSeries, SubWorldID2Idx(W), X * 32, (Y +  5) * 32, 1,BossName, 1 );
	
-- 	AddNpcEx(BossId, BossLevel, BossSeries, MapBoss[1], Boss_Pos[posRan][1] * 32, Boss_Pos[posRan][2] * 32, 1, BossName, 1)
-- 	local str = "Boss Kim Quang �� xu�t hi�n t�i Kim Quang ��ng !"
-- 	AddGlobalCountNews(str, 3)
-- 	Msg2SubWorld(format("Boss Kim Quang �� xu�t hi�n t�i Kim Quang ��ng !"));
-- end
