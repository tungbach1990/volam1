--description: ������ͨ���� �����س���
--author: yuanlan	
--date: 2003/3/10
-- Update: Dan_Deng(2003-08-13)

Include("\\script\\global\\repute_head.lua")
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main()
	if allbrother_0801_CheckIsDialog(11) == 1 then
		allbrother_0801_FindNpcTaskDialog(11)
		return 0;
	end
	UTask_tm = GetTask(2);
	Uworld37 = GetByte(GetTask(37),1)
	if (Uworld37 == 80) then			--��������
		if (HaveItem(33) == 1) and (HaveItem(34) == 1) and (HaveItem(35) == 1) then
			Uworld37_prise()
		else
			Talk(1,"","B�n ph�i l�y ���c 3 c�y tr�c xanh, tr�ng, t�m qua �i m�i ���c!")
		end
	elseif (Uworld37 < 80) then						--��δ����
		Talk(1,"","Mu�n qua Tr�c H�i Tam Quan, ph�i l�y ���c 3 c�y g�y tr�c m�u xanh, tr�ng, t�m.")
--	elseif (GetFaction() == "tangmen") then			--�Ѿ����ţ���δ��ʦ
--		Talk(1,"","����ׯ������Ҷ���ͬ���ֵܣ��㲻���ٴ���������������ˣ�")
	elseif (UTask_tm >= 70*256) and (GetFaction() ~= "tangmen") then						--�Ѿ���ʦ
		Talk(1,"","�m kh� v� c�m b�y c�a B�n m�n ��c b� thi�n h�, ng��i tr�n giang h� kh�ng ai d�m xem th��ng ch�ng ta. Sau n�y h�nh t�u giang h� kh�ng ���c l�m m�t uy phong b�n m�n! ")
	else
		Talk(1,"","Tr�c h�i nguy hi�m, ph�i h�t s�c c�n th�n!")
	end
end;

function Uworld37_prise()
	Talk(1,"","Ng��i �� thu�n l�i qua �i, tr� th�nh �� t� k� danh c�a b�n m�n! ")
	DelItem(33)
	DelItem(34)
	DelItem(35)
	UTask_world37 = SetByte(GetTask(37),1,127)
	i = ReturnRepute(25,19,4)		-- ȱʡ�������������ĵȼ���ÿ���ݼ���
	SetTask(37,UTask_world37)
	AddRepute(i)		-- ������
	Msg2Player("Mang 3 c�y tr�c ��n Tr�c H�i Tam Quan xu�t kh�u giao cho ph�ng ngh� s� ���ng m�n, ho�n th�nh nhi�m v� K� Danh �� t�. Tr� th�nh ���ng m�n K� Danh �� t�, thanh th� t�ng l�n"..i.."�i�m.")
	AddNote("T�i l�i ra c�a Tr�c H�i Tam Quan, giao 3 c�y tre cho ���ng M�n tr�ng �inh, ho�n th�nh nhi�m v� k� danh �� t�. ")
end;
