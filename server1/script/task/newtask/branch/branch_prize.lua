-- ����֧������ű�
-- by xiaoyang(2005\1\4)

Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\branch\\branch_head.lua")
Include([[\script\task\newtask\branch\extent_prize.lua]]);


--���ɣ�1    ������2     а�ɣ�3

saying = "Ng��i v�t v� qu�! H�y ch�n m�t m�n cho m�nh �i!";
ItemText = {
				{"Trang b� Ho�ng Kim/15/2/get_golditem1","Trang b� Ho�ng Kim/15/2/get_golditem2","Trang b� Ho�ng Kim/15/2/get_golditem3"},
				{"Trang b� Ho�ng Kim/15/3/get_golditem1","Trang b� Ho�ng Kim/15/3/get_golditem2","Trang b� Ho�ng Kim/15/3/get_golditem3"},
				{"Trang b� Ho�ng Kim/15/4/get_golditem1","Trang b� Ho�ng Kim/15/4/get_golditem2","Trang b� Ho�ng Kim/15/4, 3/get_golditem3"},
				{"Trang b� Ho�ng Kim/15/5/get_golditem1","Trang b� Ho�ng Kim/15/5/get_golditem2","Trang b� Ho�ng Kim/15/5/get_golditem3"},
				{"Ti�n/3/2/get_qualityitem1","Ti�n/3/2/get_qualityitem2","Ti�n/3/2/get_qualityitem3"},
				{"Ti�n/3/5/get_qualityitem1","Ti�n/3/5/get_qualityitem2","Ti�n/3/5/get_qualityitem3"},
				{"kinh nghi�m /4/2/get_oreitem1","kinh nghi�m /4/2/get_oreitem2","kinh nghi�m /4/2/get_oreitem3"},
				{"kinh nghi�m /4/3/get_oreitem1","kinh nghi�m /4/3/get_oreitem2","kinh nghi�m /4/3/get_oreitem3"},
				{"kinh nghi�m /4/4/get_oreitem1","kinh nghi�m /4/4/get_oreitem2","kinh nghi�m /4/4/get_oreitem3"},
				{"kinh nghi�m /4/5/get_oreitem1","kinh nghi�m /4/5/get_oreitem2","kinh nghi�m /4/5/get_oreitem3"},
				{"V�t ph�m/14/3/get_propitem1","V�t ph�m/14/3/get_propitem2","V�t ph�m/14/3/get_propitem3"},
				{"V�t ph�m/14/4/get_propitem1","V�t ph�m/14/4/get_propitem2","V�t ph�m/14/4/get_propitem3"},
			}

