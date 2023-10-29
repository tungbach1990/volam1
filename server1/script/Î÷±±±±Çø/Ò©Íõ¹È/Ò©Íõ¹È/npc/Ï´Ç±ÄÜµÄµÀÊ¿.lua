-- ϴǱ�ܵĵ�ʿ.lua ��ҩ���ȣ��˵��ˣ�
-- By Dan_deng(2004-01-06)
-- ������GetTask(92): ϴ���Ĵ�����Ŀǰ���5�Σ�
--			GetTaskTemp(8)���ݴ�ϴǱ�ܼ۸�
--			GetTaskTemp(50): �Ƿ��ñ�ʯϴ��
-- Update: Dan_Deng(2004-05-24) ���Ա������� (Uworld76 = GetTask(76))
-- Update: Dan_Deng(2004-05-27) С��ʧ������ (Uworld42 = GetTask(42))

function main()
	Uworld92 = GetTask(92)
	Uworld76 = GetTask(76)
	Uworld42 = GetTask(42)
	if (Uworld76 == 30) then    -- ���Ա��������ҵ��˵��ˣ����������
		if (HaveItem(393) == 1) then
			Talk(11,"W76_step","��o tr��ng! Ch�ng ta l�i g�p m�t r�i","T�m ta c� vi�c g�? ","� ��y c� 1 b�c th�, ng��i xem xong r�i n�i. ","Ah! Th� l�i cho b�n ��o �� xem th��ng","Th� ra l� th� c�a l�o V��ng, ��ng ti�c b�n ��o �ang v��ng b�n vi�c ri�ng, t�m th�i kh�ng r�i kh�i ��y ���c","V�y th� ph�i l�m sao ��y? Ta �� v� ng�c ch�c ch�n tr��c m�t ��i l�o gia. ","�� l� l�i h�a c�a ng��i! Li�n quan g� ��n b�n ��o! ","��o tr��ng n� l�ng n�o th�y ch�t kh�ng c�u! V�y ��� ","Ha ha! Ta ch� ��a v�i ng��i th�i. B�n ��o ��y tuy kh�ng �i ���c, nh�ng ng��i c� th� �i. Tr��c h�t ng��i h�y �i t�m l�y 3 v�t,�� ch�nh l� r�ng �nh �i�n, n��c nhi�m ph�n v� c�nh b�ch v�n. C�c th� �� l� thu�c pha ch�, k�t h�p v�i th�n d��c c�a b�n ��o c� th� gi�i ���c ch�ng m�t s�c.","Ti�u t� h�nh t�u giang h�, nhi�u l�c c�ng c�m th�y lao l�c, ��y ch�ng ph�i l� ph��ng ph�p �� ch�a tr� sao?","��ng v�y! ��n l�c �� b�n ��o s� truy�n cho ng��i h�i th� k� thu�t n�y, ng��i l�n n�y xem nh� v�a c�u ng��i v�a t� c�u, ch� l� 3 lo�i d��c pha ch� kh�ng d� c� ���c, ph�i nhanh ch�ng t�m ki�m. ","��o tr��ng an t�m!")
		else
			Talk(2,"","Ng��i n�i l�o B�nh nh� ta gi�p ��, v�y t�n v�t ��u? �t nh�t c�ng ph�i c� l�y 1 b�c th� ch�?","�ng ��ng tr�n tr�n m�t nh� v�y, ta s� quay v� nh� B�nh ��i l�o gia vi�t ngay 1 b�c cho �ng ��y. ")
   	end
	elseif (Uworld76 == 40) then
		if (HaveItem(370) == 1) and (HaveItem(371) == 1) and (HaveItem(372) == 1) then
			Talk(6,"W76_end","��o tr��ng! Nh�ng th� �ng c�n ta ��u �� chu�n b� ��","�.","Kh�ng ng� ng��i th�t s�c c� b�n l�nh nh� v�y. Huy�t D�ng ho�n ��y,mau mau mang�i!","Ch�ng ph�i c�n H�i Th� thu�t sao?","C�i g� h�i th� hay kh�ng h�i th�? Kh�ng hi�u r�. ","Th�i th� c�ng ���c! ��o tr��ng kh�ng ch�u truy�n th� t�c c� l� do b�t ti�n, n�u c�u ���c tu�n m�, h�c hay kh�ng h�c ���c v� c�ng th� c� quan tr�ng g� ��u")
		else
			Talk(1,"","3 lo�i d��c li�u �� l�: r�ng �nh �i�n, n��c nhi�m ph�n v� c�nh b�ch v�n. Ng��i ph�i nhanh l�n, n�u kh�ng b�nh t�nh tr�m tr�ng th� kh�ng li�n quan ��n b�n ��o ��y!")
		end
	elseif (Uworld76 == 50) and (HaveItem(375) == 0) then			-- ���Ա�������Ѫ���趪��
		SetTask(76,40)
		Talk(1,"","Huy�t D�ng ho�n ��nh r�i r�i? V�y ta c�ng kh�ng c� c�ch n�o kh�c, ng��i ph�i l�i t�m ki�m 3 lo�i d��c li�u")
	elseif (Uworld42 == 10)  then  								-- С��ʧ������ȥɱʮ����ɽ
		Talk(4,"","��o tr��ng! Xin h�i �ng c� bi�t v� �n m�t t�ch tr� con � ��i L�? ","Th� gian n�y �� tr�ng �en �i�n ��o, l�ng ng��i thay ��i l�u r�i. Ng��i h� t�t �i lo nhi�u chuy�n kh�ng li�n can? ","Ng��i kh�c l�m g� th� m�c ng��i kh�c, ta th� c� c�ch h�nh s� ri�ng c�a ta. Kh�ng l� nh�n tr�m h� ng�n nh� ng�y ng�y d�ng n��c m�t r�a m�t l� ch�nh ��o sao","Kh�ng ng� v�n c�n ng��i c�ng ��u nh� ng��i. D��c V��ng ��ng c� r�t nhi�u t�n Xuy�n S�n r�t ��ng gh�t. Ng��i �i gi�t 10 t�n, n�u c�n m�ng quay tr� l�i ��y th� ta s� nghe ng��i n�i chuy�n. ")
		SetTask(42,20)
		AddNote("Nhi�m v� tr� con m�t t�ch: ��o nh�n qu� c�n b�n ��n D��c V��ng ��ng gi�t ch�t 10 t�n s�n t�c ")
		Msg2Player("Nhi�m v� tr� con m�t t�ch: ��o nh�n qu� c�n b�n ��n D��c V��ng ��ng gi�t ch�t 10 t�n s�n t�c ")
	elseif (Uworld42 == 30) then									-- С��ʧ���������������
		Talk(1,"","Chuy�n n�y ta c�ng kh�ng gi�p ���c g�! Nh�ng ta c� 1 ng��i b�n bi�t hi�u l� V� Danh T�ng, n�u ng��i t�m g�p ���c l�o ta, ch�c ch�n m�i vi�c ��u r� r�ng")
		SetTask(42, 40)
		AddNote("Ti�p nh�n nhi�m v�: �i t�m V� danh T�ng �� h�i tin t�c v� vi�c tr� con m�t t�ch ")
		Msg2Player("Ti�p nh�n nhi�m v�: �i t�m V� danh T�ng �� h�i tin t�c v� vi�c tr� con m�t t�ch ")
	elseif (GetItemCountEx(353) >= 1) then				-- ϴǱ�ܣ��ñ�ʯϴ
		Say("Tinh H�ng b�o th�ch? Ta c�ng �ang ��nh t�m v�i vi�n ��y. Nh� v�y �i,ta s� gi�p ng��i c�i t�o kinh m�ch �� ��i vi�n Tinh h�ng b�o th�ch c�a ng��i",3,"H�c ch�!/tuneprop_jewel","Kh�ng h�ng th� /no","Tinh H�ng B�o th�ch c�n d�ng v�o vi�c kh�c, d�ng ti�n �� nh� ng��i gi�p ta c�i t�o kinh m�ch c� ���c kh�ng? /sele3")
	elseif (GetLevel() >= 50) then			-- and ((GetCamp() == 0) or (GetCamp()== 4)) then		-- ϴǱ�ܵĻ���Ҫ�󣺹�50�������������������������Ӫ��
		if (Uworld92 == 0) then			-- ûϴ��
			Talk(1,"tuneprop_get","C�i t�o kinh m�ch gi�p ng��i? L� ai nhi�u chuy�n b�o ng��i ��n t�m ta v�y?")
		elseif (Uworld92 < 5) then		-- ϴ������δ������
			Talk(1,"tuneprop_get","�n qua m�t l�n ng�t ng�o ban ��u th� m�i m�i kh�ng qu�n. Ta ph�i c�nh b�o ng��i, m�i l�n c�i t�o kinh m�ch c�ng ��u t�n th�t th� kh� c�a ng��i, chuy�n n�y kh�ng ph�i t�y � l�m d�ng ���c ��u. ")
		elseif (Uworld92 >= 5) then		-- ϴ�������ﵽ����
			Talk(1,"","S� l�n ta gi�p ng��i c�i t�o kinh m�ch �� qu� nhi�u, hi�n nay th� kh� c�a ng��i �� khuy�t, n�u ti�p t�c c�i t�o kinh m�ch n�a ch�c ch�n s� g�p nh�ng nguy hi�m kh�ng l��ng. Chuy�n n�y ta th�t kh�ng d�m l�m, ng��i h�y �i t�m cao nh�n kh�c v�y!")
		else										-- ��������������GM��BUG
			Talk(1,"","Ta xem ng��i th�n s�c �m �m, �m kh� ��y m�t, s� b� ��i n�n trong nay mai. Ng��i b�y gi� ��ng n�n t�m ta, nhanh ch�ng �i t�m <color=red>Thi�n th�n<color> �i!")
		end
	elseif (Uworld76 == 50) then
		Talk(1,"B� ��o nh�n: ng�y nay th� s� ��o lo�n, nh�ng ng��i c� ���c l�ng nhi�t huy�t nh� ti�u huynh �� ��y kh�ng ph�i l� nhi�u")			
	else
		Talk(1,"","Trong D��c V��ng ��ng b�ch th�o phong ph�, qu� th�c l� 1 n�i t�t. T�y b�c hoang nguy�n m� c�ng c� ���c 1 n�i nh� v�y, �� th�y ���c s� di�u k� c�a th� gian, s� tuy�t v�i c�a t�o h�a. ")
	end
