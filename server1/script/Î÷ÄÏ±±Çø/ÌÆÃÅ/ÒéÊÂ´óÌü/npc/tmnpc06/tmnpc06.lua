--description: ������һ�� 20������50������
--author: yuanlan	
--date: 2003/3/12
--Dan_Deng(2003-07-22), ������������ĵȼ�Ҫ��
-- Update: Dan_Deng(2003-08-13)
-- Update: Dan_Deng(2004-05-25) ϴ��ԩ������

Include("\\script\\global\\repute_head.lua")

function main()
	UTask_tm = GetTask(2);
	Uworld51 = GetTask(51)
--	if (GetTask(123) >= 80) and (Uworld51 < 10) and (GetReputeLevel(GetRepute()) >= 8) then		-- ϴ��ԩ����������
		--		Talk(2,"Uworld51_get", 13429, 13430)
	if (Uworld51 == 20) then
		Talk(5,"Uworld51_30","Ta c�ng kh�ng khohuynh �yy ��ng nh�n, v�n �ang t�m c�ch. Ch� v� cha ta hi�n �ang nghi ng� ta, ta h�nh ��ng e kh�ng ti�n.","Nh�ng ta �� bi�t ���c m�y ng�y tr��c c� m�y v� cao th� Thi�u L�m g�p n�n, th��ng t�ch r�t gi�ng v�i tuy�t k� c�a B�n m�n g�y ra, cha ta nghi ng� ta �� ti�t l� tuy�t k� c�a m�n ph�i.","Ng��i n�i �i g�p M�n ch� gi�i th�ch r�!","V� d�ng th�i! Cha ta �ang t�c gi�n v�n kh�ng cho ta c� h�i gi�i th�ch. Ngay c� tin n�y ta c�ng ch� nghe ���ng H�c n�i th�i.","N�u v�y� M�n ch� kh�ng c� th�nh ki�n v�i ta, c� l� ta c� th� gi�p �ng.")
	elseif (Uworld51 == 55) then
		Talk(6,"Uworld51_60","Nh�t Tr�n c�ng t�, ta v�a nghe tin t�c t� Thi�n Nh�n gi�o, chuy�n �m s�t cao th� Thi�u L�m qu� nhi�n l� do h� l�m. B�t Nhi�m c�ng t� v� mu�n tranh quy�n v�i ng��i �� �em M�t t�ch B�n m�n ��a cho Thi�n Nh�n gi�o.","Co chuy�n v�y sao? B�t Nhi�m cho d� mu�n tr� th�nh M�n ch� c�ng kh�ng n�n l�m v�y.","��nh ti�c ta �ang b� nghi ng�, cha ta l�i kh�ng tin ta n�i, ta ph�i l�p t�c ��n th��ng l��ng v�i ���ng H�c s� ph� m�t ch�t.","M�c ti�u th�ch s�t ti�p theo c�a Thi�n Nh�n gi�o l� C�i Bang, xin c�ng t� nh�c nh� C�i Bang tr�nh �� Thi�n Nh�n gi�o th�a c� h�m h�i.","B� ki�p B�n m�n l�t v�o tay ��i th� nh�t ��nh ph�i l�y l�i, hay l� nh� ng��i ti�u di�t t�n th�ch kh�ch, l�y l�i b� ki�p.","���c th�i!")
	elseif (Uworld51 == 70) and (HaveItem(377) == 1) then				-- ϴ��ԩ�������Ѿ��������
		Talk(2,"Uworld51_80","Nh�t Tr�n c�ng t�! T�i h� �� ho�n th�nh s� m�nh l�y l�i b� ki�p.","�a t� ng��i! Ta �� th��ng l��ng v�i ���ng H�c s� ph�, xin ng��i h�y n�i r� ch�n t��ng v�i cha ta. V� chuy�n n�y do ng��i �i�u tra ���c, ch� c� ng��i n�i m�i c� s�c thuy�t ph�c.")
	elseif (Uworld51 == 90) then
		Talk(2,"Uworld51_100","Cha ta n�i th� �? Hay qu�! Ta ph�i b�o tin n�y cho H�m Y�n m�i ���c."," Ha ha! �� ta �i m�t chuy�n, l�n tr��c l� b�o tin x�u, l�n n�y ph�i �� ta b� ��p.")
	elseif (GetFaction() == "tangmen") and (GetSeries() == 1) then
		if (UTask_tm == 20*256) and (GetLevel() >= 20) then		--20����������
			Talk(2, "L20_get", " Ta c� 1 ng��i c� t�n l� <color=Red>���ng U<color>, l� ng��i mu�i mu�i duy nh�t c�a cha ta, nh�ng v� �� l�m tr�i m�n quy, k�t h�n v�i ng��i b�n ngo�i, �� b� T� ph� tr�c xu�t kh�i gia m�n, hai m��i n�m nay ch�a t�ng g�p m�t, ta bi�t cha ta ngo�i m�t kh�ng n�i, nh�ng trong l�ng r�t nh� ��n mu�i mu�i.", "V�y sao Ch��ng m�n kh�ng ��n b� ta v�, c� nh� �o�n vi�n?")
		elseif (UTask_tm == 20*256+60) then 
			Talk(2, "", "���ng U s� c� �� tha th� cho Ch��ng m�n. B� ta b�o ta �em <color=Red>Kim H�ng khuy�n<color> n�y giao cho Ch��ng m�n.", "Th�t �? Hay qu�! Ng��i qu� l� c� b�n l�nh, mau �em<color=Red> Kim H�ng khuy�n<color> giao cho cha ta! �ng ta �ang � <color=Red>ph�ng kh�ch<color>.")
			Msg2Player("V� ph�ng Ngh� S� t�m ���ng Nh�t Tr�n, ���c bi�t Ch��ng m�n ���ng C�u �ang � Ph�ng kh�ch.")
			SetTask(2,20*256+70)
		elseif (UTask_tm == 20*256+70) then
			Talk(1, "", "T�t qu�! Mau �em Kim H�ng khuy�n giao cho cha ta! �ng ta �ang � <color=Red>ph�ng kh�ch<color>.")
		elseif (UTask_tm == 50*256+20) then		--50������
			Talk(4, "", "��i s� huynh! Huynh bi�t t�i qua ai v�o ph�ng �m kh� kh�ng?", "T�i qua h�nh nh� <color=Red>Tam s� �� ���ng H�a<color> v� <color=Red>Ng� s� �� ���ng Nguy�n <color> � ��.", "Kh�ng bi�t hi�n gi� h� �ang � ��u?", "<color=Red>Ng� s� ��<color> v�a m�i v�i v� ��n <color=Red>Giang T�n th�n<color> �� th�m ng��i c�u b� b�nh, tam s� �� ra ngo�i nh�ng kh�ng bi�t �i ��u. ")
			SetTask(2, 50*256+40)
			Msg2Player("T�i ph�ng Ngh� s�, t� ���ng Nh�t Tr�n bi�t ���c tam s� huynh ���ng H�a v� ng� s� huynh ���ng Nguy�n c� �i qua ph�ng �m Kh�, bi�u hi�n kh� nghi nh�t.")
			AddNote("T�i ph�ng Ngh� s�, t� ���ng Nh�t Tr�n bi�t ���c tam s� huynh ���ng H�a v� ng� s� huynh ���ng Nguy�n c� �i qua ph�ng �m Kh�, hai ng��i c� v� kh� nghi. ���ng Nguy�n �i Giang T�n Th�n th�m ng��i c�u, c�n ���ng H�a kh�ng bi�t �i ��u n�a.")
		elseif (UTask_tm == 50*256+40) then							--50������
			Talk(1,"","Sao ng��i l�i h�i ai �� v�o ph�ng �m kh�? �� x�y ra chuy�n g� ph�i kh�ng?")
		elseif (UTask_tm > 20*256) and (UTask_tm < 30*256) then					--�Ѿ��ӵ�20��������δ���
			Talk(1,"","Ch�ng c� ch�t �i, c� c� c� ��n � trong ng�i nh� tranh � h�u s�n <color=Red>V� T�m c�c<color>. T� �� b� �y kh�ng mu�n g�p m�t ng��i trong ���ng m�n, ta �� ��n �� nhi�u l�n nh�ng ch� ��ng <color=Red>tr��c c�a<color> th�nh an b�, l�n n�y nh� ng��i v�y! ")
		elseif (UTask_tm >= 30*256) then					--�Ѿ����20��������δ��ʦ
			Talk(1,"","�a t� ng��i �� h�a gi�i �n o�n gi�a cha ta v� c� c�! ")
		else
			Talk(1,"","���ng m�n l� m�t tr� c�t trong gi�i v� l�m, kh�ng nh�ng d�a v�o v� c�ng m� c�n l� c�ng phu �m kh�. V� m�t �m kh� l� th� m�nh c�a ch�ng ta.")
		end
	elseif (Uworld51 >= 10) and (Uworld51 < 100) then		-- ϴ��ԩ�����񣺽�����
		Talk(1,"","Nh�t Tr�n tuy l� b�t t�i t� nh�ng kh�ng v� th� m� �em tuy�t h�c v� c�ng truy�n ra ngo�i. ")
	elseif (Uworld51 >= 100) then					-- ϴ��ԩ�������Ѿ����
		Talk(1,"","N�u kh�ng ph�i ng��i gi�p ta r�a s�ch oan t�nh, chuy�n n�y kh�ng bi�t s� ra sao n�a, ta v� H�m Y�n ph�i c�m �n ng��i m�i ��ng!")
	elseif (UTask_tm >= 70*256) then							--�Ѿ���ʦ
		Talk(1,"","C� r�nh nh� v� th�m ch�ng ta.")
	else
		Talk(1,"","Ng��i l� �� t� m�i nh�p m�n ph�i kh�ng?")
	end