function branchprize()
	Uworld1050 = nt_getTask(1050)
	Uworld1051 = nt_getTask(1051)
	Uworld1052 = nt_getTask(1052)
	Uworld1053 = nt_getTask(1053)
	Uworld1054 = nt_getTask(1054)
	Uworld1055 = nt_getTask(1055)
	Uworld1056 = nt_getTask(1056)
	Uworld1057 = nt_getTask(1057)
	Uworld1058 = nt_getTask(1058)
	Uworld1059 = nt_getTask(1059)
	Uworld1060 = nt_getTask(1060)
	Uworld1061 = nt_getTask(1061)
	Uworld192 = nt_getTask(192) --����֧�߽�������������λ���壺
								--1-20~30������һ��2-20~30�����ɶ���3-20~30���������� 4-30~40������һ�� 5-30~40�����ɶ��� 6-30~40����������
								--7-40~50������һ�� 8-40~50�����ɶ��� 9-40~50���������� 10-50~60������һ�� 11-50~60�����ɶ��� 12-50~60����������
	Uworld193 = nt_getTask(193) --����֧�߽�������������λ���壺
								--1-20~30������һ��2-20~30����������3-20~30���������� 4-30~40������һ�� 5-30~40���������� 6-30~40����������
								--7-40~50������һ�� 8-40~50���������� 9-40~50���������� 10-50~60������һ�� 11-50~60���������� 12-50~60����������
	Uworld194 = nt_getTask(194) --а��֧�߽�������������λ���壺
								--1-20~30��а��һ��2-20~30��а�ɶ���3-20~30��а������ 4-30~40��а��һ�� 5-30~40��а�ɶ��� 6-30~40��а������
								--7-40~50��а��һ�� 8-40~50��а�ɶ��� 9-40~50��а������ 10-50~60��а��һ�� 11-50~60��а�ɶ��� 12-50~60��а������
	Uworld195 = nt_getTask(195)	--ȷ��Ҫ����/������������

	if ( nt_getTask(1050) == 50 and GetBit(GetTask(192), 1) ~= 1) then 						--ȱ�ٽ�����������  ����֧��20-30����һ
		nt_setTask(195, 1)
		Prise(saying,ItemText[1][1],ItemText[5][1],ItemText[7][1])

	elseif ( nt_getTask(1050) == 110 and GetBit(GetTask(192), 2) ~= 1 ) then  				--����֧��20-30�����
		nt_setTask(195, 1)
		Prise(saying,ItemText[1][1],ItemText[5][1],ItemText[7][1])
		
	elseif ( nt_getTask(1050) == 140 and GetBit(GetTask(192), 3) ~= 1 ) then	 			--����֧��20-30������
		nt_setTask(195, 1)
		Prise(saying,ItemText[1][1],ItemText[5][1],ItemText[7][1])	
	
	elseif ( nt_getTask(1051) == 30 and GetBit(GetTask(192), 4) ~= 1 ) then   				--����֧��30-40����һ
		--AddItem() --����һ��һ�׵���ɫװ��
		nt_setTask(195, 1)
		Prise(saying,ItemText[2][1],ItemText[11][1],ItemText[8][1])
		
	elseif ( nt_getTask(1051) == 90 and GetBit(GetTask(192), 5) ~= 1 ) then	 			--����֧��30-40�����
		--AddItem() --����һ�Ÿ��ʱ�ʯ
		nt_setTask(195, 1)
		Prise(saying,ItemText[2][1],ItemText[11][1],ItemText[8][1])	
	
	elseif ( nt_getTask(1051) == 180 and GetBit(GetTask(192), 6) ~= 1 ) then	 			--����֧��30-40������
		--AddItem() --����һ�Ž�ϵ�İ����Ա�ʯ
		nt_setTask(195, 1)
		Prise(saying,ItemText[2][1],ItemText[11][1],ItemText[8][1])	
	
	elseif ( nt_getTask(1052) == 30 and GetBit(GetTask(192), 7) ~= 1 ) then				--����֧��40-50����һ
		nt_setTask(195, 1)
		Prise(saying,ItemText[3][1],ItemText[12][1],ItemText[9][1])
		
	elseif ( nt_getTask(1052) == 70 and GetBit(GetTask(192), 8) ~= 1 ) then  				--����֧��40-50�����
		nt_setTask(195, 1)
		Prise(saying,ItemText[3][1],ItemText[12][1],ItemText[9][1])	
	
	elseif ( nt_getTask(1052) == 120 and GetBit(GetTask(192), 9) ~= 1 ) then 				--����֧��40-50������
		nt_setTask(195, 1)
		Prise(saying,ItemText[3][1],ItemText[12][1],ItemText[9][1])
		
	elseif ( nt_getTask(1053) == 25 and GetBit(GetTask(192), 10) ~= 1 ) then 				--����֧��50-60����һ
		nt_setTask(195, 1)
		Prise(saying,ItemText[4][1],ItemText[6][1],ItemText[10][1])	
	
	elseif ( nt_getTask(1053) == 50 and GetBit(GetTask(192), 11) ~= 1 ) then 				--����֧��50-60�����
		nt_setTask(195, 1)
		Prise(saying,ItemText[4][1],ItemText[6][1],ItemText[10][1])	
	
	elseif ( nt_getTask(1053) == 80 and GetBit(GetTask(192), 12) ~= 1 ) then 				--����֧��50-60������
		nt_setTask(195, 1)
		Prise(saying,ItemText[4][1],ItemText[6][1],ItemText[10][1])		

	elseif ( nt_getTask(1054) == 30 and GetBit(GetTask(193), 1) ~= 1 ) then 				--����֧��20-30����һ
		Prise(saying,ItemText[1][2],ItemText[5][2],ItemText[7][2])
		nt_setTask(195, 1)
		
	elseif ( nt_getTask(1054) == 100 and GetBit(GetTask(193), 2) ~= 1 ) then 				--����֧��20-30�����
		nt_setTask(195, 1)
		Prise(saying,ItemText[1][2],ItemText[5][2],ItemText[7][2])	
	
	elseif ( nt_getTask(1054) == 150 and GetBit(GetTask(193), 3) ~= 1 ) then 				--����֧��20-30������
		nt_setTask(195, 1)
		Prise(saying,ItemText[1][2],ItemText[5][2],ItemText[7][2])	

	elseif ( nt_getTask(1055) == 50 and GetBit(GetTask(193), 4) ~= 1 ) then 				--����֧��30-40����һ
		--AddItem() --����һ��һ�׵���ɫװ��
		nt_setTask(195, 1)
		Prise(saying,ItemText[2][2],ItemText[11][2],ItemText[8][2])	
	
	elseif ( nt_getTask(1055) == 90 and GetBit(GetTask(193), 5) ~= 1 ) then 				--����֧��30-40�����
		--AddItem() --����һ�Ÿ��ʱ�ʯ
		nt_setTask(195, 1)
		Prise(saying,ItemText[2][2],ItemText[11][2],ItemText[8][2])

	elseif ( nt_getTask(1055) == 140 and GetBit(GetTask(193), 6) ~= 1 ) then 				--����֧��30-40������
		nt_setTask(195, 1)
		Prise(saying,ItemText[2][2],ItemText[11][2],ItemText[8][2])

	elseif ( nt_getTask(1056) == 25 and GetBit(GetTask(193), 7) ~= 1 ) then 				--����֧��40-50����һ
		nt_setTask(195, 1)
		Prise(saying,ItemText[3][2],ItemText[12][2],ItemText[9][2])

	elseif ( nt_getTask(1056) == 50 and GetBit(GetTask(193), 8) ~= 1 ) then 				--����֧��40-50�����
		nt_setTask(195, 1)
		Prise(saying,ItemText[3][2],ItemText[12][2],ItemText[9][2])

	elseif ( nt_getTask(1056) == 80 and GetBit(GetTask(193), 9) ~= 1 ) then 				--����֧��40-50������
		nt_setTask(195, 1)
		Prise(saying,ItemText[3][2],ItemText[12][2],ItemText[9][2])

	elseif ( nt_getTask(1057) == 30 and GetBit(GetTask(193), 10) ~= 1 ) then				--����֧��50-60����һ
		nt_setTask(195, 1)
		Prise(saying,ItemText[4][2],ItemText[6][2],ItemText[10][2])

	elseif ( nt_getTask(1057) == 70 and GetBit(GetTask(193), 11) ~= 1 ) then					--����֧��50-60�����
		nt_setTask(195, 1)
		Prise(saying,ItemText[4][2],ItemText[6][2],ItemText[10][2])

	elseif ( nt_getTask(1057) == 100 and GetBit(GetTask(193), 12) ~= 1 ) then					--����֧��50-60������
		nt_setTask(195, 1)
		Prise(saying,ItemText[4][2],ItemText[6][2],ItemText[10][2])

	elseif ( nt_getTask(1058) == 30 and GetBit(GetTask(194), 1) ~= 1 ) then 				--а��֧��20-30����һ
		nt_setTask(195, 1)
		Prise(saying,ItemText[1][3],ItemText[5][3],ItemText[7][3])

	elseif ( nt_getTask(1058) == 50 and GetBit(GetTask(194), 2) ~= 1 ) then 				--а��֧��20-30�����
		nt_setTask(195, 1)
		Prise(saying,ItemText[1][3],ItemText[5][3],ItemText[7][3])

	elseif ( nt_getTask(1058) == 100 and GetBit(GetTask(194), 3) ~= 1 ) then 				--а��֧��20-30������
		nt_setTask(195, 1)
		Prise(saying,ItemText[1][3],ItemText[5][3],ItemText[7][3])

	elseif ( nt_getTask(1059) == 30 and GetBit(GetTask(194), 4) ~= 1 ) then 				--а��֧��30-40����һ
		nt_setTask(195, 1)
		Prise(saying,ItemText[2][3],ItemText[11][3],ItemText[8][3])

	elseif ( nt_getTask(1059) == 50 and GetBit(GetTask(194), 5) ~= 1 ) then 				--а��֧��30-40�����
		nt_setTask(195, 1)
		Prise(saying,ItemText[2][3],ItemText[11][3],ItemText[8][3])
		
	elseif ( nt_getTask(1059) == 120 and GetBit(GetTask(194), 6) ~= 1 ) then 				--а��֧��30-40������
		nt_setTask(195, 1)
		Prise(saying,ItemText[2][3],ItemText[11][3],ItemText[8][3])

	elseif ( nt_getTask(1060) == 50 and GetBit(GetTask(194), 7) ~= 1 ) then 				--а��֧��40-50����һ
		nt_setTask(195, 1)
		Prise(saying,ItemText[3][3],ItemText[12][3],ItemText[9][3])

	elseif ( nt_getTask(1060) == 90 and GetBit(GetTask(194), 8) ~= 1 ) then 				--а��֧��40-50�����
		nt_setTask(195, 1)
		Prise(saying,ItemText[3][3],ItemText[12][3],ItemText[9][3])

	elseif ( nt_getTask(1060) == 120 and GetBit(GetTask(194), 9) ~= 1 ) then 				--а��֧��40-50������
		nt_setTask(195, 1)
		Prise(saying,ItemText[3][3],ItemText[12][3],ItemText[9][3])

	elseif ( nt_getTask(1061) == 30 and GetBit(GetTask(194), 10) ~= 1 ) then 				--а��֧��50-60����һ
		nt_setTask(195, 1)
		Prise(saying,ItemText[4][3],ItemText[5][3],ItemText[9][3])

	elseif ( nt_getTask(1061) == 70 and GetBit(GetTask(194), 11) ~= 1 ) then 				--а��֧��50-60�����
		nt_setTask(195, 1)
		Prise(saying,ItemText[4][3],ItemText[5][3],ItemText[9][3])

	elseif ( nt_getTask(1061) == 120 and GetBit(GetTask(194), 12) ~= 1 ) then 				--а��֧��50-60������
		nt_setTask(195, 1)
		Prise(saying,ItemText[4][3],ItemText[5][3],ItemText[9][3])

	end
