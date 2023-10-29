-- ���� ·��NPC ��ĦԺ���� 20������
-- by��Dan_Deng(2003-08-01)
-- update by: xiaoyang(2004\4\15) ������90������ 

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_sl = GetTask(7)
	Uworld122 = GetTask(122)
	if(GetSeries() == 0) and (GetFaction() == "shaolin") then
		if(UTask_sl == 20*256+128) then		--20�����������
			L20_prise()
		elseif((UTask_sl == 20*256) and (GetLevel() >= 20)) then		--20������
			Talk(2,"L20_get","G�n ��y c� 5 t�n �� t� ��n t� ��t B�, Ph�c Ki�n, do Ph��ng Tr��ng Nam Thi�u L�m �� c�, nh�ng do 5 t�n n�y �� g�y n�o lo�n Thi�u l�m, Ph��ng Tr��ng b� tay, hy v�ng b�n t� c� th� gi�o h�a b�n ch�ng, nh�ng b�n ch�ng qu� ng� ng��c c�ng ��u, kh�ng th�m nghe l�i khuy�n r�n. Th�t �au ��u qu�!","5 t�n ng� ng��c �� b�y gi� � ��u?")
		else
			Talk(1,"","Ng��i xu�t gia ch� tr�ng minh t�m ki�t t�nh!")
		end
	elseif(Uworld122 == 10) then
		Talk(5,"Uworld122_find","Huy�n Bi ��i s�! Tr�n ���ng l�n Hoa S�n ta th�y c� r�t nhi�u �� t� Thi�u L�m ��nh nhau ch� t�, kh�ng bi�t l� v� chuy�n g�?","Thi�u L�m mu�n ch�n ng��i th�ch h�p trong c�c �� t� ng��i th�ch h�p �� tu luy�n 72 tuy�t ngh� t�i T�ng Kinh C�c. Nh�ng k� gi�i giang ��u t� ��t Ma Vi�n c�a ta v� La H�n ���ng c�a Huy�n Nan. �� t� c�a La H�n ���ng kh�ng gi�ng c�a ��t Ma Vi�n,lu�n tranh gi�nh ��a v�, ��i kh�i c�u chuy�n l� nh� v�y.","��t Ma La H�n ��u t� Thi�u L�m, h� c� g� ph�i tranh gi�nh, ai h�c m� ch�ng ���c!","�� t� c�a ta si�u ph�m xu�t ch�ng, ch�n ai nh��ng ai?","Ch�ng ph�i La H�n ���ng c�ng thu�c Thi�u L�m sao?")
   elseif(Uworld122 >=20) and (Uworld122 < 30)then
   	Talk(1,"","�i t�m Huy�n Nan �i... ")
   elseif(Uworld122 == 30)then
   	Talk(5,"Uworld122_alow","��i s�! Huy�n Nan �a� s� kh�ng nghe ta khuy�n gi�i. Ta �i qua Hoa S�n th�y r�t nhi�u cao th� c�a Kim qu�c mai ph�c, e r�ng c� �m m�u g� ��.","Ng��i th�y th�t ch�?","Tuy�t kh�ng n�i d�i! ","�i��Ng��i h�y �i n�i c�c �� t� ��t ma Vi�n ��ng ��nh nhau n�a. ��y l� l�nh b�i c�a ta. N�u th�t s� l� qu�n Kim, hy v�ng c� th� gi�p ti�u t� di�t ch�ng.","T�i h� xin tu�n l�nh.")
	elseif (Uworld122 == 50) and (HaveItem(392) == 0) then
   	Talk(1,"","Th� ch� �� �� qu�n m�t l�nh b�i n�i l�o n�p ��y, kh�ng c� n� e �� t� Thi�u L�m kh�ng tin")
   	AddEventItem(392)
   	Msg2Player("Nh�n l�i l�nh Thi�u L�m t�ng ch�ng ")
   elseif(Uworld122 >= 50) and (Uworld122 <= 60) then
   	Talk(1,"","C� th� th�t s� ch�ng ta �� sai... ")
   elseif (Uworld122 == 65) and (HaveItem(392) == 1) then
   	Talk(4,"U122_finish","M�i nguy hi�m Hoa S�n �� ���c h�a gi�i, may l� ��n k�p kh�ng x�y ra th��ng vong g� h�t.","B�n t�ng �� nh�n ���c tin c�a �� t�, th�t x�u h� l�m sao." ,"��i s� ��ng n�n nh� v�y, trong hi�m nguy m� ng�i qu� quy�t ���c s� vi�c ��ng l� b�n s�c anh h�ng.","Anh b�n tr� ��ng tr�u l�o n�p n�a, ng��i h�y ��n t�m Huy�n Nan �i �ng ta c� chuy�n mu�n n�i v�i ng��i ��, ha ha.!")
   else							-- ����Ի�
		Talk(1,"","Ch��ng m�n s� huynh m�y n�m nay ngh� c�ch ch�ng Kim ��n �� l�ng mi c�ng b�c tr�ng lu�n.")
	end
