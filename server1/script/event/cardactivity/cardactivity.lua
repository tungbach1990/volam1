ONECARDACTIVITY_OPEN = nil	--һ��ͨ��������

---------------- ��ȡ������Ʒ ---------------------------------
function onGift()
	-- Say("��٣�����û����Ʒ���ͣ����������ɣ�", 0)	
	-- Say("��٣��������»��2004��9��22��-10��1������ϵͳά��ǰ����35Ԫ������<color=blue>10���ɲ�¶<color>(1Сʱ�ھ��鷭��)����ȡǰ���������ı������Է��Ų���(10����)��", 2, "��Ҫ��ȡ/get_gift_XianCaoLu", "�Ȼ�����/onCancel")
	-- Say( "��٣��������»<color=yellow>\"ˮ���籩\"<color>��2004��10��13��-10��21������ϵͳά��ǰ����35Ԫ�����ɴ���������ȡ��1��<color=yellow>ˮ��<color>����ȡǰ���������ı������Է��Ų��¡�", 2, "��Ҫ��ȡ/get_gift_Crystal", "�Ȼ�����/onCancel" );
	-- Say("��٣��������»��2004��10��22��-11��1������ϵͳά��ǰ����35Ԫ������<color=yellow>5����Ե¶<color>����ȡǰ���������ı������Է��Ų���(5����)��", 2, "��Ҫ��ȡ/get_gift_FuYuanLu", "�Ȼ�����/onCancel");
	-- Say( "��٣��������»��2004��11��11��-11��19������ϵͳά��ǰ��ÿ��ֵ2��35Ԫ����6��10Ԫ�����ɴ���������ȡһ��<color=yellow>���¹����±����书���ܵ�����1�㣩<color>��<color=yellow>����ܽ���±���Ǳ�ܵ�����5�㣩<color>����ȡǰ���������ı������Է��Ų��¡�", 2, "��Ҫ��ȡ/get_gift_MoonCake", "�Ȼ�����/onCancel" );
	--Say( "<#>��٣�Ϊ��ףһ��ͨ��ͨ������Ϊ������׼���˷�ʢ�Ĵ�����12��12��-12��26������ϵͳά��ǰ����ֵ3��30Ԫһ��ͨ��6��15Ԫһ��ͨ������ȡһ��<color=yellow>�����ؼ����书���ܵ��1�㣩<color>����ֵ1��30Ԫһ��ͨ��2��15Ԫһ��ͨ������ȡһ��<color=yellow>��׾��裨�����йܹ��ܣ�<color>����ȡǰ���������ı������Է��Ų��¡�", 2, "��Ҫ��ȡ/get_gift_Passport", "�Ȼ�����/onCancel" );
	--Say("<#>��٣�����һ��ͨ�������2005��1��11����11��00��ʼ��2005��1��21����8��00ֹ����ֵ1��30Ԫһ��ͨ��2��15Ԫһ��ͨ�Ϳ�����ȡһ��<color=yellow>�����ľ������ú���������ϵĸ����飩<color>����ȡǰ���������ı������Է��Ų��¡�", 2, "��Ҫ��ȡ/get_gift_Passport", "�Ȼ�����/onCancel")
	 Say( "��٣������ٹ��ƽ��ܣ��俨ˮ�������͡�2005��05��11����10��00��5��18������8��00����ֵһ��ͨ��������������ȡˮ������15Ԫһ��ͨ��һ��ˮ������30Ԫһ��ͨ�Ͷ���ˮ������ֵ48Ԫһ��ͨ������ˮ����", 2, "��Ҫ��ȡ/get_gift_Crystal_050511", "�Ȼ�����/onCancel" );
end