end


function get_golditem1(lel)		--����	
	if ((nt_getTask(1050) == 50 and GetBit(GetTask(192), 1) ~= 1) ==1 or (nt_getTask(1050) == 110 and GetBit(GetTask(192), 2) ~= 1) == 1 or (nt_getTask(1050) == 140 and GetBit(GetTask(192), 3) ~= 1) ==1) then			--�ж������ĸ��ȼ�����
			AddGoldItem(0, 184)
			Msg2Player("B�n nh�n ���c 1 b� Trang b� Ho�ng Kim")
			zhengpai_lel2()
	elseif((nt_getTask(1051) == 30 and GetBit(GetTask(192), 4) ~= 1) == 1 or (nt_getTask(1051) == 90 and GetBit(GetTask(192), 5) ~= 1) == 1 or (nt_getTask(1051) == 180 and GetBit(GetTask(192), 6) ~= 1) == 1) then	
			AddGoldItem(0, 178)
			Msg2Player("B�n nh�n ���c 1 b� Trang b� Ho�ng Kim")
			nt_setTask(195, 0)
			zhengpai_lel3()
	elseif((nt_getTask(1052) == 30 and GetBit(GetTask(192), 7) ~= 1) == 1 or (nt_getTask(1052) == 70 and GetBit(GetTask(192), 8) ~= 1) == 1 or (nt_getTask(1052) == 120 and GetBit(GetTask(192), 9) ~= 1) == 1) then
			local array4 = {181, 182, 183}
			local i= random(1, 3)
			AddGoldItem(0, array4[i])			--AddGoldItem(0,181or182or183)
			Msg2Player("B�n nh�n ���c 1 b� Trang b� Ho�ng Kim")		
			nt_setTask(195, 0)
			zhengpai_lel4()
	elseif((nt_getTask(1053) == 25 and GetBit(GetTask(192), 10) ~= 1) == 1 or (nt_getTask(1053) == 50 and GetBit(GetTask(192), 11) ~= 1) == 1 or (nt_getTask(1053) == 80 and GetBit(GetTask(192), 12) ~= 1) == 1) then
			local array5 = {179, 180, 185}
			local i = random(1, 3)
			AddGoldItem(0, array5[i])
			Msg2Player("B�n nh�n ���c 1 b� Trang b� Ho�ng Kim")
			nt_setTask(195, 0)
			zhengpai_lel5()
	else
		print("error:transfors parameter was wrong!!")
		Talk(1,"","Xin l�i! Kh�ng th� nh�n ���c ph�n th��ng! Xin h�y ph�n �nh v�i GM!!")
		return
	end
end


function get_golditem2(lel)		--����	
	if((nt_getTask(1054) == 30 and GetBit(GetTask(193), 1) ~= 1) == 1 or (nt_getTask(1054) == 100 and GetBit(GetTask(193), 2) ~= 1) == 1 or (nt_getTask(1054) == 150 and GetBit(GetTask(193), 3) ~= 1) == 1) then			--�ж������ĸ��ȼ�����
			AddGoldItem(0, 184)		
			Msg2Player("B�n nh�n ���c 1 b� Trang b� Ho�ng Kim")
			zhongli_lel2()
	elseif((nt_getTask(1055) == 50 and GetBit(GetTask(193), 4) ~= 1) == 1 or (nt_getTask(1055) == 90 and GetBit(GetTask(193), 5) ~= 1) == 1 or (nt_getTask(1055) == 140 and GetBit(GetTask(193), 6) ~= 1 ) == 1 ) then	
			AddGoldItem(0, 178)
			Msg2Player("B�n nh�n ���c 1 b� Trang b� Ho�ng Kim")		
			zhongli_lel3()
	elseif((nt_getTask(1056) == 25 and GetBit(GetTask(193), 7) ~= 1) == 1 or (nt_getTask(1056) == 50 and GetBit(GetTask(193), 8) ~= 1) == 1 or (nt_getTask(1056) == 80 and GetBit(GetTask(193), 9) ~= 1) == 1 ) then
			local array4 = {181, 182, 183}
			local i= random(1, 3)
			AddGoldItem(0, array4[i])			--AddGoldItem(0,181or182or183)
			Msg2Player("B�n nh�n ���c 1 b� Trang b� Ho�ng Kim")		
			zhongli_lel4()
	elseif((nt_getTask(1057) == 30 and GetBit(GetTask(193), 10) ~= 1) == 1 or (nt_getTask(1057) == 70 and GetBit(GetTask(193), 11) ~= 1) == 1 or (nt_getTask(1057) == 100 and GetBit(GetTask(193), 12) ~= 1) == 1 ) then
			local array5 = {179, 180, 185}
			local i = random(1, 3)
			AddGoldItem(0, array5[i])			--AddGoldItem(0,181or182or183)
			Msg2Player("B�n nh�n ���c 1 b� Trang b� Ho�ng Kim")		
			zhongli_lel5()
	else
		print("error:transfors parameter was wrong!!")
		Talk(1,"","Xin l�i! Kh�ng th� nh�n ���c ph�n th��ng! Xin h�y ph�n �nh v�i GM!!")
		return
	end
end


function get_golditem3(lel)		--а��	
	if((nt_getTask(1058) == 30 and GetBit(GetTask(194), 1) ~= 1) == 1 or (nt_getTask(1058) == 50 and GetBit(GetTask(194), 2) ~= 1) ==1  or (nt_getTask(1058) == 100 and GetBit(GetTask(194), 3) ~= 1) == 1) then			--�ж������ĸ��ȼ�����
			AddGoldItem(0, 184)
			Msg2Player("B�n nh�n ���c 1 b� Trang b� Ho�ng Kim")		
			xiepai_lel2()
	elseif((nt_getTask(1059) == 30 and GetBit(GetTask(194), 4) ~= 1) == 1 or (nt_getTask(1059) == 50 and GetBit(GetTask(194), 5) ~= 1) == 1 or (nt_getTask(1059) == 120 and GetBit(GetTask(194), 6) ~= 1) == 1) then	
			AddGoldItem(0, 178)
			Msg2Player("B�n nh�n ���c 1 b� Trang b� Ho�ng Kim")
			xiepai_lel3()
	elseif((nt_getTask(1060) == 50 and GetBit(GetTask(194), 7) ~= 1) == 1 or (nt_getTask(1060) == 90 and GetBit(GetTask(194), 8) ~= 1) == 1 or (nt_getTask(1060) == 120 and GetBit(GetTask(194), 9) ~= 1) == 1) then	
			local array4 = {181, 182, 183}
			local i= random(1, 3)
			AddGoldItem(0, array4[i])			--AddGoldItem(0,181or182or183)
			Msg2Player("B�n nh�n ���c 1 b� Trang b� Ho�ng Kim")
			xiepai_lel4()
	elseif((nt_getTask(1061) == 30 and GetBit(GetTask(194), 10) ~= 1) == 1 or (nt_getTask(1061) == 70 and GetBit(GetTask(194), 11) ~= 1) == 1 or (nt_getTask(1061) == 120 and GetBit(GetTask(194), 12) ~= 1) == 1) then
			local array5 = {179, 180, 185}
			local i = random(1, 3)
			AddGoldItem(0, array5[i])			
			Msg2Player("B�n nh�n ���c 1 b� Trang b� Ho�ng Kim")
			xiepai_lel5()
	else
		print("error:transfors parameter was wrong!!")
		Talk(1,"","Xin l�i! Kh�ng th� nh�n ���c ph�n th��ng! Xin h�y ph�n �nh v�i GM!!")
		return
	end
