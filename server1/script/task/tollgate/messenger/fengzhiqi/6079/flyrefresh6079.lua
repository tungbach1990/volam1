-------------------------------------------------------------------------
-- FileName		:	enemy_flyrefresh6079.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-06 19:39:14
-- Desc			:   ��֮��ؿ���boss���ˢ���������ű�[60-79��]
-------------------------------------------------------------------------
IncludeLib( "FILESYS" );
Include("\\script\\task\\tollgate\\messenger\\fengzhiqi\\enemy_flyrefresh.lua") 
Include("\\script\\task\\newtask\\newtask_head.lua") --���� nt_getTask ͬ���������ͻ��˵���
Include("\\script\\task\\tollgate\\messenger\\messenger_losetask.lua")  --ȡ������
Include("\\script\\task\\tollgate\\messenger\\messenger_timeer.lua")    --���ü�ʱ��
TabFile_Load( "\\settings\\task\\tollgate\\messenger\\messenger_tollprize.txt" , "tollprize");	 --���ͬ�������ı��

FLYREFRESH_EXP = tonumber( TabFile_GetCell( "tollprize" ,2 ,"shuachu_exp"))   --boss���ˢ��С�־���
FLYREFRESH_MAPID= 387  --��֮��ĵ�ͼid
FLYREFRESH_MESSENGEREXP= tonumber( TabFile_GetCell( "tollprize" ,2 ,"shuachu_jifen"))  --��֮���boss���ˢ��С�����������ʹ����


function OnDeath()
	local name = GetName()
	local Uworld1215 = nt_getTask(1215)  --boss���ˢ�ֵĴ�ֿ���
	if ( messenger_middletime() == 10  ) then --����ڵ�ͼ�е�ʱ��
		Msg2Player("Th�t xin l�i ! "..name.."! Thi h�nh th�i gian nhi�m v� t�n s� �� h�t, nhi�m v� th�t b�i !.")
		losemessengertask()
	elseif ( Uworld1215 == 0 ) then  --û��ˢ�ֵ�����
		Msg2Player("Ng��i n�y �� b� ng��i kh�c b�c, ng��i ��nh h�n ch�c l� s� kh�ng c� b�t k� ph�n th��ng ph�i.")
		return
	else
		messenger_killrefresh()
	end
end
