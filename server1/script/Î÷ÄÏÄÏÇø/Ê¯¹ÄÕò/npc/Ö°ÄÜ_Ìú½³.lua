-- ʯ���� ְ�� ����
-- By: Dan_Deng(2003-09-16)
Include("\\script\\global\\global_tiejiang.lua")

TIEJIANG_DIALOG = "<dec><npc>C�c lo�i �ao th��ng binh kh� ��y! ��y l� n�i mua v� kh� t�t nh�t � Th�ch C� Tr�n!"

function main(sel)
	tiejiang_village();
end;

function yes()
Sale(25);  				--��ʱ��Ϊ25
end;
