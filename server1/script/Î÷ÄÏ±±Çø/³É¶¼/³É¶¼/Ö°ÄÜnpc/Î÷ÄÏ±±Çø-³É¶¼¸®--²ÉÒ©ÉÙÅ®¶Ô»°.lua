--���ϱ��� �ɶ��� ��ҩ��Ů�Ի������ɼ�ҩ�ġ�����
-- Update: Xiao_Yang(2004-04-26)�����ӡ��ɼ�ҩ�����񡱣�

Include("\\script\\global\\repute_head.lua")

function main(sel)
	Uworld132 = GetTask(132)
	Uworld133 = GetByte(GetTask(133),1)
	if (Uworld132 == 10) and (HaveItem(112) == 1) and (HaveItem(113) ==1) and (HaveItem(114) ==1) and (HaveItem(115) ==1) and (HaveItem(116) ==1) then
		Talk(2,"Uworld132_finish","Ti�u c� n��ng! Nh�ng th� c� c�n ��u � ch� ta","Th�t �! C�m �n ng��i nhi�u l�m!")
	elseif (GetLevel() >= 20) and (GetReputeLevel(GetRepute()) >= 2) and ((Uworld132 < 10) or ((GetGameTime() > Uworld132) and (Uworld132 > 255))) then		-- ���ɼ�ҩ�ġ�������������
		if (Uworld133 >= 5) then
			SetTask(133,0)
		end
		Talk(5,"Uworld132_get","�y...","Ti�u c� n��ng c� vi�c g� lo l�ng v�y?","Hi�u thu�c c�a ta g�n ��y thi�u v�i v� thu�c ch� y�u. To�n b� s� thu�c �� � Th��ng Ch�u ��u b� c�c �ng ch� l�n mua h�t r�i,danh d� c�a �ng ch� �� b� m�t s�ch, n�u kh�ng c� c�ch �� ch� nh�ng d��c li�u n�y th� kh�ng bi�t ph�i l�m sao n�a.","Chuy�n bu�n b�n ta kh�ng hi�u nh�ng c�ng th��ng ��n ti�m c�a mu�i mua thu�c, c� kh� kh�n g� c� n�i ra bi�t ��u ta c� th� gi�p mu�i.","Th�t sao? Ng��i bi�t � ��u c� th� t�m ���c 5 lo�i: T� M�c T�c, ��a C�m Th�o, Thi�n Th�o, H� Nh� th�o, Linh Chi kh�ng?","Ha ha,! May qu�! Nh�ng lo�i thu�c n�y ta �� t�ng th�y qua trong D��c V��ng C�c")
	else
		i = random(0,2)
		if (i == 0) then
			Talk(1,"","V�ng Th�nh �� c� r�t nhi�u n�i,g�n th� c� n�i Nga Mi,n�i Thanh Th�nh, xa m�t ch�t th� c� n�i T� C� N��ng, n�i D�n S�n, n�i nhi�u th�o d��c t� nhi�n s� nhi�u, ��c bi�t l� Xuy�n B�i, Thi�n Ma, Tr�ng Th�o")
		elseif (i == 1) then
			Talk(1,"","Th�o d��c mu�i h�i v�, m�t �t t� m�nh d�ng, m�t �t b�n cho c�c ti�m thu�c, �� l�y ti�n nu�i s�ng m�nh v� b� n�i.")
		else
			Talk(1,"","Cha m� mu�i m�t s�m, ch� c�n m�nh ta v� b� n�i s�ng n��ng t�a v�o nhau, b� n�i l� ng��i th�n duy nh�t c�a mu�i")
		end
	end
end;

function Uworld132_get()
	Say("V�y ng��i c� th� gi�p ta h�i m�t �t mang v� ��y kh�ng?",2,"Ch� l� chuy�n nh�, c� n��ng h�y ��i 1 l�c. /Uworld132_yes","� �� qu�i v�t r�t nhi�u, t�i h� t�i k�m l�c th�p, t�t h�n l� n�n t�p luy�n v� c�ng tr��c v�y. /Uworld132_no")
end

function Uworld132_yes()
	SetTask(132,10)
	Msg2Player("Ng��i nh� l� �� th�y ���c 5 v� d��c li�u T� M�c T�c, ��a C�m Th�o, Thi�n Th�o, H� Nh� Th�o, Linh Chi � D��c V��ng C�c, h�a s� t�m gi�p c� g�i h�i thu�c. ")
end

function Uworld132_no()
end

function Uworld132_finish()
	
	local nResult = 0;
	
	-- �����Ʒ�ǻ����ڣ������ 1 ��ֱ�� return
	for i=112, 116 do
		nResult = HaveItem(i);
		if nResult~=1 then
			return
		end;
		DelItem(i);
	end;
	
	SetTask(132,GetGameTime()+3600)
	
	Uworld133 = GetByte(GetTask(133),1)
	Uworld133_2 = GetByte(GetTask(133),2)
	Cur_date = tonumber(date("%d"))
	if (Uworld133_2 == Cur_date) then
		Uworld133 = Uworld133 + 1
	else
		Uworld133 = 1
	end
	AddRepute(Uworld133)
	Msg2Player("B�n ��t ���c"..Uworld133.."�i�m danh v�ng")
	if (Uworld133 >= 5)then
		SetTask(133,0)
		AddRepute(10)
		Msg2Player("V� �� nhi�u l�n ra tay gi�p ��, b�n ���c th�m 10 �i�m th��ng thanh th� n�a! ")
	else
		Uworld133 = SetByte(Uworld133,2,Cur_date)
		SetTask(133,Uworld133)
	end
end
