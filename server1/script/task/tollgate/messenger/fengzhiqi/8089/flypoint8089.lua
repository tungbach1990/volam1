-------------------------------------------------------------------------
-- FileName		:	enemy_flybugbear.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-13 11:10:14
-- Desc			:  ��֮��ؿ��Ķ�����������ű�[80-89��]
-------------------------------------------------------------------------
IncludeLib( "FILESYS" );
Include("\\script\\task\\tollgate\\messenger\\fengzhiqi\\enemy_flypoint.lua") 
Include("\\script\\task\\newtask\\newtask_head.lua") --���� nt_getTask ͬ���������ͻ��˵���
Include("\\script\\task\\tollgate\\messenger\\messenger_losetask.lua")  --ȡ������
Include("\\script\\task\\tollgate\\messenger\\messenger_timeer.lua")    --���ü�ʱ��
TabFile_Load( "\\settings\\task\\tollgate\\messenger\\messenger_tollprize.txt" , "tollprize");	 --���ͬ�������ı��

FLYPOINT_EXP = tonumber( TabFile_GetCell( "tollprize" ,3 ,"dingdian_exp"))  --����С�־���
FLYPOINT_MAPID= 388  --��֮��ĵ�ͼid
FLYPOINT_MESSENGEREXP=tonumber( TabFile_GetCell( "tollprize" ,3 ,"dingdian_jifen"))  --��֮��Ķ���С�����������ʹ����

------��ʹ�����֮�ﶨ��ɱ�ֱ��--------------
--С��ͼ����x��y���������֣�60-79����,
killfly ={
{193,194,"��i Thi�n",1},
{181,183,"��i Ph��ng",2},
{197,179,"Ho�n Nhan Minh",3},
{197,172,"��i Di�u",4},
{198,163,"Ho�n Nhan �an",5},
{190,160,"Gia Lu�t H�o Nam",6},
{164,162,"��i C� ",7},
{164,172,"Gia Lu�t Minh",8},
{178,190,"Gia Lu�t Kh�c Ba",9},
{178,187,"Ho�n Nhan Thu�n",10},
{169,190,"��i Nan",11},
{172,193,"��i L�i",12},
{165,191,"Ho�n Nhan Ho� Y",13},
{178,2851,"Gia Lu�t V� Nam",14},
{186,183,"Ho�n Nhan Kh�u",15},
}


function OnDeath(nNpcIndex)
	local name = GetName()
	local Uworld1214 = nt_getTask(1214)  --�����ֿ���
	local FLY_npcidex = GetNpcParam(nNpcIndex,1)
	
	if (  messenger_middletime() == 10 ) then --����ڵ�ͼ�е�ʱ��
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