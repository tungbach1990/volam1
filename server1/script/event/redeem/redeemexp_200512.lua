
-- ====================== �ļ���Ϣ ======================

-- ������Եonline ���鲹���ͷ�ļ�
-- Edited by peres
-- 2005/12/21 AM 11:23

-- �̻�����һҹ���̻���
-- ���ǵ����ڴ������Ⱥ�У�վ�����ı���ӵ��ס����
-- ����ů��Ƥ��������Ϥ��ζ�����̻����������۾���
-- һ���޿���ء���

-- ======================================================

IncludeLib( "FILESYS" );

Include("\\script\\task\\task_addplayerexp.lua")  --������ۼӾ���Ĺ�������

--TabFile_Load("\\settings\\npc\\player\\level_exp.txt","TL_UPLEVELEXP") -- ��������ľ����

ID_2005EXPISPAY = 2333; -- ��¼�Ƿ��Ѿ���ȡ

-- 2005 �� 12 ��ͣ����������������
function getExpiationExp_200512()

local nYear  = tonumber(date("%y"));
local nMonth = tonumber(date("%m"));
local nDay   = tonumber(date("%d"));

	-- �ж��Ƿ�忨
	if IsCharged()==0 then
		Say("Th�t xin l�i! Ho�t ��ng b�i th��ng n�y ch� c� ng��i ch�i <color=yellow>n�p th�<color> m�i ���c tham gia!", 0);
		return
	end;
	
	-- �жϵȼ��Ƿ���� 50 ��
	if GetLevel()<50 then
		Say("Th�t xin l�i! Ho�t ��ng b�i th��ng n�y ch� c� ng��i ch�i <color=yellow>��ng c�p t� 50 tr� l�n<color> m�i ���c tham gia!", 0);
		return
	end;
	
	-- �ж��Ƿ��Ѿ���ȡ����
	if GetTask(ID_2005EXPISPAY)~=0 then
		Say("Uhm! Ta nh� kh�ng l�m ng��i �� nh�n qua kinh nghi�m b�i th��ng r�i, ��ng tham lam nh� v�y!", 0);
		return
	end;
	
	-- �ж��Ƿ�������ڣ�2005/12/23 ~ 2005/12/31
	if nYear==5 and nMonth==12 and nDay>=23 and nDay<=31 then
		compensateExp();
		return
	else
		Say("Th�t xin l�i! Ho�t ��ng b�i th��ng l�n n�y l� t� <color=yellow>23/12/2005<color> b�t ��u ��n <color=yellow>31/12/2005<color>, hi�n nay <color=yellow>�� k�t th�c<color>, ng��i h�y v� �i!", 0);
		return	
	end;

end;


-- ���������������
function compensateExp()

local nExp = getRedeemeExp();

	SetTask(ID_2005EXPISPAY, 1);  -- д�������������д�����ټӾ��飬�Է����������ˢ����

	addPlayerExp(nExp);
	
	Say("Ho�t ��ng b�i th��ng l�n n�y c�a b�n nh�n ���c: <color=yellow>"..nExp.."<color> �i�m kinh nghi�m!", 0);
	
	Msg2Player("Ho�t ��ng b�i th��ng l�n n�y c�a b�n nh�n ���c:<color=yellow>"..nExp.."<color> �i�m kinh nghi�m!");
	
	WriteTaskLog("Trong ho�t ��ng b�i th��ng kinh nghi�m nh�n ���c"..nExp.." �i�m kinh nghi�m!");

end;


-- ��ȡӦ�ò����ľ���
function getRedeemeExp()

local nLevel = GetLevel();

	return nLevel * 8 * 20000;
	
end;


-- ����Ҽ�ָ���ľ��飬��������
function addPlayerExp(myExpValue)
	tl_addPlayerExp(myExpValue)	
end;


--�ж�����Ƿ�����
function IsCharged()
	if( GetExtPoint( 0 ) >= 1 ) then
		return 1;
	else
		return 0;
	end;
end;


-- ����ϵͳ��д�� LOG ����
function WriteTaskLog(strMain)

	-- ����ǿ�ֵ��д��
	if strMain==nil then return end;

	WriteLog(" [K� l�c b�i th��ng kinh nghi�m]"..date(" [%y n�m %m th�ng %d ng�y  %H gi� %M ph�t]").." [m�t m�:"..GetAccount().."] [nh�n v�t:"..GetName().."]"..strMain);
end;
