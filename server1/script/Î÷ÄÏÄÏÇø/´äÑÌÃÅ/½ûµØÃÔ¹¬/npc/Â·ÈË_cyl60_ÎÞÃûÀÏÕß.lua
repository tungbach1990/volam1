-- �����Ž����Թ� ·��NPC �������ߣ������ų�ʦ����
-- by��Dan_Deng(2003-07-27)

function main()
	UTask_cy = GetTask(6)
	if ((UTask_cy == 60*256+10) and (HaveItem(237) == 1)) then				--��ʦ���������
		Talk(6,"L60_talk1","Ng��i l� ai? D�m x�ng v� �o�n Tr��ng C�c, mu�n ch�t �?","Khoan ��! L�o b�! � ��y c� m�t kh�n t�, xin �ng xem qua! ","Kh�n t�?! ��a ��y!...............Ng��i.....ng��i l� ai? Kh�n t� n�y t� ��u m� c�? ","V�n b�i l� �� t� Th�y Y�n, kh�n t� n�y l� V�n b�i l�y trong s�n ��ng. Xu�n H��ng b� b� b�o V�n b�i ��n t�m �ng!","Xu�n H��ng b� b�? Xu�n H��ng con ti�u nha ��u �� �� tr� th�nh 1 b� l�o? �i! Ta kh�ng mu�n nh�c l�i chuy�n n�m x�a n�a!")
	elseif (UTask_cy >= 60*256+20) and (UTask_cy < 70*256) and (HaveItem(235) == 0) then		--��ʦ�����У����Ŷ���
		AddEventItem(235)
		Msg2Player("Nh�n ���c b�c th� n�i r� t�nh h�nh c�a �ng l�o v� danh. ")
		AddNote("Nh�n ���c b�c th� n�i r� t�nh h�nh c�a �ng l�o v� danh. ")
		Talk(1,"","Th� c�ng kh�ng c�, ng��i l�y g� �� gi�i v�y Ti�u Ch�n?")
	elseif (UTask_cy >= 60*256+20) then				-- �����Ѿ���ʶ�����������
		Talk(1,"","Ng��i kh�ng c�n ph�i khuy�n n�a, su�t ��i n�y ta s� kh�ng r�i c�c.")
	else
		Talk(1,"","Ng��i l� ai? D�m x�ng v� �o�n Tr��ng C�c, mu�n ch�t �?")
		Msg2Player("Nh� c�m th�y s�c c�a m�t ng�n n�i �� l�n, tr��c m�t c�a b�n m�i th� d��ng nh� ��u tan bi�n. ")
		Msg2Player("B�n b� �ng l�o v� danh trong c�m ��a gi�t ch�t r�i! ")
		KillPlayer()
	end
end;

function L60_talk1()
	Talk(2,"L60_talk2","N�m �� Ti�u T�n-- c�ng l� S� t� c�a ng��i, l� T� s� s�ng l�p Th�y Y�n m�n, b� ng��i m�nh y�u b� r�i n�n �au kh� m� t� v�n. C�n c�i k� ph� t�nh ph� ngh�a ch�nh l� ��i ca c�a ta. Ti�u Ch�n kh�ng cam t�m b� b� r�i, nghe ���c tung t�ch c�a gia m�n ta n�n mu�n ��i di�n ch�t v�n s� b�i ��c c�a ��i ca ta, v� t�nh ph�t hi�n ���c s� th�t.","Ho� ra � ��i ca ta v�n c� m�t th� t� b� b�nh n�m li�t gi��ng, do c� h�n ��c tr��c. C�n Ti�u Ch�n sau n�y m�i quen bi�t, ban ��u huynh �y mu�n t� h�n nh�ng v� m�t l�n ngo�i � mu�n m� to�n th�n b� b�i li�t. ��i ca kh�ng d�m m� mi�ng t� h�n, ��nh ph�i ph� l�ng Ti�u Ch�n. Ti�u Ch�n sau khi bi�t s� th�t tuy kh�ng bi�t h�n ��i ca ta n�a nh�ng t� �� con tim tr� th�nh b�ng gi�.")
end;

function L60_talk2()
	Talk(2,"L60_talk3","C�n ta, v�a m�i g�p Ti�u Ch�n kh�ng th� k�m ���c l�ng m�nh. Tuy y�u n�ng �y, nh�ng ta bi�t m�nh kh�ng x�ng ��ng. N�ng �y v� anh trai ta m�i l� m�t ��i tr�i ��nh. Ta ch� mong n�ng �y h�nh ph�c v� kh�ng mu�n nh�n n�ng �au kh�. �� k�t n�i anh trai c�a ta v� Ti�u Ch�n, ta �� l�n b� thu�c ��c v�o c�m c�a ��i t�u, nh�ng kh�ng ng� r�ng v� ta nh�t th�i h� �� m� �� g�y n�n t�i l�n t�y ��nh.","Sau khi ��i t�u ch�t th� m� c� �y ��i kh�m t� thi, k�t qu� m�i chuy�n b�i l�, ng��i nh� c� �y �i ki�n � quan ph�. Trong l�c ho�ng s� �� b� ��i ca ph�t hi�n. ��i ca v� mu�n c�u ta n�n l�n quan ph� ��u th� nh�n h�t t�i c�a ta, ta v�n gi�p anh c�a m�nh nh�ng ng��c l�i �� h�i ch�t anh. Ta ��ng l� kh�ng b�ng m�t con ch�. Sau �� ta �em m�i s� th�t n�i v�i Ti�u Ch�n.")
end;

