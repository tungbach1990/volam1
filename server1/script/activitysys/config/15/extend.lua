Include("\\script\\activitysys\\config\\15\\head.lua")
Include("\\script\\activitysys\\config\\15\\variables.lua")
Include("\\script\\flipcard\\flipcard_gs.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\lib\\log.lua")
pActivity.nPak = curpack()

function pActivity:FlipCardCallBack(nIndex)
	if self:CheckTaskDaily(%TSKI_BOX_OPEN_NUM,%MAX_USE_LIMIT_BOX,"H�m nay ��i hi�p �� m� 200 � r�i, ng�y mai l�i ti�p t�c nh�.","<") and
	PlayerFunLib:CheckCash(%nConsumeMoney,"Ti�n ��i hi�p mang theo kh�ng �� r�i, mang ti�n ��y �� r�i h�ng ��n.") and
	PlayerFunLib:CheckFreeBagCell(1,"H�nh trang c�a c�c h� kh�ng �� � tr�ng, h�y s�p x�p l�i r�i h�ng ��n.") then
		
		local funCallBack = function(nItemIndex)
			local nCount = GetItemStackCount(nItemIndex)
			local nG, nD, nP = GetItemProp(nItemIndex)
			%tbFlipCard:SetItem(%nIndex, {nCount, nG, nD, nP})
		end
		local tbAward = {
			[1]={szName=%tbMaterail_1.szName, tbProp=%tbMaterail_1.tbProp, nExpiredTime=%tbMaterail_1.nExpiredTime, nRate = 10, nCount = 2,CallBack=funCallBack},
			[2]={szName=%tbMaterail_1.szName, tbProp=%tbMaterail_1.tbProp, nExpiredTime=%tbMaterail_1.nExpiredTime, nRate = 7, nCount = 4,CallBack=funCallBack},
			[3]={szName=%tbMaterail_1.szName, tbProp=%tbMaterail_1.tbProp, nExpiredTime=%tbMaterail_1.nExpiredTime, nRate = 6, nCount = 6,CallBack=funCallBack},
			[4]={szName=%tbMaterail_1.szName, tbProp=%tbMaterail_1.tbProp, nExpiredTime=%tbMaterail_1.nExpiredTime, nRate = 5, nCount = 8,CallBack=funCallBack},
			[5]={szName=%tbMaterail_1.szName, tbProp=%tbMaterail_1.tbProp, nExpiredTime=%tbMaterail_1.nExpiredTime, nRate = 5, nCount = 10,CallBack=funCallBack},
			[6]={szName=%tbMaterail_4.szName, tbProp=%tbMaterail_4.tbProp, nExpiredTime=%tbMaterail_4.nExpiredTime, nRate = 10, nCount = 2,CallBack=funCallBack},
			[7]={szName=%tbMaterail_4.szName, tbProp=%tbMaterail_4.tbProp, nExpiredTime=%tbMaterail_4.nExpiredTime, nRate = 7, nCount = 4,CallBack=funCallBack},
			[8]={szName=%tbMaterail_4.szName, tbProp=%tbMaterail_4.tbProp, nExpiredTime=%tbMaterail_4.nExpiredTime, nRate = 6, nCount = 6,CallBack=funCallBack},
			[9]={szName=%tbMaterail_4.szName, tbProp=%tbMaterail_4.tbProp, nExpiredTime=%tbMaterail_4.nExpiredTime, nRate = 5, nCount = 8,CallBack=funCallBack},
			[10]={szName=%tbMaterail_4.szName, tbProp=%tbMaterail_4.tbProp, nExpiredTime=%tbMaterail_4.nExpiredTime, nRate = 5, nCount = 10,CallBack=funCallBack},
			[11]={szName=%tbMaterail_5.szName, tbProp=%tbMaterail_5.tbProp, nExpiredTime=%tbMaterail_5.nExpiredTime, nRate = 10, nCount = 2,CallBack=funCallBack},
			[12]={szName=%tbMaterail_5.szName, tbProp=%tbMaterail_5.tbProp, nExpiredTime=%tbMaterail_5.nExpiredTime, nRate = 7, nCount = 4,CallBack=funCallBack},
			[13]={szName=%tbMaterail_5.szName, tbProp=%tbMaterail_5.tbProp, nExpiredTime=%tbMaterail_5.nExpiredTime, nRate = 6, nCount = 6,CallBack=funCallBack},
			[14]={szName=%tbMaterail_5.szName, tbProp=%tbMaterail_5.tbProp, nExpiredTime=%tbMaterail_5.nExpiredTime, nRate = 5, nCount = 8,CallBack=funCallBack},
			[15]={szName=%tbMaterail_5.szName, tbProp=%tbMaterail_5.tbProp, nExpiredTime=%tbMaterail_5.nExpiredTime, nRate = 6, nCount = 10,CallBack=funCallBack},			
		} 	
		self:OpenBox(tbAward)
	end
end

-- �򿪷��ƽ���
function pActivity:OpenUI()
	%tbFlipCard:OpenUI(self.FlipCardCallBack, {self})