end;

function L20_get()
	DelItem(41)							--��ֹ�ؽ��������Ҽ����������
	Say("th��ng l��ng", 2, "�� ta ngh� c�ch xem sao/L20_get_yes", "Kh�ng c� c�ch/L20_get_no")
end;

function L20_get_yes()
	Talk(1,"","Ch�ng c� ch�t �i, c� c� c� ��n � trong ng�i nh� tranh � h�u s�n <color=Red>V� T�m c�c<color>. T� �� b� �y kh�ng mu�n g�p m�t ng��i trong ���ng m�n, ta �� ��n �� nhi�u l�n nh�ng ch� ��ng <color=Red>tr��c c�a<color> th�nh an b�, l�n n�y nh� ng��i v�y! ")
	SetTask(2, 20*256+20)
	AddNote("T�i ph�ng Ngh� s� (507,319) g�p ���ng Nh�t Tr�n, nh�n<color=red> nhi�m v� ���ng U<color>, ��n V� T�m C�c h�a gi�i �n o�n huynh �� gi�a s� c� ���ng U v� ch��ng m�n.")
	Msg2Player("T�i s�nh Ngh� s� g�p ���ng Nh�t Tr�n, nh�n nhi�m v�: �i V� T�m C�c h��ng B�c h�a gi�i �n o�n huynh �� gi�a s� c� ���ng U v� ch��ng m�n.")