function L60_talk3()
	Talk(2,"L60_talk4","Th� Ti�u Ch�n... � kh�ng! S� t� c� h�n �ng kh�ng?","D� cho n�ng �y c� h�n ta nh� th� n�o �i n�a, ta c�ng kh�ng tr�ch n�ng �y nh�ng �i�u l�m cho ta �au l�ng l� m�t c�u tr�ch c� ta c�ng kh�ng c�, n�ng ch� l�ng l� th� d�i, kh�ng n�i v�i ta ti�ng n�o. Ta r�t �au kh� v� �� n�i v�i n�ng nh�ng l�i m� b�y l�u nay ta gi� trong l�ng r�ng ta y�u n�ng �y, ta mu�n ���c ch�m s�c cho n�ng su�t ��i, b�i v� ta th�t s� y�u n�ng!")
end;

function L60_talk4()
	Talk(6,"L60_talk5","Kh�ng ng� sau khi nghe ta n�i n�ng kh�ng c� m�t bi�u hi�n g�, ch� n�i duy nh�t m�t c�u: 'Ng��i �i �i! Ta mu�n qu�n h�t c�c ng��i'!","Th� �ng l�o c� �i kh�ng?","Ta c�n c� th� �i ��u ���c? Con tim ta �� tr�t trao cho n�ng, ta c�n c� th� �i ��u? T�m ���c n�i n�y, ta � l�i ��y lu�n, hy v�ng m�t ng�y n�ng s� tha th� cho ta! ","C� l� b� �y kh�ng h� gi�n �ng ��u, con tim c�a b� �y �� ch�t theo ��i ca c�a ng��i r�i! ","��m ��m ta ��u ��n b�n c�a s� c�a n�ng van xin n�ng tha l�i, cho ��n m�t ng�y n�ng g�i cho ta m�t b�c th�, trong th� n�i: '50 n�m! N�u ng��i c� th� ��i 50 n�m c� l� ta s� ch�p nh�n ng��i!'","V� l�i h�a n�y m� �ng m�i ��i � trong c�c n�y cho ��n ng�y h�m nay �?")
end;

function L60_talk5()
	Talk(3,"L60_talk6","Kh�ng sai! Ta � trong n�y ng�y ch� ��m ��i ch� hy v�ng m�t ng�y n�ng ch�p nh�n ta, ��n nay, ��n nay ta v�n c�n mong ��i n�ng! Tuy l� Xu�n H��ng k�u ta ��n, n�ng l� a ho�n th�n th�ch c�a Ti�u Ch�n, nh� v�y c� th� n�i Ti�u Ch�n �� tha th� cho ta! Ng��i.... ng��i h�y l�p t�c d�t ta �i g�p n�ng! ","L�o b�! �ng �� nhi�u n�m r�i kh�ng ra kh�i c�c n�n kh�ng bi�t b�n ngo�i th�t s� �� thay ��i, Ti�u Ch�n m� �ng n�i ch�nh l� s� t� c�a s� m�n, ng��i �� kh�ng c�n n�a! ","Ng��i n�i c�i g�? L�m sao c� th� ch�? T�i sao n�ng l�i �Ta kh� s� ��i n�ng bao nhi�u n�m, m� n�ng kh�ng g�p ta m�t l�n m� �� ra �i, ta kh�ng bao gi� ���c g�p n�ng n�a r�i, hu hu.....")
end;

function L60_talk6()
	Talk(2,"L60_talk7","L�o b�! Chuy�n �� qua r�i xin ��ng qu� �au bu�n, c� ��i s� t� �� l�y v� t�nh. Ra �i kh�ng ph�i l� m�t c�ch gi�i tho�t hay sao? Sinh ly t� bi�t kh�ng ph�i l� chuy�n m� ch�ng ta c� th� ��nh ���c. Ch� c�n t�nh c�m m� �ng d�nh cho s� t� kh�ng h� thay ��i, th� ng��i m�i m�i v�n � trong l�ng �ng, m�i m�i kh�ng r�i nhau.","�� nhi�u n�m tr�i qua gi�ng nh� l� m�t gi�c m�, ta v�n lu�n mong g�p m�t n�ng, ��n h�m nay bi�t ���c n�ng �� ch�t, tr�i l�i ta nh� tr�t ���c g�nh n�ng trong l�ng! ")
end;

function L60_talk7()
	Talk(4,"L60_talk8","Ch� ��ng ti�c! Ng��i kh�c kh�ng bi�t s� th�t, c�n cho r�ng S� t� l� m�t ng��i l�nh l�ng v� t�nh! ","M�i ng��i �� hi�u l�m Ti�u Ch�n r�i, n�u nh� n�ng ta l� m�t ng��i tuy�t t�nh th� ta c�ng s� kh�ng � n�i ��y. Ng��i ��i ch� bi�t m�t m� kh�ng bi�t hai, �� ��n ��i kh�ng ��ng l�m h�i cho ng��i t�t. Ta � ��y v�n c�n l�u gi� nh�ng b�c th� m� khi �� Ti�u Ch�n �� vi�t cho ta, ng��i �em nh�ng b�c th� n�y giao cho Ch��ng m�n, m�i ng��i xem xong th� s� r� ch�n t��ng s� vi�c! ","Th� th� t�t qu�! Sau n�y l�o c� d� ��nh g� kh�ng?","Ti�u Ch�n �� ch�t r�i, c� ��i n�y ta s� kh�ng r�i kh�i c�c!")
end;

function L60_talk8()
	SetTask(6,60*256+20)
	DelItem(237)
	AddEventItem(235)
	Talk(1,"","N�u �� nh� th� l�o b� xin b�o tr�ng, v�n b�i xin c�o t�! ")
end;
