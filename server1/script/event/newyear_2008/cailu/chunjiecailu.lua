--�����»
--2008.1.21
--С�˶��

Include( "\\script\\task\\system\\task_string.lua" );
NewYear2008_cailu = {}
NewYear2008_cailu.tbdate = 
{
	nstart = 80202,
	nend = 80302,
	ndate = { 
		nstart = 80205,
		nend = 80211,
		common =
		{
			{2,3},
			{10,11},
			{14,15},
			{22,23},
		}
	},
	nweek = {
		common = {
			{10,11},
			{22,23}
		},
		Satweek = 
		{
			{2,3},
			{10,11},
			{14,15},
			{22,23},
		},
		Sunweek =
		{
			{10,11},
			{14,15},
			{22,23},
		},
	}
}
NewYear2008_cailu.ntaskday = 1877
NewYear2008_cailu.ntask = 1874
NewYear2008_cailu.ntaskcount=1873
NewYear2008_cailu.ntasksum = 20
NewYear2008_cailu.LIMIT_LEVEL = 50
NewYear2008_cailu.handcash = 9999
NewYear2008_cailu.mareial = 
{
	{G=6,D=1,P=1657,szname="Ph�c"},
	{G=6,D=1,P=1658,szname="L�c"},
	{G=6,D=1,P=1659,szname="Th�"},
}
NewYear2008_cailu.randomitem = 
{
	ntotialprop = 100,
	nitem =
	{
		{G=6,D=1,P=123,szname="Ph�c Duy�n L� (Trung) ",prop=75},
		{G=6,D=1,P=124,szname="Ph�c Duy�n L� (��i) ",prop=20},
		{G=6,D=1,P=71,szname="Ti�n Th�o L� ",prop=5},		
	}
}
NewYear2008_cailu.randomnexp = 
{
	ntotialprop = 100,
	nexp = 
	{
		{nexp = 500000,prop=35},
		{nexp = 1000000,prop=30},
		{nexp = 1500000,prop=25},
		{nexp = 2000000,prop=10},
	}
	
}
function main()
	local nsign = NewYear2008_cailu:checkdate()
	if nsign == 2 then
		Say("Ho�t ��ng h�i l�c ��u xu�n �� k�t th�c, �a t� c�c v� ��i hi�p �� tham d�.",0) 	
		return
	end
	local arytalk = {"Ho�t ��ng h�i l�c ��u xu�n �� b�t ��u, trong th�i gian ch� ��nh, Ng��i ch�i ��n tr��c c�y ��o, c�y mai � th�t ��i th�nh th�, t�n th� th�n th�nh t�m c�u nguy�n, s� nh�n ���c nh�ng ph�n th��ng n�m m�i. Ngo�i ra, c�c v� ��i hi�p c�ng c� th� treo th�m li�n t�t v�i ba ch� Ph�c - L�c - Th� s� nh�n ���c nh�ng ph�n th��ng b�t ng�."}
	arytalk[getn(arytalk)+1] = "Ta mu�n treo li�n Ph�c - L�c - Th� �� ��n t�t./#NewYear2008_cailu:onhandwish(1)"
	if nsign == 1 then
		arytalk[getn(arytalk)+1] = "Ta ��n th�nh t�m c�u nguy�n./#NewYear2008_cailu:ongivewish(1)"
	end
	arytalk[getn(arytalk)+1] = "Ta ch� mu�n d�o ch�i/#NewYear2008_cailu:onCancel(1)"
	CreateTaskSay(arytalk)
end

function NewYear2008_cailu:onhandwish()
	if self:checkdate() == 2 then
		Say("Ho�t ��ng h�i l�c ��u xu�n �� k�t th�c, �a t� c�c v� ��i hi�p �� tham d�.",0) 
		return	
	end
	
	if self:check_level() == 0 or self:check_pay() == 0 then
		Say("Xin l�i, ��ng c�p c�c h� kh�ng ��, xin luy�n t�p th�m ��ng th�i n�p th� r�i m�i quay l�i nh�n th��ng.",0)
		return
	end
	if CalcFreeItemCellCount() < 1 then
		Say("Kh�ng �� ch� tr�ng, h�y s�p x�p l�i h�nh trang.",0)
		return
	end
	local ndate = tonumber(GetLocalDate("%y%m%d"))
	if GetTask(self.ntaskday) ~= ndate then
		SetTask(self.ntaskday,ndate)
		SetTask(self.ntaskcount,0)
	end
	if GetTask(self.ntaskcount) >= self.ntasksum then
		Say("B�n �� treo li�n h�n 20 b� r�i, c�y kh�ng c�n ch� cho b�n treo n�a r�i, xin h�y gi�nh c� h�i cho ng��i ch�i kh�c. �a t� �� tham gia ho�t ��ng.",0)
		return
	end
	for ni,nitem in self.mareial do
		if CalcEquiproomItemCount(nitem.G,nitem.D,nitem.P,-1) < 1 then
			Say("Li�n Ph�c - L�c - Th� kh�ng ��, xin h�y thu th�p th�m r�i m�i treo li�n.",0)
			return
		end
	end
	if GetCash() < self.handcash then
			Say("Ti�n trong ng��i kh�ng �� xin ��ng treo li�n.",0)
			return		
	end
	for ni,nitem in self.mareial do
		ConsumeEquiproomItem(1,nitem.G,nitem.D,nitem.P,-1)
	end
	SetTask(self.ntaskcount,(GetTask(self.ntaskcount)+1) )
	Pay(self.handcash)
	self:award()
