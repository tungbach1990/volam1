-- ������Ʒ�нű�
-- lixin 2005-8-31

zq_tab_award = {	--������Ʒ�п��Ի�õ���Ʒ�����ʣ�
	{	"B�t m� c�p 1",	0.43145	,	 528 ,	},
	{	"B�t m� c�p 2 ",	0.05	,	 529 ,	},
	{	"B�t m� c�p 3",	0.015	,	 530 ,	},
	{	"B�t m� c�p 4 ",	0.003	,	 531 ,	},
	{	"B�t m� c�p 5",	0.0005	,	 532 ,	},
	{	"B�t m� c�p 6",	0.00005	,	 533 ,	},
	{	"B�t sen c�p 1",	0.43145	,	 534 ,	},
	{	"B�t sen c�p 2 ",	0.05	,	 535 ,	},
	{	"B�t sen c�p 3 ",	0.015	,	 536 ,	},
	{	"B�t sen c�p 4 ",	0.003	,	 537 ,	},
	{	"B�t sen c�p 5 ",	0.0005	,	 538 ,	},
	{	"B�t sen c�p 6 ",	0.00005	,	 539 ,	},
}

function main()
	local base = 100000
	local sum = 0
	local num = random(1, base)

	for i = 1, getn( zq_tab_award ) do
		sum = sum + zq_tab_award[i][2] * 100000
		if( sum >= num ) then
			zq_award( zq_tab_award[i] )
			break
		end
	end
end

function zq_award( item )
	local name = item[1]
	AddEventItem( item[ 3 ] )
	Msg2Player("Ch�c m�ng, b�n nh�n ���c 1 "..name)
	Talk(1,"","L� Quan: Ch�c m�ng ng��i nh�n ���c <color=yellow>"..name.."<color>!")
	WriteLog(date("%y-%m-%d,%H:%M").."Account==["..GetAccount().."] RoleName=="..GetName()..", m� h�p qu� Trung Thu nh�n ���c "..name)
end