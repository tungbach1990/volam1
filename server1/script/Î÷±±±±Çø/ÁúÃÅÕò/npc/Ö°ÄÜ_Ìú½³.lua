--������ ְ�� ����
-- By: Dan_Deng(2003-09-16)
Include("\\script\\global\\global_tiejiang.lua")

TIEJIANG_DIALOG = "<dec><npc>B�n c�c lo�i v� kh� th��ng h�ng ��y! V� kh� t�t nh�t � Long M�n ��y!"

function main(sel)
		tiejiang_village()
end;

function yes()
Sale(25);  				--�������׿�
end;
