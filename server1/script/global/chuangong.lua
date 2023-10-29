Include([[\script\global\�����õ�\�ξ�\npc\·��_��ɮ.lua]])
Include("\\script\\item\\levelup_item.lua")
Include("\\script\\global\\head_qianzhuang.lua")
Include("\\script\\global\\systemconfig.lua")
IncludeLib("SETTING")

TBMONTH = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31}
strimg = "<link=image[0,1]:\\spr\\npcres\\enemy\\enemy111\\enemy111_pst.spr><link>"
function cg_getnextdate(oldday, num) --���oldday�ĵ�num�յ����ڣ�����060227�ĵ�5��Ϊ060304
	local nDay = tonumber(oldday)
	local nYear = floor(nDay / 10000)
	local nMonth = floor((nDay - nYear * 10000) / 100)
	nDay = nDay - nYear * 10000 - nMonth * 100 
	nDay = nDay + num
	
	while (nDay > TBMONTH[nMonth]) do
		nDay = nDay - TBMONTH[nMonth]
		if (nMonth == 12) then
			nMonth = 1
			nYear = nYear + 1
		else
			nMonth = nMonth + 1
		end
	end
	return (nYear * 10000 + nMonth * 100 + nDay)
end

function chuangong_main()
	-- VN_MODIFY_20060427
	if (1) then
		Say("Ch�c n�ng v�n ch�a M� ra", 0)
		return
	end
	
	if (gb_GetModule("Truy�n c�ng") ~= 1) then
		Say("Xin l�i! Ch�c n�ng truy�n c�ng �� ��ng l�i, th�i gian m� l�i xem trang ch� �� bi�t th�m th�ng tin!", 0)
		return 
	end
	if (GetTask(TV_LAST_APPLY_TIME) > 0) then
		Say(": "..GetName().."�� l�u kh�ng g�p! H�m nay t�m ta c� vi�c g�?",3, "Ta mu�n h�i th�m v� chuy�n truy�n c�ng./chuangong_info", "Ta mu�n xin x�a b� truy�n c�ng!/cg_undo", "Ch� l� ��n th�m Minh ch�!/OnCancel")
	else
		Say(": "..GetName().."�� l�u kh�ng g�p! H�m nay t�m ta c� vi�c g�?",2, "Ta mu�n h�i th�m v� chuy�n truy�n c�ng./chuangong_info", "Ch� l� ��n th�m Minh ch�!/OnCancel")
	end
end

function chuangong_info()
	if (gb_GetModule("Truy�n c�ng") ~= 1) then
		Say("Xin l�i! Ch�c n�ng truy�n c�ng �� ��ng l�i, th�i gian m� l�i xem trang ch� �� bi�t th�m th�ng tin!", 0)
		return 
	end
	local nowday = tonumber(date("%y%m%d"))
	local applytime = GetTask(TV_LAST_APPLY_TIME)
	if (applytime == 0) then
		Describe(strimg.."Ng��i c� ��ng c�p t� 100 ��n 160 c� th� chuy�n c�ng l�c th�nh 1 vi�n 'Nguy�n Th�n ��n', ng��i t� c�p 10 tr� xu�ng, ch�a gia nh�p m�n ph�i v� ch�a b�i s� ch� c�n u�ng 1 vi�n Nguy�n Th�n ��n s� c�p ���c tinh l�c h�n ng��i. Ng��i t� 100~120 sau khi truy�n c�ng kinh nghi�m s� gi�m 5%, ng��i t� 121~150 sau khi truy�n c�ng kinh nghi�m s� gi�m 10%, Ng��i t� 150 tr� l�n s� gi�m 20%. <color=yellow>Suy ngh� k� ch�a?<color>", 2, "Ta ngao du giang h� �� l�u, mu�n r�a tay g�c ki�m!/chuangong_do", "���ng nhi�n kh�ng ph�i! Ch� l� ��n h�i th�m 1 ch�t m� th�i!./OnCancel");
	elseif (nowday >= applytime ) then
		Describe(strimg.."Chu�n b� truy�n c�ng! Ng��i quy�t d�nh ch�a? �� truy�n l� kh�ng th� r�t l�i ��u ��!", 3, "��ng v�y! � ta �� quy�t!./chuangong_dosure","Kh�ng! Tta mu�n h�y b� truy�n c�ng! /cg_undo", "��i ta suy ngh� th�m v�i ng�y./OnCancel");
	else
		Describe(strimg.."Ta �ang chu�n b� c�c v�t li�u c�n thi�t �� truy�n c�ng. Ta mu�n ��n"..(num2datestr(applytime))..", sau �� m�i ti�n h�nh", 2, "Qu� l� phi�n Minh ch�, v�n b�i c�o bi�t t�i ��y!   /OnCancel", "Kh�ng! Tta mu�n h�y b� truy�n c�ng! /cg_undo");
	end