end;

----------------------- �������� --------------------------
function Uworld51_get()
	Say("Ai da! n�i ra d�i l�m�c� th� gi�p ta gi�p ta chuy�n l�i Do�n H�m Y�n?",2,"Chuy�n �� d� th�i, m� n�i dung trong tin l� g� v�y?/Uworld51_get_yes","ta nh�c ��u l�m, ng�i t�m ng��i kh�c gi�p �� �i./L20_get_no")
end

function Uworld51_get_yes()
	Talk(1,"","N�i v�i c� ta: Cha ta kh�ng bi�t th� n�o ��t nhi�n l�i ph�n ��i h�n s� c�a ch�ng ta, h�n l� c� th� th� s� kh� kh�n, nh�ng c� ta ��ng qu� lo l�ng.")
	SetTask(51,10)
	Msg2Player("Ti�p nh�n nhi�m v�: Gi�p ���ng Nh�t Tr�n mang tin t�i Do�n H�m Y�n.")
	AddNote("Ti�p nh�n nhi�m v� 'R�a s�ch oan �c': Gi�p ���ng Nh�t Tr�n ��a tin t�i cho Do�n H�m Y�n.")
end

function Uworld51_30()
	SetTask(51,30)
	Msg2Player("B�n quy�t ��nh �i g�p M�n ch� ���ng C�u, gi�p ���ng Nh�t Tr�n gi�i th�ch.")
end

function Uworld51_60()
	SetTask(51,60)
	Msg2Player("���ng Nh�t Tr�n m�i b�n �i Ti�n C�c ��ng ti�u di�t th�ch kh�ch Kim Qu�c, �o�t b� ki�p v�.")
end

function Uworld51_80()
	SetTask(51,80)
	Msg2Player("���ng Nh�t Tr�n c�m �n b�n gi�p ��, ��ng th�i hy v�ng b�n c� th� gi�p �ng ta n�i r� v�i M�n ch� ���ng C�u.")
end

function Uworld51_100()
	SetTask(51,100)
	i = random(35,45)
	AddRepute(i)		-- ������
	Msg2Player("���ng Nh�t Tr�n c�m �n s� gi�p �� c�a b�n, Danh v�ng c�a b�n t�ng th�m"..i.."�i�m.")
	Msg2Player("B�n t� nguy�n �em tin t�t b�o cho Do�n H�m Y�n, gi�p c� ta gi�m b�t s� lo �u ch� ��i.")
end

function L20_get_no()
end;
