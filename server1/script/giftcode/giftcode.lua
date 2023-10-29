IncludeLib("FILESYS");
IncludeLib("TASKSYS");
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\gm_tool\\libgm.lua")
Include("\\script\\giftcode\\giftcodelist.lua")

tbGiftCode = {}
tbGiftCode.szFile = "\\data\\giftcode_dasudung.txt"
server_loadfile(tbGiftCode.szFile)

function dienmagiftcode()
	--dofile("script/giftcode/giftcode.lua")
	AskClientForString("giftcode","",1,255,"GIFTCODE")
end;
function giftcode(code)
	local IsUsed = server_getdata(tbGiftCode.szFile,"GIFT_CODE_CHECK",code);

	local gift = 0
	if IsUsed ~= "" then -- check xem code da duoc su dung hay chua
		return Say("Giftcode n�y �� ���c s� d�ng. Vui l�ng li�n h� GM �� nh�n GIFTCODE kh�c!")
	end
	if GetTask(4520)==1 then
		return Say("M�i nh�n v�t ch� c� th� s� d�ng giftcode 1 l�n!")
	end

	if CalcFreeItemCellCount() < 10 then
			Msg2Player("H�y c�t b�t v�t ph�m �� ��m b�o c� 10 � tr�ng r�i h�y m�.");
			--SaveNow()
			-- return 1;
	end
		for k=1,getn(ListGiftCode) do
			if code == ListGiftCode[k][1] then
				server_setdata(tbGiftCode.szFile,"GIFT_CODE_CHECK",code,"1");
				server_savedata(tbGiftCode.szFile);
				SetTask(4520,1)

		local tbAwardTanThu = 
			{	
				{szName = "T�y T�y Kinh", tbProp={6,1,22,1,0,0,0}, nCount=1,nExpiredTime=1440*7,nBindState = -2},
				{szName = "V� L�m M�t T�ch", tbProp={6,1,26,1,0,0,0}, nCount=1,nExpiredTime=1440*7,nBindState = -2},
				{szName = "Ti�n Th�o L� ��c bi�t", tbProp={6,1,1181,1,0,0,0}, nCount=1,nExpiredTime=1440*7,nBindState = -2},
				--{szName = "Than hanh phu", tbProp={6,1,1266,1,0,0,0}, nCount=1,nExpiredTime=1440*7,nBindState = -2},
				--{szName = "Th� ��a ph�", tbProp={6,1,438,1,0,0,0}, nCount=1,nExpiredTime=1440*7,nBindState=-2},
				{szName = "Ti�n Th�o L�", tbProp={6,1,71,1,0,0,0}, nCount=3,nExpiredTime=1440*7,nBindState=-2},
			}
		tbAwardTemplet:Give(tbAwardTanThu, 1, {"NhanHoTroTanThu", "NhanHoTroTanThu"})
		WriteLogPro("data/sudungcode.txt",""..GetName().."\t"..GetIP().."\t"..GetAccount().."\t su dung giftcode "..code.." \n");
		Msg2Player("Nh�n th��ng GIFTCODE th�nh c�ng!")
		SaveNow()
		local strMSG ="<bclr=yellow>"..GetName().." nh�n th�nh c�ng GIFTCODE LIKE SHARE FACEBOOK.<bclr>"
		Msg2SubWorld(strMSG) 
		AddGlobalCountNews(strMSG,1);
			return
			else 
				gift = 0
			end
		end
	if gift == 0 then -- check xem code co ton tai trong he thong hay khong
		return Say("M� gift ng��i v�a nh�p v�o kh�ng t�n t�i trong h� th�ng!")
	end;
end;

function WriteLogPro(data,str)
	local Data2 = openfile(""..data.."", "a+");
	write(Data2,tostring(str));
	closefile(Data2);
end