end



function num2datestr(nday)
	local year = floor(nday / 10000) + 2000
	local month = mod( floor(nday / 100) , 100)
	local day = mod(nday, 100)
	return year.."n�m"..month.."nguy�t "..day.."nh�t "
end

function cg_undo()
	local nowday = GetTask(TV_LAST_APPLY_TIME)
	if (nowday > 0) then
		Describe(strimg.."Ta ��n"..num2datestr(nowday).."l� c� th� truy�n c�ng cho ng��i, c� th�t ng��i kh�ng mu�n truy�n c�ng kh�ng?",2,"Kh�ng! Ta kh�ng mu�n truy�n c�ng!/cg_undo_sure", "V�ng! Ta mu�n truy�n c�ng./OnCancel")
	else
		Describe(strimg.."Ng��i ch�a xin ph�p truy�n c�ng, c�n g� h�y b�!",1,"K�t th�c ��i tho�i/OnCancel")
	end
end

function cg_undo_sure()
	SetTask(TV_LAST_APPLY_TIME, 0)
	Describe(strimg.."���c! Nguy�n li�u n�y ta t�m gi� l�i, n�u l�n sau mu�n truy�n c�ng th� ��n ��y!",1,"C�m �n Minh ch�!/OnCancel")
end

function chuangong_do()
	local nEndLevel = GetLevel()
	local nRestExp = GetExp()
	if (nEndLevel < 100) then
		Describe(strimg.."Huynh ��! Theo c�ng l�c c�a ng��i hi�n nay kh�ng �� �� truy�n c�ng. Mu�n truy�n c�ng ph�i t� <color=yellow>c�p 100<color> tr� l�n, ng��i c�n ph�i luy�n th�m!",1,"Ta bi�t r�i!/OnCancel")
		return
	end
	if (nEndLevel >= 160) then
		Describe(strimg.."��ng c�p c�a b�n nh� h�n 100 c�p ho�c h�n 160 kh�ng th� truy�n c�ng!",1,"Ta bi�t r�i!/OnCancel")
		return
	end
	
	local nLevelFullExp = tonumber(GetTabFileData(FILE_LEVEL, nEndLevel+ 1, 2))
	local fPerc = format("%.2f", (nEndLevel)+(nRestExp/nLevelFullExp))
	
	local str = strimg.."V�i v� c�ng c�a ng��i hi�n nay, n�u truy�n c�ng s� chuy�n h�a ��ng c�p <color=yellow> "..fPerc.."<color>s� t�n th�t kinh nghi�m"..(100 - exp_getRate(nEndLevel)).." %Nguy�n Th�n ��n"
	str = str..client_main(nEndLevel, nRestExp)
	Describe(str..", nh�ng ta c�n ph�i chu�n b� m�t tu�n, trong th�i gian n�y, ng��i c� th� x�a b� truy�n c�ng, mu�n luy�n ��n m�t tr�nh �� nh�t ��nh th� kh�ng d�, trong th�i gian n�y h�y c� g�ng luy�n c�ng.",2,"Minh ch�! Ta �� quy�t t�m quy �n, �ng c� th� b�t ��u chu�n b�!/chuangong_doprepair1","Nh� th�! �� ta suy ngh� l�i xem!/OnCancel")
end

