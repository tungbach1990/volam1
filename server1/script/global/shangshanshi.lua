--����ʹ
--hehongpeng 2004-12-27
Include("\\script\\global\\shangchenghead.lua")

CityData = {0, 0, 0, 0, 0, 0, 0};

function main()
	if (nil) then
		Say("Ch�c n�ng v�n ch�a M� ra", 0)
		return
	end
	--��ȡ�����ļ�����ֻ֤��ȡһ��
	loadsavevalue()
	
	local aryszContent = 
	{
		"<#> Th��ng Thi�n S�: Ta l� s� gi� ph� tr�ch Th��ng Thi�n L�nh, c� th� gi�p g� cho ng��i?",
		"<#> Giao Th��ng Thi�n L�nh/onsubmit",
		"<#> Nh�n ph�n th��ng/ontakeprize",
		"<#> T�m hi�u c�ng tr�ng c�c th�nh bang h�i m�nh chi�m l�nh ���c/onchecknum",
		"<#> T�m hi�u ho�t ��ng l�n n�y/onhelp",
		"<#> Nh�n ti�n gh� qua th�i/oncancel",
	}
	
	Say(aryszContent[1], 5, aryszContent[2], aryszContent[3], aryszContent[4], aryszContent[5], aryszContent[6]);
end 

--�õ�һ��������ڰ��ռ��ĳ���,��������ֵ
function gettongownercity()
	--�õ���Ұ������
	local strTongName = GetTongName()
	if (strTongName == nil or strTongName == "") then
		return 0
	end

	--�ֱ�õ��ߴ���еİ����������Ұ�����ƶԱ�
	local strCityTongName

	for nCityID=1, 7 do
		strCityTongName = GetCityOwner(nCityID)
		if (strCityTongName ~= "") then 
			if (strCityTongName == strTongName) then
				return nCityID
			end
		end
	end
	
	--��ʾ������ڵİ��û��ռ�����
	return 0
end

--ĳһ���е����������ӵ���ʼ���͵�����
function beginadward(nCityIndex)
	--����������г����ۼƵ�������
	for i=1, 7 do
		SetGlbValue(arraycitytoglobalvalue[i], 0)
	end
	
	--��������ۼ�����
	for i=1, 7 do
		CityData[i] = 0
	end
	
	local strTongName = GetCityOwner(nCityIndex)
	--�洢Ҫ�����ĳ�������
	SetGlbValue(AEXP_GLOBAL_ADWARD_CITY, nCityIndex)

	--���ý������������
	--�洢ʱ�����(ϵͳ��ʱ��)
	local nEnddate = GetCurrentTime() + AEXP_ADWARD_HOURNUM * 60 * 60
	SetGlbValue(AEXP_GLOBAL_ENDDATE, nEnddate)
	
	--���д���
	savevalue()
		
	--����������ʾ��Ϣ
	AddGlobalCountNews("Bang h�i"..strTongName.."��t ���c c�ng tr�ng chi�m l�nh th�nh s� nh�n ���c ph�n th��ng, m�i c�c bang ch�ng trong bang ��n D��ng Ch�u g�p Th��ng Thi�n S� �� nh�n ph�n th��ng, k� h�n l�nh th��ng l� "..AEXP_ADWARD_HOURNUM.."gi�, qua gi� th� kh�ng c�n c�ng hi�u. T�t c� c�ng tr�ng c�c th�nh th� ��u bi�n m�t", 1)
end

function onsubmit()
	--�ж�ռ����еİ��
	local nCityIndex = gettongownercity()
	if (nCityIndex < 1) then
		Say("<#> B�n ch�a gia nh�p bang h�i ho�c bang h�i c�a b�n ch�a chi�m l�nh ���c th�nh th�, kh�ng th� nh�n Th��ng Thi�n L�nh.", 0)
		return
	end
	
	--�򿪸������
	local nNum = GetGlbValue(arraycitytoglobalvalue[nCityIndex])
	GiveItemUI( "Giao Th��ng Thi�n L�nh", "Th��ng Thi�n L�nh c� th� gia t�ng c�ng tr�ng chi�m l�nh th�nh c�a bang h�i, khi �i�m t�ch l�y c�ng tr�ng ��n m�t m�c n�o ��, t�t c� bang ch�ng trong bang h�i ��u nh�n ���c ph�n th��ng, bang ph�i c�a  b�n �ang chi�m l�nh th�nh th� l�<color=read>"..arraycityindextoname[nCityIndex].."<color>, c�ng tr�ng l�:<color=read>"..nNum.."<color>", "onsubmitconfirm", "oncancel" );
