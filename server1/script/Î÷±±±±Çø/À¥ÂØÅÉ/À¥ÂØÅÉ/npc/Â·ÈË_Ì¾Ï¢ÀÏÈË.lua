-- ���� ���� ̾Ϣ���� 20������
-- by��Dan_Deng(2003-07-30)
-- by: xiaoyang(2004\4\20) ˽��������������90������

Include("\\script\\global\\skills_table.lua")
Include("\\script\\global\\repute_head.lua")

Include("\\script\\item\\skillbook.lua")

function main()
	UTask_kl = GetTask(9)
	Uworld130 = GetTask(130)
	Uworld31 = GetByte(GetTask(31),2)
	if (GetSeries() == 4) and (GetFaction() == "kunlun") then
		if ((UTask_kl == 20*256+10) and (HaveItem(7) == 1)) then		--20�����������
			Talk(1,"L20_prise","��i gia! X��ng ��u L�c �� n�y c� ph�i c�a �ng kh�ng?")
		elseif ((UTask_kl == 20*256) and (GetLevel() >= 20)) then		--20������
			Talk(4,"L20_get","C�i x��ng ��u L�c �� c�a l�o b� m�t r�i, b�y gi� ph�i l�m g� ��y? H�m! Nh�t ��nh b� k� n�o l�y c�p r�i!","��i gia! �ng c�n x��ng ��u L�c �� �� l�m g�?","Ng��i m�i ��n ��ng kh�ng? Th�o n�o m� ta c�ng kh�ng bi�t l� ai. Ta ch�nh l� Th�n T�c L�o Nh�n! Ch��ng m�n �ang luy�n 1 chi�u tuy�t th� v� c�ng, �ang c�n 1 l��ng l�n x��ng ��u L�c ��, b�y gi� b� k� n�o ��nh c�p r�i, Ch��ng m�n m� ch�t v�n, c�i th�n gi� c�a ta ch�n kh�ng b�o to�n ���c! Ph�i l�m sao ��y? B�y gi� ph�i l�m sao ��y?","Sao kh�ng xu�ng n�i �� mua")
		else
			Talk(1,"","B�ch th� t��ng tri do an ki�m, chu m�n ti�n ��t ti�u ��m quan")
		end
	elseif (Uworld130 < 10) and (GetLevel() >= 90) and (GetReputeLevel(GetRepute()) >= 5) and (GetFaction() ~="kunlun") and (Uworld31 ==127) then
		Talk(8,"Uworld130_get","L�o h�n n�y g��ng m�t ch�n ch�t s�o, c�c k� x�u x�, m�i ng�y ��u qu�t l� r�ng b�n trong C�n L�n ph�i, r�t �t n�i chuy�n, nh� th� ��ng sau che gi�u nh�ng chuy�n kh�ng th� cho ai bi�t ���c. Nghe ��u l�o ch�nh l� Th�n T�c L�o Nh�n - Ch��ng m�n c�a ��i tr��c","L�o ti�n b�i!","L�o ti�n b�i?...�� r�t l�u kh�ng c�n ai g�i ta nh� th� n�a. ","Ta nghe n�i...l�o ch�nh l� Ch��ng m�n ��i tr��c c�a C�n L�n","�� l� chuy�n c�a r�t nhi�u n�m tr��c r�i, kh�ng nh�c t�i n�a.","V�n b�i nghe ��i danh c�a ti�n b�i,��n ��y th�nh gi�o!","Haha! Ng��i v�n cho r�ng C�n L�n b�y gi� v�n c�n l� 1 ��m ng��i r�i r�c tranh gi�nh quy�n l�c l�n nhau sao?","V�y th� nh� th� n�o?")
	elseif (Uworld130 == 20)then
		Talk(8,"Uworld130_help","�� th�y g� ch�a?","Ch�a th�y g� c�! ","Hi�n t�i C�n L�n ph�i v�n t�n t�i nh�ng t�n nh� nh�t soi m�i nh� th�, ng��ic�n g� ph�i k�t nh�m v�i ��m ng��i ��!","V�n b�i nghe n�i b�n h� h�nh nh� �ang trao ��i Cu�ng Phong S�u �i�n v� Ng� L�i Ch�nh Ph�p g� ��","Bi k�ch n�m x�a gi� �� l�p l�i! L�o phu c�ng v� n�m x�a tu�n t� truy�n h�t tuy�t chi�u cho 3 �� ��, g�y cho ch�ng nghi k� l�n nhau, n�n h�p s�c l�i ph� ta. B�y gi� ��y!","Lo�i �� �� v� s� nh� th�, kh�ng n�n �� t�m ��n l�m g�. C� �� b�n ch�ng t� sinh t� t�n.","B�t lu�n th� n�o, l�o phu c�ng l� m�t th�nh vi�n c�a C�n L�n. Nh�ng l�o phu kh�ng ti�n ra tay, c� th� nh� ti�u hi�p ��y gi�p chuy�n n�y kh�ng? L�o phu c�m k�ch v� c�ng, C�n L�n c�ng s� t�t h�n trong v�i n�m t�i!","���c th�i!")
   elseif (Uworld130 == 40) and (GetFaction() ~= "kunlun") then
   	Talk(4,"Uworld130_finish","Ti�n b�i! Ta �� gi�p �ng d�y d� 2 t�n n�y. Nh�ng ch� s� m�y t�n ti�u t�t n�y b�n ch�t kh� thay ��i, c�ng xin ti�n b�i ra tay d�y d�! ","V� c�ng c�a ta to�n b� kh�ng c�n, �� xem nh� ng��i t�n ph� ","Sao?","Nh�ng chuy�n c� c�ng kh�ng n�n nh�c l�i l�m g� ")
   elseif (Uworld130 > 10) and (Uworld130 < 40)then
   	Talk(1,"","C�n L�n m�nh �� nhi�u tr�c tr�, n�u ���c c�c v� ra tay gi�p ��, l�o phu th�t s� c�m k�ch v� c�ng! ")
	else
		Talk(1,"","L�o gi� r�i! C�ng kh�ng c�n h�u d�ng n�a!")
	end