end

-- �ӽ�Ǯ
function get_qualityitem1(lel)		--����	
	if ((nt_getTask(1050) == 50 and GetBit(GetTask(192), 1) ~= 1) ==1 or (nt_getTask(1050) == 110 and GetBit(GetTask(192), 2) ~= 1) == 1 or (nt_getTask(1050) == 140 and GetBit(GetTask(192), 3) ~= 1) ==1) then			--�ж������ĸ��ȼ�����
			Earn(20000);
			zhengpai_lel2()
	elseif((nt_getTask(1053) == 25 and GetBit(GetTask(192), 10) ~= 1) == 1 or (nt_getTask(1053) == 50 and GetBit(GetTask(192), 11) ~= 1) == 1 or (nt_getTask(1053) == 80 and GetBit(GetTask(192), 12) ~= 1) == 1) then
			Earn(20000);
			zhengpai_lel5()
	else
		print("error:transfors parameter was wrong!!")
		Talk(1,"","Xin l�i! Kh�ng th� nh�n ���c ph�n th��ng! Xin h�y ph�n �nh v�i GM!!")
		return
	end
end


-- �ӽ�Ǯ
function get_qualityitem2(lel)		--����	
	if((nt_getTask(1054) == 30 and GetBit(GetTask(193), 1) ~= 1) == 1 or (nt_getTask(1054) == 100 and GetBit(GetTask(193), 2) ~= 1) == 1 or (nt_getTask(1054) == 150 and GetBit(GetTask(193), 3) ~= 1) == 1) then			--�ж������ĸ��ȼ�����
			Earn(20000);
			zhongli_lel2()
	elseif((nt_getTask(1057) == 30 and GetBit(GetTask(193), 10) ~= 1) == 1 or (nt_getTask(1057) == 70 and GetBit(GetTask(193), 11) ~= 1) == 1 or (nt_getTask(1057) == 100 and GetBit(GetTask(193), 12) ~= 1) == 1 ) then
			Earn(20000);
			zhongli_lel5()
	else
		print("error:transfors parameter was wrong!!")
		Talk(1,"","Xin l�i! Kh�ng th� nh�n ���c ph�n th��ng! Xin h�y ph�n �nh v�i GM!!")
		return
	end
end


-- �ӽ�Ǯ
function get_qualityitem3(lel)	
	if((nt_getTask(1058) == 30 and GetBit(GetTask(194), 1) ~= 1) == 1 or (nt_getTask(1058) == 50 and GetBit(GetTask(194), 2) ~= 1) == 1 or (nt_getTask(1058) == 100 and GetBit(GetTask(194), 3) ~= 1) == 1) then			--�ж������ĸ��ȼ�����
			Earn(20000);
			xiepai_lel2()
	elseif((nt_getTask(1061) == 30 and GetBit(GetTask(194), 10) ~= 1) == 1 or (nt_getTask(1061) == 70 and GetBit(GetTask(194), 11) ~= 1) == 1 or (nt_getTask(1061) == 120 and GetBit(GetTask(194), 12) ~= 1) == 1) then
			Earn(20000);
			xiepai_lel5()
	else
		print("error:transfors parameter was wrong!!")
		Talk(1,"","Xin l�i! Kh�ng th� nh�n ���c ph�n th��ng! Xin h�y ph�n �nh v�i GM!!")
		return
	end
end


-- ����
function get_oreitem1(lel)		--����	
	if ((nt_getTask(1050) == 50 and GetBit(GetTask(192), 1) ~= 1) ==1 or (nt_getTask(1050) == 110 and GetBit(GetTask(192), 2) ~= 1) == 1 or (nt_getTask(1050) == 140 and GetBit(GetTask(192), 3) ~= 1) ==1) then			--�ж������ĸ��ȼ�����
			AddOwnExp(20000);
			zhengpai_lel2()
	elseif((nt_getTask(1051) == 30 and GetBit(GetTask(192), 4) ~= 1) == 1 or (nt_getTask(1051) == 90 and GetBit(GetTask(192), 5) ~= 1) == 1 or (nt_getTask(1051) == 180 and GetBit(GetTask(192), 6) ~= 1) == 1) then		
			AddOwnExp(20000);
			zhengpai_lel3()
	elseif((nt_getTask(1052) == 30 and GetBit(GetTask(192), 7) ~= 1) == 1 or (nt_getTask(1052) == 70 and GetBit(GetTask(192), 8) ~= 1) == 1 or (nt_getTask(1052) == 120 and GetBit(GetTask(192), 9) ~= 1) == 1) then	
			AddOwnExp(20000);
			zhengpai_lel4()
	elseif((nt_getTask(1053) == 25 and GetBit(GetTask(192), 10) ~= 1) == 1 or (nt_getTask(1053) == 50 and GetBit(GetTask(192), 11) ~= 1) == 1 or (nt_getTask(1053) == 80 and GetBit(GetTask(192), 12) ~= 1) == 1) then
			AddOwnExp(20000);
			zhengpai_lel5()
	else
		print("error:transfors parameter was wrong!!")
		Talk(1,"","Xin l�i! Kh�ng th� nh�n ���c ph�n th��ng! Xin h�y ph�n �nh v�i GM!!")
		return
	end
end


-- ����
function get_oreitem2(lel)	
	if((nt_getTask(1054) == 30 and GetBit(GetTask(193), 1) ~= 1) == 1 or (nt_getTask(1054) == 100 and GetBit(GetTask(193), 2) ~= 1) == 1 or (nt_getTask(1054) == 150 and GetBit(GetTask(193), 3) ~= 1) == 1) then			--�ж������ĸ��ȼ�����
			AddOwnExp(20000);
			zhongli_lel2()
	elseif((nt_getTask(1055) == 50 and GetBit(GetTask(193), 4) ~= 1) == 1 or (nt_getTask(1055) == 90 and GetBit(GetTask(193), 5) ~= 1) == 1 or (nt_getTask(1055) == 140 and GetBit(GetTask(193), 6) ~= 1 ) == 1 ) then	
			AddOwnExp(20000);
			zhongli_lel3()
	elseif((nt_getTask(1056) == 25 and GetBit(GetTask(193), 7) ~= 1) == 1 or (nt_getTask(1056) == 50 and GetBit(GetTask(193), 8) ~= 1) == 1 or (nt_getTask(1056) == 80 and GetBit(GetTask(193), 9) ~= 1) == 1 ) then	
			AddOwnExp(20000);
			zhongli_lel4()
	elseif((nt_getTask(1057) == 30 and GetBit(GetTask(193), 10) ~= 1) == 1 or (nt_getTask(1057) == 70 and GetBit(GetTask(193), 11) ~= 1) == 1 or (nt_getTask(1057) == 100 and GetBit(GetTask(193), 12) ~= 1) == 1 ) then
			AddOwnExp(20000);
			zhongli_lel5()
	else
		print("error:transfors parameter was wrong!!")
		Talk(1,"","Xin l�i! Kh�ng th� nh�n ���c ph�n th��ng! Xin h�y ph�n �nh v�i GM!!")
		return
	end
