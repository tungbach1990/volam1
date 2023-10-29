-- �ļ�������yirongmishu.lua
-- �����ߡ���wangjingjun
-- ���ݡ������������� ���������ߵ��������Ʒ
-- ����ʱ�䣺2011-07-11 09:36:28

Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\dailogsys\\dailogsay.lua")

local tbMask = 
{
	{szName = "M�t n� - B�ch Doanh Doanh", tbProp = {0,11,496,1,0,0}, nExpiredTime = 48*60},
	{szName = "M�t n� - B�ch th�nh qu�n ch�", tbProp = {0,11,497,1,0,0}, nExpiredTime = 48*60},
	{szName = "M�t n� - Chung Linh T� ", tbProp = {0,11,498,1,0,0}, nExpiredTime = 48*60},
	{szName = "M�t n� - C� B�ch", tbProp = {0,11,499,1,0,0}, nExpiredTime = 48*60},
	{szName = "M�t n� - �ao song ph�ng", tbProp = {0,11,500,1,0,0}, nExpiredTime = 48*60},
	{szName = "M�t n� - ��o Thanh Ch�n Nh�n", tbProp = {0,11,501,1,0,0}, nExpiredTime = 48*60},
	{szName = "M�t n� - Di�u Nh� ", tbProp = {0,11,502,1,0,0}, nExpiredTime = 48*60},
	{szName = "M�t n� - �oan M�c Du� ", tbProp = {0,11,503,1,0,0}, nExpiredTime = 48*60},
	{szName = "M�t n� - ��ng t�", tbProp = {0,11,504,1,0,0}, nExpiredTime = 48*60},
	{szName = "M�t n� - ���ng B�t Nhi�m", tbProp = {0,11,505,1,0,0}, nExpiredTime = 48*60},	-- 10
	{szName = "M�t n� - ���ng th�n", tbProp = {0,11,506,1,0,0}, nExpiredTime = 48*60},
	{szName = "M�t n� - ���ng Thi�n T�m", tbProp = {0,11,507,1,0,0}, nExpiredTime = 48*60},
	{szName = "M�t n� - Gia Lu�t T� Ly", tbProp = {0,11,508,1,0,0}, nExpiredTime = 48*60},
	{szName = "M�t n� - H� Linh Phi�u", tbProp = {0,11,509,1,0,0}, nExpiredTime = 48*60},
	{szName = "M�t n� - H� Nh�n Ng� ", tbProp = {0,11,510,1,0,0}, nExpiredTime = 48*60},
	{szName = "M�t n� - H� Th�nh", tbProp = {0,11,511,1,0,0}, nExpiredTime = 48*60},
	{szName = "M�t n� - Heo tr�ng", tbProp = {0,11,512,1,0,0}, nExpiredTime = 48*60},
	{szName = "M�t n� - H��u ��m", tbProp = {0,11,513,1,0,0}, nExpiredTime = 48*60},
	{szName = "M�t n� - Huy�n Gi�c ��i S� ", tbProp = {0,11,514,1,0,0}, nExpiredTime = 48*60},
	{szName = "M�t n� - Lam linh c�ng t�", tbProp = {0,11,515,1,0,0}, nExpiredTime = 48*60},	-- 20
	{szName = "M�t n� - Lam Y Y", tbProp = {0,11,516,1,0,0}, nExpiredTime = 48*60},
	{szName = "M�t n� - Li�u Phi Y�n", tbProp = {0,11,517,1,0,0}, nExpiredTime = 48*60},
	{szName = "M�t n� - Li�u Thanh Thanh", tbProp = {0,11,518,1,0,0}, nExpiredTime = 48*60},
	{szName = "M�t n� - Long th�p tam gia", tbProp = {0,11,519,1,0,0}, nExpiredTime = 48*60},
	{szName = "M�t n� - M�nh Th��ng L��ng", tbProp = {0,11,520,1,0,0}, nExpiredTime = 48*60},
	{szName = "M�t n� - M� Dung Y�n", tbProp = {0,11,521,1,0,0}, nExpiredTime = 48*60},
	{szName = "M�t n� - Nguy�t dao dao", tbProp = {0,11,522,1,0,0}, nExpiredTime = 48*60},
	{szName = "M�t n� - Phi�n Kh�ch", tbProp = {0,11,523,1,0,0}, nExpiredTime = 48*60},
	{szName = "M�t n� - T�n Ni�n Hi�p Kh�ch", tbProp = {0,11,524,1,0,0}, nExpiredTime = 48*60},
	{szName = "M�t n� - T�n Ni�n Hi�p N� ", tbProp = {0,11,525,1,0,0}, nExpiredTime = 48*60},	-- 30
	{szName = "M�t n� - Thanh Ni�n H�i ���ng", tbProp = {0,11,526,1,0,0}, nExpiredTime = 48*60},
	{szName = "M�t n� - Th�nh Ni�n H�i ���ng", tbProp = {0,11,527,1,0,0}, nExpiredTime = 48*60},
	{szName = "M�t n� - Thanh Ni�n H�a Nh�n", tbProp = {0,11,528,1,0,0}, nExpiredTime = 48*60},
	{szName = "M�t n� - Th�nh Ni�n H�a Nh�n", tbProp = {0,11,529,1,0,0}, nExpiredTime = 48*60},
	{szName = "M�t n� - Thanh Ni�n Kim Phong", tbProp = {0,11,530,1,0,0}, nExpiredTime = 48*60},
	{szName = "M�t n� - Th�nh Ni�n Kim Phong", tbProp = {0,11,531,1,0,0}, nExpiredTime = 48*60},
	{szName = "M�t n� - Thanh Ni�n L�i Ki�m", tbProp = {0,11,532,1,0,0}, nExpiredTime = 48*60},
	{szName = "M�t n� - Th�nh Ni�n L�i Ki�m", tbProp = {0,11,533,1,0,0}, nExpiredTime = 48*60},
	{szName = "M�t n� - Thanh Ni�n Ti�u S��ng", tbProp = {0,11,534,1,0,0}, nExpiredTime = 48*60},
	{szName = "M�t n� - Th�nh Ni�n Ti�u S��ng", tbProp = {0,11,535,1,0,0}, nExpiredTime = 48*60},	-- 40
	{szName = "M�t n� - Thanh Tuy�t S� Th�i", tbProp = {0,11,536,1,0,0}, nExpiredTime = 48*60},
	{szName = "M�t n� - Thi�u Ni�n H�i ���ng", tbProp = {0,11,537,1,0,0}, nExpiredTime = 48*60},
	{szName = "M�t n� - Thi�u Ni�n H�a Nh�n", tbProp = {0,11,538,1,0,0}, nExpiredTime = 48*60},
	{szName = "M�t n� - Thi�u Ni�n Kim Phong", tbProp = {0,11,539,1,0,0}, nExpiredTime = 48*60},
	{szName = "M�t n� - Thi�u Ni�n L�i Ki�m", tbProp = {0,11,540,1,0,0}, nExpiredTime = 48*60},
	{szName = "M�t n� - Thi�u Ni�n Ti�u S��ng", tbProp = {0,11,541,1,0,0}, nExpiredTime = 48*60},
	{szName = "M�t n� - T� T� Hinh", tbProp = {0,11,542,1,0,0}, nExpiredTime = 48*60},
	{szName = "M�t n� - Tr��ng T�ng Ch�nh", tbProp = {0,11,543,1,0,0}, nExpiredTime = 48*60},
	{szName = "M�t n� - T� hi�p", tbProp = {0,11,544,1,0,0}, nExpiredTime = 48*60},
	{szName = "M�t n� - Tuy�n C� T� ", tbProp = {0,11,545,1,0,0}, nExpiredTime = 48*60},		-- 50	
	{szName = "M�t n� - Voi Ch�u � ", tbProp = {0,11,546,1,0,0}, nExpiredTime = 48*60},
	{szName = "M�t n� - Voi Ho�ng H� ", tbProp = {0,11,547,1,0,0}, nExpiredTime = 48*60},
	{szName = "M�t n� - V��ng T� ", tbProp = {0,11,548,1,0,0}, nExpiredTime = 48*60},
	{szName = "M�t n� - Y�n Hi�u Tr�i", tbProp = {0,11,549,1,0,0}, nExpiredTime = 48*60},
	{szName = "M�t n� - Y�n tri�u", tbProp = {0,11,550,1,0,0}, nExpiredTime = 48*60},
	{szName = "M�t n� Chi�u Nh�t Mi�n", tbProp = {0,11,551,1,0,0}, nExpiredTime = 48*60},
	{szName = "M�t n� Di�u Nh�t", tbProp = {0,11,552,1,0,0}, nExpiredTime = 48*60},
	{szName = "M�t n� �o�n M�c Ly", tbProp = {0,11,553,1,0,0}, nExpiredTime = 48*60},
	{szName = "M�t n� ���ng H�o", tbProp = {0,11,554,1,0,0}, nExpiredTime = 48*60},
	{szName = "M�t n� h�ng nga", tbProp = {0,11,555,1,0,0}, nExpiredTime = 48*60},		-- 60	
	{szName = "M�t n� L�ng Ti�u T�", tbProp = {0,11,556,1,0,0}, nExpiredTime = 48*60},
	{szName = "M�t n� L� Chi�t Mai", tbProp = {0,11,557,1,0,0}, nExpiredTime = 48*60},
	{szName = "M�t n� Xu�n Ng�u", tbProp = {0,11,558,1,0,0}, nExpiredTime = 48*60},
}

