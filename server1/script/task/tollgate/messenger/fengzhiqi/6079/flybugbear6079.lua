-------------------------------------------------------------------------
-- FileName		:	enemy_flybugbear.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-06 18:30:14
-- Desc			:   ��֮��ؿ���С�ֽű�[60-79��]
-------------------------------------------------------------------------
IncludeLib( "FILESYS" );
Include("\\script\\task\\tollgate\\messenger\\fengzhiqi\\enemy_flybugbear.lua") 
Include("\\script\\task\\newtask\\newtask_head.lua") --���� nt_getTask ͬ���������ͻ��˵���
Include("\\script\\task\\tollgate\\messenger\\messenger_losetask.lua")  --ȡ������
Include("\\script\\task\\tollgate\\messenger\\messenger_timeer.lua")    --���ü�ʱ��
TabFile_Load( "\\settings\\task\\tollgate\\messenger\\messenger_tollprize.txt" , "tollprize");	 --���ͬ�������ı��

FLYBUGBEAR_EXP =tonumber( TabFile_GetCell( "tollprize" ,2 ,"bug_exp"))  --С�־���
FLYBUGBEAR_MAPID= 387  --��֮��ĵ�ͼid
FLYBUGBEAR_MESSENGEREXP= tonumber( TabFile_GetCell( "tollprize" ,2 ,"bug_jifen"))--��֮���С�����������ʹ����


function OnDeath()
	local name = GetName()
	if ( messenger_middletime() == 10  ) then --����ڵ�ͼ�е�ʱ��
		Msg2Player("Xin l�i! "..name.."! B�n �� h�t th�i gian th�c hi�n nhi�m v� T�n s�! Nhi�m v� th�t b�i!.")
		losemessengertask()
	else
		messenger_killbugbear()
	end
end