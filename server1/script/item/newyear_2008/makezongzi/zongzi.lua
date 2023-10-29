tbclass_newyear2008_zongbing = {}
tbclassname = tbclass_newyear2008_zongbing
tbclassname.TITLE = "B�nh ch�ng"
tbclassname.LIMIT_LEVEL = 50
tbclassname.tbdate = {}
tbclassname.tbdate.nstart = 802020000
tbclassname.tbdate.nend 	= 803312400
tbclassname.mareial =
{
		nexpmax = 2000000000,
		ntask = 1872,
		tbitem = {
			{
				G=6,D=1,P=1662,szname="B�nh ch�ng th��ng h�ng",nexp=2000000,
				tbrandomitem =
				{
					ntotalprop = 100,
					tbitem = 
					{
						{G=6,D=1,P=72,LV=1,szname="Thi�n s�n  B�o L� ",prob=14.89},
						{G=6,D=1,P=125,LV=1,szname="Qu� Hoa T�u",prob=16.0},
						{G=0,D=11,P=201,LV=1,szname="M�t n� - ��u �ng ��a",prob=10.90},
						{G=6,D=1,P=1482,LV=1,szname="Ng�c B�i",prob=0.01	},
						{G=6,D=1,P=1481,LV=1,szname="Kim B�i"	 ,prob=0.05	},
						{G=6,D=1,P=1480,LV=1,szname="Ng�n B�i"	 ,prob=5.00	},
						{G=6,D=1,P=147,LV=3,szname="Huy�n tinh kho�ng th�ch c�p 3"	 ,prob=22.0	},			
						{G=6,D=1,P=147,LV=4,szname="Huy�n Tinh Kho�ng Th�ch c�p 4",prob=16.0},
						{G=6,D=1,P=147,LV=5,szname="Huy�n Tinh Kho�ng Th�ch c�p 5",prob=2.0},
						{G=6,D=1,P=147,LV=6,szname="Huy�n Tinh Kho�ng Th�ch c�p 6",prob=1.0},
						{G=6,D=1,P=147,LV=7,szname="Huy�n Tinh Kho�ng Th�ch c�p 7",prob=0.10	},
						{G=6,D=1,P=147,LV=8,szname="Huy�n Tinh Kho�ng Th�ch c�p 8"	 ,prob=0.05	},
						{G=6,D=1,P=71,LV=1,szname="Ti�n Th�o L� "	 ,prob=11.00	},
						{G=6,D=1,P=1181,LV=1,szname="Ti�n Th�o L� ��c bi�t"	 ,prob=1.0	},					
					}
				} 
			},
			{G=6,D=1,P=1663,szname="B�nh ch�ng h�o h�ng",nexp=1500000,
				tbrandomitem =
				{
					ntotalprop = 100,
					tbitem = 
					{
						{G=6,D=1,P=124,LV=1,szname="Ph�c Duy�n L� (��i) ",prob=19.5},
						{G=6,D=1,P=72,LV=1,szname="Thi�n s�n  B�o L� ",prob=15.0},
						{G=6,D=1,P=73,LV=1,szname="B�ch Qu� L� ",prob=14.0},
						{G=6,D=1,P=71,LV=1,szname="Ti�n Th�o L� ",prob=7.0	},
						{G=6,D=1,P=125,LV=1,szname="Qu� Hoa T�u"	 ,prob=17.0	},
						{G=0,D=11,P=201,LV=1,szname="M�t n� - ��u �ng ��a"	 ,prob=15.0	},
						{G=6,D=1,P=147,LV=3,szname="Huy�n tinh kho�ng th�ch c�p 3"	 ,prob=7.0	},		
						{G=6,D=1,P=147,LV=4,szname="Huy�n Tinh Kho�ng Th�ch c�p 4"	 ,prob=5.0	},		
						{G=6,D=1,P=147,LV=5,szname="Huy�n Tinh Kho�ng Th�ch c�p 5"	 ,prob=0.5	},						
					}
				}
			},
			{G=6,D=1,P=1664,szname="B�nh ch�ng th��ng",nexp=500000},
		},	
}

