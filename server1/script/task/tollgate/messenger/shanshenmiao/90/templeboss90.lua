-------------------------------------------------------------------------
-- FileName		:	templeboss90.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-18 14:13:14
-- Desc			:   ɽ����ؿ��ı�־boss�ű�[90���ϼ�]
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
TEMBOSS_EXP=tonumber( TabFile_GetCell( "tollprize" ,7 ,"boss_exp"))  --С�־���
TEMBOSS_MAPID=392        --��ǰ������ڵ�ͼ��֮��ĵ�ͼ��ţ����Ƕ��٣���
TEMBOSS_MESSENGEREXP= tonumber( TabFile_GetCell( "tollprize" ,7 ,"boss_jifen"))  --С�־���

templeboss3=
{
--�����ֵ�90������
{840,100,392,1520,2625,1,"�ao Y�u Huynh �� ��m T� ",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\90\\templebro90.lua",1},
{840,100,392,1519,2718,1,"�ao Y�u Huynh �� T��ng M�n Nh�n",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\90\\templebro90.lua",2},
{840,100,392,1465,2795,1,"�ao Y�u Huynh �� ��m T�nh",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\90\\templebro90.lua",3},
{840,100,392,1436,2955,1,"�ao Y�u Huynh �� ��m Nh� Th�p Tam",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\90\\templebro90.lua",4},
{840,100,392,1379,3056,1,"�ao Y�u Huynh �� ��m T� Lang",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\90\\templebro90.lua",5},
{840,100,392,1412,3091,1,"�ao Y�u Huynh �� ��m T� N� ",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\90\\templebro90.lua",6},
{840,100,392,1499,2996,1,"�ao Y�u Huynh �� ��m T�ng",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\90\\templebro90.lua",7},
{840,100,392,1530,2836,1,"�ao Y�u Huynh �� ��m Tu�n",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\90\\templebro90.lua",8},
{840,100,392,1581,2701,1,"�ao Y�u Huynh �� ��m Th�y",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\90\\templebro90.lua",9},
{840,100,392,1360,2979,1,"�ao Y�u Huynh �� ��m V�n",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\90\\templebro90.lua",10},
{840,100,392,1404,2810,1,"�ao Y�u Huynh �� ��m Phi",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\90\\templebro90.lua",11},
{840,100,392,1404,2688,1,"�ao Y�u Huynh �� ��m Th� Tr� ",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\90\\templebro90.lua",12},
{840,100,392,1463,2706,1,"�ao Y�u Huynh �� ��m S�i S�i",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\90\\templebro90.lua",13},
{840,100,392,1465,3136,1,"�ao Y�u Huynh �� ��m S� ",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\90\\templebro90.lua",14},
{840,100,392,1558,3151,1,"�ao Y�u Huynh �� ��m H�i",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\90\\templebro90.lua",15},
{840,100,392,1572,3000,1,"�ao Y�u Huynh �� ��m ��a",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\90\\templebro90.lua",16},
{840,100,392,1572,2843,1,"�ao Y�u Huynh �� ��m C� ",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\90\\templebro90.lua",17},
{840,100,392,1333,2774,1,"�ao Y�u Huynh �� ��m ��u",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\90\\templebro90.lua",18},
{840,100,392,1344,2669,1,"�ao Y�u Huynh �� ��m �i�m �i�m",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\90\\templebro90.lua",19},
{840,100,392,1485,2625,1,"�ao Y�u Huynh �� ��m T�y",1,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\90\\templebro90.lua",20},

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

