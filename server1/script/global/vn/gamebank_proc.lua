-- Ǯׯ���� (Խ�ϰ汾)
-- by��Dan_Deng(2003-09-16)
-- Update: Dan_Deng(2004-01-06) ��ͳһ�����ƶ�������Ʊ���˶���
-- Update: Fanghao_Wu(2004-9-04) ����Ԫ���һ�ͭǮ����

-- Update: paul zhang(2005-09-06) ΪԽ�ϰ����޸ģ�ֻʹ����Ԫ����û�н�Ԫ������Ԫ���ɳ�ɰ���(7��)����25Сʱ��
--			ͭǮ��ʱ�����ţ�ͬʱ����һ��ͷ�ļ����ڿ��ƹ��ܵĿ�����ر�
-- Update: paul zhang(2005-12-28) ΪԽ�ϰ����޸ģ�����Խ�Ϸ���ԭ���޸ĳ�ֻʹ�ý�Ԫ����û����Ԫ�������ǽ�Ԫ���������޸�Ϊ�ɳ�ɰ���(7��)����25Сʱ��

-- Edited by peres
-- 2005/12/29 ����һ��Ԫ���� 15 ��ͭǮ�Ĺ���
-- end;

Include("\\script\\global\\systemconfig.lua") -- ϵͳ����
--Include("\\script\\global\\yuanbao_head.lua")
--Include("\\script\\task\\newtask\\newtask_head.lua")
--Include("\\script\\task\\newtask\\education\\jiaoyutasknpc.lua") 
--Include("\\script\\misc\\maskfree\\event.lua")		--��������ȡ
Include("\\script\\event\\vnchristmas2006\\event.lua")	--ʥ���俨�����

--Msg2Player("gamebank_proc-- vn")

function gamebank_proc()
	local msg = {
		"Ta mu�n r�t Ti�n ��ng/get_ingot",
		"Ta mu�n ��i Ti�n ��ng/pay_ingot",--doi knb th�nh ng�y choi
		"Ki�m tra ta c�n g�i bao nhi�u Ti�n ��ng/show_ingot",
--		"Ta mu�n ��i Nguy�n b�o th�nh Ti�n ��ng/change_ingot_to_coin",
		"Nh�n ti�n gh� qua th�i/no"
	};

	local talk = "";  
	if (GetSex() == 0) then
		talk = "��ng r�i! Thi�u hi�p c�n g�?";
	else
		talk = "��ng r�i! N� hi�p c�n g�?";
	end
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if (nDate >= 20061223 and nDate <= 20070114) then
		tinsert(msg, 1, "Nh�n qu� t�ng: M�t n� /takeMaskFree");
	end;
	
	Say(talk, getn(msg), msg)
end
------------- ��ѯԪ�� --------------------
function show_ingot()
	local nMoney = GetExtPoint(1)
	if (nMoney >= 32768) then
		nMoney = 0
		Msg2Player("�� x�y ra l�i trong ng�n kh� c�a b�n, t�m th�i kh�ng th� r�t ���c Ti�n ��ng. Xin vui l�ng li�n h� v�i nh� ph�t h�nh �� ���c gi�i quy�t !")
		return
	end
	if (nMoney <= 0) then
		Say("�ng ch� ti�n trang: Kh�ch quan ch�a h� g�i k� tr�n b�o v�t g� � ��y",1,"Bi�t r�i/no")
		return
	else
		local nCurVar = nMoney *20
		Say("<#> Kh�ch quan �� g�i t�i b�n ti�m t�ng c�ng <color=green>"..nCurVar.."<color> Ti�n ��ng.",1,"Bi�t r�i/no")
	end
end

------------- ȡԪ�� -----------------------
function get_ingot()

	if (SYSCFG_GAMEBANK_GOLDSILVER_OPEN ~= 1) then
		Talk(1,"","Xin l�i! Ti�n trang hi�n �ang s�a ch�a! 2 ng�y n�a kh�ch quan quay l�i nh�! ")
		return
	end

	local nMoney = GetExtPoint(1)	
	if (nMoney >= 32768) then
		nMoney = 0
		Msg2Player("�� x�y ra l�i trong ng�n kh� c�a b�n, t�m th�i kh�ng th� r�t ���c Ti�n ��ng. Xin vui l�ng li�n h� v�i nh� ph�t h�nh �� ���c gi�i quy�t !")
		return
	end
	if CalcFreeItemCellCount() < 5 then
			Talk(1, "", "H�nh trang kh�ng �� 5 � tr�ng.");
			return 1
	end
	if (nMoney <= 0) then					-- û����չ����
		Talk(1,"","Xin l�i! Kh�ch quan kh�ng c� g�i Ti�n ��ng t�i b�n trang !")
		return
	else
		local nCurVar = nMoney *20
		Say("<#> Kh�ch quan �� g�i t�i b�n trang  t�ng c�ng <color=green>"..nCurVar.."<color> Ti�n ��ng. C� mu�n l�y ra kh�ng?", 2, "Ta mu�n l�y ra 20 Ti�n ��ng/get_ingot10", "Kh�ng l�y/no")
	end