end

-- ��ȡ�ɻ�ý�����������Ŀ
function GetMaxCardCount()
	local count = GetTongMemberCount()
	if (count == 0) then
		return 999999999
	end
	if (count > 1500) then	-- (1500, +��)
		return 49999
	elseif (count > 900) then	-- (900, 1500]
		return 39999
	elseif (count > 600) then	-- (600, 900]
		return 29999
	elseif (count > 300) then	-- (300, 600]
		return 19999
	else 						-- (0, 300]
		return 9999
	end
end

function onsubmitconfirm(nCount)
	if (nCount < 1) then
		Msg2Player("Ng��i ch�a giao Th��ng Thi�n L�nh")
		return
	end
	
	--�жϱ����ռ��ĳ���
	local nCityIndex = gettongownercity();
	if (nCityIndex < 1) then
		Say("B�n ch�a gia nh�p bang h�i ho�c bang h�i c�a b�n ch�a chi�m l�nh ���c th�nh th�, kh�ng th� nh�n Th��ng Thi�n L�nh.", 0)
		return
	end
		
	--�ж���Ʒ�Ƿ�Ϊ������
	for i = 1, nCount do
		local nItemIndex = GetGiveItemUnit(i)
		ItemGenre, DetailType, ParticularType = GetItemProp(nItemIndex)

		if (ItemGenre ~= AEXP_AWARDMEDIAL_NGENTYPE or
			DetailType ~= AEXP_AWARDMEDIAL_DETAILTYPE or
			ParticularType ~= AEXP_AWARDMEDIAL_PARTYPE) then
				Msg2Player("H�nh nh� ng��i tr�n ng��i ng��i c� th� kh�ng ph�i Th��ng Thi�n L�nh!")
				return 0			
		end
	end
	local nTotalNum = 0;
	--ɾ������������
	for i = 1, nCount do
		nItemIndex = GetGiveItemUnit( i )
		nTotalNum = nTotalNum + GetItemStackCount(nItemIndex)
		RemoveItemByIndex( nItemIndex )
	end
	
	local nNum = GetGlbValue(arraycitytoglobalvalue[nCityIndex])
	--if (nNum < 0) then
		--nNum = 0
	--end
	nNum = nNum + nTotalNum;
	SetGlbValue(arraycitytoglobalvalue[nCityIndex], nNum)
	SetTask(1074,1);
	
	local strTongName = GetCityOwner(nCityIndex)	
	if (nNum >= GetMaxCardCount()) then
		Msg2Player("Bang ph�i c�a c�c b�n chi�m l�nh th�nh th� "..arraycityindextoname[nCityIndex].."nh�n ���c ph�n th��ng,   mau nhanh l�nh th��ng �i!")
		WriteLog( "["..date("%Y-%m-%d %X").."] Bang h�i:"..strTongName.."Th�nh th� "..arraycityindextoname[nCityIndex].."Nh�n ���c ph�n th��ng."..GetAccount().."("..GetName()..") �� giao"..nTotalNum.."m�t Th��ng Thi�n L�nh (Current OnlineTime: "..GetGameTime().." sec)" );
		beginadward(nCityIndex)
	else
		CityData[nCityIndex] = CityData[nCityIndex] + nTotalNum
		if (CityData[nCityIndex] > AEXP_ADDMAX_SAVE) then
			CityData[nCityIndex] = 0			
			WriteLog( "["..date("%Y-%m-%d %X").."] Bang h�i"..strTongName.."Th�nh th� "..arraycityindextoname[nCityIndex].."V� "..GetAccount().."("..GetName()..") �� giao"..nTotalNum.."m�t Th��ng Thi�n L�nh,  s� l��ng l� "..nNum.."(Current OnlineTime: "..GetGameTime().." sec)" );
			savevalue()			
		end
		Msg2Player("C�ng tr�ng bang h�i c�a c�c b�n �� t�ng l�n"..nTotalNum..", tr��c m�t l�:"..nNum);
	end 	
