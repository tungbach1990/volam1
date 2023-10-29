--�����׻���08��Ů�ڻ
--
--
Include("\\script\\task\\task_addplayerexp.lua")
if tbclassname == nil then
	tbclassname = {}
end
funv_jieri_meiren = tbclassname
funv_jieri_meiren.ndatestart = 8030800
funv_jieri_meiren.ndateend = 8033124
funv_jieri_meiren.ntask = 1878
funv_jieri_meiren.LIMIT_LEVEL = 50
funv_jieri_meiren.tbitem =
{
	meigui = {g=6,d=1,p=1681,szname="B� hoa h�ng",nexp=0.001,limit=25},
	juhua = {g=6,d=1,p=1682,szname="B� hoa c�c",nmanexp=1000000,nmaleexp=1500000,limit=125},
}
function main()
	local ndate = tonumber(GetLocalDate("%y%m%d%H"))
	if ndate < funv_jieri_meiren.ndatestart or ndate > funv_jieri_meiren.ndateend then
		Say("T�m th�i ch�a c� ho�t ��ng.",0)
		return
	end
	Say("Ch�ng hay c�c h� mu�n t�ng ta hoa g� nh�?",3,"Ta mu�n t�ng b� hoa h�ng./#funv_jieri_meiren:zengsongmeigui(1)","Ta mu�n t�ng b� hoa c�c./#funv_jieri_meiren:zengsongjuhua(1)","Tho�t ra/NoChoice")
end

function funv_jieri_meiren:zengsongmeigui(sel)
	if self:check_level() == 0 then
		Say("Nh�n v�t ��ng c�p tr�n 50 �� n�p th� m�i c� th� t�ng hoa.",0)
		return
	end
	if self:check_pay() == 0 then
		Say("Nh�n v�t ��ng c�p tr�n 50 �� n�p th� m�i c� th� t�ng hoa.",0)
		return
	end
	local ntaskmeigui = self:getTaskByte(self.ntask,3)
	local tbmeigui = self.tbitem.meigui
	if ntaskmeigui >= tbmeigui.limit then
		Say("M�i nh�n v�t ch� c� th� t�ng cho m� nh�n t�i �a 25 b� hoa h�ng.",0)
		return
	end
	local nmeigui = CalcEquiproomItemCount(tbmeigui.g,tbmeigui.d,tbmeigui.p,-1)
	local nsum = 0
	if nmeigui < 1 then
		Say("B�n qu�n mang b� hoa h�ng r�i.",0)
		return
	end
	ConsumeEquiproomItem(1,tbmeigui.g,tbmeigui.d,tbmeigui.p,-1)
	local n_transcount = ST_GetTransLifeCount();
	local nexp = tl_getUpLevelExp((GetLevel()+1), n_transcount) * tbmeigui.nexp
	AddOwnExp(nexp)
	Msg2Player(format("Ch�c m�ng, b�n nh�n ���c <color=yellow>%d<color> kinh nghi�m",nexp))
	self:addTaskByte(self.ntask,3,1)
end

function funv_jieri_meiren:zengsongjuhua(sel)
	if self:check_level() == 0 then
		Say("Nh�n v�t ��ng c�p tr�n 50 �� n�p th� m�i c� th� t�ng hoa.",0)
		return
	end
	if self:check_pay() == 0 then
		Say("Nh�n v�t ��ng c�p tr�n 50 �� n�p th� m�i c� th� t�ng hoa.",0)
		return
	end
	local ntaskjuhua = self:getTaskByte(self.ntask,4)
	local tbjuhua = self.tbitem.juhua
	if ntaskjuhua >= tbjuhua.limit then
		Say("M�i nh�n v�t ch� c� th� t�ng cho m� nh�n t�i �a 125 b� hoa c�c.",0)
		return
	end
	local njuhua = CalcEquiproomItemCount(tbjuhua.g,tbjuhua.d,tbjuhua.p,-1)
	local nsum = 0
	if njuhua < 1 then
		Say("B�n qu�n mang b� hoa c�c r�i.",0)
		return
	end
	ConsumeEquiproomItem(1,tbjuhua.g,tbjuhua.d,tbjuhua.p,-1)
	local nexp = 0
	if GetSex() == 0 then
		nexp = tbjuhua.nmanexp
	else
		nexp = tbjuhua.nmaleexp
	end
	AddOwnExp(nexp)
	Msg2Player(format("Ch�c m�ng, b�n nh�n ���c <color=yellow>%d<color> kinh nghi�m",nexp))
	self:addTaskByte(self.ntask,4,1)
end


function tbclassname:check_level()		--�жϵȼ�
	if GetLevel() < tbclassname.LIMIT_LEVEL then
		return 0
	end 
	return 1
end

function tbclassname:check_pay()		--�жϳ�ֵ�û�
	if GetExtPoint(0) <= 0 then
		return 0
	end 
	return 1
end

--��������ֽڻ��
function tbclassname:getTaskByte(The_Task_ID,theByte)
	return GetByte(GetTask(The_Task_ID),theByte);
end

--��������ֽ�����
function tbclassname:addTaskByte(The_Task_ID,theByte,Inc_Num)
	SetTask(The_Task_ID,SetByte(GetTask(The_Task_ID),theByte,GetByte(GetTask(The_Task_ID),theByte)+Inc_Num));
end