function get_gift_Crystal()
	if (GetExtPoint(3) >= 1) then
 		if(GetExtPoint(3) > 32767) then
			Say( "��٣����ݳ��ִ�����������ȡ������Ʒ������GM��ӳ��������ǻ����ƽ���������⡣��л֧�֣�", 0 );
		else
			local aryszCrystal = { "��ˮ��", "��ˮ��", "��ˮ��" };
			local nCrystalIdx = mod( random( 31 ) + random( 101 ), 3 ) + 1;
			AddItem(4, 237 + nCrystalIdx, 1, 1, 0, 0);			
			LiguanLog("���1��"..aryszCrystal[nCrystalIdx]);
			PayExtPoint(3, 1);
			Say( "��٣�����1��<color=yellow>" .. aryszCrystal[nCrystalIdx] .. "<color>��ף���ڽ����������п��ֵ���Ϸ����Ҫ�˷���Ŷ��", 0 );
			Msg2Player( "���õ�1��" .. aryszCrystal[nCrystalIdx] );
	
			local nCurEPValue = GetExtPoint(3);
			if (nCurEPValue > 0) then
				Say( "��٣���ĵ���δ���꣬������<color=yellow>"..nCurEPValue.."<color>��Ŷ��", 0 );
			end
		end
	else
		Talk(1, "", "��٣����������ڼ���δ�俨(�����������)��ץ��ʱ��ȥ�俨�ɣ���Ҫ��������<color=yellow>\"ˮ���籩\"<color>������Ŷ��(�忨ʱ����ʱ�˳���Ϸ)");
	end	
end


function get_gift_XianCaoLu()
	if (GetExtPoint(3) >= 1) then
 		if(GetExtPoint(3) > 32767) then
			Talk(1, "", "��٣����ݳ��ִ�����������ȡ������Ʒ������GM��ӳ��������ǻ����ƽ���������⡣��л֧�֣�")
		else
			local nCount = 10;
			local strObj = "10���ɲ�¶";
			for i = 1, nCount do
				AddItem(6, 1, 71, 1, 0, 0) -- �ɲ�¶
			end
			LiguanLog("���"..strObj);
			PayExtPoint(3, 1)
			Talk(1, "", "��٣�����<color=red>" .. strObj .. "<color>��ף���ڽ����������п��ֵ���Ϸ����Ҫ�˷���Ŷ��")
			Msg2Player("���õ�" ..strObj)
	
			local nCurEPValue = GetExtPoint(3);
			if (nCurEPValue > 0) then
				Talk(1, "", "��٣���ĵ���δ���꣬������"..nCurEPValue.."��Ŷ��")
			end
		end
	else
		Talk(1, "", "��٣����������ڼ仹δ���35Ԫ��Ŷ(�����������)�����ȥ����35Ԫ��������<color=red>���鷭��<color>�ĳɾ͸аɡ�(�忨ʱ����ʱ�˳���Ϸ)");
	end	
end



function get_gift_FuYuanLu()
	local nObjCount = 5;
	local strObj = "��Ե¶";
	
	if (GetExtPoint(3) >= 1) then
 		if(GetExtPoint(3) > 32767) then
			Say( "��٣����ݳ��ִ�����������ȡ������Ʒ������GM��ӳ��������ǻ����ƽ���������⡣��л֧�֣�", 0 );
		else
			for i = 1, nObjCount do
				AddItem( 6, 1, 124, 1, 0, 0 );
			end
			LiguanLog( "���"..nObjCount.."��"..strObj );
			PayExtPoint(3, 1);
			Say( "��٣�����<color=yellow>"..nObjCount.."��"..strObj.."<color>��ף���ڽ����������п��ֵ���Ϸ����Ҫ�˷���Ŷ��", 0 );
			Msg2Player( "���õ�"..nObjCount.."��"..strObj );
	
			local nCurEPValue = GetExtPoint(3);
			if (nCurEPValue > 0) then
				Say( "��٣���ĵ���δ���꣬������<color=yellow>"..nCurEPValue.."<color>��Ŷ��", 0 );
			end
		end
	else
		 Say( "��٣����������ڼ���δ�俨(�����������)��ץ��ʱ��ȥ�俨�ɣ���Ҫ��������<color=yellow>"..strObj.."<color>������Ŷ��(�俨ʱ����ʱ�˳���Ϸ)", 0 );
	end	
end


