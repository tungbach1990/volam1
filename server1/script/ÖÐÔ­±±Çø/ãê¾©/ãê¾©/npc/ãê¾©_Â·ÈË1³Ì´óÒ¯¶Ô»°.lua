--��ԭ���� �꾩�� ·��1�̴�ү�Ի�
-----------------------------------------------------------------------
function main(sel)

if(GetItemCount(351) >= 1)then
	Say("Ng��i Kim t�ng cho ch�ng ta m�t s� b�o b�i, giao cho ch�ng ta nhi�m v� �i t�m t�m ��a �� 'S�n h� x� t�c' g� ��. Kh�ng bi�t l� n� c� c�ng d�ng g�?",4,"Ta t�m ���c 1 mi�ng To�i phi�n /gift1","Ta t�m ���c 2 mi�ng To�i phi�n /gift2","Ta t�m ���c 1 mi�ng To�i phi�n /gift3","Ta kh�ng ��i ��u /no")
else
	default()
end

end;

-----------------------------------------------------------------------

function default()
	i = random(0,2)
	if (i == 0) then
		Talk(1,"","Bi�n Kinh n�y n�i ti�ng l� nh� c� t�a Thi�t Th�p, nh�ng trong �� l�i c� nhi�u b� �n...")
	elseif (i == 1) then
		Talk(1,"","B�y gi� Bi�n Kinh n�y �� b� ng��i Kim chi�m r�i! Ch�ng ta s� ph�i s�ng nh�ng th�ng ng�y c�c kh�!")
	else
		Talk(1,""," Ho�ng th��ng ch� bi�t h��ng ph�c m�t m�nh � ph��ng Nam, l�m g� bi�t quan t�m ��n s� th�ng kh� c�a b� t�nh! ")
	end
end

-----------------------------------------------------------------------

function gift1()
if(GetItemCount(351) >= 3)then
	DelItem(351)
	DelItem(351)
	DelItem(351)
	for i = 1, 3 do
		x = 238 + random(0,2)
		AddEventItem(x)			-- �������ʯ
		AddEventItem(353)			-- �ɺ챦ʯ
--		AddItem(6, 1, 21, 1, 0, 0, 0)			-- �ɺ챦ʯ
	end
	Say("T�m b�n �� c�a ng��i ta �� l�y r�i, t�ng cho ng��i nh�ng th� n�y, ng��i h�y gi� l�y. M�y n�m nay kh�ng ���c y�n �n l�m! ",0)
else
	Say("Ng��i b�n tr� kh�ng n�n khinh th��ng ng��i gi�! Ng��i l�m g� c� 3 m�nh b�n ��?",0)
end
end

-----------------------------------------------------------------------

function gift2()
if(GetItemCount(351) >= 2)then
	DelItem(351)
	DelItem(351)
	x = 238 + random(0,2)
	AddEventItem(x)
	AddEventItem(353)			-- �ɺ챦ʯ
--	AddItem(6, 1, 21, 1, 0, 0, 0)			-- �ɺ챦ʯ
	Say("T�m b�n �� c�a ng��i ta �� l�y r�i, t�ng cho ng��i nh�ng th� n�y, ng��i h�y gi� l�y. M�y n�m nay kh�ng ���c y�n �n l�m! ",0)
else
	Say("Ng��i b�n tr� kh�ng n�n khinh th��ng ng��i gi�! Ng��i l�m g� c� 3 m�nh b�n ��?",0)
end
end

-----------------------------------------------------------------------

function gift3()
if(GetItemCount(351) >= 1)then
	DelItem(351)
	AddEventItem(353)			-- �ɺ챦ʯ
--	AddItem(6, 1, 21, 1, 0, 0, 0)			-- �ɺ챦ʯ
	Say("T�m b�n �� c�a ng��i ta �� l�y r�i, t�ng cho ng��i nh�ng th� n�y, ng��i h�y gi� l�y. M�y n�m nay kh�ng ���c y�n �n l�m! ",0)
else
	Talk(1,"","Ng��i b�n tr� kh�ng n�n khinh th��ng ng��i gi�! Ng��i l�m g� c� 3 m�nh b�n ��?")
end
end

-----------------------------------------------------------------------

function no()
end

-----------------------------------------------------------------------
