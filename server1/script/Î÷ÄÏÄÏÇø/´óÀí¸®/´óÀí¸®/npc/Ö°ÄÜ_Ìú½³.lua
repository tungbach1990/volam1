-- ���� ְ�� ����
-- By: Dan_Deng(2003-09-16)

Include("\\script\\global\\global_tiejiang.lua")

TIEJIANG_DIALOG = "<dec><npc>Ti�m th� r�n c�a ta do nh� h�c v� ch� t�o v� kh� l�p n�n, �ao ki�m c�n th��ng k�ch, m��i t�m lo�i binh kh� �� c�, ��i hi�p mu�n mua lo�i n�o?"

function main(sel)
	tiejiang_city(TIEJIANG_DIALOG);
end;

function yes()
	Sale(16);  				--��ʱ��Ϊ25
end;

