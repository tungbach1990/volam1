--description: ������ͨ���� ���������
--author: yuanlan	
--date: 2003/3/7
--Dan_Deng(2003-07-22), ������������ĵȼ�Ҫ��
-- Update: Dan_Deng(2003-08-13)
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main()
	if allbrother_0801_CheckIsDialog(8) == 1 then
		allbrother_0801_FindNpcTaskDialog(8)
		return 0;
	end
	UTask_tm = GetTask(2)
	UTask_wu = GetTask(10)
	Uworld37 = GetByte(GetTask(37),1)
	if (Uworld37 == 0) and (GetLevel() >=10) and (GetFaction() ~= "tangmen") then		--������������
		Say("Mu�n tr� th�nh �� t� K� danh b�n m�n ph�i th�ng qua <color=Red>Tr�c H�i Tam Quan<color>, ng��i mu�n th� kh�ng?", 2, "X�ng tr�n /enroll_get_yes", "Kh�ng x�ng /no")
	elseif (Uworld37 > 0) and (Uworld37 < 20) then			--������
		Talk(1,"","Mu�n l�y ���c <color=Red>g�y tr�c m�u xanh<color> ph�i ��nh b�i <color=Red>��i M� h�u<color> trong �i th� nh�t.")
--����õ�<color=Red>��ɫ����<color>�����ȥ�ڶ�����һ��<color=Red>ׯ��<color>�����һ��<color=Red>��ɫ����<color>�ڵ����ص�<color=Red>ׯ��<color>���ϡ��õ��������Ⱥ󽻸�<color=Red>���ڵ�ׯ��<color>���������ǹ��ء�
--	elseif (GetFaction() == "tangmen") then			--�Ѿ����ţ���δ��ʦ
--		Talk(1,"","����ׯ������Ҷ���ͬ���ֵܣ��㲻���ٴ���������������ˣ�")
	elseif (UTask_tm >= 70*256) then						--�Ѿ���ʦ
		Talk(1,"","�m kh� v� c�m b�y c�a B�n m�n ��c b� thi�n h�, ng��i tr�n giang h� kh�ng ai d�m xem th��ng ch�ng ta. Sau n�y h�nh t�u giang h� kh�ng ���c l�m m�t uy phong b�n m�n! ")
	else
		Talk(1,"","B�n m�n kh�ng hoan ngh�nh ng��i l� t� � ra v�o.")
	end
end;

function enroll_get_yes()
	Talk(2, "", "L�y ���c 3 c�y <color=Red>g�y tr�c xanh, tr�ng, t�m<color> trong <color=Red>Tr�c H�i Tam Quan<color> ��a cho ��ng m�n � l�i ra, coi nh� qua �i.", "Mu�n l�y ���c<color=Red>g�y tr�c m�u xanh<color> ph�i ��nh b�i <color=Red>��i M� h�u<color> trong �i th� nh�t, <color=Red>g�y tr�c m�u tr�ng<color> ph�i qua �i th� hai t�m <color=Red>Tr�ng �inh<color>, <color=Red>G�y tr�c m�u t�m<color> � trong tay c�a <color=Red>Tr�ng �inh<color> � �i th� ba.")
	Uworld37 = SetByte(GetTask(37),1,20)
	SetTask(37,Uworld37)
	AddNote("��n Tr�c H�i Tam quan, g�p ���ng M�n tr�ng �inh, nh�n nhi�m v� <color=red>K� Danh �� T�<color>, v��t qua Tr�c H�i Tam Quan �� l�y 3 c�y g�y tre m�u xanh, tr�ng, t�m. ")
--	AddNote("�����ż����������񣺴��������ز��õ��ࡢ�ס����������ȡ�")
end;

function no()
end;