end


-- ����
function get_oreitem3(lel)	
	if((nt_getTask(1058) == 30 and GetBit(GetTask(194), 1) ~= 1) == 1 or (nt_getTask(1058) == 50 and GetBit(GetTask(194), 2) ~= 1) == 1 or (nt_getTask(1058) == 100 and GetBit(GetTask(194), 3) ~= 1) == 1) then			--�ж������ĸ��ȼ�����
			AddOwnExp(20000);
			xiepai_lel2()
	elseif((nt_getTask(1059) == 30 and GetBit(GetTask(194), 4) ~= 1) == 1 or (nt_getTask(1059) == 50 and GetBit(GetTask(194), 5) ~= 1) == 1 or (nt_getTask(1059) == 120 and GetBit(GetTask(194), 6) ~= 1) == 1) then		
			AddOwnExp(20000);
			xiepai_lel3()
	elseif((nt_getTask(1060) == 50 and GetBit(GetTask(194), 7) ~= 1) == 1 or (nt_getTask(1060) == 90 and GetBit(GetTask(194), 8) ~= 1) == 1 or (nt_getTask(1060) == 120 and GetBit(GetTask(194), 9) ~= 1) == 1) then		
			AddOwnExp(20000);
			xiepai_lel4()
	elseif((nt_getTask(1061) == 30 and GetBit(GetTask(194), 10) ~= 1) == 1 or (nt_getTask(1061) == 70 and GetBit(GetTask(194), 11) ~= 1) == 1 or (nt_getTask(1061) == 120 and GetBit(GetTask(194), 12) ~= 1) == 1) then
			AddOwnExp(20000);
			xiepai_lel5()
	else
		print("error:transfors parameter was wrong!!")
		Talk(1,"","Xin l�i! Kh�ng th� nh�n ���c ph�n th��ng! Xin h�y ph�n �nh v�i GM!!")
		return
	end
end


function get_propitem1(lel)	
	if((nt_getTask(1051) == 30 and GetBit(GetTask(192), 4) ~= 1) == 1 or (nt_getTask(1051) == 90 and GetBit(GetTask(192), 5) ~= 1) == 1 or (nt_getTask(1051) == 180 and GetBit(GetTask(192), 6) ~= 1) == 1) then				--�ж������ĸ��ȼ�����
			AddItem(6, 1, 72, 1, 0, 0, 0)
			Msg2Player("B�n nh�n ���c 1 v�t ph�m")
			zhengpai_lel3()
	elseif((nt_getTask(1052) == 30 and GetBit(GetTask(192), 7) ~= 1) == 1 or (nt_getTask(1052) == 70 and GetBit(GetTask(192), 8) ~= 1) == 1 or (nt_getTask(1052) == 120 and GetBit(GetTask(192), 9) ~= 1) == 1) then
			AddItem(6, 1, 73, 1, 0, 0, 0)
			Msg2Player("B�n nh�n ���c 1 v�t ph�m")
			zhengpai_lel4()
	else
		print("error:transfors parameter was wrong!!")
		Talk(1,"","Xin l�i! Kh�ng th� nh�n ���c ph�n th��ng! Xin h�y ph�n �nh v�i GM!!")
		return
	end
end


function get_propitem2(lel)	
	if((nt_getTask(1055) == 50 and GetBit(GetTask(193), 4) ~= 1) == 1 or (nt_getTask(1055) == 90 and GetBit(GetTask(193), 5) ~= 1) == 1 or (nt_getTask(1055) == 140 and GetBit(GetTask(193), 6) ~= 1 ) == 1 ) then			--�ж������ĸ��ȼ�����
			AddItem(6, 1, 72, 1, 0, 0, 0)
			Msg2Player("B�n nh�n ���c 1 v�t ph�m")
			zhongli_lel3()
	elseif((nt_getTask(1056) == 25 and GetBit(GetTask(193), 7) ~= 1) == 1 or (nt_getTask(1056) == 50 and GetBit(GetTask(193), 8) ~= 1) == 1 or (nt_getTask(1056) == 80 and GetBit(GetTask(193), 9) ~= 1) == 1 ) then
			AddItem(6, 1, 73, 1, 0, 0, 0)
			Msg2Player("B�n nh�n ���c 1 v�t ph�m")
			zhongli_lel4()
	else
		print("error:transfors parameter was wrong!!")
		Talk(1,"","Xin l�i! Kh�ng th� nh�n ���c ph�n th��ng! Xin h�y ph�n �nh v�i GM!!")
		return
	end
end


function get_propitem3(lel)	
	if((nt_getTask(1059) == 30 and GetBit(GetTask(194), 4) ~= 1) == 1 or (nt_getTask(1059) == 50 and GetBit(GetTask(194), 5) ~= 1) == 1 or (nt_getTask(1059) == 120 and GetBit(GetTask(194), 6) ~= 1) == 1) then				--�ж������ĸ��ȼ�����
			AddItem(6, 1, 72, 1, 0, 0, 0)
			Msg2Player("B�n nh�n ���c 1 v�t ph�m")
			xiepai_lel3()
	elseif((nt_getTask(1060) == 50 and GetBit(GetTask(194), 7) ~= 1) == 1 or (nt_getTask(1060) == 90 and GetBit(GetTask(194), 8) ~= 1) == 1 or (nt_getTask(1060) == 120 and GetBit(GetTask(194), 9) ~= 1) == 1) then	
			AddItem(6, 1, 73, 1, 0, 0, 0)
			Msg2Player("B�n nh�n ���c 1 v�t ph�m")
			xiepai_lel4()
	else
		print("error:transfors parameter was wrong!!")
		Talk(1,"","Xin l�i! Kh�ng th� nh�n ���c ph�n th��ng! Xin h�y ph�n �nh v�i GM!!")
		return
	end
end

