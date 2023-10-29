-- ؤ�� �ư������޿��� 30������
-- by��Dan_Deng(2003-07-28)
-- by: xiaoyang(2004\4\22)

Include("\\script\\global\\skills_table.lua")
Include("\\script\\global\\repute_head.lua")

Include("\\script\\item\\skillbook.lua")

function main()
	UTask_gb = GetTask(8)
	Uworld128 = GetTask(128)
	if (GetSeries() == 3) and (GetFaction() == "gaibang") then
		if (UTask_gb == 30*256) and (GetLevel() >= 30) then		--30������
			Say("Ta ph� tr�ch c�ng v� th��ng ng�y c�a c�c ph�n ���ng, m�i th�ng c�c �� ch� ��u tr�nh c�ng v�n l�n m�t l�n, nh�ng th�ng n�y Tri�u �� ch� ph�n �� th� ba ch�a giao t�i n�a, ng��i gi�p ta �i h�i th�c ���c kh�ng?",2,"��ng �!/L30_get_yes","Ti�c qu�! Ta c� vi�c kh�c r�i /L30_get_no")
		elseif (UTask_gb == 30*256+40) and (HaveItem(81) == 1) then		--30���������
			L30_prise()
		elseif (UTask_gb >= 30*256+10) and (UTask_gb < 400*256) then		--30�����������
			Talk(1,"","�i qua D��ng Ch�u ch�a v�y? Sao Tri�u �� ch� ch�a ��a c�ng v�n t�i n�a?")
		else
			Talk(1,"","Kim Binh c�ng ng�y c�ng t�o b�o, ch�ng ta ph�i h�nh ��ng g� th�i!")
		end
	elseif (Uworld128 == 20) and (HaveItem(390) == 1) then
		Talk(9,"Uworld128_danger","La tr��ng l�o! � ��y c� b�c th� c�a Gi�i V� T�.",".....Xin h�i C�c h� l�y th� n�y � ��u?","T�i h� v�i Gi�i V� T� bi�t nhau, � Tr��ng Giang nguy�n ��u h�n ��a th� cho ta.","V�y ch�c kh�ng sai! Trong th� V� T� n�i r� ng��i r�t ��ng tin v� n�i c� ng��i mu�n h�i h�n.","Sao?","Chuy�n n�y v� c�ng tr�ng ��i, tuy�t ��i kh�ng ���c truy�n ra ngo�i","T�i h� hi�u r�!","Ta kh�ng ti�n xu�t ��u l� di�n! Ng��i c� d�m ��m tr�ch s� m�ng n�y kh�ng/","V�y ta �i ngay!")
	elseif (Uworld128 == 50) then
		Talk(5,"Uworld128_finish","La tr��ng l�o! Gi�i ��i ca �� tho�t hi�m.","�a t� b�ng h�u! Nh�ng ta v�n c�n lo l�ng m�t chuy�n","Xin c� n�i ra!","Gi�i V� T� l� hy v�ng C�i Bang, ��i ph��ng s� kh�ng bu�ng tha. Mong ng��i h�y c� g�ng b�o v� y.","La tr��ng l�o xin y�n t�m! ")
	elseif (Uworld128 == 20) then
		Talk(1,"","La tr��ng l�o! Gi�i V� T� qu� bang nh� t�i giao b�c th� cho �ng, nh�ng ta �� qu�n mang theo.")
	elseif (Uworld128 > 20) and (Uworld128 < 50)then
		Talk(1,"","Ti�u Gi�i l� �� t� k� v�ng c�a c�i bang. C� th� �em ��n ph�c ph�n cho ng��i! ")
	else
		Talk(1,"","Kim binh c�ng l�c c�ng manh ��ng, ch�ng ta c�ng ph�i s�m h�nh ��ng m�i ���c.")
	end
end;

function L30_get_yes()
	Talk(1,"","Ph�n �� th� 3 n�m � D��ng Ch�u, ng��i ��n �� s� g�p ���c Tri�u �� ch�.")
	SetTask(8,30*256+10)
	Msg2Player("Ti�p nh�n nhi�m v�: ��n D��ng Ch�u �� h�i nguy�n nh�n giao d�ch s�ch tr� c�a Tri�u �� ch� ")
	AddNote("Ti�p nh�n nhi�m v�: ��n D��ng Ch�u �� h�i nguy�n nh�n giao d�ch s�ch tr� c�a Tri�u �� ch� ")
end;

function L30_get_no()
end;

function L30_prise()
	Talk(2,"","Tr��ng l�o! Ta �� �em v�n th� v� r�i!","Xem ra Kim binh �� th�t s� h�nh ��ng! Ch�ng ta ph�i c�n h�n h�n m�i ���c. L�n n�y ng��i l�p ���cc�ng l�n, ta phong ng��i l� �� t� c�p 30")
	DelItem(81)
	SetTask(8,40*256)
	SetRank(40)
--	AddMagic(274)
--	AddMagic(124)
	add_gb(40)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
	Msg2Player("Ch�c m�ng B�n! �� ���c th�ng l� C�i Bang Ch�p B�ng �� t�, s� ���c h�cGi�ng Long Ch��ng; �� C�u Tr�n. ")
	AddNote("Gi�i quy�t ���c s� vi�c � Th�c C��ng s�n, c�u ���c �� t� C�i bang, ���c th�ng l� Ch�p b�ng �� t� ")
end;

function Uworld128_danger()
	DelItem(390)
	SetTask(128,30)
	Msg2Player("La tr��ng l�o nh� b�n �i c�u Gi�i V� T� ")
	AddNote("La tr��ng l�o nh� b�n �i c�u Gi�i V� T� ")
end

function Uworld128_finish()
	if (GetTask(8) >= 70*256) and (GetTask(8) ~= 75*256) then
		Talk(1,"","C�i Bang ta c� m�t b� m�t quy�t, ng��i x�ng ��ng ���c truy�n d�y!")
		if (HaveMagic(357) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(357,1)
		end
		if (HaveMagic(359) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(359,1)
		end
		CheckIsCanGet150SkillTask()
		Msg2Player("B�n h�c ���c tuy�t k� c�a C�i bangPhi Long T�i Thi�n, Thi�n H� V� C�u ")
		SetTask(128,255)
	else
	   SetTask(128,245)  --������������ñ���245
	end
   add_repute = ReturnRepute(30,100,4)			-- �������������30�㣬��100����ÿ���ݼ�4%
   AddRepute(add_repute)
   Msg2Player("C�u ���c Gi�i V� T�, ho�n th�nh nhi�m v�. Danh v�ng c�a b�n t�ng th�m "..add_repute.."�i�m.")
   AddNote("C�u ���c Gi�i V� T�, ho�n th�nh nhi�m v�. ")
end
