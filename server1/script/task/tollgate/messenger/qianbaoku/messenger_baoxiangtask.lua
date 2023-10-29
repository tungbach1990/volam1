-------------------------------------------------------------------------
-- FileName		:	messenger_baoxiangtask.lua
-- Author		:	daizejun
-- CreateTime	:	2011-03-24 
-- Desc			:   ǧ����ؿ�������������ع��ߺ����ű�
-------------------------------------------------------------------------
--Include("\\script\\task\\tollgate\\messenger\\qianbaoku\\messenger_baoxiangtask.lua")--�����乤�ߺ���
Include("\\script\\task\\newtask\\newtask_head.lua") --���� nt_getTask ͬ���������ͻ��˵���

nBaoXiangTotal = 9--�ܹ��ı������
nOpendRequire = 5--������Ҫ�������


--��ȡ����ı�������˳��
function get_task_order()
	local tbSel = {}
	local tbResult = {}
	local nResult = 0
	local i = 1
	while i <= %nOpendRequire do
		local nTmp = random(1,%nBaoXiangTotal)
		if not tbSel[nTmp] then
			tbSel[nTmp] = i
			tbResult[i] = nTmp
			nResult = nResult * 10 + nTmp
			i = i + 1
		end
	end
	
	return nResult,tbResult
end

--���������ת�����ַ���
function get_task_string(nCode)
	local szRet = ""
	local nCount = 0
	if nCode then
		while(nCode > 0) do
			local nDigit = mod(nCode, 10)
			nCode = floor(nCode/10)
			if 0==nCount then
				szRet = format("%d",nDigit)
			else
				szRet = format("%d,%s",nDigit,szRet)
			end
			nCount = nCount+1
		end
	end
	return szRet,nCount
end

--��һ������
function add_task_step(nDigit)
	if (not nDigit) or nDigit < 1 or nDigit > %nBaoXiangTotal then
		return
	end
	Uworld1202 = nt_getTask(1202)
	if Uworld1202 >= pow(10, %nOpendRequire) then
		return
	end
	Uworld1202 = Uworld1202 * 10 + nDigit;
	nt_setTask(1202, Uworld1202)
	return check_task_state()
end

--�˷�����
function pow(nBase, nFang)
	local nRet = 1
	for i=1,nFang do
		nRet = nRet * nBase
	end
	return nRet
end

--�������״̬
function check_task_state()
	local Uworld1201 = nt_getTask(1201)--���������
	local Uworld1202 = nt_getTask(1202)--�ѿ������
	local _,n1202DigitCount = get_task_string(Uworld1202)
	if Uworld1201==0 or n1202DigitCount > %nOpendRequire then
		return--����ʧ��
	elseif Uworld1201==Uworld1202 then
		return 30--����ɹ�
	elseif floor(Uworld1201/pow(10,%nOpendRequire-n1202DigitCount)) == Uworld1202 then
		return 20--������Լ�������
	else
		return 0--����ʧ��
	end
end

function get_task_daily(nTaskIdx)
	if not nTaskIdx then
		return
	end
	local nTaskValue = nt_getTask(nTaskIdx)
	local nCurDate = tonumber(GetLocalDate("%y%m%d"))
	
	if floor(nTaskValue/256) ~= nCurDate then
		nTaskValue = nCurDate * 256
		nt_setTask(nTaskIdx, nTaskValue)
	end
	
	return mod(nTaskValue, 256)
end

function set_task_daily(nTaskIdx, nValue)
	if not nTaskIdx then
		return
	end
	if not nValue then
		nValue = 1
	end
	if nValue >= 256 then
		return
	end

	local nCurDate = tonumber(GetLocalDate("%y%m%d"))
	local nTaskValue = nCurDate * 256 + nValue;
	
	nt_setTask(nTaskIdx, nTaskValue)
	
	return nValue
end

function add_task_daily(nTaskIdx, nAdd)
	if not nTaskIdx or not nAdd then
		return
	end
	local nTaskValue = nt_getTask(nTaskIdx)
	local nCurDate = tonumber(GetLocalDate("%y%m%d"))
	
	local nValue = 0;
	if floor(nTaskValue/256) ~= nCurDate then
		nTaskValue = nCurDate * 256
		nt_setTask(nTaskIdx, nTaskValue)
	else
		nValue = mod(nTaskValue, 256)
	end
	
	nValue = nValue + nAdd
	if nValue < 0 or nValue >= 256 then
		return 
	end
	
	nTaskValue = nTaskValue + nAdd
	nt_setTask(nTaskIdx, nTaskValue)
	
	return nValue
end

