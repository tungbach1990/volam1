
-- ====================== �ļ���Ϣ ======================

-- ������Եonline 2006 Ԫ�����������گ���ļ�
-- Edited by peres
-- 2005/12/22 PM 15:12

-- �̻�����һҹ���̻���
-- ���ǵ����ڴ������Ⱥ�У�վ�����ı���ӵ��ס����
-- ����ů��Ƥ��������Ϥ��ζ�����̻����������۾���
-- һ���޿���ء���

-- ======================================================

-- ����ϵͳ��֧��
IncludeLib("TASKSYS");

-- ���� 2006 Ԫ���ͷ�ļ�
Include("\\script\\event\\newyear_2006\\newyear_head.lua");

-- �������Ĵ���֧��
Include("\\script\\task\\random\\task_head.lua");

function main()

Say("�� tri �n c�c anh h�ng hi�p kh�ch, v�o d�p T�t �m L�ch, ta mu�n t�ng m�t s� l� v�t, v�o ng�y <color=yellow>30/12 ��n 01/01<color> c� th� ��n ch� ta nh�n qu�--��c C� Ki�m",
	7,
	"Nh�n �i�m kinh nghi�m t�ng g�p ��i trong 8 gi� m�i ng�y/getDoubleExp",
	"Nh�n ph�n th��ng �i�m kinh nghi�m m�i ng�y/getMoreExp_Confirm",
	"Nh�n m�t t�ch nhi�m v� m�i ng�y/getTaskBook",
	"Li�n quan v� t� l� t�ng �i�m kinhn nghi�m c�a nhi�m v� ng�u nhi�n/getRandomTaskInfo",
	"Tin t�c m�i v� B�ch C�u ho�n/getBaijuInfo",
	"C� th� s� d�ng Ti�n ��ng mua d�ng c� m�i/getCoppercashInfo",
	"�� ��c xong/OnExit");
	
	return 1;

end;


function getDoubleExp()

-- ȡ������
local nDate  = tonumber(GetLocalDate("%y%m%d"));
	
	-- ������ڲ��ԣ�ֱ�ӷ���
	if isNewYearTime()==0 then
		Say("Gi� �� h�t Nguy�n ��n r�i!", 0);
		return
	end;

	-- ����ȼ�δ�ﵽ 80 ��
	if GetLevel()<80 then
		Say("Ch� c� ng��i ch�i t� c�p 80 tr� l�n m�i c� th� nh�n ���c ph�n th��ng g�p ��i �i�m kinh nghi�m!", 0);
		return
	end;

	if nDate~= GetTask(ID_GETDOUBLEEXP_DATE) then
	
		SetTask(ID_GETDOUBLEEXP_DATE, nDate);
		SetTask(ID_GETDOUBLEEXP_NUM, 1);	
		
	elseif GetTask(ID_GETDOUBLEEXP_NUM)>=1 then
	
		Say("H�m nay b�n �� nh�n ph�n th��ng g�p ��i �i�m kinh nghi�m r�i!", 0);
		return
		
	else
	
		SetTask(ID_GETDOUBLEEXP_DATE, nDate);
		SetTask(ID_GETDOUBLEEXP_NUM, 1);
			
	end;
	
	-- 80 �����ϵ���ÿ�������ȡһ�� 8 Сʱ����˫��
	if GetLevel()>=80 then
	
		AddSkillState(531,10,1,8*60*60*18);
		AddSkillState(461,1, 1,8*60*60*18);
		
		Msg2Player("B�n nh�n ���c <color=green>Ph�n th��ng �i�m kinh nghi�m g�p ��i trong 8 gi�!<color>");
		WriteTaskLog("Nh�n ���c ph�n th��ng �i�m kinh nghi�m g�p ��i trong 8 gi�!");
		
	else
		Say("Ch� c� ng��i ch�i t� c�p 80 tr� l�n m�i c� th� nh�n ���c ph�n th��ng g�p ��i �i�m kinh nghi�m!", 0);
	end;

end;


function getTaskBook()

local nRandomTaskID, nRandomItemIndex = 0, 0;

