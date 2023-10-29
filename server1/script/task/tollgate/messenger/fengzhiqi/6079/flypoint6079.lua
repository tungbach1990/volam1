-------------------------------------------------------------------------
-- FileName		:	enemy_flypoint6079.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-06 19:39:14
-- Desc			:   ��֮��ؿ��Ķ�����������ű�[60-79��]
-------------------------------------------------------------------------
IncludeLib( "FILESYS" );
Include("\\script\\task\\tollgate\\messenger\\fengzhiqi\\enemy_flypoint.lua") 
Include("\\script\\task\\newtask\\newtask_head.lua") --���� nt_getTask ͬ���������ͻ��˵���
Include("\\script\\task\\tollgate\\messenger\\messenger_losetask.lua")  --ȡ������
Include("\\script\\task\\tollgate\\messenger\\messenger_timeer.lua")    --���ü�ʱ��
TabFile_Load( "\\settings\\task\\tollgate\\messenger\\messenger_tollprize.txt" , "tollprize");	 --���ͬ�������ı��

FLYPOINT_EXP = tonumber( TabFile_GetCell( "tollprize" ,2 ,"dingdian_exp"))  --����С�־���
FLYPOINT_MAPID= 387  --��֮��ĵ�ͼid
FLYPOINT_MESSENGEREXP= tonumber( TabFile_GetCell( "tollprize" ,2 ,"dingdian_jifen"))  --��֮��Ķ���С�����������ʹ����

------��ʹ�����֮�ﶨ��ɱ�ֱ��--------------
--С��ͼ����x��y���������֣�60-79����,
killfly ={
{193,194,"Ho�n Nhan Xung",1},
{181,183,"Ho�n Nhan V� Lo�i",2},
{197,179,"��i Cao",3},
{197,172,"Ho�n Nhan T� ",4},
{198,163,"��i M�c",5},
{190,160,"Ho�n Nhan Nguy�t",6},
{164,162,"Gia Lu�t M�nh",7},
{164,172,"��i H�c",8},
{178,190,"Ho�n Nhan Ni�n",9},
{178,187,"��i V� ",10},
{169,190,"Gia Lu�t B�nh Tr��ng",11},
{172,193,"Ho�n Nhan H�o",12},
{165,191,"Gia Lu�t L�p Ph�m",13},
{178,2851,"Ho�n Nhan An",14},
{186,183,"��i Tr� ",15},
}


function OnDeath(nNpcIndex)
	local name = GetName()
	local Uworld1214 = nt_getTask(1214)  --�����ֿ���
	local FLY_npcidex = GetNpcParam(nNpcIndex,1)
	
	if ( messenger_middletime() == 10 ) then --����ڵ�ͼ�е�ʱ��
		Msg2Player("Xin l�i! "..name.."! B�n �� h�t th�i gian th�c hi�n nhi�m v� T�n s�! Nhi�m v� th�t b�i!.")
		losemessengertask()
	elseif ( Uworld1214 == 0 ) then  --û�ж���ɱ�ֵ�����
		Msg2Player("T�n n�y �� b� ng��i ta �� ng��i ta mua ��t r�i, ng��i ��nh h�n c�ng kh�ng ���c ph�n th��ng.")
		return
	elseif ( FLY_npcidex ~= killfly[Uworld1214][4]) then
		Msg2Player("T�n n�y kh�ng ph�i l� ng��i trong th� mu�n ng��i �i t�m sao? X�c ��nh r� c� ph�i l� ng��i c�a Kim C�u!")
	else
		messenger_killpoint()
	end
end