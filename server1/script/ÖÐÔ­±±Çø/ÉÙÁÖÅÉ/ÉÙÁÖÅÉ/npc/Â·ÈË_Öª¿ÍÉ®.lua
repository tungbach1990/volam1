-- ���� ·��NPC ֪��ɮ ��������
-- by��Dan_Deng(2003-08-01)

Include("\\script\\global\\repute_head.lua")

function main()
	UTask_sl = GetTask(7)
	Uworld38 = GetByte(GetTask(38),2)
	if (Uworld38 == 20) and (HaveItem(219) == 1) then		-- �������(֤������)
		Talk(1,"enroll_prise","Th� ra l� gi�y t� t�y th�n c�a huynh �y, th�i c�ng ���c.")
	elseif (Uworld38 == 0) and (GetLevel() >=10) and (GetFaction() ~= "shaolin") then		--��������
		Say("�� t� b�n m�n c�n ph�i c� �� b�n �i�u ki�n, ph�n bi�t l�: Anh d�ng gan d�, h�o nhi�n ch�nh kh�, ki�n nh�n b�t khu�t v� v� t� v� ng�. Ng��i mu�n l�m k� danh �� t� c�a b�n ph�i c�n ph�i c� nh�ng �i�u ki�n n�y, ng��i ti�p nh�n kh�o nghi�m kh�ng?",2,"Tu�n l�nh!/enroll_get_yes","Kh�ng, ta ch� ��n tham quan. /enroll_get_no")
	elseif (GetFaction() == "shaolin") then
		Talk(1,"","S� �� c�n ph�i ch� � b�o v� s� trang nghi�m c�a b�n t�, kh�ng ���c ch�y nh�y lung tung, la l�i om s�m.")
	else							-- ����Ի�
		if (GetSex() == 0) then
			Talk(1,"","Th� ch� ��ng n�n mang theo binh kh� v�o t�.")
		else
			Talk(1,"","N� kh�ch kh�ng ���c v�o trong t�.")
		end
	end
end;

function enroll_get_yes()
	Talk(1, "", "���c! Ng��i h�y h� s�n du ngo�n, h�i �� b�n �i�u ki�n xong r�i m�i tr� l�i ��y ta s� n�i ti�p.")
	Uworld38 = SetByte(GetTask(38),2,10)
	SetTask(38,Uworld38)
	AddNote("Ch�ng minh cho Tri Kh�ch T�ng c� c�c ph�m ch�t: X�ch ��m trung t�m, h�o nhi�n ch�nh kh�, ki�n nh�n b�t b�t v� v� t� v� ng�. ")
	Msg2Player("Ch�ng minh cho Tri Kh�ch T�ng c� c�c ph�m ch�t: X�ch ��m trung t�m, h�o nhi�n ch�nh kh�, ki�n nh�n b�t b�t v� v� t� v� ng�. ")
end;

function enroll_get_no()
end;

function enroll_prise()
	Talk(1,"","Xem ra ng��i �� h�i �� b�n ph�m ch�t ��! Ch�c m�ng ng��i, t� n�y v� sau ng��i �� tr� th�nh �� t� k� danh c�a b�n ph�i r�i!")
	DelItem(219)
	i = ReturnRepute(12,29,2)		-- ȱʡ�������������ĵȼ���ÿ���ݼ�
	AddRepute(i)
	Uworld38 = SetByte(GetTask(38),2,127)
	SetTask(38,Uworld38)
	Msg2Player("Ho�n th�nh nhi�m v� k� danh �� t� c�a Thi�u L�m ph�i, tr� th�nh �� t� Thi�u L�m, danh v�ng t�ng l�n. "..i.."�i�m.")
	AddNote("Ho�n th�nh nhi�m v� k� danh �� t� c�a Thi�u L�m ph�i, tr� th�nh �� t� Thi�u L�m. ")
end;
