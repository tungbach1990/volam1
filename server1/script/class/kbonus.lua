--========�ļ�����==================================--
--�ļ�����
--���ߣ�
--�������ڣ�
--����޸����ڣ�
--����������
--
--
--
--
--��Ϸ�ű���������Ե�����
--��ɽ����ɷ����޹�˾��copyright 1992-2005
--==================================================--
if not KBONUS_HEAD then
KBONUS_HEAD = 1

Include("\\script\\lib\\player.lua")
Include("\\script\\lib\\string.lua")

--========�ඨ��====================================--
--������
--���ߣ�
--�������ڣ�
--����޸����ڣ�
--����������
--
--
--
--
--��Ա������
--
--
--��Ա������
--
--
--
--
--������
--
--
--
--==================================================--
CONST_ITEM_NAME = 1
CONST_ITEM_PROBAB = 2
CONST_ITEM_COSTLY = 3
CONST_ITEM_MSG = 4
CONST_ITEM_TYPE = 5
CONST_ITEM_PARAMS = 6
CONST_ITEM_LOG = 7

KBonus = {
	ITEM = 1, --��ͨ����
	GOLDEN = 2, --�ƽ�װ��
	MONEY = 3, --jx��
	EXP = 4, --����ֵ
	MASK = 5, --���
	FUYUAN = 7, --��Ե
	REPUTE = 8, --����
	SKILL = 9, --����
	SKILLS = 10, --һ�鼼��
	PROPERTY = 11, --Ǳ�ܵ�
	SOCKETEQU = 12, --��װ
	UNKNOW = 0, --δ֪
	probability = 0,
	addBonus = function(self,index,name,probability,costly,msg,btype,blog,...)
		if(type(self[index]) == "table") then
			self.probability = self.probability - (tonumber(self[index][CONST_ITEM_PROBAB]) or 0)
		end
		self[index] = {	[CONST_ITEM_NAME] = tostring(name),
										[CONST_ITEM_PROBAB]=tonumber(probability) or 0,
										[CONST_ITEM_COSTLY]=tonumber(costly) or 0,
										[CONST_ITEM_MSG]=msg,
										[CONST_ITEM_TYPE]=tonumber(btype) or 0,
										[CONST_ITEM_LOG]=tonumber(blog) or 0,
										[CONST_ITEM_PARAMS]=arg[1]}
		if(self[index][CONST_ITEM_MSG]=="") then
			self[index][CONST_ITEM_MSG]=nil
		end
		self.probability = self.probability + self[index][CONST_ITEM_PROBAB]
		return
	end,
	randomSelect = function(self)
		local rnd = random(self.probability)
		local p = 0
		for i = 1,getn(self) do
			p =p + self[i][CONST_ITEM_PROBAB]
			if(rnd <=p) then
				return i
			end
		end
		return nil
	end,
	payBonus = function(self,playerIdx,bonusIdx)
		self:payBonusEx(playerIdx, bonusIdx, 1)
	end,
	payBonusEx = function(self,playerIdx,bonusIdx, scale) -- scale: ֧������(ֻ�Խ�Ǯ������ֵ��Ч)
		local btype,params = self[bonusIdx][CONST_ITEM_TYPE],self[bonusIdx][CONST_ITEM_PARAMS]
		if(FALSE(btype)) then
			return nil
		end
		if(not bonusIdx) then
			return nil
		end
		local g,d,p,l,s,luck,p1,p2,p3,p4,p5,p6,r = 
					tonumber(params[1]),  --g
					tonumber(params[2]),  --d
					tonumber(params[3]),  --p
					tonumber(params[4]) or random(10),  --l
					tonumber(params[5]) or random(5)-1,  --s
					tonumber(params[6]) or 0,  --luck
					tonumber(params[7]) or 0,  --p1
					tonumber(params[8]) or 0,  --p2
					tonumber(params[9]) or 0,  --p3
					tonumber(params[10]) or 0,  --p4
					tonumber(params[11]) or 0,  --p5
					tonumber(params[12]) or 0,  --p6
					tonumber(params[13]) --r
		
		if(btype == self.ITEM) then
			if(not g or not d or not p) then
				return nil
			end
			if(r) then
				RandomSeed(r)
			end
			callPlayerFunction(playerIdx,AddItem,g,d,p,l,s,luck,p1,p2,p3,p4,p5,p6)
			if(self[bonusIdx][CONST_ITEM_NAME]) then
				sendMessage(playerIdx,"B�n nh�n ���c <color=white>"..self[bonusIdx][CONST_ITEM_NAME].."<color> th��ng!")
			end
			local strmsg = self:convertBonusMsg(bonusIdx, playerIdx)
			if(TRUE(self[bonusIdx][CONST_ITEM_COSTLY]) and self[bonusIdx][CONST_ITEM_MSG]) then
				AddGlobalNews(strmsg)
			end
			if(TRUE(self[bonusIdx][CONST_ITEM_LOG])) then
				--����д��־
				WriteLog(date("%H%M%S")..": T�i kho�n"..callPlayerFunction(playerIdx,GetAccount)..", nh�n v�t"..callPlayerFunction(playerIdx,GetName)..strmsg)
			end	
			return self.ITEM
		end
		if(btype == self.SOCKETEQU) then
			if(r) then
				RandomSeed(r)
			end
			callPlayerFunction(playerIdx,AddQualityItem,2,g,d,p,l,s,luck,p1,p2,p3,p4,p5,p6)
			if(self[bonusIdx][CONST_ITEM_NAME]) then
				sendMessage(playerIdx,"B�n nh�n ���c <color=white>"..self[bonusIdx][CONST_ITEM_NAME].."<color> th��ng!")
			end
			local strmsg = self:convertBonusMsg(bonusIdx, playerIdx)
			if(TRUE(self[bonusIdx][CONST_ITEM_COSTLY]) and self[bonusIdx][CONST_ITEM_MSG]) then
				AddGlobalNews(strmsg)
			end
			if(TRUE(self[bonusIdx][CONST_ITEM_LOG])) then
				--����д��־
				WriteLog(date("%H%M%S")..": T�i kho�n"..callPlayerFunction(playerIdx,GetAccount)..", nh�n v�t"..callPlayerFunction(playerIdx,GetName)..strmsg)
			end	
			return self.SOCKETEQU
		end
		if(btype == self.GOLDEN) then
			callPlayerFunction(playerIdx,AddGoldItem,0,g)
			if(self[bonusIdx][CONST_ITEM_NAME]) then
				sendMessage(playerIdx,"B�n nh�n ���c <color=white>"..self[bonusIdx][CONST_ITEM_NAME].."<color> th��ng!")
			end
			local strmsg = self:convertBonusMsg(bonusIdx, playerIdx)
			if(TRUE(self[bonusIdx][CONST_ITEM_COSTLY]) and self[bonusIdx][CONST_ITEM_MSG]) then
				AddGlobalNews(strmsg)
			end
			if(TRUE(self[bonusIdx][CONST_ITEM_LOG])) then
				--����д��־
				WriteLog(date("%H%M%S")..": T�i kho�n"..callPlayerFunction(playerIdx,GetAccount)..", nh�n v�t"..callPlayerFunction(playerIdx,GetName)..strmsg)
			end	
			return self.GOLDEN
		end
		if(btype == self.MONEY) then
			callPlayerFunction(playerIdx,Earn, g*scale)
			if(self[bonusIdx][CONST_ITEM_NAME]) then
				sendMessage(playerIdx,"B�n nh�n ���c <color=white>"..self[bonusIdx][CONST_ITEM_NAME].."<color> th��ng!")
			end
			if(TRUE(self[bonusIdx][CONST_ITEM_COSTLY]) and self[bonusIdx][CONST_ITEM_MSG]) then
				local strmsg = self:convertBonusMsg(bonusIdx, playerIdx)
				AddGlobalNews(strmsg)
			end
			if(TRUE(self[bonusIdx][CONST_ITEM_LOG])) then
				--����д��־
				WriteLog(date("%H%M%S")..": T�i kho�n"..callPlayerFunction(playerIdx,GetAccount)..", nh�n v�t"..callPlayerFunction(playerIdx,GetName)..strmsg)
			end	
			return self.MONEY
		end
		if(btype == self.EXP) then
			callPlayerFunction(playerIdx,AddOwnExp,g*scale)
			if(self[bonusIdx][CONST_ITEM_NAME]) then
				sendMessage(playerIdx,"B�n nh�n ���c <color=white>"..replace(self[bonusIdx][CONST_ITEM_NAME],"<name>",g*scale).."<color> th��ng!")
			end
			local strmsg = self:convertBonusMsg(bonusIdx, playerIdx)
			if(TRUE(self[bonusIdx][CONST_ITEM_COSTLY]) and self[bonusIdx][CONST_ITEM_MSG]) then
				AddGlobalNews(strmsg)
			end
			if(TRUE(self[bonusIdx][CONST_ITEM_LOG])) then
				--����д��־
				WriteLog(date("%H%M%S")..": T�i kho�n"..callPlayerFunction(playerIdx,GetAccount)..", nh�n v�t"..callPlayerFunction(playerIdx,GetName)..strmsg)
			end	
			return self.EXP
		end
		return nil
	end,
	formatBonus = function(self,type,...)
		if(not type) then return nil end
		if(type == self.UNKNOW ) then
			return nil
		end
		if(type == self.ITEM) then
			return type,arg
		end
		if(type == self. GOLDEN) then
			return type,arg[1]
		end
		if(type == self.MONEY) then
			return type,arg[1]
		end
		if(type == self.EXP) then
			return type,arg[1]
		end
		if(type == self.MASK) then
			return type,arg
		end
		if(type == self.FUYUAN) then
			return type,arg[1]
		end
		return nil
	end,

	convertBonusMsg = function(self,bonusIdx, playerIdx)
		local str,msg = "",self[bonusIdx][CONST_ITEM_MSG] or ""
		
		if (playerIdx > 0) then
			local strRoleName = callPlayerFunction(playerIdx,GetName);
			str = replace(msg,"<player>",strRoleName)
			str = replace(str,"<name>",self[bonusIdx][CONST_ITEM_NAME])
		end
		return str
	end
}
end