function get_gift_MoonCake()
	local aryMoonCake = { { "���¹����±�", { 6, 1, 127, 1, 0, 0 } },
						  { "����ܽ���±�", { 6, 1, 128, 1, 0, 0 } },
						};
	local nCurEPValue = GetExtPoint( 3 );
	
	if( nCurEPValue >= 6 ) then
 		if( nCurEPValue > 32767 ) then
			Say( "��٣����ݳ��ִ�����������ȡ������Ʒ������GM��ӳ��������ǻ����ƽ���������⡣��л֧�֣�", 0 );
		else		
			local nMoonCakeIdx = mod( random( 31 ) + random( 101 ), 2 ) + 1;
			AddItem( aryMoonCake[nMoonCakeIdx][2][1], aryMoonCake[nMoonCakeIdx][2][2], aryMoonCake[nMoonCakeIdx][2][3], aryMoonCake[nMoonCakeIdx][2][4], aryMoonCake[nMoonCakeIdx][2][5], aryMoonCake[nMoonCakeIdx][2][6] );
			LiguanLog( "���1��"..aryMoonCake[nMoonCakeIdx][1] );
			PayExtPoint( 3, 6 );
			Say( "��٣�����һ��<color=yellow>"..aryMoonCake[nMoonCakeIdx][1].."<color>��ף���ڽ����������п��ֵ���Ϸ����Ҫ�˷���Ŷ��", 0 );
			Msg2Player( "���õ�1��"..aryMoonCake[nMoonCakeIdx][1] );
			
			nCurEPValue = GetExtPoint( 3 );			
			if( nCurEPValue >= 6 ) then
				Say( "��٣����ĵ���δ���꣬������<color=yellow>"..floor( nCurEPValue / 6 ).."<color>���±�Ŷ��", 0 );
			elseif( nCurEPValue > 0 ) then
				local nHighCardCount = floor( ( 6 - nCurEPValue ) / 3 );
				local nLowCardCount = mod( 6 - nCurEPValue, 3 );
				local szInfo = "";
				if( nHighCardCount > 0 ) then
					szInfo = szInfo..nHighCardCount.."��35Ԫ��";
				end
				if( nLowCardCount > 0 ) then
					if( nHighCardCount > 0 ) then
						szInfo = szInfo.."��";
					end
					szInfo = szInfo..nLowCardCount.."��10Ԫ��";
				end
				Say( "��٣����ĵ���δ���꣬�ٳ�<color=yellow>"..szInfo.."<color>�Ϳ�����ȡһ���±�Ŷ��", 0 );
			end
		end
	else	
		local nHighCardCount = floor( ( 6 - nCurEPValue ) / 3 );
		local nLowCardCount = mod( 6 - nCurEPValue, 3 );
		local szInfo = "";
		if( nHighCardCount > 0 ) then
			szInfo = szInfo..nHighCardCount.."��35Ԫ��";
		end
		if( nLowCardCount > 0 ) then
			if( nHighCardCount > 0 ) then
				szInfo = szInfo.."��";
			end
			szInfo = szInfo..nLowCardCount.."��10Ԫ��";
		end
		 Say( "��٣����������ڼ���δ�乻�����ٳ�<color=yellow>"..szInfo.."<color>�Ϳ���ȡ�±��ˡ�ץ��ʱ��ȥ�俨�ɣ���Ҫ��������<color=yellow>"..aryMoonCake[1][1].."��"..aryMoonCake[2][1].."<color>������Ŷ��(�俨ʱ����ʱ�˳���Ϸ)", 0 );
	end	
end

-- һ��ͨ�����2004-12-12
--function get_gift_Passport()
--	local gift_Big = { "�����ؼ�", { 6, 1, 26, 1, 0, 0, 0 } };
--	local gift_Small = { "��׾���", { 6, 1, 130, 1, 0, 0, 0 } };
--	local nCurEPValue = GetExtPoint( 3 );
--	if( nCurEPValue >= 2 ) then
--		if( nCurEPValue > 32767 ) then
--			Say( "��٣����ݳ��ִ�����������ȡ������Ʒ������GM��ӳ��������ǻ����ƽ���������⡣��л֧�֣�", 0 );
--		else
--			local gift = nil;
--			if( nCurEPValue >= 6 ) then
--				gift = gift_Big;
--				PayExtPoint( 3, 6 );
---			else
--				gift = gift_Small;
--				PayExtPoint( 3, 2 );
---			end
--			if( gift ~= nil ) then
--				AddItem( gift[2][1], gift[2][2], gift[2][3], gift[2][4], gift[2][5], gift[2][6], gift[2][7] );
--				LiguanLog( "���1��"..gift[1] );
--				Msg2Player( "�����1��" .. gift[1] );
--				nCurEPValue = GetExtPoint( 3 );
--				if( nCurEPValue >= 2 ) then
--					Say( "��٣�����1��<color=yellow>"..gift[1].."<color>��ף���ڽ����������п��ֵ���Ϸ����Ҫ�˷���Ŷ����������Ʒ������ȡ����ֻ���������ܵ�������ĩ����Ҫ������Ŷ��", 2, "������ȡ��Ʒ/get_gift_Passport", "�����ұ��ܰ�/onCancel" );
--				else
--					Say( "��٣�����1��<color=yellow>"..gift[1].."<color>��ף���ڽ����������п��ֵ���Ϸ����Ҫ�˷���Ŷ��", 0 );
--				end
--			else
--				Say( "��٣����ݳ��ִ�����������ȡ������Ʒ������GM��ӳ��������ǻ����ƽ���������⡣��л֧�֣�", 0 );
--			end
--		end
--	else
--		Talk( 1, "", "��٣����������ڼ�һ��ͨ��δ�乻(�����������)����ֵ1��30Ԫһ��ͨ��2��15Ԫһ��ͨ������ȡ����Ʒ�ˣ���Ҫ��������<color=yellow>"..gift_Big[1].."<color>��<color=yellow>"..gift_Small[1].."<color>������Ŷ��" );
--	end
--end

