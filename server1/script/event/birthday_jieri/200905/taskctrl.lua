-- ====================== �ļ���Ϣ ======================

-- ������Ե�����Խ�ϰ� - 2009�����ջ
-- 	1��ף���۰����°汾
-- 	2���·����ְ����¼�
-- 	3����ȡ�ֺ���
-- 	4������
-- �ļ�������taskctrl.lua
-- �����ߡ����ӷ��~
-- ����ʱ�䣺2009-05-20 08:55:17

-- ======================================================

Include("\\script\\lib\\baseclass.lua")

local tbTask = tbBaseClass:new()

function tbTask:_init(nstartdate, nenddate)
	self.nstartdate	= nstartdate;
	self.nenddate	= nenddate;
	
	self.nmaxexpfromzhuhe	= 15e5;
	self.nmaxexpfromshoulie	= 9e5;
	self.nmaxexpfromchuang	= 10e5;	-- ����δ��
	
	self.tsk_version		= 1909;	-- ��汾��
	self.tsk_jinnangsj		= 1910;	-- �Ƿ���ȡ�������¼�
	self.tsk_zhuhe_maxexp	= 1911;	-- 
	self.tsk_zhuhe_curcnt	= 1912;	-- ʹ���°�ġ��°����������ޣ�500��ʹ������β������500��
	self.tsk_zhuhe_curexp	= 1913;	-- ף�ػ�������ޣ�42��
	self.tsk_shoulie_cnt	= 1914;	-- ÿ�����Ժ���Ĵ�����¼byte1:���ڣ�byte2:����
	self.tsk_shoulie_curexp	= 1863;	-- �μ����Ի�������ޣ�9��
	self.tsk_toll_task		= 1864;	-- 	byte1~2������500�������ϸ\��100������\ɱ��2������

	self.tsk_toll_cg_state		= 2605;		-- ʱ�����ս������ҽ�����������״̬��0��ʾû�нӣ�1��ʾ�Ѿ�����
	self.tsk_toll_cg_passcount	= 2606;		-- ʱ�����ս������ҵĹ�����
	self.tsk_toll_explmt		= 2607;		-- ���ػ�ľ�������
	
	self.tsk_msg_curtsk			= 2608;		-- ��ҵ�ǰ���ӵ���ʹ�����index
	self.tsk_msg_date			= 2608;		-- ÿ����ʹ����ÿ��ֻ����һ��
	self.tsk_msg_needcount		= 2617;		-- ÿ����ʹ�����������Ҫ������
			
	self.item_expiredtime1	= 20090720;
	self.item_expiredtime2	= 20090728;
	
end

function tbTask:reset_task()
	local ncurdate = tonumber(GetLocalDate("%Y%m%d"))
	if self.nstartdate <= ncurdate and ncurdate <= self.nenddate then
		if (GetTask(self.tsk_version) ~= self.nstartdate) then
			SetTask(self.tsk_version, self.nstartdate);
			
			SetTask(self.tsk_jinnangsj, 0);
			
			SetTask(self.tsk_shoulie_cnt, 0);
			SetTask(self.tsk_shoulie_curexp, 0);
			
			SetTask(self.tsk_toll_award, 0);
			SetTask(self.tsk_toll_curexp, 0);
			SetTask(self.tsk_toll_task, 0);
			
			SetTask(self.tsk_zhuhe_curcnt, 0);
			SetTask(self.tsk_zhuhe_maxexp, self.nmaxexpfromzhuhe);
			SetTask(self.tsk_zhuhe_curexp, 0);
			
			SetTask(self.tsk_toll_explmt, 0);
			
			SetTask(self.tsk_toll_cg_state, 0);	-- ���أ�ʱ����ս������ҽ�����������״̬
			SetTask(self.tsk_toll_cg_passcount, 0);
			
			for i = 1, 8 do
				SetTask(self.tsk_msg_date + i, 0);
			end
			SetTask(self.tsk_msg_curtsk, 0)
			SetTask(self.tsk_msg_needcount, 0);
		end
	end
		
end

-- �Ƿ��Ѿ���ȡ�������¼���1����ȡ����0��δ��ȡ��
function tbTask:if_taked_jinnang()
	self:reset_task();
	return GetTask(self.tsk_jinnangsj);
end