end

function sele3()
	Talk(2,"","Ng��i t��ng gi�p ng��i kh�c c�i t�o kinh m�ch l� c�ng vi�c nh� nh�ng �? Ta ph�i t�n r�t nhi�u s�c l�c, xong vi�c l�i ph�i m�t th�i gian r�t d�i �� t�nh d��ng! Vi�n Tinh H�ng b�o th�ch c�a ng��i c� th� gi�p ta kh�i ph�c nguy�n kh�!","N�u kh�ng cho xem th� th�i v�y, r� r�ng �� mang ra cho ta nh�n th�y r�i, v�y m� c�n ti�c kh�ng d�m �em 1 vi�n Tinh H�ng b�o th�ch ra! V�y m� c�n mu�n ta gi�p ng��i c�i t�o kinh m�ch sao? H�m! Th�i��ng ngh� ��n n�a!")
end

function W76_step()
	DelItem(393)
	SetTask(76,40)
	Msg2Player("��o nh�n qu� n�i v�i ng��i, mu�n tr� b�nh n�y, ph�i c�n r�ng �nh �i�n, n��c nhi�m �� v� c�nh b�ch v�n 3 lo�i thu�c pha ch� ")
	AddNote("��o nh�n qu� n�i v�i ng��i, mu�n tr� b�nh n�y, ph�i c�n r�ng �nh �i�n, n��c nhi�m �� v� c�nh b�ch v�n 3 lo�i thu�c pha ch� ")