end;

function L20_get()
	Say("Mua? T�t nhi�n l� kh�ng th� mua ���c! C�i x��ng ��u n�y ta ph�i ph� m�t r�t nhi�u s�c l�c m�i t�m ���c, l�n n�y b� ��nh c�p th� ta ch�t ch�c r�i",2,"Ng��i kh�ng c�n ph�i lo l�ng, ta s� gi�p ng��i t�m l�i c�i x��ng ��u l�c �� n�y. /L20_get_yes","V�y th� kh�ng c�n c�ch n�o c� /L20_get_no")
end;

function L20_get_yes()
	Talk(1,"","Ng��i ��ng l� hi�p kh�ch t�t b�ng, ch� c�n ng��i t�m ���c x��ng ��u l�c ��, ta s� ti�n c� ng��i tr��c m�t Ch��ng m�n �� tr� th�nh �� t� c�p 20")
	SetTask(9,20*256+10)
	AddNote("Nh�n nhi�m v� c�p 20, t�m l�i x��ng ��u l�c �� b� ��nh m�t. ")
	Msg2Player("Nh�n nhi�m v� c�p 20, t�m l�i x��ng ��u l�c �� b� ��nh m�t. ")
end;

function L20_get_no()
end;

function L20_prise()
	Talk(1,"","��y r�i! ��y r�i! R�t c�m �n ng��i! Ta nh�t ��nh s� ti�n c� ng��i v�i Ch��ng m�n")
	DelItem(7)
	SetTask(9,30*256)
	SetRank(21)
--	AddMagic(174)
	add_kl(30)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
	Msg2Player("Ch�c m�ng b�n! �� ���c th�ng c�p th�nh C�n L�n ph�i T� Vi H� Ph�p, h�c ���c Ky B�n ph�. ")
	AddNote("T�m ���c x��ng ��u l�c ��, giao cho Th�n T�c L�o Nh�n, ho�n th�nh nhi�m v�. Th�ng c�p th�nh T� Vi h� ph�p ")
end;

function Uworld130_get()
	if (GetCamp() == 0) and (GetTask(75) < 255) then		-- ����δѧҰ��ȭ�ģ������������
		Talk(1,"","Y�u �u�i kh�ng c� s�c nh� ng��i n�i nhi�u c�ng v� �ch! �i �i!")
	else
		Say("N�u ng��i th�c s� mu�n h�c, th� tr��c h�t �i ra ph�a sau ng�n n�i, ch� c�n nh�n qua s� bi�t!",2,"�i th� �i /Uworld130_yes","Ng��i mu�n d�y th� d�y, kh�ng d�y th� th�i. /Uworld130_no")
	end
end

function Uworld130_yes()
	SetTask(130,10)
	Msg2Player("Th�n T�c L�o Nh�n mu�n b�n �i v�ng v�ng ra ph�a sau n�i. ")
	AddNote("Th�n T�c L�o Nh�n mu�n b�n �i v�ng v�ng ra ph�a sau n�i. ")
end

function Uworld130_no()
end

function Uworld130_help()
	SetTask(130,30)
	Msg2Player("Th�n T�c L�o Nh�n mu�n b�n ng�n ch�n n�i chi�n, b�n ��p �ng. ")
	AddNote("Th�n T�c L�o Nh�n mu�n b�n ng�n ch�n n�i chi�n, b�n ��p �ng. ")
end

function Uworld130_finish()
	if(GetTask(9) >= 70*256) and (GetTask(9) ~= 75*256) then
		Talk(4,"","� ��y c� 1 quy�n b� k�p c�a C�n L�n, ng��i h�y theo �� m� t�p luy�n","��y l��?","Ch� hy v�ng ng��i nghi�m t�c luy�n t�p, l�c C�n L�n g�p nguy kh�, c� th� ra tay y�m tr�, l� l�o gi� n�y �� m�n nguy�n l�m r�i. ","V�n b�i tu�n l�nh")
		if (HaveMagic(372) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(372,1)
		end
		if (HaveMagic(375) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(375,1)
		end
		if (HaveMagic(394) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(394)
		end
		CheckIsCanGet150SkillTask()
		Msg2Player("H�c ���c k� n�ng C�n L�n Ng�o Tuy�t Ti�u Phong, L�i ��ng C�u Thi�n, T�y Ti�n T� C�t ")
 		SetTask(130,255)
	else
	   SetTask(130,245)  --������������ñ���245
	end
   add_repute = ReturnRepute(30,100,4)			-- �������������30�㣬��100����ÿ���ݼ�4%
   AddRepute(add_repute)
   Msg2Player("H�a gi�i m�t cu�c n�i chi�n, ho�n th�nh nhi�m v�. Danh v�ng c�a b�n t�ng th�m "..add_repute.."�i�m.")  
   AddNote("H�a gi�i m�t cu�c n�i chi�n, ho�n th�nh nhi�m v�. ")
end
