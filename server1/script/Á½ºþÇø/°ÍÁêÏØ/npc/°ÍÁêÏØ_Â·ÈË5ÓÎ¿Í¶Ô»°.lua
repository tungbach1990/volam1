--������ ������ ·��5�οͶԻ�
--�������������񣺹���̫�ı���
--suyu
-- Update: Dan_Deng(2003-08-10)

function main(sel)
	UTask_world19 = GetTask(47);
	if (UTask_world19 == 2) then
		if HaveItem(183) == 1 then
			Say("� � �! C�i g� kia! B�n tr� c� b�c th� ph�p kia, c� th� nh��ng l�i cho ta ���c kh�ng, gi� c� c� th� th��ng l��ng, b�c th� ph�p n�y l� c�a Ph�m V�n Ch�nh C�ng n�i ti�ng ��y!",2,"B�n /yes","Kh�ng b�n /no")
		else
			Talk(1,"","�i!...Bao gi� th� ta m�i c� th� t�m ���c m�t b�c th� ph�p qu� nh� th� n�y?")
		end
	else
		i = random(0,3)
		if (i == 0) then
			Talk(1,"","��ng ��nh h� n�y c�n ���c g�i l� 'V�n M�ng Tr�ch', ph�a B�c gi�p Tr��ng Giang, Nam gi�p b�n con s�ng T��ng, T�, Nguy�n, Phong, danh hi�u l� 'B�t B�ch L� ��ng ��nh H�'. ")
		elseif (i == 1) then
			Talk(1,"","��ng ��nh h� r�ng m�nh m�ng, n�i non ch�t v�t, ��c �i�m l�n nh�t l� ngo�i h� c� h�, trong h� c� n�i,c� nhi�u v� s�, lau s�y um t�m, n��c tr�i m�t s�c, h�i �u bay l��n. Xu�n thu t� qu� lu�n thay ��i. ")
		elseif (i == 2) then
			Talk(1,"","Du kh�ch?Ph�m V�n Ch�nh C�ng trong b�i 'Nh�c d��ng l�u k�' c� vi�t?'D� quan phu Ba L�ng th�ng tr�ng,t�i ��ng ��nh nh�t h�. H�m vi�n s�n, Th�n Tr��ng Giang, h�o h�o thang thang, ho�nh v� t� nhai?tri�u huy t�ch �m, kh� t��ng v�n thi�n',��ng ��nh h� n�y x�ng ��ng ���c t�n l� 'Thi�n h� �� nh�t ��ng'!")
		else
			Talk(1,"","�i!...Bao gi� th� ta m�i c� th� t�m ���c m�t b�c th� ph�p qu� nh� th� n�y?")
		end
	end
end;

function yes()
	i = 100 * (random(0,5)+10)
	Talk(2,"","N�u ng��i �� ��ng � b�n cho ta, th� kh�ng ���c ��i � ��y! �� xem ta c�n bao nhi�u ti�n, 5, 10, 15, 20... ","T�t r�i, ��a ng��i "..i.."ng�n l��ng.")
	DelItem(183)
	Earn(i)
	SetTask(47, 3)
	Msg2Player("��a b�c th� ph�p cho ng��i du kh�ch, l�y ���c "..i.."ng�n l��ng.")
	AddNote("��a b�c th� ph�p cho ngu�i du kh�ch, ho�n th�nh nhi�m v�. ")
end;

function no()
	Talk(1,"","C� th� ngh� l�i kh�ng? Ta th�t l�ng r�t mu�n c� b�c th� ph�p n�y. ")
end;
