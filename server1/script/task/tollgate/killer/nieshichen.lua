--Bossɱ���������npc�ű�
--By LiuKuo 2005.3.25
Include ("\\script\\class\\ktabfile.lua")
Include ("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\missions\\challengeoftime\\npc\\dragonboat_main.lua")
Include("\\script\\event\\birthday_jieri\\200905\\chuangguan\\chuangguan.lua");
Include("\\script\\event\\birthday_jieri\\200905\\class.lua");
Include("\\script\\lib\\common.lua");
Include("\\script\\lib\\log.lua")
-- ���ػÿ�����а�
Include("\\script\\missions\\challengeoftime\\rank_perday.lua");
---- DescribͼƬ����
--DescLink_NieShiChen = "<#><link=image[147,167]:\\spr\\npcres\\enemy\\enemy154\\enemy154_pst.spr>��߱����<link>";
--TSKID_KILLTASKID = 1082;	-- ���ܵ��ĸ�����
--TSKID_KILLERDATE	= 1192;	--������ʱ������
--TSKID_KILLERMAXCOUNT	= 1193;	--ÿ��ɱ�˴���
--KILLER_MAXCOUNT		= 8;	--ÿ��ɱ������8��

--Th�m d�ng ki�m tra �i�u ki�n tham gia khi�u chi�n c�a t� ��i - Modified by DinhHQ - 20110504
Include("\\script\\vng_feature\\challengeoftime\\npcNhiepThiTran.lua")

