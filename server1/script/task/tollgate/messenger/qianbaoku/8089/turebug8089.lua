-------------------------------------------------------------------------
-- FileName		:	turebug8089.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-20 11:05:14
-- Desc			:   ǧ����ؿ���С�ֽű�[80-89��]
-------------------------------------------------------------------------
IncludeLib( "FILESYS" );
Include("\\script\\task\\tollgate\\messenger\\qianbaoku\\enemy_turebugbear.lua") 
Include("\\script\\task\\newtask\\newtask_head.lua") --���� nt_getTask ͬ���������ͻ��˵���
Include("\\script\\task\\tollgate\\messenger\\messenger_losetask.lua")  --ȡ������
Include("\\script\\task\\tollgate\\messenger\\messenger_timeer.lua")    --���ü�ʱ��
TabFile_Load( "\\settings\\task\\tollgate\\messenger\\messenger_tollprize.txt" , "tollprize");	 --���ͬ�������ı��

TUREBUGBEAR_EXP =tonumber( TabFile_GetCell( "tollprize" ,9 ,"bug_exp"))  --С�־���
TUREBUGBEAR_MAPID= 394  --ǧ����ĵ�ͼid
TUREBUGBEAR_MESSENGEREXP= tonumber( TabFile_GetCell( "tollprize" ,9 ,"bug_jifen"))  --С�־���


function OnDeath(Npcindex)
	local name = GetName()
	local turesureindex = GetNpcParam(Npcindex,1)
	SetTaskTemp(181,turesureindex)
	if (  messenger_middletime() == 10 ) then --����ڵ�ͼ�е�ʱ��
		Msg2Player("Xin l�i! "..name.."! B�n �� h�t th�i gian th�c hi�n nhi�m v� T�n s�! Nhi�m v� th�t b�i!.")
		losemessengertask()
	else
		turesure_killbugbear()
	end
end