
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
Include("\\script\\activitysys\\g_activity.lua")			--��༭��
Include("\\script\\activitysys\\playerfunlib.lua")		--��༭��

function main(nIndex)

local nRow = GetItemMagicLevel(nIndex, 1);

	if nRow==0 or nRow==nil then
		Msg2Player("<color=Orange>T�m b�n �� kho b�u n�y �� c� r�ch, kh�ng th� s� d�ng ���c n�a.<color>");
		return 1;
	end;

local strInfo = tabTreaPos:getCell("Text", nRow);
local picPath = tabTreaPos:getCell("Pic", nRow);

local nMapState = GetItemMagicLevel(nIndex, 2);

local nResult = 0;
local picLink = "";

	if nMapState==0 then
		Msg2Player("<color=Orange>B�n d�a theo t�m b�n �� kho b�u n�y t�m ki�m kh�p v�n kh�ng thu ho�ch ���c g�, khuy�n b�n n�n ��n Long Tuy�n Th�n t�m Ph� L�i Th� ch� gi�o �i!<color>");
		return 1;
	else
		picLink = "<link=image:"..picPath..">Th�ng tin v� T�ng B�o ��:<link> Sau khi b� m�t s� ti�n l�n, cu�i c�ng b�n c�ng �� ���c Ph� L�i Th� ch� coh v� tr� kho b�u<color=yellow>"..strInfo.."<color>.";
		Describe(picLink, 2,
				 "b�t ��u khai qu�t/#useTreasureMap("..nIndex..")",
				 "��ng/OnExit");
		return 1;
	end;

end;

function useTreasureMap(nIndex)

local nResult = MapCheckTreasurePos(nIndex);
local nDelResult = 0;

	if nResult==1 then
		
		-- ����ɹ��ڳ������ˣ��򽫸���Ʒɾ��
		nDelResult = RemoveItemByIndex(nIndex);
		
		if nDelResult==1 then
			UseTreasurePos();
			
			G_ACTIVITY:OnMessage("FinishCangBaoTu");
			
			return 1;
		else
			Msg2Player("<color=Orange>Nh�n t�m b�n �� kho b�u ��o qua ��o l�i � ��y v�n kh�ng t�m ���c gׅ...<color>");
			return 1;	
		end;
		
	elseif nResult==0 then
		Msg2Player("<color=Orange>Nh�n t�m b�n �� kho b�u ��o qua ��o l�i � ��y v�n kh�ng t�m ���c gׅ...<color>");
		return 1;
	elseif nResult==2 then
		Msg2Player("Nh�n <color=yellow>h�nh v�<color> tr�n <color=green>b�n �� kho b�u<color> d��ng nh� kh�ng hi�u g�, c� th� ��n <color=yellow>Long Tuy�n Th�n<color> <color=green>t�m<color> <color=yellow>Ph� L�i Th�<color> gi�m ��nh xem sao!");
		return 1;
	end;
		
end;


function OnExit()

end;