end

function ontakeprize()
	
	-- �ж���Ұ����ռ���е�����
	local nCityIndex = gettongownercity()	
	if (nCityIndex < 1 ) then
		Say("<#> B�n ch�a gia nh�p bang h�i ho�c bang h�i b�n ch�a chi�m l�nh ���c th�nh th�, kh�ng th� nh�n ph�n th��ng.", 0);
	 	return 0
	end
	 
	--�ж���Ұ����ռ�����Ƿ��Ľ���
	local nAdwardCityIndex = GetGlbValue(AEXP_GLOBAL_ADWARD_CITY)
	if (nAdwardCityIndex < 1) then
		Say("<#> Hi�n t�i kh�ng c� th�nh th� nh�n ���c ph�n th��ng, kh�ng th� nh�n.", 0);
		return 0
	end
	
	if (nAdwardCityIndex ~= nCityIndex) then
		Say("<#> B�n �ang � trong bang h�i c� c�ng tr�ng chi�m l�nh th�nh th� kh�ng ��, kh�ng nh�n ���c ph�n th��ng.", 0);
		return 0
	end
	 
	local nNow = GetCurrentTime()
	local nLastdate = GetGlbValue(AEXP_GLOBAL_ENDDATE);
	if (nNow > nLastdate) then
		Say("<#> Th�i gian l�nh th��ng �� h�t, kh�ng th� nh�n ���c ph�n th��ng c�ng tr�ng th�nh th� k� n�y.", 0);
		SetTask(1074,0);
		return 0
	end
	
	--�ж���ҵ����ʱ��
	if (GetJoinTongTime() < AEXP_PLAYERTONG_LIMIT * 24 * 60) then
		Say("<#> Th�i gian gia nh�p bang ph�i c�a b�n ch�a ��<color=red>"..AEXP_PLAYERTONG_LIMIT.."<color>ng�y, kh�ng th� nh�n ph�n th��ng.", 0);
		return 0
	end
	
	--�ж�������һ�ε��콱����
	local today = tonumber(date("%Y%m%d"))
	local nLastAdward = GetTask(AEXP_TASK_ADWARDDATE)
	if (today == nLastAdward) then
		Say("<#> Ph�n th��ng h�m nay b�n �� nh�n, kh�ng th� nh�n th�m m�t l�n n�a!", 0);
		return 0
	end
	
	--�������������������ô���뽱��
	if(GetTask(1074) ~= 1) then
		Say("<#> B�n kh�ng giao n�p Th��ng Thi�n L�nh cho bang h�i, kh�ng th� nh�n ���c ph�n th��ng.",0);
		return 0
	end
	giveprize();
	return 1
end

--������ɹ���ô������ҽ���
function giveprize()
	--����(�ɲ�¶�Ľ���)
	--�漴�γɽ���
	local iRand = random(1,1)
	if (iRand == 1) then
		local nExpRate = 0--GetNpcExpRate()
		if (nExpRate == nil) then
			nExpRate = 1
		end
		if (nExpRate <= 100) then
			AddSkillState(440, 1, 1, AEXP_ADWARD_TIME * FRAME2TIME * 60 * 60);
			SetTask(1074,0);
			Say("Ch�c m�ng! B�n nh�n ���c "..AEXP_ADWARD_TIME.."Ph�n th��ng t�ng g�p ��i �i�m kinh nghi�m trong m�t gi� ", 0)
		else
			Say("<#> Xin l�i! Hi�n t�i kh�ng th� cho b�n �i�m kinh nghi�m g�p b�i.", 0)
			return 1
		end
	else
		--��������ӱ�Ľ����� 	
	end
	
	--��λ����õ����ﻹ��ǰ�棿
	--�����������콱����
	WriteLog( "["..date("%Y-%m-%d %X").."] c�ng tr�ng th�nh th� ���c t�nh t�i m�t gi�i h�n n�o ��. Ng��i ch�i"..GetAccount().."("..GetName()..") �� nh�n ���c ph�n th��ng (Current OnlineTime: "..GetGameTime().." sec)" );	
	
	-- �����ϴ��콱������
	local today = tonumber(date("%Y%m%d"))
	SetTask(AEXP_TASK_ADWARDDATE, today)
