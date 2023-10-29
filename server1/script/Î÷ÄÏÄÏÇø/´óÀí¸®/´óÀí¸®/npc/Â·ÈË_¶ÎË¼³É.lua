-- ����·�ˡ���˼��
-- by��Dan_Deng(2003-09-16)
-- update by xiaoyang(2004\4\22) ����90������

Include("\\script\\global\\repute_head.lua")
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main()
	if allbrother_0801_CheckIsDialog(14) == 1 then
		allbrother_0801_FindNpcTaskDialog(14)
		return 0;
	end
	Uworld126 = GetTask(126)
	Uworld36 = GetByte(GetTask(36),2)
	if (Uworld126 < 10) and (GetLevel() >= 90) and (Uworld36 == 127) and (GetReputeLevel(GetRepute()) >= 5) and (GetFaction() ~="cuiyan") then
		Talk(6,"Uworld126_get","H�.....","C�ng t� v� sao ph�i th� ng�n th� d�i nh� v�y?","Tu�i tr� ph�i nu�i ch� l�n, y nh� B�ch h�c, Thu Th�y qua r�i.","Ch�ng l� � trung nh�n c�a C�c h� �� m�t.","N�ng s�ng m� tim nh� �� ch�t.","Ch� c�n ng��i th�nh t�m, chuy�n g� c�ng th�nh. C�c h� c� g� kh� kh�n, xin c� n�i ra.")
	elseif (Uworld126 == 10) and (HaveItem(391) == 0) then
		AddEventItem(391)
		Msg2Player("Nh�n l�i th� c�a �o�n T� Th�nh ")
		if (GetSex() == 0) then
			Talk(1,"","Mu�n g�p m� nh�n c�ng kh�ng c�n ph�i g�p nh� th�? Th� c�n ch�a c�m m�.")
		else
			Talk(1,"","C� n��ng �y qu�n mang th� v�.")
		end
	elseif (Uworld126 == 40) then
		SetTask(126,45)
		Talk(8,"Uworld126_jump","Kh�ng c�n n�i n�a!","�o�n c�ng t�! Ng��i �� cho L� Thu Th�y cu�c s�ng gi�u sang ph� qu� t�n h��ng kh�ng h�t, lo�i ��n b� d� d�n nh� th� c� th� t�m th�m 10 hay 100 ng��i kh�c n�a, sao l�i chu�c kh� v�o th�n.","Ng��i n�i nh� th� n�o c�ng v� d�ng, xin c�c h� h�y mau r�i kh�i ��y �i.","�o�n T� Th�nh! Ng��i r��u m�i kh�ng u�ng m� u�ng r��u ph�t, l�o kh�ng c�n nh�n n�i n�a, n�u ng��i v�n kh�ng tr� l�i, th� h�y �� m�ng l�i ��y.","H�! ","Hay cho t�n ti�u t� nh� ng��i! ","A.....","�o�n c�ng t�!")
	elseif (Uworld126 == 45) then			-- û�����
		Talk(1,"Uworld126_jump","H�! Ng��i tho�t kh�i tay H�a Th��ng th� c�ng kh�ng tho�t kh�i mi�u n�y! Xem chi�u!")
	elseif (Uworld126 == 50) then
		Talk(8,"Uworld126_set","�o�n c�ng t� ng��i kh�ng ph�i l� ��i th� c�a �ng ta!","May nh� C�c h� ��n k�p th�i, t�i h� c�n �� n�i.","��i phu�ng t� ��u ��n?","Kh�ng r� n�a! C� l� l� k� th� c�a Thu Thu� trong giang h�.",".....C� r�i! Ta s� n�i d�i v�i L� c� n��ng l� ng��i b� tr�ng th��ng.","V�y h�nh nh� l� kh�ng hay l�m.","H�nh ph�c c� ��i, l� n�o kh� kh�n n�y kh�ng th� v��t qua.","�o�n T� Th�nh:.....���c! C�c h� mu�n th� n�o c�ng ���c �o�n m� xin nghe theo.")
	elseif (Uworld126 == 70) then
		Talk(3,"U126_70","Th� n�o! L� c� n��ng c� ��n th�m huynh kh�ng?","C� �y c� gh� th�m, ch�ng ta n�i chuy�n r�t vui, ng��i �� gi�p ta nhi�u r�i, xin c�m �n!","H� t�t ph�i b�n t�m, ch� c�n 2 ng��i h�nh ph�c, chuy�n nh� n�y c� ��ng l� g�.")
	elseif (Uworld126 > 10) and (Uworld126 < 50)then
		Talk(1,"","Tr��c ��y l� do ta sai! Th�t kh�ng bi�t l�y g� c�m �n ng��i!...")
	else
		Talk(2,"","��i L� ch�ng ta v� T�ng qu�c, m�i n�m ��u c�ng n�p cho Thi�n tri�u tr�u, l�a l�, ng�a, x� h��ng, b� v�ng.","B�n ng��i Kim tham lam t� c�ng, c� c�ng cho h� c� ��i c�ng ch�a l�m v�a l�ng h�!")
   end
end;

function Uworld126_get()
	if (GetCamp() == 0) and (GetTask(75) < 255) then		-- ����δѧҰ��ȭ�ģ������������
		if (GetSex() == 0) then
			Talk(1,"","H�o � c�a Huynh ��i, T� Th�nh xin ghi nh�!")
		else
			Talk(1,"","H�o � c�a Huynh ��i, T� Th�nh xin ghi nh�!")
		end
	else
		Say("Th�t kh�ng d�m gi�u! N�m x�a T�i h� �� ph� c� ta, nay ngh� l�i h�i h�n �� mu�n. Ta c� m�t b�c th�, hy v�ng C�c h� c� th� t�n tay giao cho Th�y Y�n m�n H�i ���ng S� Gi� L� Thu Th�y?",2,"Vi�c n�y c� kh� g�! /Uworld126_yes","T�i h� v�n c�n c� vi�c, c�c h� h�y �i t�m ng��i kh�c �i! /Uworld126_no")
	end
end

function Uworld126_yes()
	AddEventItem(391)
	SetTask(126,10)
	Msg2Player("Nh�n ���c th� c�a �o�n T� Th�nh, ��n Thu� Y�n M�n H�i Th��ng S� Gi� L� Thu Thu� ")
	AddNote("Nh�n ���c th� c�a �o�n T� Th�nh, ��n Thu� Y�n M�n H�i Th��ng S� Gi� L� Thu Thu� ")
end

function Uworld126_no()
end

function Uworld126_jump()
	SetFightState(1)
	NewWorld(230,1613,3175)
end

function Uworld126_set()
	SetTask(126,60)
	Msg2Player("L�p m�u l�a Thu Th�y ��n th�m �o�n T� Th�nh ")
	AddNote("L�p m�u l�a Thu Th�y ��n th�m �o�n T� Th�nh ")
end

function U126_70()
	Talk(1,"","��ng r�i! Thu Th�y n�i Do�n Ch��ng m�n mu�n g�p ng��i, kh�ng bi�t l� chuy�n g�?")
	SetTask(126,80)
	Msg2Player("Nghe ���c �o�n v� L� n�i chuy�n v�i nhau, th� r�t vui. Ng��i h�y �i xem th� Do�n H�m Y�n c� vi�c g� m� t�m ng��i ")
end