-----------һ��ͨ�����2005-01-11---------------------------
function get_gift_Passport()
	local gift_banruo={"�����ľ�",{6,1,12,1,0,0,0}};
	local nCurEPValue=GetExtPoint( 3 );
	if (nCurEPValue>=2) then
		if (nCurEPValue>=32767) then
			Say("��٣����ݳ��ִ�����������ȡ������Ʒ������GM��ӳ��������ǻ����ƽ���������⡣��л֧�֣�", 0 )
		else
				PayExtPoint(3,2)
				AddItem(6,1,12,1,0,0,0)
				LiguanLog("���1�������ľ�")
				Msg2Player("�����1�������ľ�")
				nCurEPValue=GetExtPoint(3);
				if(nCurEPValue>=2) then
					Say( "��٣�����1��<color=yellow>�����ľ�<color>��ף���ڽ����������п��ֵ���Ϸ����Ҫ�˷���Ŷ����������Ʒ������ȡ����ֻ���������ܵ�2005��1��21�գ���Ҫ������Ŷ��", 2, "������ȡ��Ʒ/get_gift_Passport", "�����ұ��ܰ�/onCancel" );
				else
					Say( "��٣�����1��<color=yellow>�����ľ�<color>��ף���ڽ����������п��ֵ���Ϸ����Ҫ�˷���Ŷ��", 0 );
				end
		end
	else
		Talk( 1, "", "��٣����������ڼ�һ��ͨ��δ�乻(�����������)����ֵ1��30Ԫһ��ͨ��2��15Ԫһ��ͨ������ȡ����Ʒ�ˣ���Ҫ��������<color=yellow>�����ľ�<color>������Ŷ��" );
	end
end

---------------  һ��ͨ�����  2005-05-09�޸�-----START----------------
function get_gift_Crystal_050511()
	if (GetExtPoint(5) >= 1) then
 		if(GetExtPoint(5) > 32767) then
			Say( "��٣����ݳ��ִ�����������ȡ������Ʒ������GM��ӳ��������ǻ����ƽ���������⡣��л֧�֣�", 0 );
		else
			local aryszCrystal = { "��ˮ��", "��ˮ��", "��ˮ��" };
			local nCrystalIdx = mod( random( 31 ) + random( 101 ), 3 ) + 1;
			AddItem(4, 237 + nCrystalIdx, 1, 1, 0, 0);			
			LiguanLog("���1��"..aryszCrystal[nCrystalIdx]);
			PayExtPoint(5, 1);
			Msg2Player( "���õ�1��" .. aryszCrystal[nCrystalIdx] );
			local nCurEPValue = GetExtPoint(5);
			if (nCurEPValue > 0) then
				Say( "��٣�����1��<color=yellow>" .. aryszCrystal[nCrystalIdx] .. "<color>����ĵ���δ���꣬������<color=yellow>"..nCurEPValue.."<color>��Ŷ��", 0 );
			else
				Say( "��٣�����1��<color=yellow>" .. aryszCrystal[nCrystalIdx] .. "<color>��ף���ڽ����������п��ֵ���Ϸ����Ҫ�˷���Ŷ��", 0 );
			end
		end
	else
		Talk(1, "", "��٣����������ڼ���δ�俨(�����������)��ץ��ʱ��ȥ�俨�ɣ���Ҫ��������<color=yellow>�俨ˮ��������<color>������Ŷ��(�忨ʱ����ʱ�˳���Ϸ)");
	end	
end

---------------  һ��ͨ�����  2005-05-09�޸�---END------------------