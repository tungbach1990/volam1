-- \script\��������\��ɽ\npc\·��_uworld122_���ѷ�.lua
-- by xiaoyang(2004\4\15) ����90������

Include("\\script\\global\\repute_head.lua")

function main()
	Uworld122 = GetTask(122)
	Uworld38 = GetByte(GetTask(38),2)
	if(Uworld122 < 10) and (GetLevel() >= 90) and (Uworld38 == 127) and (GetReputeLevel(GetRepute()) >= 5) and (GetFaction() ~="shaolin" ) then
		Talk(8,"U122_get","L� huynh! Lu�n v� v�n th� �� kh�ng b�ng huynh, nh�ng t�p v� kh�ng nh� ��c s�ch, c�n c�n ph�i c� c�ng phu","Th��ng huynh! S�ch � T�ng kinh c�c c� ng�n v�n, n�u nh� ai c�ng nh� huynh kh�ng ch�u ��c s�ch th� Ph�t ph�p Thi�u L�m �� s�m kh�ng t�n t�i tr�n th� gian.","Ph�t ��o l� ph�i t� nhi�n, tu h�nh kh�ng nh�t thi�t ph�i theo s�ch v�. Hu�ng chi Th��ng m� tuy ch�a t�ng ��c s�ch nh�ng ��u ph�i kh�ng bi�t ch�. V� c�ng c�a huynh kh�ng nh� ta, l�i mu�n h�c v� c�ng th��ng th�a","Nh� th� l� kh�ng h�p l�. Ch�a c�a ta tru�c khi h�c v� ph�i nghi�n c�u Ph�t �i�n v� gi�i b� t�i l�i �i, n�u kh�ng s� ch�t s�m, ta ch� mu�n t�t cho huynh th�i.","N�i nh� v�y, ��nh ph�i so t�i m�t tr�n. Thi�u L�m nghi�m c�m ��ng m�n t��ng t�n, ch�ng ta l�n l�i ��i Hoa S�n c�ng b�ng so t�i, sinh t� do tr�i ��nh.","��u th� ��u! �� khuy�n huynh ch� kh�ng ph�i l� �� s� huynh!","Ha! Ha! Hai v�! T�i h� ��ng b�n ngo�i nghe h�t c�. Thi�u L�m l� v� l�m b�c ��u. Hai v� kh�ng n�n s�t th��ng t�nh m�nh nhau","V� n�y...t�i h� c�ng l� b�t ��c d� th�i!")
	elseif(Uworld122 > 10) and (Uworld122 < 50) then
		Talk(2,"","L� huynh kh�ng nh��ng cho th� t�i h� c�ng kh�ng kh�ch kh� ��u.","T�i h� c� �u th� r� r�ng, Th��ng huynh ch� l�m kh�!")
	elseif (Uworld122 == 60) then
		Talk(4,"Uworld122_ashamed","Th��ng huynh! L� huynh! Hai v� ��ng th� n�a!","C�m t� �n c�u m�ng c�a c�c h�!","��ng m�n t��ng tranh, h�u qu� kh� l��ng,h�i h�n c�ng kh�ng k�p!","Thi�u L�m l� r��ng c�t c�a v� l�m, t�i h� c� th� gi�p �� ���c hai v�, th�t vinh h�nh! M�i vi�c �� x� l� xong! Ta ph�i quay v� Thi�u L�m ph�c m�nh.")
   elseif (Uworld122 == 50) and (HaveItem(392) == 1) then
   	Talk(4,"U122_step","Thi�u L�m T�ng Ch�ng l�nh � ��y! �� t� Thi�u L�m l�p t�c nghe l�nh!","Ch�nh th�c l� Thi�u L�m T�ng Ch�ng l�nh! Ta xin tu�n theo hi�u l�nh!","C�c h� c� sai khi�n!","Hi�n t�i qu�n Kim �ang �n n�p trong n�i Hoa S�n, �� bao v�y ch�ng ta. Ch�ng ta th�a l�c ch�ng �ang b� tr�, chia ra ��nh gi�i v�y, sau �� t�p h�p l�i.")
   elseif (Uworld122 == 50) then			-- ״̬��ȷ����û������
   	Talk(1,"","Ng��i l� ai? D�a v�o c�i g� m� can thi�p v�o chuy�n c�a ch�ng ta?")
   elseif (Uworld122 == 55) then			-- �����е�ȱʡ�Ի�
   	Talk(2,"","Nhi�m v� c�a ta �� ho�n th�nh, b�n huynh th� n�o?","Ta th�t kh�ng y�n t�m, c�c huynh quay l�i xem th�, ��i ta m�t l�t!.")
   elseif (Uworld122 == 65) and (HaveItem(392) == 0) then		-- ����ȡ������
   	Talk(1,"","�a t� �n c�u m�ng c�a c�c h�, ��y l� l�nh b�i xin g�i l�i!")
   	AddEventItem(389)
   	Msg2Player("L�y l�nh b�i Thi�u L�m v� ")
   elseif (Uworld122 >= 240) then		-- ���������
   	Talk(1,"","L�n tr��c nh�t th�i h� ��, n�u kh�ng c� c�c h� t��ng tr� th� qu� th�t h�u qu� kh� l��ng!")
   else
   	Talk(1,"","Th��ng huynh! L�n n�y ta t� v� c� nh�n, n�u s� ph� bi�t nh�t ��nh s� tr�ch m�ng ��ng kh�ng?")
   end