end;

function L20_get()
	Say("H� �� �i Ph�c Ng�u s�n T�y. M�y ng��i n�y � c� v�i chi�u �� kh�ng xem ng��i Trung Nguy�n trong m�t h�.",2,"�� ta �i gi�o hu�n b�n ch�ng. /L20_get_yes","E r�ng ta kh�ng l�m ���c /L20_get_no")
end;

function L20_get_yes()
	Talk(1, "", "H� t� xa ��n c�ng xem nh� l� kh�ch, ng��i ra tay ph�i d� ch�ng ��.")
	SetTask(7,20*256+64)
--	SetTaskTemp(42,0)			-- ������ʱ������TaskTemp��ID��Ϊ42����ȡ����ʱ������
	AddNote("Thay ��t Ma Vi�n th� t�a Huy�n Bi ��i s� gi�o hu�n n�m g� ng� ng��c. ")
	Msg2Player("Thay ��t Ma Vi�n th� t�a Huy�n Bi ��i s� gi�o hu�n n�m g� ng� ng��c. ")
end;

function L20_get_no()
end;

function L20_prise()
	Talk(2,"","S� th�c! Ta �� thu ph�c 5 t�n man r� kia, t� nay v� sau h� kh�ng d�m g�y s� n�a ��u!","Ng� Ph�t t� bi! Thi�n tai thi�n tai!")
	SetTask(7,30*256)
	SetRank(3)
--	AddMagic(15)
	add_sl(30)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
	AddNote("Thu ph�c ���c n�m g� ng� ng��c, th�ng c�p H� T� Kim Cang. ")
	Msg2Player("Ch�c m�ng b�n! B�n �� th�ng c�p H� T� Kim Cang c�a Thi�u L�m t�! H�c ���c v� c�ng B�t ��ng Minh V��ng. ")
end;

function Uworld122_find()
	Talk(1,"","Huy�n Bi:... Ng��i h�y �i t�m Huy�n Nan �i. ")
	SetTask(122,20)  --�����������20
	Msg2Player("Huy�n Bi �p �p m� m� kh�ng ��p, b�o b�n �i t�m Huy�n Nan h�i cho r�. ")
	AddNote("Huy�n Bi �p �p m� m� kh�ng ��p, b�o b�n �i t�m Huy�n Nan h�i cho r�. ")
end

function Uworld122_alow()
	AddEventItem(392)
	Msg2Player("L�y ���c Thi�u L�m t�ng ch�ng l�nh. ")
	SetTask(122,50)  --�����������50
	Msg2Player("��p �ng Huy�n Bi, ��n Hoa s�n c�u c�c �� t� Thi�u L�m, gi�t t��ng l�nh Kim qu�c. ")
	AddNote("��p �ng Huy�n Bi, ��n Hoa s�n c�u c�c �� t� Thi�u L�m, gi�t t��ng l�nh Kim qu�c. ")
end

function U122_finish()
	DelItem(392)
	Msg2Player("Giao l�i Thi�u L�m t�ng ch�ng l�nh. ")
	SetTask(122,70)
	Msg2Player("H�a gi�i v�i Huy�n Bi, �i t�m Huy�n Nan. ")
	AddNote("H�a gi�i v�i Huy�n Bi, �i t�m Huy�n Nan. ")
end
