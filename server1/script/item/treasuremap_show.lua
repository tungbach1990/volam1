
-- ====================== �ļ���Ϣ ======================

-- ������Եonline �������ر�ͼ��Ʒʹ�ô����ļ�
-- Edited by peres
-- 2005/10/19 PM 14:22

-- ֻ��������������һ���
-- ����������ӵ����
-- ������ָ��Ƥ��
-- ���������������������ʹ
-- ���룬�����ǰ���
-- �����뱧Թʲô
-- ÿ���������Ƕ�������
-- ����֪�����������ֽӴ������İ�ȫ�к���ů�����ܴ�����ȡ��
-- ��ϲ����һ˲�䡣�·��ںڰ��Ĵ��ϣ�Ư������ľ�ͷ

-- ======================================================

Include("\\script\\task\\random\\treasure_head.lua");  -- �ر�ͼ���͹���


function GetItemDescription(name, magiclevel1, magiclevel2, magiclevel3, magiclevel4, magiclevel5, magiclevel6)

local nRow = magiclevel1;

	if magiclevel2==0 then
		return "<enter>M�t b�c ��a ��, h�nh nh� h��ng d�n ���ng ��n kho b�u.<enter> Tuy nhi�n �� qu� c� kh�ng th� xem ���c, ch� c�n c�ch ��n <color=green>Long Tuy�n Th�n<color> t�m <color=green>Ph� L�i Th�<color> nh� gi�p ��";
	else
		return showTreasureText(nRow)
	end;

end;

-- ��ʾ�ر�ͼ�����λ����Ϣ
function showTreasureText(nRow)

local strInfo = tabTreaPos:getCell("Text", nRow);
local picPath = tabTreaPos:getCell("Pic", nRow);

	return "<enter>M�t b�c ��a ��, h�nh nh� h��ng d�n ���ng ��n kho b�u.<enter><enter>"..
		   "Tr�n tranh �n �n hi�n hi�n ra n�i ��y l�<color=green>"..strInfo.."<color><enter><enter>"..
		   "<color=yellow>Nh�n chu�t ph�i c� th� b�t ��u ��o<color><enter>";

end;