end

function U122_get()
	if (GetCamp() == 0) and (GetTask(75) < 255) then		-- ����δѧҰ��ȭ�ģ������������
		Talk(1,"","Xem huynh c� v� kh�ng kho�, hay l� ��ng c�ch xa tr�n chi�n �� tr�nh b� s�t th��ng.")
	else
		Say("N�i nh� v�y, n�u huynh ch�u nh��ng danh hi�u, t�i h� quy�t kh�ng l�m kh� kh�n!",2,"Xem ra th� khuy�n hai ng��i kh�ng xong, ta ��nh l�n Thi�u L�m m�t chuy�n, h�i r� c�n nguy�n. /Uworld122_yes","C�c huynh ��nh th� c� ��nh, kh�ng li�n can ��n ta, khuy�n r�i m� c�c huynh kh�ng nghe, b� thi�t th�i l� c�c huynh. /Uworld122_no")
	end
end

function Uworld122_yes()
	Msg2Player("�� t� Thi�u L�m Th��ng B�ch L� v� L� ��ch Phong v� tranh h�c v� c�ng th��ng th�a m� quy�t ��u s�ng ch�t. B�n ��nh l�n Thi�u L�m t�m s� ph� c�a h� �� khuy�n ng�n. ")
	AddNote("�� t� Thi�u L�m Th��ng B�ch L� v� L� ��ch Phong v� tranh h�c v� c�ng th��ng th�a m� quy�t ��u s�ng ch�t. B�n ��nh l�n Thi�u L�m t�m s� ph� c�a h� �� khuy�n ng�n. ")
	SetTask(122,10) --������������
end

function Uworld122_no()
end

function U122_step()
	DelItem(392)
	SetTask(122,55)			-- ���������
	Msg2Player("T�m ra ch� qu�n Kim, gi�t t��ng l�nh sau �� l�i t�p h�p. ")
end

function Uworld122_ashamed()
	SetTask(122,65)  --�����������Ϊ60
  	AddEventItem(392)		-- �˴���ȡ������
	Msg2Player("C�u Th��ng B�ch L� v� L� ��ch Phong, mang l�nh b�i Thi�u L�m v� Thi�u L�m b�o tin. ")
	AddNote("C�u Th��ng B�ch L� v� L� ��ch Phong, v� Thi�u L�m b�o tin. ")
end
