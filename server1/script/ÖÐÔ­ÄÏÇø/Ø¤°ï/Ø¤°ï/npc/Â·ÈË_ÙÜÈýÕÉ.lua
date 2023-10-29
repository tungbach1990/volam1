-- ؤ�� �Ƴj���������� �������񡢳�ʦ����
-- by��Dan_Deng(2003-07-28)

Include("\\script\\global\\repute_head.lua")
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main()
	if allbrother_0801_CheckIsDialog(209) == 1 then
		allbrother_0801_FindNpcTaskDialog(209)
		return 0;
	end
	UTask_gb = GetTask(8)
	Uworld30 = GetByte(GetTask(30),2)
	if (GetSeries() == 3) and (GetFaction() == "gaibang") then
		if (UTask_gb == 60*256+10) then		-- ��ʦ������
			if (HaveItem(211)==1) and (HaveItem(201)==1) and (HaveItem(208)==1) and (HaveItem(209)==1) and (HaveItem(210)==1) and (HaveItem(206)==1) and (HaveItem(207)==1) and (HaveItem(200)==1) and (HaveItem(205)==1) then
				L60_prise()
			else
				Talk(1,"","Ch� c�n l�y ���c 9 t�i v�i, ng��i c� th� thu�n l�i xu�t s�. C� g�ng l�n! ")
			end
		elseif (UTask_gb == 60*256) and (GetLevel() >= 50) then		--��ʦ��������
			Say("�� t� b�n bang mu�n xu�t s� ��u ph�i �i v�o trong m�t ��ng t�m ���c 9 c�i t�i v�i. Ng��i c� gan �i v�o trong m�t ��ng �� kh�ng? ",2,"���ng nhi�n d�m. /L60_get_yes","�� t� v�n ch�a mu�n xu�t s� /no")
		else
			Talk(1,"","B�n bang ai c�ng c�c kh�, ha ha! M�i ng��i �o�n k�t l�i c� th� gi�p b�n bang ph�t d��ng quang ��i.")
		end
	elseif (Uworld30 == 10) then		--�������������
		if (HaveItem(72) == 1) and (HaveItem(73) == 1) and (HaveItem(74) == 1) and (HaveItem(75) ==1) then
			Talk(1,"enroll_prise","X� Tr��ng l�o! �� t� �� t�m ���c 4 m�n ng��i c�n: r�u c�m, Phi�n qu�t, Th� ph�ch, Ban ch� ")
		else
			Talk(1,""," 4 m�n ta c�n ng��i v�n ch�a c�. Ng��i k�m c�i qu�!")
		end
	elseif (Uworld30 == 0) and (GetLevel() >=10) and (GetFaction() ~= "gaibang") then		--������������
		Say("��ng xem th��ng Khi�u h�a t� n�y! Tuy xin �n �� s�ng nh�ng c�ng c� ch�t ki�n th�c! C� mu�n th� kh�ng?",2,"���c. �� ta th� l�i. /enroll_get_yes","Kh�ng, ta ch� ��n tham quan. /enroll_get_no")
	else
		Talk(1,"","Huynh �� trong bang tuy b�nh th��ng c� h�i kh� m�t ch�t nh�ng m�i ng��i ��u r�t �o�n k�t v�i nhau. C� c�m c�ng �n, c� r��u c�ng u�ng! Ng��i ngo�i kh�ng th� n�o hi�u ���c c�i kho�i l�c c�a ch�ng ta!")
	end
end;

function enroll_get_yes()
	Talk(1, "", "���c r�i! Ta �� cho ng��i t� th� xem! Ng��i h�y ��n th�nh D��ng Ch�u �� l�y b�n m�n: r�u c�m, Phi�n qu�t, Th� ph�ch, Ban ch� v� ��y")
	Uworld30 = SetByte(GetTask(30),2,10)
	SetTask(30,Uworld30)
	AddNote("Nh�n nhi�m v� ti�p theo: �i D��ng Ch�u th�nh l�y 4 m�n v�t: H� Tu, Phi�n T�, Th� Ph�ch, B�n Ch� ")
	Msg2Player("Nh�n nhi�m v� ti�p theo: �i D��ng Ch�u th�nh l�y 4 m�n v�t: H� Tu, Phi�n T�, Th� Ph�ch, B�n Ch� ")
end;

function enroll_prise()
	Talk(1,"","Ha ha ha! Ng��i ��ng l� c� khi�u �n xin! T�t! Ta s� nh�n ng��i l�m �� t� k� danh! ")
	DelItem(72)
	DelItem(73)
	DelItem(74)
	DelItem(75)
	i = ReturnRepute(15,29,2)		-- ȱʡ�������������ĵȼ���ÿ���ݼ�
	AddRepute(i)
	Uworld30 = SetByte(GetTask(30),2,127)
	SetTask(30,Uworld30)
	AddNote("Ho�n th�nh nhi�m v�, tr� th�nh �� t� ch�nh th�c <color=Red>c�a C�i Bang<color>. ")
	Msg2Player("Ho�n th�nh nhi�m v�, tr� th�nh �� t� ch�nh th�c c�a C�i Bang ")
end;

function L60_get_yes()
	SetTask(8,60*256+10)
	AddNote("Nh�n nhi�m v� xu�t s�: �i v�o trong m�t ��ng, t�m ���c 9 c�i t�i v�i ")
	Msg2Player("Nh�n nhi�m v� xu�t s�: �i v�o trong m�t ��ng, t�m ���c 9 c�i t�i v�i ")
end;

function L60_prise()
	DelItem(211)
	DelItem(201)
	DelItem(208)
	DelItem(209)
	DelItem(210)
	DelItem(206)
	DelItem(207)
	DelItem(200)
	DelItem(205)
	SetRank(68)
	SetTask(8, 70*256)
	SetFaction("")
	SetCamp(4)
	SetCurCamp(4)
	AddNote("Mang 5 c�i t�i v�i tr� v� C�i Bang, ho�n th�nh nhi�m v� xu�t s�, ���c phong Ti�u Di�u th�n c�i. ")
	Msg2Player("Ch�c m�ng B�n! �� thu�n l�i xu�t s�. ���c phong l� Ti�u di�u th�n c�i ")
end;

function no()
end;
