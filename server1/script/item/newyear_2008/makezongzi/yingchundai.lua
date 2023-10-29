tbclass_newyear2008_yingchundai = {}
tbclassname = tbclass_newyear2008_yingchundai
tbclassname.TITLE = "M� t�i m�ng xu�n."
tbclassname.tbdate = {}
tbclassname.tbdate.nstart = 802020000
tbclassname.tbdate.nend 	= 803022400
tbclassname.mareial =
{
	ntotalprob = 100,
	tbitem = {
			{G=6,D=1,P=1653,szname="L� b�nh",prob=38.80},
			{G=6,D=1,P=1654,szname="G�o n�p",prob=29.10},
			{G=6,D=1,P=1655,szname="��u xanh",prob=19.40},
			{G=6,D=1,P=1656,szname="Th�t heo ",prob=9.70	},
			{G=6,D=1,P=1657,szname="Ph�c"	 ,prob=1.00	},
			{G=6,D=1,P=1658,szname="L�c"	 ,prob=1.00	},
			{G=6,D=1,P=1659,szname="Th�"	 ,prob=1.00	},
		},
}
function main(sel)
	if tbclassname:checkdate() == 0 then
		Say("T�i m�ng xu�n �� h�t h�n, kh�ng th� m�.",0)
		return 0
	end
	if CalcFreeItemCellCount() < 1 then
		Say("Kh�ng �� ch� tr�ng, h�y s�p x�p l�i h�nh trang.",0)
		return 1
	end
	tbclassname:getitem()
end

function tbclassname:getitem()
	local tbclass = self.mareial
	local p = random(1,(tbclass.ntotalprob*100))
	local nsum = 0
	for ni,nitem in tbclass.tbitem do
				nsum = nsum + (nitem.prob*tbclass.ntotalprob)
				if nsum >= p then
					AddItem(nitem.G,nitem.D,nitem.P,1,0,0)
					local szstr = format("Ch�c m�ng b�n nh�n ���c 1 <color=yellow>%s<color>",nitem.szname)
					Msg2Player(szstr)
					self:sdl_writelog(self.TITLE,szstr)
					return
				end
	end
end
function tbclassname:checkdate()
	local ndate = tonumber(GetLocalDate("%y%m%d%H%M"))
	if ndate >= self.tbdate.nstart and ndate <= self.tbdate.nend then
		return 1
	end
	return 0
end
function tbclassname:sdl_writelog(sztitle,szevent)	--��¼,sztitle=�¼���,szevent=�¼�����
	WriteLog(format("[%s]\t Date:%s\t Account:%s\t Name:%s\t %s",sztitle,GetLocalDate("%y-%m-%d %H:%M:%S"),GetAccount(),GetName(),szevent));
end