end

function W76_end()                                   -- ���Ա����������
	Talk(1,"","Kh�ng ng� l�i c� ng��i nhi�t huy�t ��o ngh�a nh� ng��i, truy�n l�i cho nh� ng��i c�ng kh�ng ph�n l�i s� ��o! ")
	DelItem(370)                  -- ʧȥ����֮��
	DelItem(371)                  -- ʧȥ����֮ˮ
	DelItem(372)                  -- ʧȥ����֮��
	AddEventItem(375)                  -- �õ�Ѫ����
	AddMagic(396)          -- ѧ�ᡰ������¶��
	SetTask(76,50)
	Msg2Player("��a c�c thu�c pha ch� �� cho ��o nh�n qu�, l�y ���c Huy�t D�ng ��n, ��ng th�i h�c ���c k� n�ng  Xu�n Phong V� L� ")
	AddNote{"B� ��o nh�n c�m k�ch l�ng nhi�t huy�t c�a b�n, �� truy�n th� cho b�n Huy�t D�ng ho�n v� 'V� l� Tr�ng sinh', h�y mau �i c�u tr� B�n H�a �i! "}
end

function tuneprop_get()				-- ������
	pay_money = {20,40,60,80,100}		-- ����۸�ʵ��ʹ��ʱҪ*10000
	i = (GetTask(92) + 1)
	SetTaskTemp(8,pay_money[i]*10000)
	SetTaskTemp(50,0)
	Say("Th�nh th�t, s� ti�n �t �i n�y �� k�nh l�o ��o tr��ng m�i ���c. "..GetTaskTemp(8).."�� kh�ng ph�i l� con s� nh�, ta ph�i �i ki�m m�i ���c. ",2,"Coi nh� ng��i c�ng c� t�m l�ng ��, th�i ���c, ng��i mu�n tr� kh�i ph�n n�o? /tuneprop_go","S�c m�nh /no")
end

function tuneprop_jewel()
	SetTaskTemp(50,1)			-- ʹ�ñ�ʯ
	SetTaskTemp(8,0)			-- ���
	tuneprop_go()
