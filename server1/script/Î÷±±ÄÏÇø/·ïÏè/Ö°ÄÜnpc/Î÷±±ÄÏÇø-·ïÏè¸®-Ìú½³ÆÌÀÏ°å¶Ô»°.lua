--�������� ���踮 �������ϰ�Ի�

Include("\\script\\global\\global_tiejiang.lua")

TIEJIANG_DIALOG = "<dec><npc>Mu�n mua lo�i v� kh� n�o? Xin m�i xem v� ch�n t� nhi�n."
function main(sel)
	tiejiang_city(TIEJIANG_DIALOG);
end;


function yes()
	Sale(19);  			--�������׿�
end;