function main(sel)
	
	local prop = tbclassname:pack(GetItemProp(sel))
	local szkey = format("%s,%s,%s",prop[1],prop[2],prop[3])
	local tbitem = tbclassname:selectitem(szkey)
	if tbitem == nil then
		Say("V�t ph�m sai, xin li�n h� v�i ng��i qu�n l�.",0)
		return 1
	end
	if tbclassname:check() == 0 then
		return 1
	elseif tbclassname:check() == 2 then
		return 0
	end
	tbclassname:useitem(tbitem.nexp)
	if tbitem.tbrandomitem ~= nil then
		tbclassname:getradomitem(tbitem.tbrandomitem)
	end
end
function tbclassname:getradomitem(tbitem)
	local tbclass = tbitem
	local p = random(1,(tbclass.ntotalprop*100))
	local nsum = 0
	for ni,nitem in tbclass.tbitem do
				nsum = nsum + (nitem.prob*tbclass.ntotalprop)
				if nsum >= p then
					AddItem(nitem.G,nitem.D,nitem.P,nitem.LV,0,0)
					local szstr = format("Ch�c m�ng b�n nh�n ���c 1 <color=yellow>%s<color>",nitem.szname)
					Msg2Player(szstr)
					self:sdl_writelog(self.TITLE,szstr)
					return
				end
	end	
end
function tbclassname:useitem(naddexp)
	local nexp = GetTask(self.mareial.ntask)
	local nexpn = naddexp
	if nexp + naddexp > self.mareial.nexpmax then
		nexpn = self.mareial.nexpmax - nexp
	end
	local szstr = format("Ch�c m�ng b�n nh�n ���c <color=yellow>%s<color> kinh nghi�m.",nexpn)
	AddOwnExp(nexpn)
	SetTask(self.mareial.ntask,nexp+nexpn)
	Msg2Player(szstr)
	self:sdl_writelog(self.TITLE,szstr)
end
function tbclassname:selectitem(szkey)
	for ni,nitem in self.mareial.tbitem do
		local szitemkey = format("%s,%s,%s",nitem.G,nitem.D,nitem.P)
		if szitemkey == szkey then
			return nitem
		end
	end
	return nil
end
function tbclassname:check()
	if self:check_date() == 0 then
		Say("B�nh ch�ng �� qu� h�n, kh�ng th� s� d�ng.",0)
		return 2
	end
	if self:check_level() == 0 then
		Say("��ng c�p ch�a ��t 50 kh�ng th� th�c d�ng.",0)
		return 0
	end
	if self:check_pay() == 0 then
		Say("B�n v�n ch�a n�p th�, kh�ng th� s� d�ng.",0)
		return 0
	end
	if self:check_exp() == 0 then
		Say("Ho�t ��ng l�m b�nh ch�ng, b�n �� ��t �i�m kinh nghi�m t�i �a, kh�ng th� s� d�ng n�a.",0)
		return 0
	end
	if CalcFreeItemCellCount() < 1 then
		Say("Kh�ng �� ch� tr�ng, h�y s�p x�p l�i h�nh trang.",0)
		return 0
	end
	return 1
end

function tbclassname:pack(...) --ת��table
	return arg
end

function tbclassname:check_exp()
	local nexp = GetTask(self.mareial.ntask)
	if nexp >= self.mareial.nexpmax then
		return 0
	end
	return 1
end
function tbclassname:check_date()--�ж�ʱ��
	local ndate = tonumber(GetLocalDate("%y%m%d%H%M"))
	if ndate >= self.tbdate.nstart and ndate <= self.tbdate.nend then
		return 1
	end
	return 0
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

function tbclassname:sdl_writelog(sztitle,szevent)	--��¼,sztitle=�¼���,szevent=�¼�����
	WriteLog(format("[%s]\t Date:%s\t Account:%s\t Name:%s\t %s",sztitle,GetLocalDate("%y-%m-%d %H:%M:%S"),GetAccount(),GetName(),szevent));
end