end

function NewYear2008_cailu:ongivewish()
	
	local ndate = tonumber(GetLocalDate("%y%m%d%H"))
	if self:checkdate() == 0 then
		Say("Ho�t ��ng h�i l�c c�u may �� k�t th�c, �a t� c�c v� ��i hi�p �� tham gia ho�t ��ng.",0) 
		return
	end
	
	if self:check_level() == 0 or self:check_pay() == 0 then
		Say("Xin l�i, ��ng c�p c�c h� kh�ng ��, xin luy�n t�p th�m ��ng th�i n�p th� r�i m�i quay l�i nh�n th��ng.",0)
		return
	end
	
	local ntaskdate = GetTask(self.ntask)
	if ntaskdate == ndate then
		Say("B�n �� nh�n ���c l�i ch�c ��u xu�n, l�n sau h�y quay l�i nh�.",0) 
		return
	end
	SetTask(self.ntask,ndate)
	self:award()
end

function NewYear2008_cailu:award()
	local ntotialprop = self.randomitem.ntotialprop * 100
	local np = random(1,ntotialprop)
	local nsum = 0
	local szstrsay = ""
	for ni,nitem in self.randomitem.nitem do
		nsum = nsum + (nitem.prop) * (self.randomitem.ntotialprop)
		if nsum >= np then
			AddItem(nitem.G,nitem.D,nitem.P,1,0,0)
			local szstr = format("Ch�c m�ng b�n �� nh�n ���c 1 c�i <color=yellow>%s<color>",nitem.szname)
			szstrsay = szstr
			Msg2Player(szstr)
			self:sdl_writelog("H�i l�c ��u xu�n",szstr)
			break
		end
	end

	ntotialprop = self.randomnexp.ntotialprop * 100
	np = random(1,ntotialprop)
	nsum = 0
	for ni,nitem in self.randomnexp.nexp do
		nsum = nsum + (nitem.prop) * (self.randomnexp.ntotialprop)
		if nsum >= np then
			AddOwnExp(nitem.nexp)
			local szstr = format("Ch�c m�ng b�n nh�n ���c <color=yellow>%s<color> kinh nghi�m",nitem.nexp)
			szstrsay = format("%s\n%s",szstrsay,szstr)
			Msg2Player(szstr)			
			self:sdl_writelog("H�i l�c ��u xu�n",szstr)
			break
		end
	end
	Say(szstrsay,0)
end

function NewYear2008_cailu:sdl_writelog(sztitle,szevent)	--��¼,sztitle=�¼���,szevent=�¼�����
	WriteLog(format("[%s]\t Date:%s\t Account:%s\t Name:%s\t %s",sztitle,GetLocalDate("%y-%m-%d %H:%M:%S"),GetAccount(),GetName(),szevent));
end

function NewYear2008_cailu:onCancel()
end

function NewYear2008_cailu:check_level()		--�жϵȼ�
	if GetLevel() < self.LIMIT_LEVEL then
		return 0
	end 
	return 1
end

function NewYear2008_cailu:check_pay()		--�жϳ�ֵ�û�
	if GetExtPoint(0) <= 0 then
		return 0
	end 
	return 1
end

function NewYear2008_cailu:checkdate()
	local ndate = tonumber(GetLocalDate("%y%m%d"))
	local nhour = tonumber(GetLocalDate("%H"))
	local nweek = tonumber(GetLocalDate("%w"))
	if ndate < NewYear2008_cailu.tbdate.nstart or ndate > NewYear2008_cailu.tbdate.nend then
		return 2
	end
	local tbspdate =  NewYear2008_cailu.tbdate.ndate
	if ndate >= tbspdate.nstart and ndate <= tbspdate.nend then
		for ni,nitem in tbspdate.common do
			if nhour == nitem[1] then
					return 1
			end
		end
	else
		local tbdate
		if nweek == 6 then
			tbdate = NewYear2008_cailu.tbdate.nweek.Satweek
		elseif nweek == 0 then
			tbdate = NewYear2008_cailu.tbdate.nweek.Sunweek
		else
			tbdate = NewYear2008_cailu.tbdate.nweek.common
		end 
		for ni,nitem in tbdate do
			if nhour == nitem[1] then
					return 1
			end		
		end
	end
	return 0
end