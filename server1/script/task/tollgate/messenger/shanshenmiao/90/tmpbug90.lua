-------------------------------------------------------------------------
-- FileName		:	tmpbug90.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-18 14:57:14
-- Desc			:   ɽ����ؿ���С�ֽű�[90���ϼ�]
-------------------------------------------------------------------------
IncludeLib( "FILESYS" );
Include("\\script\\task\\tollgate\\messenger\\shanshenmiao\\enemy_tembugbear.lua") 
Include("\\script\\task\\newtask\\newtask_head.lua") --���� nt_getTask ͬ���������ͻ��˵���
Include("\\script\\task\\tollgate\\messenger\\messenger_losetask.lua")  --ȡ������
Include("\\script\\task\\tollgate\\messenger\\messenger_timeer.lua")    --���ü�ʱ��
TabFile_Load( "\\settings\\task\\tollgate\\messenger\\messenger_tollprize.txt" , "tollprize");	 --���ͬ�������ı��

TEMBUGBEAR_EXP =tonumber( TabFile_GetCell( "tollprize" ,7 ,"bug_exp"))  --С�־���
TEMBUGBEAR_MAPID= 392  --ɽ����ĵ�ͼid
TEMBUGBEAR_MESSENGEREXP= tonumber( TabFile_GetCell( "tollprize" ,7 ,"bug_jifen"))  --С�־���


function OnDeath()
	local name = GetName()
	if (  messenger_middletime() == 10 ) then --����ڵ�ͼ�е�ʱ��
		Msg2Player("Xin l�i! "..name.."! B�n �� h�t th�i gian th�c hi�n nhi�m v� T�n s�! Nhi�m v� th�t b�i!.")
		losemessengertask()
	else
		temple_killbugbear()
	end
end