ContentList = {
	"<#>N�u ai c� �� 160  s�t th� gi�n trong tay th� gi�c m�ng tr� th�nh �� nh�t s�t th� �� xem nh� ho�n th�nh. M�i ng�y ch� c�n ho�n th�nh <color=yellow>8nhi�m v�<color>l� ���c. <enter>H�y ti�p nh�n nhi�m v� �th�ch th�c th�i gian� �� th� nghi�m s�c m�nh ��ng ��iv� kh� n�ng s�t th� c�a m�nh.",
	"<#> Nhi�m v� s�t th� c�p 20/killer20",
	"<#> Nhi�m v� s�t th� c�p 30/killer30",
	"<#> Nhi�m v� s�t th� c�p 40/killer40",
	"<#> Nhi�m v� s�t th� c�p 50/killer50",	--5
	"<#> Nhi�m v� s�t th� c�p 60/killer60",
	"<#> Nhi�m v� s�t th� c�p 70/killer70",
	"<#> Nhi�m v� s�t th� c�p 80/killer80",
	"<#> Nhi�m v� s�t th� c�p 90/killer90",
	"<#> Ta ��nh kh�ng mu�n gi�t ng��i ��u, h�y b� nhi�m v�./cancel",	--10
	"<#> M�u ch�y ��u r�i, t�t nh�t l� ta n�n tr�nh xa/no",
	"<#> Ng��i �� h�y b� nhi�m v�. L�m s�t th� tr��c ti�n ph�i c� th� ph�p si�u ph�m, hai l� h� th� v� t�nh, xem ra ng��i kh�ng th�ch h�p, kh�ng �i c�ng kh�ng sao.",
	"<#> Ng��i l�n tr��c ta n�i ng��i �i h� th� v�n c�n s�ng, h�y ch�ng minh th�c l�c c�a m�nh tr��c �i ��.",
	"<#> ��ng c�p c�a ng��i kh�ng ph� h�p, ph�i giao ��u c�ng v�i ng��i c� ��ng c�p t��ng �ng m�i ���c.",
	"<#> ��ng/no",	--15
	"<#> ��ng c�p nh� th� c� 20 s�t th�, tay m�i ng��i ��u nhu�m ��y m�u, ng��i mu�n ��nh v�i ng��i n�o?",
	"<#> H�p th�nh s�t th� gi�n/compose",
	"<#> S�t th� gi�n b�n �� kh�ng ��ng, vi�c quan s�t v� c�p m�t tinh t��ng l� r�t quan tr�ng.",
	"<#> S�t th� l�nh b�n �� qu� nhi�u, s�t th� c�ng ph�i c� ngh� thu�t c�a n�, kh�ng th� n�o m� ngay c� sinh m�nh c�a b�n th�n m�nh c�ng kh�ng bi�t.",
	"<#> S�t th� l�nh b�n �� qu� �t, s�t th� c�ng ph�i c� ngh� thu�t c�a n�, kh�ng th� n�o m� ngay c� sinh m�nh c�a b�n th�n m�nh c�ng kh�ng bi�t.",	--20
	"<#> H�p l�i m�t l�n n�a/compose",
	"<#> B�n �� h�p th�nh m�t<color=",
	"<#> Thu�c t�nh<color> s�t th� gi�n, s�t th� gi�n l� m�t s�t th� phi ph�m. B�n c� th� d�ng m�t s�t th� c�ng c�p �� so t�i v�i s�t th� gi�n, quy t�c th�ng thua ���c �p d�ng theo quy t�c t��ng kh�c c�a ng� h�nh. ",
	"<#> Th� luy�n s�t th� /annealofkiller",
	"<#> Tham gia khi�u chi�n/want_playboat",	--25
	"<#> S�t th� luy�n th�c tr��c ti�n ph�i b�t ��u t� vi�c tham gia khi�u chi�n, ng��i d�m ti�p nh�n nhi�m v� ch�?",
	"<#> Li�n quan ��n khi�u chi�n/aboutchallenge",
	"<#> C� m�i gi� h� th�ng s� th�ng b�o 1 l�n. Th�i gian b�o danh l� 5 ph�t, th�c hi�n ch� trong 30 ph�t. M�i ng��i ch� t�i �a 2 l�n/ng�y. Ph�i �o ��i tr��ng ��n b�o danh. <enter>�Nhi�m v� th�ch th�c th�i gian� g�m 2 khu v�c tham gia. S� c�p: ng��i ch�i t� c�p 50 ��n 89, do ��i tr��ng mang 2 s�t th� gi�n d��i c�p 90 (ng� h�nh b�t k�) �i b�o danh. Cao c�p: ng��i ch�i t� c�p 90, do ��i tr��ng mang 2 s�t th� gi�n c�p 90 (ng� h�nh b�t k�) �i b�o danh. <enter>N�i trong th�i gian quy ��nh, n�u v��t qua h�t 28 �i s� ho�n th�nh. M�i �i ph�n th��ng kinh nghi�m s� kh�c nhau. N�u ho�n th�nh nhi�m v� tr��c th�i gian h�n ��nh, ph�n th��ng kinh nghi�m s� c�ng cao <enter>N�u tr��c th�i h�n �� ho�n th�nh, c� th� s� xu�t hi�n th�m 1 �i, trong �� c� nhi�u ph�n th��ng b�t ng� (v�t ph�m ng�u nhi�n, trang b� Ho�ng Kim�). Ch� nh�ng ��i �� v��t 28 �i ��ng th�i gian quy ��nh m�i c� t�n trong b�ng x�p h�ng.",
	"<#> Nhi�m v� \"Qu� quan t�m b�o\"/guoguan_xunbao",
	"<#> Ta ��n nh�n th��ng/rank_award",
	"<#> Ta ��n xem x�p h�ng 5 ��i cao nh�t c�a h�m nay./get_top5team"
}

killertabfile = new(KTabFile,"/settings/task/tollgate/killer/killer.txt","KILLER")

function main()
	UWorld1082 = nt_getTask(1082);
	local tbDialog = {ContentList[24],ContentList[17],ContentList[2],ContentList[3],ContentList[4],ContentList[5],ContentList[6],ContentList[7],ContentList[8],ContentList[9],ContentList[10],ContentList[15]};
	if (tbBirthday0905:IsActDate() == 1) then
		tinsert(tbDialog, 12, ContentList[29]);
	end
	Describe(DescLink_NieShiChen..ContentList[1], getn(tbDialog), unpack(tbDialog));
end

