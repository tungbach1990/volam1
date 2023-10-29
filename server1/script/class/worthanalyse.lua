--========�ļ�����==================================--
--�ļ�����worthanalyse.lua
--���ߣ�yfeng
--�������ڣ�2005-1-25
--����޸����ڣ�2005-1-25
--����������
--	���ջ�ļ�ֵ������������ݡ���Ҫ����Ϊ��
--	����Ϊÿ����Ʒ��һ����ֵ��Worth(i)������ü�ֵ����
--����Ϊ�佱Ʒ���ֵĻ����������ӡ�Factor(i)������i��ʾ
--��i����Ʒ,Factor(i)��ʾ��i����Ʒ�ĸ������ӡ�
--	�����н�Ʒ�ĸ������ӵ��ܺ�Ϊ��
--	FactorCount = Factor(1)+Factor(2)+...+Factor(n)
--	��ô��BaseP(i) = Factor(i)/FactorCount��ʾΪ��i��
--��Ʒ���ֵĻ������ʡ�
--	BasePCount = BaseP(1)+BaseP(2)+...+BaseP(n) = 1
--	���������Ҫ����һ���ļ�ֵ����ı��Ʒ�����������
--�����ļ�ֵ��Ϊ��Worth����ôWP(Worth,i)��ʾΪ�����
--��ֵ��Worth�õ���i����Ʒ�ĸ��ʡ�
--	������<=Worth����ӽ���ֵ����Ʒ��������ѡj�ĸ�����
--���������������ķ�����ԭ����BaseP(j)��ΪWorthP(j)��
--��WP(Worth,j) = WorthP(j)
--�ڴˣ����Ǳ��뱣֤WorthP(j) < 1
--Ϊ�˱�֤�����غ㣬��1-WorthP(j)�ĸ�����Ҫ��������
--Ʒ���ĵ���
--	���ԣ����ȥ��j��Ʒ��ֵ����ȵĽ�Ʒ����֮�������
--��Ʒ�����еĸ���֮��Ϊ��
--	LeavePCount = 1 - BaseP(j)
--����������Ʒ��Worth�������¸���Ϊ
--	WorthP(i) = (1-WorthP(j))*BaseP(i)/LeavePCount  
--���Ǽ���WorthPjCount ���ܳ���x%�ĸ��ʣ���ô��
--	�ṩ�㷨ģ�ͣ�
--	��Min(Worth-Worth(j))>=0 ���ڣ���
--	1:	WorthP(j) = BaseP(j)*(100-x)/100 + x/100
--	2:	WorthP(i) = (1-WorthP(j)*BaseP(i)/LeavePCount
--ʽ1��2����WP(Worth,n)�ı�����ʽ
--
--��Ϸ�ű���������Ե�����
--��ɽ����ɷ����޹�˾��copyright 1992-2005
--==================================================--
--DEBUG = 1

if not WORTHANALYSE_HEAD then
WORTHANALYSE_HEAD =1

Include("\\script\\lib\\mem.lua")
Include("\\script\\class\\lerror.lua")


--========�ඨ��====================================--
--������WorthAnalyse
--���ߣ�yfeng
--�������ڣ�2005-1-25
--����޸����ڣ�2005-1-25
--����������
--	�������ڴ����ռ�ֵ����������ز�����
--��Ա������
--	__maxP�����ϳɹ��ĸ��ʣ���x%
--	__worth����ֵ���б�
--	__factors�����������б���Ϊһ�����飬���������
--��Ӧ��ؼ�ֵ������Ʒ��������ֵΪ�������ӡ�
--	__factorCount�����������ܺ�
--	__baseP����Ʒ���ݸ������ӵĻ��������б�
--	__worthP����Ʒ����Worth�任��ĸ����б�
--	__concern���ӽ�������ֵ��Worth����Ŀ
--	__leavePC��ʣ����Ʒ�ĸ����ܺ�
--��Ա������
--	:addWorth(idx,worth)�������idx��Ʒ�ļ�ֵ��
--	:makeBaseP()�����ɻ��������б�
--	:makeWorthP(worth)������worth�����µĸ����б�
--	:getFromBase()���ӻ������ʱ���ѡ��һ����Ʒ
--	:getFromWorth()����Worth����ѡ��һ����Ʒ
--������
--
--
--
--==================================================--
WorthAnalyse = inherit(LError,{
	__factorCount = 0,
	__maxP = 50,

--========��������==================================--
--����ԭ�Σ�:__new(maxP)
--���ߣ�yfeng
--�������ڣ�2005-2-1
--����޸����ڣ�2005-2-1
--����������
--	���캯��������ʼ��maxP
--������
--	maxP��������Ŀ�ļ�ֵ���������ʲ�С�ڴ�ֵ�������д
--��ֵ����maxP = 50
--����ֵ��
--	��
--������
--	��
--==================================================--
	__new = function(self,arg)
		if(not arg) then return end
		if(not arg[1]) then return end
		if(arg[1]<=0) then return end
		if(arg[1]>100) then
			self.__maxP = 100
			return
		end
		self.__maxP = arg[1]
		return
	end,
	
--========��������==================================--
--����ԭ�Σ�:addWorth
--���ߣ�yfeng
--�������ڣ�2005-1-25
--����޸����ڣ�2005-1-25
--����������
--	������idx����һ����ֵ��������������Ӧ�ĸ������ӣ�
--������ʹ�øú������Ӽ�ֵ����ʱ������������Ǵ�1��
--ʼ�������ţ��Ա�֤Ч�ʺ���ȷ�ԣ�����ֵ��Ϊnil��0ʱ��
--���������Ϊ0����������Ϊ0����Ŀ���ᱻgetFromXXX��
--����ȡ����
--������
--	idx�������ţ�����
--	worth����ֵ������0������������ò���Ϊnil����Ĭ��Ϊ0
--����ֵ��
--	����Ϊnil������Ϊ1
--������
--	local myworth = new(WorthAnalyse)
--	for i=1,100 do
--		wroth:addWorth(i,i)
--	end
--==================================================--
	addWorth = function(self,idx,worth)
		if(not worth) then worth = 0 end
		--�������漰ȡ���������Բ���С��,0�����⴦��
		if(worth>0 and worth < 1) then
			self:__notify(1000,"gi� tr� bi�n l��ng kh�ng th� l� s� th�p ph�n")
			return nil
		end
		if(not self.__worth) then
			self.__worth = {}
			self.__factors={}
		end
		if(not self.__worth[idx]) then --���������κμ�ֵ��
			self.__worth[idx] = worth
			if(worth == 0) then
				self.__factors[idx] = 0
			else
				self.__factors[idx] = 1/worth --�ڴ�ʱ�����������
				self.__factorCount = self.__factorCount + 1/worth --�ڴ�ʱ����__factorCount
			end
		else --�������м�ֵ����
			self.__factorCount = self.__factorCount - self.__factors[idx]
			self.__worth[idx] = worth
			if(worth == 0) then
				self.__factors[idx] = 0
			else
				self.__factors[idx] = 1/worth
				self.__factorCount = self.__factorCount + 1/worth
			end
		end
		self.__baseP = nil
		return 1
	end,
	
--========��������==================================--
--����ԭ�Σ�:makeBaseP
--���ߣ�yfeng
--�������ڣ�2005-1-25
--����޸����ڣ�2005-1-25
--����������
--	�ɸ������Ӽ���ȡ�û������ʣ������浽__baseP�С���
--����һ��Ҫ������:addFactor֮�����ʹ�ã��Ա�֤��ȷ�ԣ�
--����getFromXXXϵ�к������᲻�ɹ���
--������
--	��
--����ֵ��
--	ʧ��Ϊnil���ɹ�Ϊ1
--������
--
--
--
--==================================================--
	makeBaseP = function(self)
		if(not self.__worth) then
			self:__notify(100,"no any worth.")
			return nil
		end
		if(not self.__baseP) then
			self.__baseP = {}
			for i = 1,getn(self.__factors) do
				if(self.__factors[i]) then
					self.__baseP[i] = self.__factors[i]/self.__factorCount
				else --nil
					self.__baseP[i] = 0
				end
			end
		end
		return 1
	end,

--========��������==================================--
--����ԭ�Σ�:makeWorthP
--���ߣ�yfeng
--�������ڣ�2005-1-25
--����޸����ڣ�2005-1-25
--����������
--	����worth���¼���__baseP�еĸ��ʣ�����ŵ�__worthP
--�С�����������__worthP�Ὣ���С�ڵ���worth����Ŀ
--���ʵ�������50%��ע�⣬ִ�д˺���֮ǰ��һ��Ҫ��ִ��
--:makeBaseP()������ִ�иú�������ʧ��
--������
--	worth����ֵ������������Ϊ0��nil
--����ֵ��
--	ʧ��Ϊnil���ɹ�Ϊ1
--������
--
--
--
--==================================================--
	makeWorthP = function(self,worth)
		if(not self.__baseP) then
			self:__notify(100,"no any baseP.")
			return nil
		end
		local concern = nil --��ʼֵ
		for i=1,getn(self.__worth) do
			if(worth >= self.__worth[i]) then --i����������Ҫ�ҵ���ӽ�worth����
				if(not concern) then --��û����С��
					concern={i} --��<=worth�ļ����е��������ʱ��i
				else
					if(self.__worth[i] > self.__worth[concern[1]]) then  --������󣬵�<=worth
						concern = {i} --����__concern
					elseif(self.__worth[i] == self.__worth[concern[1]]) then
						concern[getn(concern)+1] = i
					end
				end
			end
		end
		if(not concern) then --û��С�ڵ���worth����,__worthP = __baseP
			self.__worthP = self.__baseP
			return 1
		end
		self.__concern = concern[random(getn(concern))] --���ѡȡ������������������������
		self.__leavePC = 1 - self.__baseP[self.__concern]
		--����__worthP
		self.__worthP = {}
		--	1:	WorthP(j) = BaseP(j)*(100-x)/100 + x/100
		self.__worthP[self.__concern] = self.__maxP/100 + self.__baseP[self.__concern]*(100-self.__maxP)/100
		for i=1,getn(self.__baseP) do
			if(i~=self.__concern) then  --i�Ǹ��ʱ�������
				--	2:	WorthP(i) = (1-WorthP(j))*BaseP(i)/LeavePCount
				self.__worthP[i] =  (1-self.__worthP[self.__concern])*self.__baseP[i]/self.__leavePC
			end
		end --endfor i
		return 1
	end,

--========��������==================================--
--����ԭ�Σ�:getFromBase
--���ߣ�yfeng
--�������ڣ�2005-1-26
--����޸����ڣ�2005-1-26
--����������
--	�ӻ������ʱ��������ȡһ����Ŀ��
--������
--	��
--����ֵ��
--	����ɹ���������Ŀ��ţ����򷵻�nil
--������
--	��
--==================================================--
	getFromBase = function(self)
		if(not self.__baseP) then
			self:__notify(300,"B�ng x�c xu�t c� b�n kh�ng t�n t�i..")
			return nil
		end
		local rnd = random()
		local p = 0
		for i=1,getn(self.__baseP) do
			p = p + self.__baseP[i]
			if(rnd <= p and self.__worth[i]~=0) then
				return i
			end
		end
		self:__notify(500,"Kh�ng th� ch�n ra h�ng m�c th�ch h�p.")
		return nil
	end,

--========��������==================================--
--����ԭ�Σ�getFromWorth
--���ߣ�yfeng
--�������ڣ�2005-1-26
--����޸����ڣ�2005-1-26
--����������
--	�Ӽ�ֵ���ʱ��У����ѡȡһ����Ŀ����ֵ���ʱ��Ǹ���
--����ļ�ֵ��worth������ģ����ԣ�ִ�д˺���֮ǰ������
--��Ҫִ��һ��:makeWorthP(worth)������makeWorthP֮��
--��getFromWorth���Ǵ�worth������ļ�ֵ���ʱ��л�ȡ����
--��Ŀ��
--������
--	worth����ֵ�����ò�������Ѽ�ֵ������С�ڵ���������
--��ӽ��ļ�ֵ������Ŀ����������50%����
--����ֵ��
--	����ɹ�,�򷵻�ѡ�����Ŀ���,���򷵻�nil
--������
--	��
--==================================================--
	getFromWorth = function(self)
		if(not self.__worthP) then
			self:__notify(400,"have no baseP.")
			return nil
		end
		local rnd = random()
		local p = 0
		for i=1,getn(self.__baseP) do
			p = p + self.__worthP[i]
			if(rnd <= p and self.__worth[i]~=0) then
				return i
			end
		end
		self:__notify(500,"Kh�ng th� ch�n ra h�ng m�c th�ch h�p.")
		return nil
	end,

})

--eg.
--Include("script/lib/string.lua")
--local myworth = new(WorthAnalyse)
--for i=1,200 do
--	myworth:addWorth(i,random(200000))
--end
--myworth:makeBaseP()
--h = openfile("settings/tmp.txt","w")
--for i=1,1000 do
--	local worth = random(200000)
--	myworth:makeWorthP(worth)
--	local idx = myworth:getFromWorth()
--	if(idx) then
--		local arr = {
--			worth,myworth.__worth[idx],myworth.__worthP[idx]
--		}
--		write(h,join(arr,"\t").."\n")
--		flush(h)
--	end
--end
--closefile(h)

end