function zhengpai_lel2()
	if (nt_getTask(1050) == 50) then
		Uworld192 = nt_getTask(192)
		nt_setTask(192, SetBit(Uworld192, 1, 1))
		nt_setTask(1050, 60)
		Msg2Player("Nhi�m v� k�t th�c! Th� ra  ng��i n�y l� Si T�ng gi� d�ng! B�n h�y tr� v� t�m Ng�o V�n T�ng.")
		Msg2Player("B�n nh�n ���c 20.000 �i�m kinh nghi�m")
		for i=1,5 do
			DelItem(504)
		end
		AddOwnExp(20000)
	elseif (nt_getTask(1050) == 110) then
		Uworld192 = nt_getTask(192)
		nt_setTask(192, SetBit(Uworld192, 2, 1))
		nt_setTask(1050, 120)
		Msg2Player("T�m ���c S�m H�ng, nhi�m v� k�t th�c! S�m H�ng cho bi�t s�t th� n�m x�a th�ch s�t Nh�c T��ng Qu�n �ang � ngo�i th�nh.")				
		Msg2Player("B�n nh�n ���c 20.000 �i�m kinh nghi�m")
		AddOwnExp(20000)
	elseif (nt_getTask(1050) == 140) then
		Uworld192 = nt_getTask(192)
		nt_setTask(192, SetBit(Uworld192, 3, 1))
		nt_setTask(1050, 1000)
		Msg2Player("Nhi�m v� ho�n th�nh! B�n c� th� quay v� t�m Ng�o V�n T�ng �� nh�n ph�n th��ng c�a giai �o�n n�y!")
	end
end

function zhengpai_lel3()
	if (nt_getTask(1051) == 30) then
		Uworld192 = nt_getTask(192)
		nt_setTask(192, SetBit(Uworld192, 4, 1))
		nt_setTask(1051, 40)
		Msg2Player("Nhi�m v� k�t th�c, H� Lan Chi cho bi�t B�o Th�ch �� b�  b� � qu� nh�. B�n c� th� �i  t�m Ng� L�o Th�i �� nh�n m�t b� �o gi�p th�n k�!")
		Msg2Player("B�n nh�n ���c 1 b� trang b� m� bao nhi�u ng��i h�ng mong ��c!")
		Msg2Player("B�n nh�n ���c 50.000 �i�m kinh nghi�m")
		if ( GetSex() == 0 ) then
			AddGoldItem(0, 178); -- ����һ������·�
		else
			AddGoldItem(0, 178);
		end
		AddOwnExp(50000)
	elseif (nt_getTask(1051) == 90) then
		Uworld192 = nt_getTask(192)
		nt_setTask(192, SetBit(Uworld192, 5, 1))
		nt_setTask(1051, 100)
		Uworld1011 = nt_getTask(1011)
		nt_setTask(1011,0)
--		Msg2Player("��ɹ�������㹻���ǹǣ�������ɣ������ڸ�������ֵ�һ�Ÿ��ʱ�ʯ��������Ҳ���д��á������ȥ�����ҹ���ţ����ҩ���ˡ�")
--		AddItem(6,1,147,1,1,1)
	elseif (nt_getTask(1051) == 180) then
		Uworld192 = nt_getTask(192)
		nt_setTask(192, SetBit(Uworld192, 6, 1))
		nt_setTask(1051, 1000)
--		Msg2Player("����������񣬰����ڽ�����̫̫���͵ģ������һ�ſ�ʯ�͸����㡣�������㣬������õ��Ĵ������ף����ʱ�ʯ����������Կ�ʯ��ȥ�������������п��ܺϳ�һ���õ�װ����������ٴ������Ի�����ȡ�ý׶�����ȫ��ɵĴ��ˡ�")
--		Msg2Player("��õ�һ�ſ�ʯ")
		Msg2Player("B�n nh�n ���c 120.000 �i�m kinh nghi�m")
--		AddItem(6,1,149,1,0,0,0) --����һ��ʯ
		AddOwnExp(120000)
	end
end

function zhengpai_lel4()
	if (nt_getTask(1052) == 30) then
		Uworld192 = nt_getTask(192)
		nt_setTask(192, SetBit(Uworld192, 7, 1))
		nt_setTask(1052, 40)
		Uworld1011 = nt_getTask(1011) --����֧��ɱ�ֱ���������Ϊ0�����
		nt_setTask(1011,0)
		Msg2Player("Nhi�m v� ho�n th�nh! Ng�o V�n T�ng b�o b�n ��n D��ng Ch�u t�m H�n H�n. Th�ng qua y �� x�m nh�p v�o t� ch�c s�t th� L�m Uy�n Nhai t�m ra k� �� th�ch s�t Nh�c Nguy�n So�i n�m x�a.")
		Msg2Player("B�n nh�n ���c 100.000 �i�m kinh nghi�m")
		AddOwnExp(100000)
	elseif (nt_getTask(1052) == 70) then
		Uworld192 = nt_getTask(192)
		nt_setTask(192, SetBit(Uworld192, 8, 1))
		nt_setTask(1052, 80)
		Uworld1011 = nt_getTask(1011)
		nt_setTask(1011, 0) --ɱ�ֱ�����Ϊ0
		Msg2Player("Nhi�m v� ho�n th�nh! H�n H�n sai b�n �i gi�t Du T��ng T�n nh�ng b�n quy�t ��nh quay v� h�i Ng�o V�n T�ng tr��c.")
		Msg2Player("B�n nh�n ���c 100.000 �i�m kinh nghi�m")
		AddOwnExp(100000)
	elseif (nt_getTask(1052) == 120) then
		Uworld192 = nt_getTask(192)
		nt_setTask(192, SetBit(Uworld192, 9, 1))
		nt_setTask(1052, 1000)
		Msg2Player("Nhi�m v� ho�n th�nh! B�n c� th� quay v� t�m Ng�o V�n T�ng �� nh�n ph�n th��ng c�a giai �o�n n�y!")
	end
end

function zhengpai_lel5()
	if (nt_getTask(1053) == 25) then
		Uworld192 = nt_getTask(192)
		nt_setTask(192, SetBit(Uworld192, 10, 1))
		nt_setTask(1053, 27)
		Uworld1011 = nt_getTask(1011)
		nt_setTask(1011, 0)
		Msg2Player("Nhi�m v� ho�n th�nh! H�n H�n khen ng�i b�n! Nh�ng d��ng v�n c�n c� �i�u g� �� �n ch�a ph�a sau!")
		Msg2Player("B�n nh�n ���c 200.000 �i�m kinh nghi�m")
		AddOwnExp(200000)
	elseif (nt_getTask(1053) == 50) then
		Uworld192 = nt_getTask(192)
		nt_setTask(192, SetBit(Uworld192, 11, 1))
		nt_setTask(1053, 60)
		Msg2Player("Nhi�m v� ho�n th�nh! H�n H�n cu�i c�ng �� ti�t l�, c�m ��u th�ch s�t Nh�c Nguy�n So�i n�m x�a ch�nh l� T� T�c Phong. H�n �ang � b�n ngo�i th�nh L�m An.")
		Msg2Player("B�n nh�n ���c 200.000 �i�m kinh nghi�m")
		AddOwnExp(200000)
	elseif (nt_getTask(1053) == 80) then
		Uworld192 = nt_getTask(192)
		nt_setTask(192, SetBit(Uworld192, 12, 1))
		nt_setTask(1053, 1000)
		Msg2Player("Ng�o V�n T�ng e ng�i ph�a sau nh�t ��nh c� m�t t� ch�c ng�m thao t�ng. Xem ra h�n mu�n ��ch th�n �i th�m tra. B�n h�y ti�p t�c ��i tho�i v�i Ng�o V�n T�ng �� nh�n ph�n th��ng.")

	end