function annealofkiller()
--Th�m d�ng ki�m tra �i�u ki�n tham gia khi�u chi�n c�a t� ��i - Modified by DinhHQ - 20110504
	--Describe(DescLink_NieShiChen..ContentList[26], 3, ContentList[25],ContentList[27],ContentList[11]);
	Describe(DescLink_NieShiChen..ContentList[26], 4, ContentList[25], "<#> Ki�m tra �i�u ki�n t� ��i/#tbCOT_Party:CheckCondition()",ContentList[27],ContentList[11]);
end

function aboutchallenge()
	Describe(DescLink_NieShiChen..ContentList[28],1, ContentList[15]);
end

function killer20()
	if ( killerCoundTakedTask(20, 29) == 0) then
		return 0;
	end;
	showboss( 0 );
end

function killer30()
	if ( killerCoundTakedTask(30, 39) == 0) then
		return 0;
	end;
	showboss( 20 );
end

function killer40()
	if ( killerCoundTakedTask(40, 49) == 0) then
		return 0;
	end;
	showboss( 40 );
end

function killer50()
	if ( killerCoundTakedTask(50, 59) == 0) then
		return 0;
	end;
	showboss( 60 );
end

function killer60()
	if ( killerCoundTakedTask(60, 69) == 0) then
		return 0;
	end;
	showboss( 80 );
end

function killer70()
	if ( killerCoundTakedTask(70, 79) == 0) then
		return 0;
	end;
	showboss( 100 );
end

function killer80()
	if ( killerCoundTakedTask(80, 89) == 0) then
		return 0;
	end;
	showboss( 120 );
end

function killer90()
	if ( killerCoundTakedTask(90, 350) == 0) then
		return 0;
	end;
	showboss( 140 );
	tbLog:PlayerActionLog("TinhNangKey","NhanNhiemVuBossSatThu")
end

function cancel()
	if (nt_getTask(1082) == 0) then
		Talk(1, "", "Ng��i ch�a nh�n nhi�m v�, kh�ng th� h�y b�!")
	return end
	nt_setTask(1082, 0);
	Describe(DescLink_NieShiChen..ContentList[12], 1,ContentList[15]);
end

function havetask()
	if ( UWorld1082 ~= 0 ) then
		Describe(DescLink_NieShiChen..ContentList[13], 1,ContentList[15]);
		return 0
	end
	return 1
end

function showboss(row)
	Describe(DescLink_NieShiChen..ContentList[16], 12, killertabfile:getCell("BossName",row+1).."/#givetask("..(row+1)..")", killertabfile:getCell("BossName",row+2).."/#givetask("..(row+2)..")", killertabfile:getCell("BossName",row+3).."/#givetask("..(row+3)..")", killertabfile:getCell("BossName",row+4).."/#givetask("..(row+4)..")", killertabfile:getCell("BossName",row+5).."/#givetask("..(row+5)..")", killertabfile:getCell("BossName",row+6).."/#givetask("..(row+6)..")", killertabfile:getCell("BossName",row+7).."/#givetask("..(row+7)..")", killertabfile:getCell("BossName",row+8).."/#givetask("..(row+8)..")", killertabfile:getCell("BossName",row+9).."/#givetask("..(row+9)..")", killertabfile:getCell("BossName",row+10).."/#givetask("..(row+10)..")", "Trang k� /#showbossnext("..row..")", ContentList[15]);
end

function showbossnext(row)
	Describe(DescLink_NieShiChen..ContentList[16], 12, killertabfile:getCell("BossName",row+11).."/#givetask("..(row+11)..")", killertabfile:getCell("BossName",row+12).."/#givetask("..(row+12)..")", killertabfile:getCell("BossName",row+13).."/#givetask("..(row+13)..")", killertabfile:getCell("BossName",row+14).."/#givetask("..(row+14)..")", killertabfile:getCell("BossName",row+15).."/#givetask("..(row+15)..")", killertabfile:getCell("BossName",row+16).."/#givetask("..(row+16)..")", killertabfile:getCell("BossName",row+17).."/#givetask("..(row+17)..")", killertabfile:getCell("BossName",row+18).."/#givetask("..(row+18)..")", killertabfile:getCell("BossName",row+19).."/#givetask("..(row+19)..")", killertabfile:getCell("BossName",row+20).."/#givetask("..(row+20)..")", "Trang tr��c/#showboss("..row..")", ContentList[15]);
