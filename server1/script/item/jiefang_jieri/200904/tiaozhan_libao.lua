-- ====================== �ļ���Ϣ ======================

-- ������Ե�����Խ�ϰ� - ��ս���
-- �ļ�������tiaozhan_libao.lua
-- �����ߡ����ӷ��~
-- ����ʱ�䣺2009-04-26 13:16:50

-- ======================================================

Include("\\script\\lib\\pay.lua");
Include("\\script\\lib\\awardtemplet.lua");

function main(nItemIdx)
	local n_level = GetLevel();
	if (n_level < 50 or IsCharged() ~= 1) then
		Say("Ch� c� ng��i ch�i c�p tr�n 50 �� n�p th� m�i c� th� s� d�ng.", 0)
		return 1;
	end
	
	if (CalcFreeItemCellCount() < 20) then
		Say(format("�� tr�nh m�t m�t t�i s�n, h�y b�o ��m h�nh trang c�n �� %d � tr�ng.", 20), 0);
		return 1;
	end
	tbItem = { tbProp = {6,1,1499,1,1,0}, nCount = 20};
	tbAwardTemplet:GiveAwardByList(tbItem, "Khi�u chi�n L� bao")
end

