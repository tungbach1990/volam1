function OnDeath(sel)
	Uworld42 = GetTask(42)
	if (Uworld42 == 70) then
		Talk(8,"U42_prise","Ha ha! H�o Ti�u t�, kh�ng ng� ng��i c�ng kh� qu�.","Ti�n b�i qu� khen!","��i ng��i nh� gi�c m�ng, n�n t�nh l�i th�i. M�y ��a tr� n�y kh�ng c� l�i g� v�i ta, ng��i d�n ch�ng �i �i!","�a t� Ti�n b�i!","Ti�u t�! H�y nh� ph�i tr�n tr�ng nh�ng g� m�nh c�, m�t r�i c� h�i c�ng kh�ng k�p, ta si m� luy�n v� ��n khi c� nh� g�p n�n, ��t ��n tuy�t ��nh th� sao ch�? Chi b�ng b�nh ��m s�ng qua ng�y vui c�ng con ch�u.","T�i h� xin ghi nh�.","Nh�ng ��a tr� c�n ���c d�y d�. Ta b�nh sinh �� h�c nhi�u r�i, ng��i c�ng n�n h�c �i, l�m nhi�u vi�c thi�n, xem nh� thay l�o phu t�ch m�y ph�n c�ng ��c.","�a t� Ti�n b�i!")
		Msg2Player("��nh b�i Th��ng L�ng kh�ch ")
		NewWorld(167,1400,2974)
	end
end;

function U42_prise()
	SetTask(42,255)
	AddProp(2)
	Ubonus86 = GetTask(86) + 1					-- ��¼��������2��Ǳ��(��һ�ֽ�+1)
	if (GetByte(Ubonus86,1) >= 250) then		-- �ݴ�����Ϊ250��
		Ubonus86 = 250
	end
	SetTask(86,Ubonus86)
	
	i = random(30,35)
	AddRepute(i)
	Msg2Player("L�nh ng� B�n L�i, ti�m n�ng c�a b�n t�ng th�m 2 �i�m")
	Msg2Player("<#> Nhi�m v� ��a b� m�t t�ch: c�u ��a b� m�t t�ch, ho�n th�nh nhi�m v�. Danh v�ng c�a b�n t�ng th�m "..i.."<#> �i�m.")
	AddNote("Nhi�m v� ��a b� m�t t�ch: t�m ���c ��a b�, ho�n th�nh nhi�m v�. Danh v�ng c�a b�n t�ng th�m")
end