-- ȡ������
local nDate  = tonumber(GetLocalDate("%y%m%d"));
	
	-- ������ڲ��ԣ�ֱ�ӷ���
	if isNewYearTime()==0 then
		Say("Gi� �� h�t Nguy�n ��n r�i!", 0);
		return
	end;
	
	-- ����Ƿǳ忨�û�
	if IsCharged()==0 then
		Say("Ho�t ��ng Nguy�n ��n l�n n�y ch� c� n�p th� m�i s� d�ng ���c!", 0);
		return
	end;
	
	-- ����ȼ�δ�ﵽ 80 ��
	if GetLevel()<80 then
		Say("Ch� c� ng��i ch�i t� c�p 80 tr� l�n m�i c� th� nh�n ���c m�t t�ch nhi�m v� n�y!", 0);
		return
	end;
	
	if nDate~= GetTask(ID_GETTASKBOOK_DATE) then
	
		SetTask(ID_GETTASKBOOK_DATE, nDate);
		SetTask(ID_GETTASKBOOK_NUM, 1);	
		
	elseif GetTask(ID_GETTASKBOOK_NUM)>=1 then
	
		Say("H�m nay b�n �� nh�n m�t m�t t�ch nhi�m v� r�i!", 0);
		return
		
	else
	
		SetTask(ID_GETTASKBOOK_DATE, nDate);
		SetTask(ID_GETTASKBOOK_NUM, 1);	
		
	end;
	
	-- ѡ��һ���ڶ�����������
	nRandomTaskID = TaskNo(selectNextTask());
		
	-- ����һ���������
	nRandomItemIndex = AddItem(6, 2, 2, 0, 1, 0, 0);
	SetItemMagicLevel(nRandomItemIndex, 1, nRandomTaskID);
	
	-- ͬ����Ʒħ������
	SyncItem(nRandomItemIndex);

	Msg2Player("B�n nh�n ���c <color=green>nhi�m v� ng�u nhi�n!<color>");
	
	WriteTaskLog("Nh�n ���c 1 m�t t�ch nhi�m v�, m� s� l�:"..nRandomTaskID);
	
end;


-- ѯ������Ƿ���ȡ����
function getMoreExp_Confirm()
	Say("Trong kho�ng th�i gian t� <color=yellow>20-12-2005 ��n 01-01-2006<color>, m�i ng�y l�n m�ng ��u nh�n ���c �i�m kinh nghi�m do V� l�m minh ch� t�ng.<color=yellow>Trong v�ng 3 ng�y n�y c� th� nh�n 1 l�n <color>, nh�ng 2 l�n nh�n ph�i c�ch nhau <color=yellow>tr�n m�t gi� tr�n m�ng<color>. Ng��i ��ng � nh�n kh�ng?",2,
		"���c r�i! Ta mu�n nh�n l�nh!/getMoreExpMain",
		"Th�i �� l�t �i/OnExit");
	return
end;


-- ��ȡÿ�յľ���
function getMoreExpMain()

local nExp = countMoreExpNum();

-- ȡ������
local nDate  = tonumber(GetLocalDate("%y%m%d"));
	
	-- ������ڲ��ԣ�ֱ�ӷ���
	if isNewYearTime()==0 then
		Say("Gi� �� h�t Nguy�n ��n r�i!", 0);
		return
	end;
	
	-- ����Ƿǳ忨�û�
	if IsCharged()==0 then
		Say("Ho�t ��ng Nguy�n ��n l�n n�y ch� c� n�p th� m�i s� d�ng ���c!", 0);
		return
	end;
	
	if canGetMoreExp()==1 then
		if GetLevel()<50 then
			addPlayerExpForLimit(nExp, 5); -- ����ֻ���� 5 ��
		else
			addPlayerExpForLimit(nExp, 0); -- ������
		end;
		
		Msg2Player("B�n nh�n ���c ph�n th��ng trong ho�t ��ng Nguy�n ��n:<color=yellow>"..nExp.."<color> �i�m kinh nghi�m!");
		
		writeMoreExpData();  -- ��¼��ȡ������������
	
		WriteTaskLog("nh�n ���c ph�n th��ng �i�m kinh nghi�m m�i ng�y:"..nExp);
		
	else
		Say("Hi�n t�i ng��i kh�ng �� �i�u ki�n �� nh�n.<color=yellow>Trong v�ng 3 ng�y m�i ng�y s� nh�n 1 l�n<color>, nh�ng 2 l�n nh�n ph�i c�ch nhau <color=yellow>tr�n 1 gi� tr�n m�ng<color>!", 0);
		return
	end;


end;


-- ��ȡͭǮ����ʾ
function getCoppercashInfo()

	Say("G�n ��y D� dung thu�t s� � L�m An c� b�n m�t s� M�t n� Tinh Linh, M�t n� T�n Ni�n Hi�p Kh�ch, M�t n� T�n Ni�n Hi�p N�, M�t n� Thu�n L�c�B�n c�nh �� H�nh c��c th��ng nh�n m�t s� n�i c�ng c� nh�p v�o m�t s� h�p l� v�t m�u xanh, h�p hoa, n�i H�ng Rong c�ng c� b�n Thi�p Nh� � cho ng��i ch�i c� th� vi�t l�i ch�c ph�c l�n ��, hoan ngh�nh m�i ng��i ��n mua!", 0);
	return
	
end;


function getBaijuInfo()

	Say("Trong th�i gian <color=yellow>30/12/2005 ��n 01/01/2006<color> m�i ng�y t� <color=red>0:00~18:00<color>, s� d�ng B�ch C�u ho�n treo m�y nh�n ���c t�ng ��i �i�m kinh nghi�m, K� n�ng B�ch C�u ho�n treo m�y nh�n ���c k� n�ng t�ng 1.5 l�n ", 0);
	return

end;


function getRandomTaskInfo()

	Say("Trong th�i gian <color=yellow>30-12-2005 ��n 01-01-2006<color> nh�n ���c nhi�m v� ng�u nhi�n - ph�n th��ng nh�n ��i!", 0);
	return

end;



function OnExit()

end;