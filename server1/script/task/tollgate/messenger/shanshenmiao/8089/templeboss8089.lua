-------------------------------------------------------------------------
-- FileName		:	templeboss8089.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-18 14:13:14
-- Desc			:   ɽ����ؿ��ı�־boss�ű�[80-89��]
-------------------------------------------------------------------------
IncludeLib( "FILESYS" );
Include("\\script\\task\\tollgate\\messenger\\shanshenmiao\\enemy_temboss.lua") 
Include("\\script\\task\\newtask\\newtask_head.lua") --���� nt_getTask ͬ���������ͻ��˵���
Include("\\script\\task\\tollgate\\messenger\\messenger_losetask.lua")  --ȡ������
Include("\\script\\task\\tollgate\\messenger\\messenger_timeer.lua")    --���ü�ʱ��
Include("\\script\\tagnewplayer\\head.lua");
TabFile_Load( "\\settings\\task\\tollgate\\messenger\\messenger_tollprize.txt" , "tollprize");	 --���ͬ�������ı��

NPC_PARAM_ID = 1;        --����boss������ˢ������������¼��У�����npc��ʱ����ΪGetNpcParam�ĵڶ�λ����˼�Ǹú���ȡ�����Ǵ���Ŀǰ����bossID������   
TEMBOSS_RELIVE=120        --ÿ����־������ʱ��
TEMBOSS_EXP=tonumber( TabFile_GetCell( "tollprize" ,6 ,"boss_exp"))  --С�־���
TEMBOSS_MAPID=391        --��ǰ������ڵ�ͼ��֮��ĵ�ͼ��ţ����Ƕ��٣���
TEMBOSS_MESSENGEREXP=tonumber( TabFile_GetCell( "tollprize" ,6 ,"boss_jifen"))  --С�־���

templeboss2=
{
--�����ֵ�80-89��
{837,85,391,1520,2625,1,"�ao Y�u Huynh �� L� L�o Ti�m",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\8089\\templebro8089.lua",1},
{837,85,391,1519,2718,1,"�ao Y�u Huynh �� Ho�t C�t Nh�n",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\8089\\templebro8089.lua",2},
{837,85,391,1465,2795,1,"�ao Y�u Huynh �� Tam Ti�m �ao",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\8089\\templebro8089.lua",3},
{837,85,391,1436,2955,1,"�ao Y�u Huynh �� C�i L�c V�n",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\8089\\templebro8089.lua",4},
{837,85,391,1379,3056,1,"�ao Y�u Huynh �� Di�u L� T�ng",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\8089\\templebro8089.lua",5},
{837,85,391,1412,3091,1,"�ao Y�u Huynh �� L�m Th��ng",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\8089\\templebro8089.lua",6},
{837,85,391,1499,2996,1,"�ao Y�u Huynh �� L�c �ao B�nh",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\8089\\templebro8089.lua",7},
{837,85,391,1530,2836,1,"�ao Y�u Huynh �� L�u Khu�ch T� ",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\8089\\templebro8089.lua",8},
{837,85,391,1581,2701,1,"�ao Y�u Huynh �� L��ng B�t B�nh",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\8089\\templebro8089.lua",9},
{837,85,391,1360,2979,1,"�ao Y�u Huynh �� V��ng Kh�i Di",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\8089\\templebro8089.lua",10},
{837,85,391,1404,2810,1,"�ao Y�u Huynh �� L� Tinh Tinh",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\8089\\templebro8089.lua",11},
{837,85,391,1404,2688,1,"�ao Y�u Huynh �� Li�u S�m Ch�n",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\8089\\templebro8089.lua",12},
{837,85,391,1463,2706,1,"�ao Y�u Huynh �� Tri�u Ti�u V�n",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\8089\\templebro8089.lua",13},
{837,85,391,1465,3136,1,"�ao Y�u Huynh �� Ti�u S�i",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\8089\\templebro8089.lua",14},
{837,85,391,1558,3151,1,"�ao Y�u Huynh �� Ti�u Thu�n D��ng",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\8089\\templebro8089.lua",15},
{837,85,391,1572,3000,1,"�ao Y�u Huynh �� Qu�ch ��t L� ",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\8089\\templebro8089.lua",16},
{837,85,391,1572,2843,1,"�ao Y�u Huynh �� Tr�n Ph�i",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\8089\\templebro8089.lua",17},
{837,85,391,1333,2774,1,"�ao Y�u Huynh �� Chu Song",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\8089\\templebro8089.lua",18},
{837,85,391,1344,2669,1,"�ao Y�u Huynh �� L� Kim",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\8089\\templebro8089.lua",19},
{837,85,391,1485,2625,1,"�ao Y�u Huynh �� M� C�n",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\8089\\templebro8089.lua",20},

}

function OnDeath(NpcIndex)
	local name = GetName()
	if (GetTask(Task_IsQuest)==2 and GetTask(Task_lag_TskID)==4) then
		if (GetTask(Task_KillNPC) < 5) then
			SetTask(Task_KillNPC, GetTask(Task_KillNPC) + 1)
			Msg2Player(format("��i hi�p �� ti�u di�t ���c %d t�n �ao Y�u", GetTask(Task_KillNPC)))
		else
		Msg2Player("��i hi�p �� ho�n th�nh nhi�m v� ti�u di�t �ao Y�u, H�y ��n Chi�n t�m T�n Gi� ho�n th�nh nhi�m v�")
		end
	end
	
	if (  messenger_middletime() == 10 ) then --����ڵ�ͼ�е�ʱ��
		Msg2Player("Xin l�i! "..name.."! B�n �� h�t th�i gian th�c hi�n nhi�m v� T�n s�! Nhi�m v� th�t b�i!.")
		losemessengertask()
	else
		Msg2Player("B�n th�nh c�ng h� t�n �ao Y�u.")
		messenger_templego(NpcIndex)
	end
end

