-------------------------------------------------------------------------
-- FileName		:	templebro90.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-18 15:09:14
-- Desc			:   ɽ����ؿ��ĵ����ֵ������ű�[90���ϼ�]
-------------------------------------------------------------------------
IncludeLib( "FILESYS" );
Include("\\script\\task\\tollgate\\messenger\\shanshenmiao\\enemy_temrefresh.lua") 
Include("\\script\\task\\newtask\\newtask_head.lua") --���� nt_getTask ͬ���������ͻ��˵���
Include("\\script\\task\\tollgate\\messenger\\messenger_losetask.lua")  --ȡ������
Include("\\script\\task\\tollgate\\messenger\\messenger_timeer.lua")    --���ü�ʱ��
TabFile_Load( "\\settings\\task\\tollgate\\messenger\\messenger_tollprize.txt" , "tollprize");	 --���ͬ�������ı��

TEMREFRESH_EXP = tonumber( TabFile_GetCell( "tollprize" ,7 ,"shuachu_exp"))  --С�־���
TEMREFRESH_MAPID= 392  --ɽ����ĵ�ͼid
TEMREFRESH_MESSENGEREXP= tonumber( TabFile_GetCell( "tollprize" ,7 ,"shuachu_jifen"))  --С�־���


function OnDeath()
	local name = GetName()
	local Uworld1215 = nt_getTask(1215)  --boss���ˢ�ֵĴ�ֿ���
	if (  messenger_middletime() == 10 ) then --����ڵ�ͼ�е�ʱ��
		Msg2Player("Th�t xin l�i ! "..name.."! th�i gian nhi�m v� t�n s� �� h�t, nhi�m v� th�t b�i!.")
		losemessengertask()
	elseif ( Uworld1215 == 0 ) then  --û��ˢ�ֵ�����
		Msg2Player("Ng��i n�y �� b� ng��i kh�c l�y, ng��i ��nh h�n ch�c l� s� kh�ng c� b�t k� ph�n th��ng.")
		return
	else
		temple_killrefresh()
	end
end