function showMask(nIndex, nPlayerIndex, nItemIndex)
	local szTitle = "Xin h�y l�a ch�n lo�i m�t n� m� ng��i mu�n"
	local tbOpt = {}
	local nMaskCount = getn(%tbMask)
	local nShowIndex = 0
	local nPerCount = 10
	
	nIndex = max(1, nIndex)
	nIndex = min(nIndex, nMaskCount)
	nShowIndex = nIndex
	
	for i=1,nPerCount do
		if nShowIndex > nMaskCount then
			break
		end
		tinsert(tbOpt, {%tbMask[nShowIndex].szName, queren, {nShowIndex, nPlayerIndex, nItemIndex}})
		nShowIndex = nShowIndex + 1	
	end
	
	tinsert(tbOpt, {"Trang tr��c", showMask, {nIndex - nPerCount, nPlayerIndex, nItemIndex}})
	if nShowIndex + 1 < nMaskCount then
		tinsert(tbOpt, {"Trang k� ", showMask, {nShowIndex, nPlayerIndex, nItemIndex}})
	end
	tinsert(tbOpt, {"R�i kh�i", cancel})
	
	CreateNewSayEx(szTitle, tbOpt)
end

function queren(nIndex, nPlayerIndex, nItemIndex)
	local nWidth = 1
	local nHeight = 1
	local nCount = 1
	if CountFreeRoomByWH(nWidth, nHeight, nCount) < nCount then
		Say(format("�� b�o ��m t�i s�n c�a ��i hi�p, xin h�y �� tr�ng %d %dx%d h�nh trang", nCount, nWidth, nHeight))
		return 
	end
	
	if CallPlayerFunction(nPlayerIndex, IsMyItem, nItemIndex) ~= 1 then
		return 
	end
	if CallPlayerFunction(nPlayerIndex, RemoveItemByIndex, nItemIndex) ~= 1 then
		WriteLog("H�y b� D� Dung B� Thu�t th�t b�i")
		return 
	end
	-- ����ѡ�������
	CallPlayerFunction(nPlayerIndex, tbAwardTemplet.GiveAwardByList, tbAwardTemplet, %tbMask[nIndex], "S� d�ng D� Dung B� Thu�t", 1)
end

function main(nItemIndex)
	showMask(1, PlayerIndex, nItemIndex)
	return 1
end