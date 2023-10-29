
-- ====================== �ļ���Ϣ ======================

-- ������Եonline �����������չ֧��ͷ�ļ�
-- Edited by peres
-- 2005/08/12 PM 10:28

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

-- ����ļ����֧��
Include("\\script\\class\\ktabfile.lua");

-- �̳� KTabFile �������¹���
KTabFileEx = inherit(KTabFile, {

	-- �������ָ�����ڵ������У�����ָ�����ݵ�����
	-- ���������data:data ָ��������
	-- ���������string:col ָ�����б���
	-- ����ֵ��  int:row    ������������
	getDataRow = function(self, data, col)
		local strType = type(data) -- ��ȡ��������
		local i=0;
		
		for i=2, self:getRow() do
			if type=="number" then
				if tonumber(self:getCell(col, i))==data then
					return i;
				end;
			else
				if self:getCell(col, i)==data then
					return i;
				end;	
			end;
		end;
		return 0;
	end,

	-- ��һ������ļ��и���ָ��������ȡ��������Ϊһ����ά����
	-- ���������string:Col �б���
	-- ���������int:nStart �ӵڼ��п�ʼ��Ĭ��Ϊ 2
	-- ����ֵ����ά����ֵ����
	createIntArray = function(self, Col, nStart)
		local aryReturn = {};
		local i=0;
		
		if nStart==nil then nStart=2; end;
		
		for i=nStart, self:getRow() do
			tinsert(aryReturn, 
					tonumber(self:getCell(Col, i))
					);
		end;
		
		return aryReturn;
	end,

	-- ��һ������ļ��и���ָ��������ȡ��������Ϊһ����ά����
	-- ���������string:Col �б���
	-- ���������int:nStart �ӵڼ��п�ʼ��Ĭ��Ϊ 2
	-- ����ֵ����ά���ַ�������
	createStringArray = function(self, Col, nStart)
		local aryReturn = {};
		local i=0;
		
		if nStart==nil then nStart=2; end;
		
		for i=nStart, self:getRow() do
			tinsert(aryReturn, 
					self:getCell(Col, i)
					);
		end;
		
		return aryReturn;
	end,
	
	-- ���ݵ��е�Ȩ�������ѡȡ��һ������
	-- ���������string:Col �б���
	-- ���������int:nStart �ӵڼ��п�ʼ��Ĭ��Ϊ 2
	-- ����ֵ��  int:row    ������������
	countArrayRate = function(self, col, nStart)
		local nRow = self:getRow();
		local nRandom = 0;
		local nAdd = 0;
		local i=0;
		
		if nStart==nil then nStart=2; end;
		
		for i=nStart, nRow do
			nAdd = nAdd + tonumber(self:getCell(col, i));
		end;
		
		nRandom = random(1, nAdd);
		
		nAdd = 0;
		
		for i=nStart, nRow do
			nAdd = nAdd + tonumber(self:getCell(col, i));
			if nAdd>=nRandom then
				return i;
			end;
		end;
		
		return 0;
	end,

});