end

function zhongli_lel2()
	if (nt_getTask(1054) == 30) then
		Uworld193 = nt_getTask(193)
		nt_setTask(193, SetBit(Uworld193, 1, 1))
		nt_setTask(1054, 40)
		Uworld1012 = nt_getTask(1012)
		nt_setTask(1012, 0)
		Msg2Player("Nhi�m v� ho�n th�nh! Giang Nh�t Ti�u b�o b�n �i v�o th�nh t�m Th� Sinh L�c Thanh Thu, anh ta l� m�t ng��i r�t am hi�u v� binh kh� ")
		Msg2Player("B�n nh�n ���c 20.000 �i�m kinh nghi�m")
		AddOwnExp(20000)
	elseif(nt_getTask(1054) == 100) then
		Uworld193 = nt_getTask(193)
		nt_setTask(193, SetBit(Uworld193, 2, 1))
		nt_setTask(1054, 110) 
		Msg2Player("Nhi�m v� ho�n th�nh! �� C�n b� b�n ��nh b�i, h�n n�i s� x�a h�t m�n n� cho L�c Thanh Thu.")
		Msg2Player("B�n nh�n ���c 20.000 �i�m kinh nghi�m")
		AddOwnExp(20000)
	elseif(nt_getTask(1054) == 150) then
		Uworld193 = nt_getTask(193)
		nt_setTask(193, SetBit(Uworld193, 3, 1))
		nt_setTask(1054, 1000)
		Msg2Player("L�c Thanh Thu n�i, t� tin m�i l� v� kh� l�i h�i nh�t. Nhi�m v� ho�n th�nh. B�n quay v� g�p Li�u V�n Nam �� nh�n ph�n th��ng.")
		Msg2Player("B�n nh�n ���c 50.000 �i�m kinh nghi�m")
		AddOwnExp(50000)
	end
end

function zhongli_lel3()
	if (nt_getTask(1055) == 50) then
		Uworld193 = nt_getTask(193)
		nt_setTask(193, SetBit(Uworld193, 4, 1))
		nt_setTask(1055, 60)
		Msg2Player("Nhi�m v� ho�n th�nh! Tr�n b� gi�p n�y c� kh�c m�t c�y Tr��ng th��ng, ��y l� d�u �n c�a Th�nh �� L�nh Th��ng Ti�u c�c, b�n quy�t ��nh �i ��n �� m�t chuy�n.")
		Msg2Player("B�n nh�n ���c 1 b� trang b�!")
		Msg2Player("B�n nh�n ���c 50.000 �i�m kinh nghi�m")
		if ( GetSex() == 0 ) then
			AddGoldItem(0, 178); -- ����һ������·�
		else
			AddGoldItem(0, 178); -- ����һ������·�
		end
		AddOwnExp(50000)
	elseif (nt_getTask(1055) == 90) then
		Uworld193 = nt_getTask(193)
		nt_setTask(193, SetBit(Uworld193, 5, 1))
		nt_setTask(1055, 100)
		Uworld1012 = nt_getTask(1012)
		nt_setTask(1012, 0)
--		Msg2Player("��ǹ�ھ��������㲻Ҫ�Ժɻ����Ͼ�ɱ�������͸�����һ�Ÿ��ʱ�ʯ��")
--		Msg2Player("��õ�һ�Ÿ��ʱ�ʯ")
		Msg2Player("B�n nh�n ���c 50.000 �i�m kinh nghi�m")
--		AddItem(6, 1, 147, 1, 1, 1)
		AddOwnExp(50000)
	elseif (nt_getTask(1055) == 140) then
		Uworld193 = nt_getTask(193)
		nt_setTask(193, SetBit(Uworld193, 6, 1))
		nt_setTask(1055, 1000)
--		Msg2Player("������ɣ������Ƹ�����һ�����Կ�ʯ������������Կ�ʯ��ʲô�ô����Ǿ͵��Ժ�����������ʱ���ܵ��Խ����ˡ�")
--		Msg2Player("��õ�һ�����Կ�ʯ")
		Msg2Player("B�n nh�n ���c 120.000 �i�m kinh nghi�m")
--		AddItem(6,1,149,1,0,0,0)
		AddOwnExp(120000)
	end
end

function zhongli_lel4()
	if (nt_getTask(1056) == 25) then
		Uworld193 = nt_getTask(193)
		nt_setTask(193, SetBit(Uworld193, 7, 1))
		nt_setTask(1056, 27)
		Msg2Player("Nhi�m v� ho�n th�nh! Nh�ng Li�u V�n Nam t�a h� c�n c� ch�t do d�, d��ng nh� c�n c� �i�u g� ch�a n�i.")--����������ȥ���䳡��ʤһ����������������Ҫ���¼���������")
		Msg2Player("B�n nh�n ���c 100.000 �i�m kinh nghi�m")
		AddOwnExp(100000)
	elseif (nt_getTask(1056) == 50) then
		Uworld193 = nt_getTask(193)
		nt_setTask(193, SetBit(Uworld193, 8, 1))
		nt_setTask(1056, 60)
		Uworld1012 = nt_getTask(1012)
		nt_setTask(1012, 0)
		Msg2Player("Nhi�m v� ho�n th�nh! Li�u Nam V�n b�o b�n �i  t�m di�t Du T��ng T�n - k� �� t�ng nhi�u n�m v� ��ch v� tr��ng")
		Msg2Player("B�n nh�n ���c 100.000 �i�m kinh nghi�m")
		AddOwnExp(100000)
	elseif (nt_getTask(1056) == 80) then
		Uworld193 = nt_getTask(193)
		nt_setTask(193, SetBit(Uworld193, 9, 1))
		nt_setTask(1056, 1000)
		Msg2Player("Nhi�m v� ho�n th�nh! T� ch�c r�t h�i l�ng v�i b�n. B�n h�y quay l�i ��i tho�i v�i Li�u V�n Nam �� �� nh�n ph�n th��ng") 
		Msg2Player("B�n nh�n ���c 260.000 �i�m kinh nghi�m")
		AddOwnExp(260000)
	end
end

function zhongli_lel5()
	if (nt_getTask(1057) == 30) then
		Uworld193 = nt_getTask(193)
		nt_setTask(193, SetBit(Uworld193, 10, 1))
		nt_setTask(1057, 40)
		Uworld1012 = nt_getTask(1012)
		nt_setTask(1012, 0)
		Msg2Player("Nhi�m v� ho�n th�nh! B�n c� th� tr� l�i c�c v�n �� v� T�ng Kim")
		Msg2Player("B�n nh�n ���c 200.000 �i�m kinh nghi�m")
		AddOwnExp(200000)
	elseif (nt_getTask(1057) == 70) then
		Uworld193 = nt_getTask(193)
		nt_setTask(193, SetBit(Uworld193, 11, 1))
		nt_setTask(1057, 80)
		Msg2Player("Nhi�m v� ho�n th�nh! Li�u Nam V�n b�o v�i b�n m�t hung tin.")
		Msg2Player("B�n nh�n ���c 200.000 �i�m kinh nghi�m")
		AddOwnExp(200000)
	elseif (nt_getTask(1057) == 100) then
		Uworld193 = nt_getTask(193)
		nt_setTask(193, SetBit(Uworld193, 12, 1))
		nt_setTask(1057, 1000)
		Msg2Player("Nhi�m v� ho�n th�nh! Li�u Nam V�n vui m�ng r�i l�. B�n quay l�i ��i tho�i v�i Li�u V�n Nam �� �� nh�n ph�n th��ng")

	end
