-- ����Դͷ ·��_����а.lua��ؤ��90����������
-- By��XiaoYang(2004-04-29)
-- Update��dan_deng(2004-05-20)

Include("\\script\\global\\repute_head.lua")
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main()
	if allbrother_0801_CheckIsDialog(2) == 1 then
		allbrother_0801_FindNpcTaskDialog(2)
		return 0;
	end
	
	Uworld128 = GetTask(128)
	Uworld30 = GetByte(GetTask(30),2)
	if (Uworld128 < 10) and (GetReputeLevel(GetRepute()) >= 5) and (GetLevel() >= 90) and (GetFaction() ~="gaibang") and (Uworld30 ==127) then
		Talk(8,"Uworld128_get","Tr��ng Giang nguy�n ��u. B�n nh�n th�y m�t thanh ni�n tu�n t�, �ang th�i s�o. Ti�ng s�o r�t n�o nu�t","Ti�ng s�o c�a c�c h� sao nghe th� l��ng,d��ng nh� �ang c� t�m s�?","Qu�c gia chi n�n, th�t phu h�u tr�ch. Huynh �� gia vi�n �ang b� qu�n kim ch� ��p t�n s�t, t�i h� l�m sao c� th� vui ���c?","Quan s�n v�n l�, kh�ng bi�t bao nhi�u h�n th�. Ch� ti�c th� nh�n ngu mu�i sai l�m l�y kh�i hoa �� ��i l�y s� ph�n vinh","T�i h� l� Gi�i V� T� � C�i Bang, h�m nay g�p ���c anh h�ng, mang r��u ra u�ng m�ng!","Trong thi�n h� anh h�ng c� m�y ng��i� ","C�n ly ","C�n ly ")
   elseif (Uworld128 == 10) and (HaveItem(76) == 1) then
   	Talk(11,"Uworld128_envelop","Huynh ��i qu� l� ng��i c� ch� t�n","Tri k� t��ng ph�ng thi�n b�i thi�u. H�m nay nh�t ��nh ph�i u�ng cho say� ","Trong thi�n h� anh h�ng c� m�y ng��i� ","C�c h� kh�ng bi�t �� th�i, nhi�u khi ch�nh th�i th� t�o anh h�ng!","T�i sao n�i v�y?","T�i h� tuy nh�p m�n kh�ng l�u nh�ng �� tr�i qua kh�ng �t tr�n quy�t chi�n, nhi�u ng��i kh�ng n�n ch�t c�ng �� ch�t r�i, t�i h� v�n c�n s�ng ��y, b�n h� ai c�ng c� cha m�, v� v� con th� kh�ng l� n�o l�i mu�n ch�t,? Ch� t�i th�i th� d�n v�o ���ng c�ng kh�ng th� kh�ng l�m v�y","��ng ti�c, nh�ng ng��i nh� th� r�t hi�m!","C� l� v�y! ��n l��t ta r�i! Kh�ng n�i nh�ng chuy�n kh�ng vui n�a! N�o u�ng r��u �i!","Gi�i ��i ca h�nh nh� c� chuy�n g� kh� n�i? N�u ��i ca c� g� c�n d�n d� c� n�i v�i ��!","Ta v� ng��i b�o n��c g�p nhau nh�ng v�a g�p nh� �� quen t� l�u! ���c! Gi�i m� � ��y c� m�t b�c th� nh� ng��i mang gi�p b�c th� n�y ��n C�i bang giao cho tr��ng l�o La Khu�ng Sinh!","���c!")
   elseif (Uworld128 == 40) then
   	Talk(7,"Uworld128_kill","G i�i ��i ca! Huynh kh�ng c� vi�c g� ch�!","Y�n t�m! Ta kkh�ng sao!","Huynh l�m sao bi�t c� ng��i s�p gi�t h�i huynh!","Chuy�n n�y li�n quan ��n n�i b� C�i bang, n�u ta kh�ng c� tin t�nh b�o ch�nh x�c th� c�ng kh�ng d�m b�a ��t ra ��u","V�y huynh ph�i n�n c�n th�n, �� ph�i �i b�o v�i La tr��ng l�o!","B�ng h�u! Gi�i m� kh�ng c� g� b�o ��p! Sau n�y n�u c� c�n vi�c g� th� Gi�i m� d� l�m tr�u ng�a c�ng quy�t l�m!","��i ca kh�ng n�n n�i nh� v�y, n�u kh�ng t�i h� th�y r�t �y n�y")
   elseif (Uworld128 == 10) then
   	Talk(1,"","���ng t� ��y t�i D��ng Ch�u r�t nguy hi�m, tr�n ���ng �i nh� c�n th�n!")
   elseif (Uworld128 == 30) then
   	Talk(2,"","Gi�i ��i ca c�ng c�n th�n k�o b� �m h�i","��n th�t ��ng l�c! H�y c�ng nhau gi�t s�ch l� gi�c n�y!")
   elseif (Uworld128 == 20) and (HaveItem(390) == 0) then
   	AddEventItem(390)
   	Msg2Player("L�i nh�n ���c b�c th� c�a Gi�i V� T� ")
   	Talk(1,"","S� vi�c r�t tr�ng ��i, nh� ng��i c�p t�c mang b�c th� n�y ��n b�n bang giao cho La tr��ng l�o")
   else
   	Talk(1,"","U�ng r��u ca h�t!Nh�n sinh tri k� h�u k� nh�n?")
   end
end

function Uworld128_get()
	if (GetCamp() == 0) and (GetTask(75) < 255) then		-- ����δѧҰ��ȭ�ģ������������
		Talk(1,"","H�m nay ta v� c�c h� ph�i u�ng r��u ��m ��o t�i t�i! S�ng mai xin k�p l�n ���ng!")
	else
		Say("��ng ti�c l� h�m nay t�i h� kh�ng bi�t s� g�p ���c tri �m n�n ch�a k�p chu�n b� r��u ngon",2,"T�i h� bi�t � D��ng Ch�u c� m�t t�u l�u b�n r��u Tu� Tuy�n r�t ngon, �� t�i h� l�p t�c �i mua. /Uworld128_wait","Huynh �� ta b�o n��c g�p nhau, t�i h� kh�ng bi�t con ���ng ph�a tr��c r�i s� v� ��u /Uworld128_no")
	end
end

function Uworld128_wait()
	SetTask(128,10)
--	Uworld135 = GetGameTime()
   Msg2Player("B�n v� Gi�i V� T� c� giao ��c ��n D��ng Ch�u th��ng th�c r��u ngon ")
   AddNote("B�n v� Gi�i V� T� c� giao ��c ��n D��ng Ch�u th��ng th�c r��u ngon ")
end

function Uworld128_no()
end

function Uworld128_envelop()
	DelItem(76)
	AddEventItem(390)
	Msg2Player("Nh�n ���c b�c th� c�a Gi�i V� T� ��n C�i bang t�m La tr��ng l�o ")
	AddNote("Nh�n ���c b�c th� c�a Gi�i V� T� ��n C�i bang t�m La tr��ng l�o ")
	SetTask(128,20)
end

function Uworld128_kill()
	SetTask(128,50)
	Msg2Player("C�u tho�t Gi�i V� T�, tr� v� h�i b�o La tr��ng l�o ")
	AddNote("C�u tho�t Gi�i V� T�, tr� v� h�i b�o La tr��ng l�o ")
end