-- ��ý���μ����ԵĴ���
function tbTask:get_shoulie_count()
	self:reset_task();
	local nvalue = GetTask(self.tsk_shoulie_cnt);
	local nlastdate = GetByte(nvalue, 1);
	local ncount = GetByte(nvalue, 2);
	local ncurdate = tonumber(GetLocalDate("%d"));
	
	if (nlastdate ~= ncurdate) then
		nlastdate = ncurdate;
		nvalue = SetByte(nvalue, 1, nlastdate);
		
		ncount = 0;
		nvalue = SetByte(nvalue, 2, ncount);
		
		SetTask(self.tsk_shoulie_cnt, nvalue);
	end
	
	return ncount;
end

-- ���ӵ�ǰ�μ����ԵĴ���
function tbTask:add_shoulie_count(n_addvalue)
	local nvalue = GetTask(self.tsk_shoulie_cnt);
	local nlastdate = GetByte(nvalue, 1);
	local ncount = GetByte(nvalue, 2);
	ncount = ncount + n_addvalue;
	
	if (ncount > 255) then
		return 0;
	end
	
	nvalue = SetByte(nvalue, 2, ncount);
	SetTask(self.tsk_shoulie_cnt, nvalue);
	return 1;
end

-- ���ָ��TaskIDֵ
function tbTask:get_task(n_taskid)
	self:reset_task();
	return GetTask(n_taskid);
end

-- ����ָ��TaskIDֵ
function tbTask:set_task(n_taskid, n_value)
	return SetTask(n_taskid, n_value);
end

-- ����ָ��TaskIDֵ
function tbTask:add_task(n_taskid, n_addvalue)
	return self:set_task(n_taskid, self:get_task(n_taskid) + n_addvalue);
end

-- �����ܹ�ʹ���°����°������
function tbTask:add_zhuhe_maxexp()
	return self:add_task(self.tsk_zhuhe_maxexp, self.nmaxexpfromzhuhe);
end


function tbTask:get_toll_aimcount(n_type)
	local n_value = GetTask(self.tsk_toll_task);
	local n_count = 0;
	local n_bitmod = 1;
	
	if (n_type == 1) then
		n_count = mod(n_value, 2^9);
	elseif(n_type == 2) then
		n_count = mod(floor(n_value, 2^10), 2^10);
		n_bitmod = 2^10;
	elseif(n_type == 3) then
		n_count = floor(n_value, 2^10*2^10);
		n_bitmod = 2^10 * 2^10;
	else
		return nil;
	end
	
	return n_count;
end


function tbTask:add_toll_aimcount(n_type)
	local n_value = GetTask(self.tsk_toll_task);
	local n_count = 0;
	local n_bitmod = 1;
	if (n_type == 1) then
		n_count = mod(n_value, 2^9);
	elseif(n_type == 2) then
		n_count = mod(floor(n_value, 2^10), 2^10);
		n_bitmod = 2^10;
	elseif(n_type == 3) then
		n_count = floor(n_value, 2^10*2^10);
		n_bitmod = 2^10 * 2^10;
	else
		return nil;
	end
	
	return SetTask(self.tsk_toll_task, n_value + 1*n_bitmod);
end


function tbTask:clear_toll_aimcount(n_type)
	local n_value = GetTask(self.tsk_toll_task);
	local n_count = 0;
	local n_bitmod = 1;
	
	if (n_type == 1) then
		n_count = mod(n_value, 2^9);
	elseif(n_type == 2) then
		n_count = mod(floor(n_value, 2^10), 2^10);
		n_bitmod = 2^10;
	elseif(n_type == 3) then
		n_count = floor(n_value, 2^10*2^10);
		n_bitmod = 2^10 * 2^10;
	else
		return nil;
	end
	
	return SetTask(self.tsk_toll_task, n_value - n_count*n_bitmod);
end


function tbTask:get_toll_award(n_gene, n_type)
	return GetBit(GetTask(self.tsk_toll_award), (n_gene - 1)*3+n_type);
end

function tbTask:set_toll_award(n_gene, n_type, n_b)
	local n_value = GetTask(self.tsk_toll_award);
	n_value = SetBit(n_value, (n_gene - 1)*3+n_type, n_b);
	return SetTask(self.tsk_toll_award, n_value);
end

function tbTask:get_toll_isacc(n_gene, n_type)
	return GetBit(GetTask(self.tsk_toll_award), (n_gene - 1)*3+n_type+8);
end

function tbTask:set_toll_award(n_gene, n_type, n_b)
	local n_value = GetTask(self.tsk_toll_award);
	n_value = SetBit(n_value, (n_gene - 1)*3+n_type+8, n_b);
	return SetTask(self.tsk_toll_award, n_value);
end

tbBirthday0905_tbTasktCtrl = tbTask;