end

function xiepai_lel2()
	if (nt_getTask(1058) == 30) then
		Uworld194 = nt_getTask(194)
		nt_setTask(194, SetBit(Uworld194, 1, 1))
		nt_setTask(1058, 40)
		Uworld1013 = nt_getTask(1013)
		nt_setTask(1013, 0)
		Msg2Player("Nhi�m v� ho�n th�nh! Th�c B�t Ho�i Xuy�n b�o b�n �i Th�nh �� t�m t�n gian t� Tr�u Tr��ng C�u.")
		Msg2Player("B�n nh�n ���c 20.000 �i�m kinh nghi�m")
		AddOwnExp(20000)
	elseif (nt_getTask(1058) == 50) then
		Uworld194 = nt_getTask(194)
		nt_setTask(194, SetBit(Uworld194, 2, 1))
		nt_setTask(1058, 60)
		Msg2Player("Nhi�m v� ho�n th�nh! Tr�u Tr��ng C�u b�o b�n c�m v�i quy�n m�t t�ch �i D��ng Ch�u t�m Th�m Phong.")
		Msg2Player("B�n nh�n ���c 20.000 �i�m kinh nghi�m")
		AddOwnExp(20000)
	elseif (nt_getTask(1058) == 100) then
		Uworld194 = nt_getTask(194)
		nt_setTask(194, SetBit(Uworld194, 3, 1))
		nt_setTask(1058, 1000)
		Msg2Player("Nhi�m v� ho�n th�nh! B�n quay g�p Th�c B�t �� nh�n ph�n th��ng.")
		Msg2Player("B�n nh�n ���c 50.000 �i�m kinh nghi�m")
		AddOwnExp(50000)
	end
end
function xiepai_lel3()
	if (nt_getTask(1059) == 30) then
		Uworld194 = nt_getTask(194)
		nt_setTask(194, SetBit(Uworld194, 4, 1))
		nt_setTask(1059, 40) 
		Uworld1013 = nt_getTask(1013)
		nt_setTask(1013, 0)
		Msg2Player("Nhi�m v� ho�n th�nh! Th�c B�t  b�o b�n �i T��ng D��ng t�m L�u U�n C�, t�n gian t� c�a ��i Kim �ang l�n tr�n")
		Msg2Player("B�n nh�n ���c 50.000 �i�m kinh nghi�m")
		AddOwnExp(50000)
	elseif (nt_getTask(1059) == 50) then
		Uworld194 = nt_getTask(194)
		nt_setTask(194, SetBit(Uworld194, 5, 1))
		nt_setTask(1059, 60)
		Msg2Player("L�u U�n C� cho bi�t Thi Nghi Sinh th�t s� c� bi�u hi�n ph�n qu�c, b�n l�p t�c quay l�i b�o cho Th�c B�t Ho�i Xuy�n.")
		Msg2Player("B�n nh�n ���c 50.000 �i�m kinh nghi�m")
		AddOwnExp(50000)
	elseif (nt_getTask(1059) == 120) then
		Uworld194 = nt_getTask(194)
		nt_setTask(194, SetBit(Uworld194, 6, 1))
		nt_setTask(1059, 1000)
		Msg2Player("Nhi�m v� ho�n th�nh! B�n quay g�p Th�c B�t �� nh�n ph�n th��ng.")
		Msg2Player("B�n nh�n ���c 120.000 �i�m kinh nghi�m")
		AddOwnExp(120000)
	end
end

function xiepai_lel4()
if (nt_getTask(1060) == 50) then
		Uworld194 = nt_getTask(194)
		nt_setTask(194, SetBit(Uworld194, 7, 1))
		nt_setTask(1060, 60)
		Uworld1013 = nt_getTask(1013)
		nt_setTask(1013, 0)
		Msg2Player("Nhi�m v� ho�n th�nh! L�u U�n C�  b�o b�n tr� v� b�o t��ng t�n v�i Th�c B�t  v� t�nh h�nh thi ��u.")
		Msg2Player("B�n nh�n ���c 100.000 �i�m kinh nghi�m")
		AddOwnExp(100000)
	elseif (nt_getTask(1060) == 90) then
		Uworld194 = nt_getTask(194)
		nt_setTask(194, SetBit(Uworld194, 8, 1))
		nt_setTask(1060, 100)
		Uworld1013 = nt_getTask(1013)
		nt_setTask(1013, 0)
		Msg2Player("Nhi�m v� ho�n th�nh! Th�c B�t  b�o b�n �i T��ng D��ng �m s�t ��i ph� h� Nguy�n Minh Vi�n.")
		Msg2Player("B�n nh�n ���c 100.000 �i�m kinh nghi�m")
		AddOwnExp(100000)
	elseif (nt_getTask(1060) == 120) then
		Uworld194 = nt_getTask(194)
		nt_setTask(194, SetBit(Uworld194, 9, 1))
		nt_setTask(1060, 1000)
		Msg2Player("Nhi�m v� ho�n th�nh! B�n quay g�p Th�c B�t �� nh�n ph�n th��ng.")
		Msg2Player("B�n nh�n ���c 260.000 �i�m kinh nghi�m")
		AddOwnExp(260000)
	end
end

function xiepai_lel5()
	if (nt_getTask(1061) == 30) then
		Uworld194 = nt_getTask(194)
		nt_setTask(194, SetBit(Uworld194, 10, 1))
		nt_setTask(1061, 40)
		Uworld1013 = nt_getTask(1013)
		nt_setTask(1013, 0)
		Msg2Player("Nhi�m v� ho�n th�nh! Th�c B�t  h�t m�c t�n th��ng b�n v� cho bi�t Ho�ng th��ng chu�n b� tri�u ki�n b�n. B�n c�n chu�n b� v�i ki�n th�c v� qu�n s�!")
		Msg2Player("B�n nh�n ���c 200.000 �i�m kinh nghi�m")
		AddOwnExp(200000)
	elseif (nt_getTask(1061) == 70) then
		Uworld194 = nt_getTask(194)
		nt_setTask(194, SetBit(Uworld194, 11, 1))
		nt_setTask(1061, 80)
		Msg2Player("Nhi�m v� ho�n th�nh! Th�c B�t  r�t vui nh�ng h�nh nh� y �ang c� v�n �� g� kh� n�i.")
		Msg2Player("B�n nh�n ���c 200.000 �i�m kinh nghi�m")
		AddOwnExp(200000)
	elseif (nt_getTask(1061) == 120) then
		Uworld194 = nt_getTask(194)
		nt_setTask(194, SetBit(Uworld194, 12, 1))
		nt_setTask(1061, 1000)
		Msg2Player("Nhi�m v� ho�n th�nh! B�n quay g�p Th�c B�t �� nh�n ph�n th��ng.")

	end
end