end

function get_ingot10()
	if (SYSCFG_GAMEBANK_SILVER_GET == nil) then -- ������~~
		print("get_silver have close, but something is wrong...");
		Msg2Player("Ch�c n�ng b� l�i!");
		return
	end
	
	if (GetExtPoint(1) < 1) then
		Talk(1,"","�� x�y ra l�i trong ng�n kh� c�a b�n, t�m th�i kh�ng th� r�t ���c Ti�n ��ng. Xin vui l�ng li�n h� v�i nh� ph�t h�nh �� ���c gi�i quy�t !")
		return
	end
	Say("Kh�ch quan x�c ��nh mu�n r�t  Ti�n ��ng ch�? (Sau khi x�c nh�n xin ��ng tho�t kh�i tr� ch�i!) ", 2, "X�c nh�n/get_ingot10ok", "H�y b� /no");
end

function get_ingot10ok()
	PayExtPoint(1,1)
	Msg2Player("Hi�n �ang l�y Ti�n ��ng cho qu� kh�ch! Xin l�u � ��ng tho�t kh�i tr� ch�i!")
end;

------------- ����Ԫ�� ---------------------
function pay_ingot()

	if (SYSCFG_GAMEBANK_SILVER_PAY ~= 1) then
		Talk(1,"","Xin l�i! Ti�n trang hi�n �ang s�a ch�a! 2 ng�y n�a kh�ch quan quay l�i nh�! ")
		return
	end

	-- Խ�ϵ���Ԫ����ƷID���½�汾�Ľ�Ԫ����ƷIDһ��
	local nCurTD = CalcEquiproomItemCount(4,417,1,1)
	if (nCurTD >= 20) then
		Say("�ng ch� ti�n trang: Kh�ng th�nh v�n ��! Kh�ch quan mu�n ��i <color=green>Ti�n ��ng<color> sang h�nh th�c n�o?", 3,"Ta mu�n d�ng 20 Ti�n ��ng ��i  th�nh 10 ng�y ch�i/pay_ingot_10a","Ta mu�n d�ng 20 Ti�n ��ng ��i th�nh 20 gi� ch�i/pay_ticket_10b","Kh�ng ��i n�a/no")
	else
		Say("Kh�ch quan kh�ng mang �� Ti�n ��ng �?",1,"��ng r�i! Ta qu�n mang theo/no")
	end

end

function pay_ingot_10a()
	if (SYSCFG_GAMEBANK_SILVER_PAY == nil) then -- ������~~
		print("pay_silver10 have close, but something is wrong...");
		Msg2Player("Ch�c n�ng b� l�i!");
		return
	end
	local nCurTD = CalcEquiproomItemCount(4,417,1,1)
	if (nCurTD >= 20) then
		if (ConsumeEquiproomItem(20,4,417,1,1)~= 1) then
			Msg2Player("Tr� ti�n ��ng th�t b�i !")
			WriteLog(date("%Y%m%d %H%M%S").."\t".."��i 10 ng�y ch�i"..GetAccount().."\t"..GetName().."\t".."d�ng 20 Ti�n ��ng ��i  th�nh 10 ng�y ch�i th�t b�i")
			return
		end
		UseSilver(1,1,1)
		SaveNow(); -- ��������
		WriteLog(date("%Y%m%d %H%M%S").."\t".."��i 10 ng�y ch�i"..GetAccount().."\t"..GetName().."\t".."d�ng 20 Ti�n ��ng ��i  th�nh 10 ng�y ch�i th�nh c�ng")
		WriteGoldLog( GetAccount().."("..GetName()..") USE a 343 SILVER for 10 DAY CHARGE", 0, -1, 0 );
		Say("�ng ch� ti�n trang: <color=green>S� d�ng 20 Ti�n ��ng<color> ��i sang <color=red>10 ng�y ch�i<color> th�nh c�ng. Xin kh�ch quan ki�m tra l�i!", 0)
	end
end

