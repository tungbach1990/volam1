--description: ������л����
--author: yuanlan	
--date: 2003/3/3
-- Update: Dan_Deng(2003-08-12)

function main()
	UTask_em = GetTask(1);
	Uworld36 = GetByte(GetTask(36),1)
	if (Uworld36 == 60) then		--��������
		Msg2Player("Ti�p nh�n th� th�ch v� c�ng c�a T� To�n Thi�n pha ��n kh�ch ���c B�ch Ng�c nh� � ")
		Say("Th� th�ch c�a 3 s� t� kh�ng kh� kh�n v�i mu�i! C�a 'v�n' xem nh� mu�i �� qua, nh�ng c�ng c�n ph�i qua �i 'v�'. Trong th� th�ch ��u ti�n c�n ph�i qua To�n Thi�n Ph� Ngh�nh Kh�ch Tr�n, l�y ���c <color=Red>B�ch Ng�c Nh� �<color>, mu�i mu�n x�ng tr�n kh�ng?", 2, "X�ng tr�n /yes", "Kh�ng x�ng /no")
	elseif (Uworld36 == 70) then
		if (HaveItem(17) == 0) then
			Talk(1,"","Sau khi l�y ���c <color=Red>B�ch Ng�c Nh� �<color>, r�i kh�i To�n Thi�n Ph� � c�a ra v� trao cho Di�u Tr�n s� t�.")
		else
			Talk(1,"","Trao <color=Red>B�ch Ng�c Nh� �<color> cho Di�u Tr�n � <color=Red>l�i ra To�n Thi�n Ph�<color>.")
		end
--	elseif ((UTask_em > 5*256) and (UTask_em < 5*256+60)) then 					--��δ���ǰ����
--		Talk(1,"","л���ܣ�Ҫ����뱾�ɣ�������ͨ��������Ŀ��飬�㶼��������")
--	elseif (GetFaction() == "emei") then   				--�Ѿ����ţ���δ��ʦ
--		Talk(1,"","л���ܣ����Ѿ��Ǳ��ɵ��ӣ������ٴ��������ˡ�")
	elseif (UTask_em == 70*256) then   						--�ѳ�ʦ
		Talk(1,"","R�nh r�i h�y v� th�m t� mu�i ta!")
	else
		Talk(1,"","�.��nh ti�n t�c d� nh�t chi mai")
	end
end;

function yes()
--	SetPos(1766, 5136);				--����Ҵ������Թ�
	Uworld36 = SetByte(GetTask(36),1,70)
	SetTask(36,Uworld36)
	AddNote("Khi v�o To�n Thi�n Pha ph�i ch�u s� th� th�ch c�a T� V�n La, x�ng v�o To�n Thi�n Pha v� �o�t B�ch Ng�c Nh� � t� trong Ngh�nh kh�ch tr�n ")
	Msg2Player("Khi v�o To�n Thi�n Pha ph�i ch�u s� th� th�ch c�a T� V�n La, x�ng v�o To�n Thi�n Pha v� �o�t B�ch Ng�c Nh� � t� trong Ngh�nh kh�ch tr�n ")
end;

function no()
end;