function chuangong_doprepair1()
	local nowday = tonumber(date("%y%m%d"))
	local nextday = cg_getnextdate(nowday, 7)
	SetTask(TV_LAST_APPLY_TIME , nextday);
	WriteLog(" [Truy�n c�ng]:"..nowday.." Acc:"..GetAccount().."Role:"..GetName().."�� ngh� truy�n c�ng")
	Describe(strimg.."���c! Ta l�p t�c chu�n b� th� t�c truy�n c�ng c�a ng��i, 1 tu�n sau <color=yellow>"..num2datestr(nextday).."<color> ng��i h�y ��n, ta s� truy�n c�ng cho ng��i! ���ng nhi�n ng��i l�c n�o c�ng c� th� ��n ch� ta x�a b� truy�n c�ng.", 1,"�a t� Minh ch�! Tu�n sau ta s� quay l�i!/OnCancel")
	Msg2Player("Tu�n sau h�y ��n g�p ��c c� ki�m �� ch�nh th�c truy�n c�ng, ��ng th�i nh�n ���c Nguy�n Th�n ��n! C�ng c� th� x�a b� truy�n c�ng!")
end

function chuangong_dosure()
	if (GetLevel() < 100 or GetLevel() >= 160) then
		Say("��ng c�p c�a b�n nh� h�n 100 c�p ho�c h�n 160 kh�ng th� truy�n c�ng!",0)
		return
	end
	if (CalcItemCount(2,0,-1,-1,-1) > 0) then
		Say("L�c truy�n c�ng kh�ng th� m�c trang b�, xin h�y b� trang b� ra!",0)
		return
	end
	Describe(strimg.."Truy�n c�ng c�n ph�i tr� 2 t�m ng�n phi�u, b�n �� b� v�o h�nh trang ch�a? B�n x�c ��nh mu�n truy�n c�ng?",2, "2 t�m ng�n phi�u �� chu�n b� xong, x�c ��nh!/chuangong_doit1", "�� ta xem l�i/OnCancel")
end

function chuangong_doit1()
	if (GetLevel() < 100 or GetLevel() >= 160) then
		Say("��ng c�p c�a b�n nh� h�n 100 c�p ho�c h�n 160 kh�ng th� truy�n c�ng!",0)
		return
	end
	Describe(strimg.."X�c ��nh l�i l�n n�a!",2, "X�c ��nh!/chuangong_doit", "�� ta xem l�i/OnCancel")
end

function chuangong_doit()
	if (GetLevel() < 100 or GetLevel() >= 160) then
		Say("��ng c�p c�a b�n nh� h�n 100 c�p ho�c h�n 160 kh�ng th� truy�n c�ng!",0)
		return
	end
	local result = qz_use_silver(2, " [Truy�n c�ng]")
	if ( result == 0) then
		Describe(strimg.."Ng��i kh�ng �� 2 t�m ng�n phi�u, ta kh�ng th� truy�n c�ng!", 1, "Ta s� chu�n b� l�i!/OnCancel")	
		return
	elseif (result ~= 1) then
		return 
	end
	SetTask(TV_LAST_APPLY_TIME, 0)
	
	local nowday = tonumber(date("%y%m%d"))
	
	local logstr = " [Truy�n c�ng]:"..nowday.." Acc:"..GetAccount().."Role:"..GetName().." Truy�n c�ng th�nh c�ng! Level:"..GetLevel().." Exp:"..GetExp();
	
	
	DoClearSkillCore()
	DoClearPropCore()
	UpdateSkill()
	local endlevel = GetLevel()
	local restexp = GetExp()
	
	ST_LevelUp(80 - endlevel)
	local param5 = chuangong_item(endlevel, restexp)
	logstr = logstr.." ItemParam5:"..param5
	WriteLog(logstr)
end

function chuangong_item(level,restexp)
	if (restexp <0) then
		restexp = 0
	end
	
	nIt = AddItem(6,1,1061,1,0,0,0)
	SetItemMagicLevel(nIt, 1, level)
	SetItemMagicLevel(nIt, 2, restexp)

	m1 = GetByte(restexp, 3)
	m2 = GetByte(restexp, 4)
	m = m1
	m = SetByte(m1, 2, m2)
	
	n1 = SetByte(restexp, 3,0)
	n =  SetByte(n1, 4, 0)

	SetItemMagicLevel(nIt, 3, m)
	SetItemMagicLevel(nIt, 4, n)
	SetItemMagicLevel(nIt, 5, FileName2Id(GetName()))
	SyncItem(nIt)
	return GetItemParam(nIt, 5)
end

function OnCancel()
end