function pay_ticket_10b()
	if (SYSCFG_GAMEBANK_SILVER_PAY == nil) then -- ������~~
		print("pay_silver10 have close, but something is wrong...");
		Msg2Player("Ch�c n�ng b� l�i!");
		return
	end
	local nCurTD = CalcEquiproomItemCount(4,417,1,1)
		if (nCurTD >= 20) then
			if (ConsumeEquiproomItem(20,4,417,1,1)~= 1) then
				Msg2Player("Tr� ti�n ��ng th�t b�i !")
				WriteLog(date("%Y%m%d %H%M%S").."\t".."��i 20 gi� ch�i"..GetAccount().."\t"..GetName().."\t".."d�ng 20 Ti�n ��ng ��i  th�nh 20 gi� ch�i  th�t b�i")
				return
			end
			UseSilver(1,0,1)
			SaveNow(); -- ��������
			WriteLog(date("%Y%m%d %H%M%S").."\t".."��i 20 gi� ch�i"..GetAccount().."\t"..GetName().."\t".."d�ng 20 Ti�n ��ng ��i  th�nh 20 gi� ch�i th�nh c�ng")
			WriteGoldLog( GetAccount().."("..GetName()..") USE a 343 SILVER for 20 HOURS CHARGE", 0, -1, 0 );
			Say("�ng ch� ti�n trang: <color=green>S� d�ng 20 Ti�n ��ng<color> ��i sang <color=green>20 gi� ch�i<color> th�nh c�ng. Xin kh�ch quan ki�m tra l�i!", 0)
		end
end

------------- �һ�ͭǮ---------------------
function change_ingot_to_coin()	
do return end
	local nSilverCount = GetItemCountEx( 343 );		-- Ԫ������

	if (SYSCFG_GAMEBANK_SILVER_COIN ~= 1) then
		Talk(1,"","Xin l�i! Ti�n trang hi�n �ang s�a ch�a! 2 ng�y n�a kh�ch quan quay l�i nh�! ")
		return
	end

	if (nSilverCount <= 0) then					-- û��Ԫ��
		Say( "Kh�ch quan kh�ng mang Kim Nguy�n B�o theo �?", 1, "��ng r�i! Ta qu�n mang theo/no");
		return
	end
	if CalcFreeItemCellCount() < 5 then
			Talk(1, "", "H�nh trang kh�ng �� 5 � tr�ng.");
			return 1
	end

	Say( "�ng ch� ti�n trang: Kh�ch quan ��ng � ��i ti�n ��ng ch�?", 2, "��i Nguy�n b�o th�nh"..COIN_CHANGE_COUNT_OF_SILVER.."<#> ti�n ��ng/change_silver_to_coin", "Kh�ng ��i n�a/no");

end

function change_silver_to_coin()
	if (SYSCFG_GAMEBANK_SILVER_COIN == nil) then -- ������~~
		print("coin_silver have close, but something is wrong...");
		Msg2Player("Ch�c n�ng b� l�i!");
		return
	end
	
	if (GetItemCountEx(343) > 0) then		
		DelItemEx( 343 );		
		AddStackItem( COIN_CHANGE_COUNT_OF_SILVER, 4, 417, 1, 1, 0, 0, 0 );
		UseSilver(1, 2, 1); -- ��Ʊ�һ�ΪͭǮ������ͳ��
		
		SaveNow(); -- ��������
		WriteGoldLog( GetAccount().."("..GetName()..") CHANGE a SILVER into "..COIN_CHANGE_COUNT_OF_SILVER.." COINS", 0, -1, COIN_CHANGE_COUNT_OF_SILVER );
		--local nSilverCount = GetItemCountEx( 343 );		-- Ԫ������
		--if( nSilverCount > 0 ) then
		--	Say( "Ǯׯ�ϰ壺����Ԫ���ѳɹ��һ���"..COIN_CHANGE_COUNT_OF_SILVER.."<#>��ͭǮ������ĺ˲顣", 2, "֪����/no", "�ٶһ�һЩͭǮ/change_coin" );
		--else
		Say( "�ng ch� ti�n trang: Kh�ch quan ��i Nguy�n b�o ra"..COIN_CHANGE_COUNT_OF_SILVER.."<#> Ti�n ��ng! Xin kh�ch quan ki�m tra l�i!",0);
		--end
	end
end

------------ ����ͭǮ ------------------
function onAboutCoin()
	Talk( 2,"","�ng ch� ti�n trang: C� th� mang Nguy�n b�o ��n b�n ti�m �� ��ith�nh ti�n ��ng, 1 <color=yellow>Nguy�n B�o<color> ��i ���c <color=yellow>"..COIN_CHANGE_COUNT_OF_SILVER.."<color> ti�n ��ng.Nguy�n b�o sau khi �� ��i ra ti�n ��ng th� kh�ng th� ��i l�i","Ti�n ��ng c� th� ��n c�c th�nh th� n�i H�ng Rong �� mua K� tr�n d� b�o.","�n gi� chu�t tr�i v�o m�t ti�n ��ng, k�o ch�ng l�n 1 ��ng ti�n kh�c, t�i �a l� <color=yellow>100 ��ng<color>. Nh�n gi� ph�m <color=yellow>Shift<color> v� nh�n chu�t tr�i v�o m�t ��ng ti�n, nh�p s� ti�n mu�n t�ch. Nh�p x�c ��nh �� ho�n th�nh!");
end
----------------------------------------
function no()
end
