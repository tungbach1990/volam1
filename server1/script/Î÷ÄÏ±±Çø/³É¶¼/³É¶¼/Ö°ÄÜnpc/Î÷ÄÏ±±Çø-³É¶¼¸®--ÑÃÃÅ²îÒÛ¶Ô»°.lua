--���ϱ��� �ɶ��� ���Ų��۶Ի� �������񣨳ɶ�ɱҰ��
-- Update: Dan_Deng(2004-03-19)

FESTIVAL06_NPCNAME = "<color=yellow>:<color>";

Include("\\script\\global\\repute_head.lua")

Include([[\script\global\·��_��������.lua]]);

function main(sel)
    gsoldier_entance();
end;

function main_former()
	Uworld11 = GetTask(11)
	if (Uworld11 == 100) then			-- �������
		W11_prise()
	elseif (Uworld11 < 255) and (Uworld11 >= 1) then		-- ������
		Talk(1,"","Mu�n l�nh th��ng h�? Gi�t m��i con heo r�ng �i r�i h�y n�i!")
	elseif (Uworld11 > 255) then		-- �����Ѿ����
		Talk(1,"","G�n Th�nh �� c� r�t nhi�u n�i, th��ng c� heo r�ng xu�t hi�n,l�n n�y may nh� c� ng��i m�i c� th� b�o ��m ���c thu ho�ch c�a n�m nay.")
	else			-- δ������
		Talk(1,"","Ng��i d�m x�ng v�o nha m�n? ��ng l� �n gan h�m m�t g�u!")
	end
end;

function W11_prise()
	Talk(1,"","�� gi�t ch�t 10 con heo r�ng? T�t qu�! Ta thay m�t tr�m h� Th�nh �� �a t� ng��i v� c�c v� hi�p s� �� ra tay. ��y l� 500 l��ng th��ng!")
	Earn(500)
	SetTask(11,date("%Y%m%d"))
	i = random(0,99)
	if (i < 50) then			-- 50%����
		x = 3
	elseif (i < 85) then		-- 35%����
		x = 4
	else							-- 15%����
		x = 5
	end
	AddRepute(x)
	Msg2Player("Nhi�m v� ho�n th�nh, ���c th��ng 50 l��ng b�c, �i�m thanh th� c�a b�n ���c t�ng "..x.."�i�m.")
end;