end

function onchecknum()
	--�õ�������ڰ��ռ����е�����
	--���С��1��ô��ʾ��ҵİ��û��ռ�����
	local nCityIndex = gettongownercity()
	if (nCityIndex < 1 ) then
		Say("<#> B�n ch�a gia nh�p bang h�i ho�c bang h�i b�n  ch�a chi�m l�nh ���c th�nh th�, kh�ng c� �i�m t�ch l�y c�ng tr�ng th�nh th�.", 0);
		return 
	end
	
	--�õ���Ұ��ռ����е�����������
	local nNum = GetGlbValue(arraycitytoglobalvalue[nCityIndex])
	Say("<#> Bang h�i c�c b�n chi�m l�nh th�nh th� l�<color=red>"..arraycityindextoname[nCityIndex].."<color>, c�ng tr�ng th�nh th� l�:<color=red>"..nNum.."<color>", 0);
end

function oncancel()
	return
end

function onhelp()
	Talk(2, "continuefun_help","<#> H� th�ng gi�i thi�u Th��ng Thi�n Ph�t �c: Nh�n v�t tr�n c�p 50 c� th� ��nh qu�i �� nh�n ���c Th��ng Thi�n L�nh v� Ph�t �c L�nh. Th�nh vi�n c�a c�c bang ph�i chi�m l�nh c�c th�nh th� l�n c� th� ��n D��ng Ch�u ch� Th��ng Thi�n S� [n�] giao Th��ng Thi�n L�nh, gi�p bang ph�i t�nh l�y c�ng tr�ng t��ng �ng c� ���c.", "T�t c� ng��i ch�i c� th� ��n D��ng Ch�u ch� Ph�t �c S� [nam] s� d�ng Ph�t �c L�nh tr�ng ph�t 7 th�nh th� l�n. M�i khi ng��i ch�i giao m�t Ph�t �c L�nh cho b�t c� th�nh th� n�o th� s� l��ng t�ch l�y Th��ng Thi�n L�nh th�nh th� �� gi�m �i m�t c�i.");
end

function continuefun_help()
	Talk(3, "", "Khi m�t th�nh th� n�o �� m� c� c�ng tr�ng t�ch l�y t�i m�t m�c n�o ��, b�t c� th�nh vi�n n�o gia nh�p h�n m�t ng�y c� giao n�p Th��ng Thi�n L�nh ��u c� th� trong th�i gian quy ��nh nh�n ���c ph�n th��ng 4 gi� nh�n ��i �i�m kinh nghi�m, ��ng th�i s� l��ng Th��ng Thi�n L�nh c�a c�c th�nh th� kh�c tr� v� 0.","Ch� �: <color=red>Trong th�i gian n�y kh�ng ���c s� d�ng Ti�n Th�o l�, ��ng th�i m�t khi �� ch�t th� s� m�t c�ng hi�u nh�n ��i �i�m kinh nghi�m.<color> Trong th�i gian l�nh th��ng n�u m�t th�nh th� n�o c� c�ng tr�ng ��t ��n �i�u ki�n ph�t th��ng, th� bang ph�i m�i nh�t �� s� ���c nh�n th��ng, nh�ng bang ch�ng tr��c trong bang c� kh�ng th� nh�n ���c b�t c� ph�n th��ng n�o.", "Quan h� quy m� bang h�i v� c�ng tr�ng th�nh th� c�n thi�t: Nh�n s�<=300, c�ng tr�ng 9999;300<nh�n s�<=600, c�ng tr�ng 19999;600<nh�n s�<=900, c�ng tr�ng 29999;900<nh�n s�<=1500, c�ng tr�ng 39999;1500<nh�n s�, c�ng tr�ng 49999.");
end