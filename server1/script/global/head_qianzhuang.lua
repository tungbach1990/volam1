--------------------------------------
-- Ǯׯ���ܵ�ͷ�ļ�

Include("\\script\\global\\systemconfig.lua") -- ϵͳ����

IncludeForRegionVer("\\script\\global\\", "gamebank_head.lua")

--------------------------------------

QUESTKEY_TICKET = 488;					-- ��Ʊ����ƷID
EXTPOINT_TICKET = 2;					-- ��Ʊ����չ��
EXTPOINT_TICKET_NEW = 6;
QUESTKEY_TICKET_NEW = 962

EXTPOINT_MAXVAL = 32768;	
			-- ��չ������ֵ
---------------------------------------------------------------
--ʹ����Ʊ���ܺ��� ��Ʊ����Ʊ������Ʊ���֣���function ͳһ����
--���������ticket ��Ʊ���� logstr ���������������־��
--����ֵΪ -1�쳣 0��Ʊ���� 1 ��Ʊ�۳��ɹ�
--�����Ʊ�������������Ʊ��

function qz_use_silver( ticket , logstr)
	if (logstr == nil) then
		logstr = " [ch�a r�]"
	end
	
	if (SYSCFG_GAMEBANK_TICKET_USE == nil) then -- ������~~
		print("use_ticket have close, but something is wrong...");
		Msg2Player("Ch�c n�ng b� l�i!");
		return -1
	end
	
	if (ticket < 1 or ticket == nil) then
		Msg2Player("Ch�c n�ng b� l�i!")
		return -1
	end
	local nCountOld = GetItemCountEx(488);--����Ʊ
	local nCountNew = GetItemCountEx(962);
	if (nCountOld + nCountNew < ticket) then
		return 0;
	end
	
	local nDelCountOld = ticket;
	local nDelCountNew = 0;
	if (nCountOld < ticket) then
		nDelCountOld = nCountOld;
		nDelCountNew = ticket - nCountOld;
	end;
	for i = 1, nDelCountOld do
		DelItemEx(488);
	end
	for i = 1, nDelCountNew do
		DelItemEx(962);
	end
	WriteGoldLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."]: d�ng"..ticket.."T�m ng�n phi�u"..logstr, 0, 0, 0, (-ticket));
	
	if (nDelCountOld > 0) then
		UseSilver(2, 2, nDelCountOld); -- ��Ʊ�һ�ΪͭǮ������ͳ��(ֱ�����ĵ�Ԫ����Ʊ����ͭǮ�һ���ͬ����)
	end;
	if (nDelCountNew > 0) then
		UseSilver(3, 2, nDelCountNew); -- ��Ʊ�һ�ΪͭǮ������ͳ��(ֱ�����ĵ�Ԫ����Ʊ����ͭǮ�һ���ͬ����)
	end;
	SaveNow(); -- ��������
	return 1;
end