end

-- �����ȡ����
function pActivity:GetIndexByRandom(tbItem)
	if tbItem == nil then
		return nil
	end
	local rtotal = 10000000
	local rcur=random(1,rtotal);
	local rstep=0;
	for i=1,getn(tbItem) do
		rstep=rstep+floor(tbItem[i].nRate*rtotal/100);
		if(rcur <= rstep) then
			return i  -- ������Ʒ���±�
		end
	end
end

-- ��������
function pActivity:BroadCast(szPlayerName, szAwardType, szAwardName)
	AddGlobalNews("Ch�c m�ng <color=red>"..szPlayerName.."<color>��i hi�p t� <color=red>"..szAwardType.."<color>�� nh�n ���c <color=red>"..szAwardName.."<color>")
end

-- �򿪿��
function pActivity:OpenBox(tbAward)
	self:AddTaskDaily(%TSKI_BOX_OPEN_NUM,1) -- ���ӷ�������
	Pay(%nConsumeMoney)  -- �۳�������
	-- ��������
	PlayerFunLib:AddExp(%EXP_OPEN_BOX, 1)
	-- ��������
	PlayerFunLib:GetItem(tbAward, 1)
	-- �ﵽ200����ϵͳ��������
	if self:GetTaskDaily(%TSKI_BOX_OPEN_NUM) == %MAX_USE_LIMIT_BOX then 
		Msg2Player(format("H�m nay ��i hi�p �� m� %d �, ng�y mai l�i ��n nh�", %MAX_USE_LIMIT_BOX))
	end
end

-- ʹ�ý�����Ʒ
function pActivity:UseAward1(nExp)
	-- ��������
	PlayerFunLib:AddExp(nExp, 1, %EVENT_LOG_TITLE, "SuDungQuocKhanhVang")  
	-- ��������
	local nCurrentNum = self:GetTask(%TSKI_AWARD_NUM_1)
	local tbAward = self.tbAward["award_a"]
	local nAwardIndex = self:GetIndexByRandom(tbAward)
	if nAwardIndex then
		local tbAwardItem = tbAward[nAwardIndex]
		PlayerFunLib:GetItem(tbAwardItem, 1, %EVENT_LOG_TITLE, "SuDungQuocKhanhVang")
		if tbAwardItem.bBroadcast then
			self:BroadCast(GetName(), %tbAward_1.szName, tbAwardItem.szName)
		end
	end  
	if nCurrentNum == %MAX_USE_LIMIT_AWARD_1 then -- �ﵽ2000����ʹ�ý�����C
		Msg2Player(format("Ho�t ��ng l�n n�y ��i hi�p s� d�ng %s ��t ��n %d c�I, kh�ng th� ti�p t�c s� d�ng", %tbAward_1.szName, %MAX_USE_LIMIT_AWARD_1))
	end
end

function pActivity:UseAward2(nExp)
	-- ��������
	PlayerFunLib:AddExp(nExp, 1)       
	-- ��������
	local nCurrentNum = self:GetTask(%TSKI_AWARD_NUM_2)
	local tbAward = {}
	if mod(nCurrentNum, 100) == 0 then         -- �ﵽ100��200��N�ٸ���ʹ�ý�����C
		tbAward = self.tbAward["award_c"]
		%tbLog:PlayerActionLog(%EVENT_LOG_TITLE, "SuDungQuocKhanhDo"..nCurrentNum.."Lan")
	else                                  -- �������ʹ�ý�����B
		tbAward = self.tbAward["award_b"]
	end
	local nAwardIndex = self:GetIndexByRandom(tbAward)
	if nAwardIndex then
		local tbAwardItem = tbAward[nAwardIndex]
		PlayerFunLib:GetItem(tbAwardItem, 1,%EVENT_LOG_TITLE, "SuDungQuocKhanhDo")
		if tbAwardItem.bBroadcast then
			self:BroadCast(GetName(), %tbAward_2.szName, tbAwardItem.szName)
		end
	end
	--Special award
	local tbTmpSpecial = self.tbAward["award_special"]
	if tbTmpSpecial[nCurrentNum] then
		local tbTmpSpecial2 = tbTmpSpecial[nCurrentNum]
		PlayerFunLib:GetItem(tbTmpSpecial2, 1, %EVENT_LOG_TITLE, "SuDungQuocKhanhDo"..nCurrentNum.."Lan_DB")
		if tbTmpSpecial2.bBroadcast then
			self:BroadCast(GetName(), %tbAward_2.szName, tbTmpSpecial2.szName)
		end
	end
	if nCurrentNum == %MAX_USE_LIMIT_AWARD_2 then -- �ﵽ2000����ʹ�ý�����C
		Msg2Player(format("Ho�t ��ng l�n n�y ��i hi�p s� d�ng %s ��t ��n %d c�I, kh�ng th� ti�p t�c s� d�ng", %tbAward_2.szName, %MAX_USE_LIMIT_AWARD_2))
	end
end

