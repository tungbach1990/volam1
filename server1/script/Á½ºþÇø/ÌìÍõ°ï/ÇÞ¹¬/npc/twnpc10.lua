--description: �������޹� ������������ʦ�����ط���������
--author: yuanlan	
--date: 2003/4/28
--Dan_Deng(2003-07-22), ������������ĵȼ�Ҫ��
--Dan_Deng(2003-07-24), �����ط���������
-- Update: Dan_Deng(2003-08-16)
-- Update: Dan_Deng(2003-09-21)��������ط����������ɾ�ѧ���
-- Update��Dan_Deng(2003-10-27)Ϊ�ط�ʦ���������ȡ�������ܣ��Լ��������ɶ�Ӧ

function main()
--	if (check_skill() == 0) then
--		return
--	end
	UTask_tw = GetTask(3);
	if (GetTask(39) == 10) and (GetBit(GetTask(40),3) == 0) then				-- ��������������
		Talk(1,"", 11524)
		Uworld40 = SetBit(GetTask(40),3,1)
		SetTask(40,Uworld40)
	elseif (GetSeries() == 0) and (GetFaction() == "tianwang") then
		if (UTask_tw == 60*256+40) and (HaveItem(96) == 1) then					--�õ���������
			Talk(3, "L60_prise", 11525, 11526, 11527)
		elseif (UTask_tw == 60*256) and (GetLevel() >= 50) then
			Talk(3, "L60_get", 11528, 11529, 11530)
		elseif (UTask_tw == 80*256) or (UTask_tw == 80) then						-- �ط�������ɳ���
			Say(11531 ,2,"V�ng, xin Bang ch� �n chu�n. /goff_yes","Kh�ng, ta t� th�y c�ng phut�p luy�n v�n ch�a ��. /no")
		elseif (UTask_tw > 60*256) and (UTask_tw < 70*256) then		--�Ѿ��ӵ���ʦ������δ���
			Talk(1,"", 11532)
		else
			Talk(1,"", 11533)
		end
--	elseif (GetTask(7) == 5*256+10) then		-- ת����������
--		Say(11534 ,2,"���������Ѿ�/defection_yes","�����һ��ǲ���Ͷ������/defection_no")
	elseif (GetSeries() == 0) and (GetCamp() == 4) and (GetLevel() >= 60) and (UTask_tw == 70*256) and (GetTask(7) < 5*256) then		-- �ط�ʦ������
		Talk(1,"return_select", 11535)
	elseif (GetCamp() == 4) and ((UTask_tw == 70*256+10) or (UTask_tw == 70*256+20)) then
		Say(11536 ,2,"�� chu�n b� xong/return_complete","V�n ch�a chu�n b� xong/no")
	elseif (UTask_tw >= 70*256) and (GetFaction() ~= "tianwang") then		--�Ѿ���ʦ
		Talk(1,"", 11537)
	else
		Talk(1,"", 11538)
	end
end
---------------------- ���ܵ������ ------------------------
function check_skill()
	x = 0
	skillID = 38					-- �̹ž�ʽ
	i = HaveMagic(skillID)
	if (i >= 0) then
		x = x + 1
		DelMagic(skillID)
		AddMagicPoint(i)
	end
	if (x > 0) then		-- ���м��ܷ����仯���������ߣ����򷵻ؼ�������
		Say(11539 ,1,"�a t� s� ph� /KickOutSelf")
		return 0
	else
		return 1
	end
end

---------------------- �ط����� ----------------------
function goff_yes()
	Talk(1,"", 11540)
	SetTask(3,70*256)
	AddNote("R�i kh�i Thi�n V��ng bang, ti�p t�c h�nh t�u giang h�. ")
	Msg2Player("Ban �� r�i kh�i Thi�n V��ng bang, ti�p t�c h�nh t�u giang h�. ")
	SetFaction("")
	SetCamp(4)
	SetCurCamp(4)
end

function defection_yes()
-- ˢ������
	n = 0
	i=29; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ն����
	i=23; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ����ǹ��
	i=24; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ��������
	i=26; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ��������
	i=30; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- �ط�����
	i=31; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ���ƾ�
	i=32; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ����ն
	i=33; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ���ľ�
	i=34; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ����ն
	i=35; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ��������
	i=36; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ����ս��
	i=37; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- �÷�ն
	i=38; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- �̹ž�ʽ����ȡ�����ܣ�
	i=40; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- �ϻ���
	i=41; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- Ѫս�˷�
	i=42; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ������
	AddMagicPoint(n)