end

function tuneprop_go()
	pay_money = GetTaskTemp(8)
	if (GetCash() >= pay_money) then
		Say("Th�n ph�p ",5,"S�c m�nh/tune_str","Th�n ph�p/tune_dex","Vi�c n�y. ta c�n ph�i v� suy ngh� l�i /tune_vit","N�i c�ng/tune_eng","S�c l�c c�a ng��i �� ��n m�c cao nh�t r�i, v�n c�n ch�a v�a � sao? Th� th� qu� th�c ta c�ng h�t c�ch.  /no")
	else
		Talk(1,"","Th�t ra kh�ng c� ti�n c�ng kh�ng sao, d� sao ng��i v�n l� m�t h�o h�n!")
	end
end

function tune_str()
	base_str = {35,20,25,30,20}			-- �������������������ϴǱ��ʱ��������ڴ�ֵ
	i = GetSeries() + 1
	if (GetStrg(1) < base_str[i] + 5) then		-- ϴ����������������������������ϴ
		Talk(1,"","S�c l�c c�a ng��i �� ��n m�c cao nh�t r�i, ng��i v�n c�n ch�a v�a � sao? Th� th� qu� th�c ta c�ng h�t c�ch!")
	else											-- ��ʼϴǱ�ܣ���ɺ��Զ�������
		AddStrg(-5)
		check_jewel()			-- ����Ƿ���Ҫ���ı�ʯ�����ǿ�Ǯ��ϴǱ�ܴ���
		Say("���c r�i! Theo � ng��i v�y! Ta m�t ch�t �i ���c! �� ta ngh� ng�i m�t l�t nh�!",1,"�a t� /no")
	end
end

function tune_dex()
	base_dex = {25,35,25,20,15}
	i = GetSeries() + 1
	if (GetDex(1) < base_dex[i] + 5) then		-- ϴ������������������������ϴ
		Talk(1,"","S�c l�c c�a ng��i �� ��n m�c cao nh�t r�i, ng��i v�n c�n ch�a v�a � sao? Th� th� qu� th�c ta c�ng h�t c�ch!")
	else											-- ��ʼϴǱ�ܣ���ɺ��Զ�������
		AddDex(-5)
		check_jewel()			-- ����Ƿ���Ҫ���ı�ʯ�����ǿ�Ǯ��ϴǱ�ܴ���
		Say("���c r�i! Theo � ng��i v�y! Ta m�t ch�t �i ���c! �� ta ngh� ng�i m�t l�t nh�!",1,"�a t� /no")
	end
end

function tune_vit()
	base_vit = {25,20,25,30,25}
	i = GetSeries() + 1
	if (GetVit(1) < base_vit[i] + 5) then		-- ϴ����⹦�����������������ϴ
		Talk(1,"","S�c l�c c�a ng��i �� ��n m�c cao nh�t r�i, ng��i v�n c�n ch�a v�a � sao? Th� th� qu� th�c ta c�ng h�t c�ch!")
	else											-- ��ʼϴǱ�ܣ���ɺ��Զ�������
		AddVit(-5)
		check_jewel()			-- ����Ƿ���Ҫ���ı�ʯ�����ǿ�Ǯ��ϴǱ�ܴ���
		Say("���c r�i! Theo � ng��i v�y! Ta m�t ch�t �i ���c! �� ta ngh� ng�i m�t l�t nh�!",1,"�a t� /no")
	end
end

function tune_eng()
	base_eng = {15,25,25,20,40}
	i = GetSeries() + 1
	if (GetEng(1) < base_eng[i] + 5) then		-- ϴ����ڹ������������������ϴ
		Talk(1,"","S�c l�c c�a ng��i �� ��n m�c cao nh�t r�i, ng��i v�n c�n ch�a v�a � sao? Th� th� qu� th�c ta c�ng h�t c�ch!")
	else											-- ��ʼϴǱ�ܣ���ɺ��Զ�������
		AddEng(-5)
		check_jewel()			-- ����Ƿ���Ҫ���ı�ʯ�����ǿ�Ǯ��ϴǱ�ܴ���
		Say("���c r�i! Theo � ng��i v�y! Ta m�t ch�t �i ���c! �� ta ngh� ng�i m�t l�t nh�!",1,"�a t� /no")
	end
end

function check_jewel()
	if (GetTaskTemp(50) == 1) then			-- �Ǳ�ʯϴ��
		DelItemEx(353)
	else
		Pay(GetTaskTemp(8))
		SetTask(92,GetTask(92)+1)
	end
	SetTaskTemp(50,0)			-- ��λ��ʱ����
	SetTaskTemp(8,0)
	return
end

function no()
end
