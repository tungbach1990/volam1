-------------------------------------------------------------------------
-- FileName		:	enemy_flybugbear90.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-13 11:19:14
-- Desc			:   ��֮��ؿ���С�ֽű�[90���ϼ�]
-------------------------------------------------------------------------
IncludeLib( "FILESYS" );
Include("\\script\\task\\tollgate\\messenger\\fengzhiqi\\enemy_flybugbear.lua") 
Include("\\script\\task\\newtask\\newtask_head.lua") --���� nt_getTask ͬ���������ͻ��˵���
Include("\\script\\task\\tollgate\\messenger\\messenger_losetask.lua")  --ȡ������
Include("\\script\\task\\tollgate\\messenger\\messenger_timeer.lua")    --���ü�ʱ��
TabFile_Load( "\\settings\\task\\tollgate\\messenger\\messenger_tollprize.txt" , "tollprize");	 --���ͬ�������ı��
Include("\\script\\task\\newtask\\newtask_head.lua") --���� nt_getTask ͬ���������ͻ��˵���
Include("\\script\\task\\tollgate\\messenger\\posthouse.lua") --��������������ݱ�����
Include("\\script\\task\\tollgate\\messenger\\lib_messenger.lua") --��������ж�
Include("\\script\\event\\birthday_jieri\\200905\\class.lua");

FLYBUGBEAR_EXP =tonumber( TabFile_GetCell( "tollprize" ,4 ,"bug_exp"))  --С�־���
FLYBUGBEAR_MAPID= 389  --��֮��ĵ�ͼid
FLYBUGBEAR_MESSENGEREXP= tonumber( TabFile_GetCell( "tollprize" ,4 ,"bug_jifen"))--��֮���С�����������ʹ����


function OnDeath()
	dofile("/script/task/tollgate/messenger/fengzhiqi/flybugbear90.lua");
		local Uworld3000 = nt_getTask(3000) + 5
		nt_setTask(3000,Uworld3000)
--		Msg2SubWorld("Cao th� <color=yellow>"..GetName().."<color> <color=red> ti�u di�t <color=orange>Kim Qu�c Gian T�<color> trong T�n S� nh�n ���c <color=yellow>5 �i�m<color> T�n S�  .")
	local name = GetName()
	if (  messenger_middletime() == 10 ) then --����ڵ�ͼ�е�ʱ��
		Msg2Player("Xin l�i! "..name.."! B�n �� h�t th�i gian th�c hi�n nhi�m v� T�n s�! Nhi�m v� th�t b�i!.")
		losemessengertask()
	else
		messenger_killbugbear()
	end
end