-- ˢ�꼼�ܺ����ת��������
	SetTask(7,5*256+20)
	SetTask(3,75*256)				-- Ϊԭ�����������
	SetRank(79)						-- ͷ�ν�Ϊ���Ԫ˧
	if (GetRepute() < 200) then
		Msg2Player("V� h�nh vi b�t trung v�i m�n ph�i, danh v�ng c�a b�n gi�m xu�ng "..GetRepute().."�i�m!")
		AddRepute(-1 * GetRepute())
	else
		Msg2Player("V� h�nh vi b�t trung v�i m�n ph�i, danh v�ng c�a b�n gi�m xu�ng 200 �i�m! ")
		AddRepute(-200)
	end
	AddNote("D��ng Anh ph� b� v� c�ng Thi�n V��ng bang c�a b�n, �o�t l�i ch�c K�nh Thi�n Nguy�n So�i d�ng th�i c�ng b� cho thi�n h� b�n �� ra kh�i Thi�n V��ng Bang. B�y gi� ng��i c� th� gia nh�p Thi�u L�m ph�i. ")
	Msg2Player("D��ng Anh ph� b� v� c�ng Thi�n V��ng bang c�a b�n, �o�t l�i ch�c K�nh Thi�n Nguy�n So�i d�ng th�i c�ng b� cho thi�n h� b�n �� ra kh�i Thi�n V��ng Bang. B�y gi� ng��i c� th� gia nh�p Thi�u L�m ph�i. ")
	Talk(1,"KickOutSelf", 11541)
end

function defection_no()
	SetTask(7,1*256)				-- Ϊ��ͼ��ʦ������ǣ��Ա�������ʱ֮��
	AddNote("B�n t� b� � ��nh gia nh�p Thi�u L�m ph�i. ")
	Msg2Player("B�n t� b� � ��nh gia nh�p Thi�u L�m ph�i. ")
end

function return_select()
	Say(11542 ,2,"V�ng, ta mu�n tr� l�i Thi�n V��ng bang /return_yes","Kh�ng, ta ch� bu�t mi�ng n�i v�y th�i. /return_no")
end;

function return_yes()
	Talk(2,"", 11543, 11544)
	SetTask(3,70*256+20)
	AddNote("H� tr� 50000 l��ng qu�n ph� cho Thi�n V��ng bang c� th� quay l�i m�n ph�i. ")
	Msg2Player("H� tr� 50000 l��ng qu�n ph� cho Thi�n V��ng bang c� th� quay l�i m�n ph�i. ")
end;

function return_no()
	Talk(1,"", 11545)
end;

function return_complete()
	if(GetCash() >= 50000) then								-- ��50000��
		Talk(1,"", 11546)
		Pay(50000)
		SetTask(3, 80*256)
		SetFaction("tianwang")
		SetCamp(3)
		SetCurCamp(3)
		SetRank(69)
		if (HaveMagic(36) == -1) then
			AddMagic(32)
			AddMagic(41)
			AddMagic(324)
			AddMagic(36)
			Msg2Player("B�n h�c ���c tuy�t k� tr�n ph�i c�a Thi�n V��ng bang: Thi�n V��ng Chi�n �, V� C�ng V� T�m Tr�m, Huy�t Chi�n B�t ph��ng, Th�a Long Quy�t. ")
		end
		AddNote("�� quay tr� l�i Thi�n V��ng bang. ")
		Msg2Faction(GetName().." �� tr� l�i Thi�n V��ng bang, ���c phong l� K�nh Thi�n Nguy�n So�i")
	else
		Talk(2,"", 11547, 11548)
	end
end;

---------------------- ��ʦ���� ----------------------
function L60_get()
	Say(11549 , 2, "Thu�c h� t�n l�c thi h�nh /L60_get_yes", "E r�ng kh� c� th� nh�n nhi�m v� /no")
end;

function L60_get_yes()
	Talk(1,"", 11550)
	SetTask(3, 60*256+20)
	AddNote("T�i T�m cung Thi�n V��ng bang (223, 196) g�p D��ng Anh, ti�p nh�n nhi�m v� �i Thanh Loa ��o thu h�i Thi�n V��ng Di Th�. ")
	Msg2Player("T�i T�m cung Thi�n V��ng bang (223, 196) g�p D��ng Anh, ti�p nh�n nhi�m v� �i Thanh Loa ��o thu h�i Thi�n V��ng Di Th�. ")
end;

function L60_prise()
DelItem(96)
Msg2Player("Ch�c m�ng b�n �� xu�t s� th�nh c�ng, b�n ���c phong l� Tr�n Bang Nguy�n So�i! Danh v�ng t�ng th�m 120 �i�m! ")
--AddGlobalCountNews(GetName().."�ճɳ�ʦ�����ͬ��ʦ�ܿ�ʼ����������", 1)
Msg2SubWorld("Thi�n V��ng"..GetName().."Xu�t s� th�nh c�ng, c�o bi�t D��ng bang ch� v� c�c ��ng m�n huynh ��, ti�p t�c h�nh t�u giang h�. ")
AddRepute(120)
SetRank(79)
SetTask(3, 70*256)
SetFaction("")
SetCamp(4)			   				--����˳�������
SetCurCamp(4)
AddNote("Quay l�i T�m cung Thi�n V��ng Bang, ��a Thi�n V��ng Di Th� cho Bang ch� D��ng Anh, ho�n th�nh nhi�m v� xu�t s�. Th�ng ch�c K�nh Thi�n Nguy�n So�i.. ")
end;

function no()
end
