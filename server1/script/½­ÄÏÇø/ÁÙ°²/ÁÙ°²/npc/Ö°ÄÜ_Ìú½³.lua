-- �ٰ���ְ�ܡ�����
-- by��Dan_Deng(2003-09-16)
--update:zhaowenyi(2005-02-20)������ɫ���ƽ�װ������

Include("\\script\\global\\global_tiejiang.lua")


TIEJIANG_DIALOG = "<dec><npc>Gian h�ng th� r�n n�y l� do �ng t� ta truy�n l�i, t�i L�m An n�y kh�ng ng��i n�o kh�ng bi�t, xin h�i ��i hi�p mu�n mua m�n �� n�o?";
function main()
	tiejiang_city(TIEJIANG_DIALOG);
end;


function yes()
	Sale(1);  				--�������׿�
end;

