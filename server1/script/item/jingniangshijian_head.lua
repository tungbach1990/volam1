--�����¼� ��Ʒ��

--by zhongchaolong 2008-10-30
-- ��Ҫ����������Dailog�����ӶԻ����
-- �����¼�������Ϻ���Ҫ �ֶ����� ����ʹ�ô�����ָ�
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\baseclass.lua")
Include("\\script\\task\\system\\task_string.lua");


--�����¼���ͷ�ļ�


Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\task\\killmonster\\killmonster.lua")
if not tbItemJingnianshijian then
	tbItemJingnianshijian = tbBaseClass:new()
end


local nMaxUseCount = 1000 --Ĭ�����ʹ�ô���
local nExpiredTime = 20090907



--�����������¼��Ի����
function tbItemJingnianshijian:Dailog(nItemIndex)
	local szMsg = self.szDescLink.."S� d�ng c�m nang s� ki�n."
	local tbOpt = {}	
	tinsert(tbOpt, "H�y b� /OnCancel")
	
	Describe(szMsg, getn(tbOpt), tbOpt);
end

function tbItemJingnianshijian:_init()
	self.PARAM_ID_USEDATE	= 1
	self.PARAM_ID_USECOUNT 	= 2
	self.szDescLink			= "<link=image[0,0]:\\spr\\item\\script\\jingniangshijian.spr><link>" --��֪���Ƕ�ȡ�ļ���Ϣ�û���д����
end


--�����Ʒ�ǵ�һ��ʹ�ã���ô����ʹ�����ڵ����ƺͣ����ʹ�ô���
function tbItemJingnianshijian:ItemParamInit(nItemIndex)
	local nUseDate	= GetItemParam(nItemIndex, self.PARAM_ID_USEDATE);
	local nUseCount	= GetItemParam(nItemIndex, self.PARAM_ID_USECOUNT);
	
	if nUseDate == 0 and nUseCount == 0 then
		SetSpecItemParam(nItemIndex, self.PARAM_ID_USEDATE, %nExpiredTime );
		SetSpecItemParam(nItemIndex, self.PARAM_ID_USECOUNT, %nMaxUseCount);
		SyncItem(nItemIndex) --ͬ���ͻ���
	end
end

--��Ʒʹ��ʱ
function tbItemJingnianshijian:OnUse(nItemIndex)
	
	self:ItemParamInit(nItemIndex);
	
	if self:CheckItem(nItemIndex) == nil then
		return 0
	end
	self:Dailog(nItemIndex)
	
	
	return 1
end

--�����Ʒ�Ƿ���ڣ� �����Լ��ģ���Ʒ�;�
function tbItemJingnianshijian:CheckItem(nItemIndex)
	
	if not nItemIndex  or  nItemIndex <= 0 then
		return nil;
	end
	if  tonumber(GetLocalDate("%Y%m%d")) >= GetItemParam(nItemIndex, 1) then
		Talk(1,"","V�t ph�m n�y �� h�t h�n");
		return nil
	end
	
	
	if IsMyItem(nItemIndex) ~= 1 then
		return 0
	end
	
	local ng, nd, np = GetItemProp(nItemIndex);
	
	if (ng ~= 6 or nd ~= 1 or np ~= 1833) then
		return 0
	end
	
	local nUseCount =  GetItemParam(nItemIndex, self.PARAM_ID_USECOUNT)
	if nUseCount < 1 then --�;�С�� 1 ɾ��
		RemoveItemByIndex(nItemIndex)
		Talk(1,"", "V�t ph�m n�y �� h�t �� b�n v� bi�n m�t.")
		return nil
	end
	return 1
end

--����ʹ�ô���
function tbItemJingnianshijian:ReduceUseCount(nItemIndex)
	if nItemIndex  and nItemIndex > 0 then 
		local ng, nd, np = GetItemProp(nItemIndex);
		
		if (ng == 6 and nd == 1 and np == 1833 and IsMyItem(nItemIndex) == 1) then
		
			local nUseCount =  GetItemParam(nItemIndex, self.PARAM_ID_USECOUNT)
			nUseCount = nUseCount - 1
			SetSpecItemParam(nItemIndex, self.PARAM_ID_USECOUNT, nUseCount)
			SyncItem(nItemIndex) --ͬ���ͻ���
			if nUseCount < 1 then --�����˾�ɾ��
				RemoveItemByIndex(nItemIndex)
			end
		end
		
	end
end


function tbItemJingnianshijian:GetDesc(nItemIndex)
	local nUseDate	= GetItemParam(nItemIndex, self.PARAM_ID_USEDATE);

	local nUseCount	= GetItemParam(nItemIndex, self.PARAM_ID_USECOUNT);
	
	local nDate		= %nExpiredTime
	
	if nUseDate == 0 and nUseCount == 0 then
		nUseCount = %nMaxUseCount
	end
	
	return format("<color=green>S� l�n s� d�ng c�n l�i: %d<color>", nUseCount)
end
function OnCancel()
	
end

tbItemJingnianshijian:_init()