-- ���� ���� Ѿ�� 10������
-- by��Dan_Deng(2003-07-30)

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_kl = GetTask(9);
	if (GetSeries() == 4) and (GetFaction() == "kunlun") then
		if (UTask_kl == 10*256+10) then		--10�����������
			if (HaveItem(112)==1) and (HaveItem(113)==1) and (HaveItem(114)==1) and (HaveItem(115)==1) and (HaveItem(116)==1) then
				L10_prise()
			else
				Talk(1,"","Thu�c �� ���c h�i �� ch�a?")
			end
		elseif ((UTask_kl == 10*256) and (GetLevel() >= 10)) then		--10������
			Say("Ti�u th� c�a ch�ng ta t� b� �� mang nhi�u b�nh, m�i ng�y ��u ph�i u�ng 1 ch�n linh chi b�ch th�o m� vi sinh. Lo�i d��c th�o n�y ng�y h�m qua �� h�t, l�i ��ng v�o l�c ngay t�n d��c ��ng chuy�n ph� tr�ch h�i thu�c ng� b�nh, b�y gi� ph�i l�m sao ��y?",2,"Gi�p �i h�i thu�c /L10_get_yes","L�c b�t t�ng t�m /L10_get_no")
		else
			Talk(1,"","Th� ch�t c�a ti�u th� v�n y�u �u�i nh� v�y, ph�i l�m sao ��y?")
		end
	else
		Talk(1,"","Trong C�n L�n ph�i, n�i s�ch s� nh�t ch�nhh l� ph�ng c�a ti�u th� ch�ng ta!")
	end
end;

function L10_get_yes()
	Talk(3,"L10_get_talk","Xin c� n��ng ��ng lo l�ng,ta s� �i h�i thu�c v� ��y!","Th�t kh�ng? N�u th� th� qu� t�t r�i!","Kh�ng bi�t c�n nh�ng lo�i d��c li�u n�o?")
end

function L10_get_talk()
	Talk(1,"","C�n c�: T� M�c T�c, ��a C�m Th�o, Thi�n Th�o, H� Nh� th�o v� Linh Chi. Linh Chi l� kh� t�m nh�t! �i v� h��ng ��ng B�c c�a Long M�n tr�n l� D��c V��ng C�c. Trong �� c� th� t�m ���c!")
	SetTask(9,10*256+10)
	AddNote("��n D��c V��ng C�c t�i ph�a ��ng b�c c�a Long M�n tr�n �� h�i 5 lo�i d��c li�u T� M�c T�c, ��a C�m Th�o, Thi�n Th�o, H� Nh� Th�o v� Linh Chi. ")
	Msg2Player("��n D��c V��ng C�c t�i ph�a ��ng b�c c�a Long M�n tr�n �� h�i 5 lo�i d��c li�u T� M�c T�c, ��a C�m Th�o, Thi�n Th�o, H� Nh� Th�o v� Linh Chi. ")
end;

function L10_get_no()
end;

function L10_prise()
	Talk(1,"","Ng��i th�t gi�i! Ta s� n�i ti�u th� �� b�t ng��i")
	DelItem(112)
	DelItem(113)
	DelItem(114)
	DelItem(115)
	DelItem(116)
	SetTask(9,20*256)
	SetRank(20)
--	AddMagic(167)
--	AddMagic(168)
--	AddMagic(392)
--	AddMagic(171)
	add_kl(20)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
	Msg2Player("Ch�c m�ng B�n! �� tr� th�nh C�n L�n ph�i Ph�ng Ki�m �� t�! H�c ���c C�n L�n �ao ph�p, C�n L�n ki�m ph�p, Th�ch Ph��c Ch�, b�a thanh Phong. ")
	AddNote("H�i thu�c v�, g�p Ti�u H�n ph�c m�nh, ho�n th�nh nhi�m v� h�i thu�c, th�ng c�p th�nh Ph�ng ki�m �� t�. ")
end;