end

function givetask(taskid)
	nt_setTask(1082,taskid);
	Describe(DescLink_NieShiChen..killertabfile:getCell("BossName",taskid)..killertabfile:getCell("BossInfo",taskid), 1, ContentList[15]);
end

function compose()
	GiveItemUI("Giao di�n h�p th�nh s�t th� gi�n","5 s�t th� l�nh c�ng ��ng c�p s� h�p th�nh 1 s�t th� gi�n c�p t��ng �ng, thu�c t�nh c�a s�t th� gi�n ���c t�o th�nh c� li�n quan ��n thu6�c t�nh c�a 5 s�t th� l�nh. B�n c� th� d�ng s�t th� gi�n c�a m�nh �� so t�i v�i s�t th� gi�n ��ng c�p c�a ng��i kh�c, quy t�c th�ng thua ���c t�nh theo quy t�c t��ng kh�c c�a ng� h�nh.","exchange_token", "no")
end

function exchange_token(ncount)
	local scrollidx = {}
	local scrollattr = {}
	local y = 0
	local compare_level = 0
	for i=1, ncount do
		local nItemIdx = GetGiveItemUnit(i);
		itemgenre, detailtype, parttype, level, attribute = GetItemProp(nItemIdx)
		if (itemgenre == 6 and detailtype == 1 and parttype == 399  ) then	
			if( y > 0 ) then
				if( level ~= compare_level ) then
					Describe(DescLink_NieShiChen..ContentList[18], 2, ContentList[21], ContentList[15]);
					return
				end
			end
			y = y + 1;
			scrollidx[y] = nItemIdx;
			scrollattr[y] = attribute;
			compare_level = level;
		end
	end
	if( y ~= ncount) then
		Describe(DescLink_NieShiChen..ContentList[18], 2, ContentList[21], ContentList[15]);
		return
	end
	if( y > 5 ) then
		Describe(DescLink_NieShiChen..ContentList[19], 2, ContentList[21], ContentList[15]);
		return
	end
	if( y < 5 ) then
		Describe(DescLink_NieShiChen..ContentList[20], 2, ContentList[21], ContentList[15]);
		return
	end
	if( y == 5 ) then
		for i = 1, y do
			RemoveItemByIndex(scrollidx[i]);
		end
		givesword(scrollattr,compare_level);
	end
end

function givesword(attr,level)
	series = {"metal>Kim", "wood>M�c", "water>Th�y", "fire>H�a", "earth>Th� "};
	i = random( 1, 5 );
	AddItem( 6, 1, 400, level, attr[i], 0);
	j = attr[i] + 1;
	Describe(DescLink_NieShiChen..ContentList[22]..series[j]..ContentList[23], 1, ContentList[15]);
end

function no()
end

--ÿ������������
function killerCoundTakedTask(nLowLevel, nHighLevel)
	if ( havetask() == 0) then
		return 0;
	end;
	local myLevel = GetLevel();
	if( myLevel < nLowLevel or myLevel >  nHighLevel) then
		Describe(DescLink_NieShiChen..ContentList[14], 1,ContentList[15]);
		return 0;
	end;
	local nDate = tonumber(GetLocalDate("%y%m%d"));
	local myDate = nt_getTask(TSKID_KILLERDATE);
	if (myDate == nDate and nt_getTask(TSKID_KILLERMAXCOUNT) >= KILLER_MAXCOUNT) then
		Describe(DescLink_NieShiChen.."S�t th� c� m�t t� ch�t r�t quan tr�ng g�i l� khinh k� b�i tr�n.  H�m nay ng��i �� b� h�"..KILLER_MAXCOUNT.."  ng��i r�i, ng�y mai h�y quay l�i.", 1, ContentList[15]);
		return 0;
	elseif (myDate ~= nDate) then
		nt_setTask(TSKID_KILLERMAXCOUNT, 0);
		nt_setTask(TSKID_KILLERDATE, nDate);
	end;
	return 1;
end;
