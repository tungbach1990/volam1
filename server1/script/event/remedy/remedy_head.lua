
-- ====================== �ļ���Ϣ ======================

-- ������Եonline ��������ͷ�ļ�
-- Edited by peres
-- 2006/03/17 PM 15:42

-- �̻�����һҹ���̻���
-- ���ǵ����ڴ������Ⱥ�У�վ�����ı���ӵ��ס����
-- ����ů��Ƥ��������Ϥ��ζ�����̻����������۾���
-- һ���޿���ء���

-- ======================================================

-- ����������֧��
Include ("\\script\\lib\\mem.lua");

CRemedy = {

	_nServer     = 0,  -- ������ָ�����������Ϊ 0 ����������ͨ��
	_nStartDate  = 0,  -- ������ʼ������
	_nEndDate    = 0,  -- ��������������
	_nTaskID     = 0,  -- ��ռ�õ��������
	_nTimes		 = 0,  -- ÿ��������ȡ��������
	_nLevel      = 0,  -- ��ȡ�ĵȼ����ƣ�0 Ϊ����ȼ�
	_szRemedyName = "", -- �����������
	
	-- ���캯������������ʼ���ڣ��������ڣ���ռ�õ��������������������֣���Ϊ�գ�
	__new = function(self, arg)
		self._nServer = arg[1];
		self._nStartDate = arg[2];
		self._nEndDate = arg[3];
		self._nTaskID = arg[4];
		self._nLevel = arg[5];
		self._szRemedyName = arg[6];
	end,
	
	checkPay = function(self)
		
		local bServer, bDate, bTask, bLevel = 0,0,0,0;  -- ��Ҫ�������ĸ���������ͨ��
		
		local nNowServer = GetGateWayClientID();
		
		local nNowDate   = tonumber(GetLocalDate("%y%m%d"));
		
		-- �ֱ��ȡ��ʼ�ͽ�������/��/��
		local nStartYear   = tonumber(strsub(tostring(self._nStartDate),1,1));
		local nStartMonth  = tonumber(strsub(tostring(self._nStartDate),2,3));
		local nStartDay    = tonumber(strsub(tostring(self._nStartDate),4,5));
		
		local nEndYear     = tonumber(strsub(tostring(self._nEndDate),1,1));
		local nEndMonth    = tonumber(strsub(tostring(self._nEndDate),2,3));
		local nEndDay      = tonumber(strsub(tostring(self._nEndDate),4,5));
		
		local nNowTimes  = GetTask(self._nTaskID);
		
		local aryErrorMsg = {"<enter>"};
		
			-- ����������Ƿ���ͬ
			if self._nServer~=0 then
				if self._nServer==nNowServer then 
					bServer = 1; 
				else
					bServer = 0;
					tinsert(aryErrorMsg, "���β���������ڱ�������<enter>");
				end;
			else
				bServer = 1;
			end;
			
			-- ��������Ƿ��ڷ�Χ��
			if nNowDate>=self._nStartDate and nNowDate<=self._nEndDate then
				bDate = 1;
			else
				bDate = 0;
				tinsert(aryErrorMsg, "�Ѿ�������ȡ�����ڷ�Χ����ȡ�������ԣ�<color=yellow>"..nStartYear.."��"..nStartMonth.."��"..nStartDay.."��<color>��ʼ����<color=yellow>"..
									 nEndYear.."��"..nEndMonth.."��"..nEndDay.."��<color>��ֹ��<enter>");
			end;
			
			if GetLevel()>=self._nLevel then
				bLevel = 1;
			else
				bLevel = 0;
				tinsert(aryErrorMsg, "û�дﵽ��ȡ�����ĵȼ�������ȼ�������� <color=yellow>"..self._nLevel.." ��<color><enter>��");
			end;
			
			-- �����ȡ�Ĵ����Ƿ��Ѿ��ﵽ
			if nNowTimes<1 then
				bTask = 1;
			else
				bTask = 0;
				tinsert(aryErrorMsg, "�Ѿ��ﵽÿ�˿�����ȡ�Ĵ������ơ�<enter>");
			end;
			
			-- ȫ�����������ϲ�ͨ���������ͨ�����򷵻�ʧ�ܵ��ַ�����
			if bServer==1 and bDate==1 and bTask==1 and bLevel==1 then
				return 1;
			else
				return aryErrorMsg;
			end;
	end,
	
	-- �⳥����ҵ�������
	payForPlayer = function(self)
		
		local nResult = self:checkPay();
		
		if nResult==1 then
			-- ��д�����ٷ��������������ˢ�����
			self:writeData();
			self:payProcess();
			return 1;
		else
			return nResult;
		end;
	end,
	
	-- �⳥����������̣��ɼ̳�
	payProcess = function(self)
		return 1;
	end,
	
	-- д�����ݵĹ��̣��ɼ̳�
	writeData = function(self)
		SetTask(self._nTaskID, GetTask(self._nTaskID) + 1);
		
		if self._szRemedyName~=nil then
			WriteLog("["..self._szRemedyName.."]"..date("[%y��%m��%d��%Hʱ%M��]").."[�˺ţ�"..GetAccount().."][��ɫ��"..GetName().."]��".."ִ����һ����ȡ������");
		end;
		
		return 1;
	end,
}
