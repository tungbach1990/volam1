-------------------------------------------------------------------------------------------------------------------------------------------
-- FileName		:	messenger_prize.lua                            ----O--------O----
-- Author		:	xiaoyang										       ^
-- CreateTime	:	2005-04-21 10:31:14								   ----------
-- Desc			:   �ؿ�����Ľ����ű�
------------------------------------------��ע�⣺��û��Ū�����ָ��ĵ��÷�ʽǰ���мǲ�Ҫʹ�ã�����ѯ�������Ա��лл-------------------------

Include("\\script\\task\\newtask\\newtask_head.lua")
IncludeLib( "FILESYS" );
TabFile_Load( "\\settings\\task\\tollgate\\messenger\\tollgate_allprize.txt" , "Tollgateprize");	 --��ý�����

	prizeary ={}
	for i=2,TabFile_GetRowCount("Tollgateprize") do
		val = tonumber(TabFile_GetCell("Tollgateprize", i , "prize_item" ))
		if( prizeary[val] == nil ) then
			prizeary[val] = {};
		end
		valcount = getn(prizeary[val]);
		prizeary[val][valcount+1] = i;
	end

--������һ���������񣬷ֱ��Ӧprize_level������ȼ�1��2��3��4��5��
--x                ��ý�Ʒ�����еĳ���
--y	               ��ý�Ʒ�����еı�����
--prize_itemindex  ��ý�����Ʒ������1Ϊһ�㽱����2Ϊ����װ����3Ϊ������ʯ��4ΪС�ƽ�װ����5Ϊ��ƽ�װ����6Ϊ���������
--prize_adventive  ��ý�����Ʒ��żȻ���أ���0-100��0Ϊû��żȻ��

function messenger_giveprize(x,y,prize_itemindex,prize_adventive)

--����������㣬�õ������������ͽ����������飬������������бȽϣ����漴�������з��Ͻ�������Ҫ��ģ���ô���Ž���������1
	local prize_number ={}
	local prize_right = {}
	for	  i = 1,x do
		 prize_number[i] = random(1,y)          
		 prize_right[i] = random(1,y)		   --�����ṩ��x��y�ļ��ʣ�������x=4,y=10000,��ô����Ϊ4%����ô��10000��Χ�����4������
	end
	
	for i = 1,x do 
		for j = 1,x do 
			if  (prize_number[i] == prize_right[j]) then
				prize_yes=1
			end
		end
	end
	
--����żȻ����
	if ( prize_adventive ~= 0 ) then 
		for i=1,prize_adventive do
			prize_denger[i] = random(1,100)
		end
		for i=1,prize_adventive do
			if ( prize_denger[i] == prize_adventive ) then
				prize_itemindex = 6
			end
		end
	end
	
	local prize_givepeople = messenger_group() --�ж�����Ƿ����,�������򷵻ضӳ���index
	local prize_mapx,prize_mapy,prize_mapid = GetPos() --��õ�ǰ�������λ��
	local prize_yes = 0                        --�ж�����Ƿ����ʸ����ѡ���
		
--���Ž���
	if ( prizeary[prize_itemindex] == nil ) then
	    return
	end
	
	prize_givenumber = random(getn(prizeary[prize_itemindex]))
	prize_givefinish = prizeary[prize_itemindex][prize_givenumber]
	prize_numberone = tonumber( TabFile_GetCell( "Tollgateprize" ,prize_givefinish , 3 ))
	prize_numbertwo = tonumber( TabFile_GetCell( "Tollgateprize" ,prize_givefinish , 4 ))
	prize_numberthree = tonumber( TabFile_GetCell( "Tollgateprize" ,prize_givefinish , 5 ))
	prize_numberfour = tonumber( TabFile_GetCell( "Tollgateprize" ,prize_givefinish , 6 ))
	prize_numberfive = tonumber( TabFile_GetCell( "Tollgateprize" ,prize_givefinish , 7 ))
	prize_numbersix = tonumber( TabFile_GetCell( "Tollgateprize" ,prize_givefinish , 8 ))
	prize_numberseven = tonumber( TabFile_GetCell( "Tollgateprize" ,prize_givefinish , 9 ))
		
	if ( tonumber( TabFile_GetCell( "Tollgateprize" ,prize_givefinish , "prize_Quality" )) == 1 ) then
		DropItemEx(prize_mapid,prize_mapx,prize_mapy,prize_givepeople,4,0,1,0,prize_numberone,0,0,0,0,0)	
	else 
		DropItem(prize_mapid,prize_mapx,prize_mapy,prize_givepeople,prize_numberone,prize_numbertwo,prize_numberthree,prize_numberfour,prize_numberfive,prize_numbersix,prize_numberseven) 
	end	
	
	
end

function messenger_group()
	local nOldPlayerIndex = PlayerIndex
	local nPreservedPlayerIndex = PlayerIndex
	local nMemCount = GetTeamSize()
	local myMemberTask
	local myChangeMember = 0
	
	if (nMemCount == 0 ) then
		return nPreservedPlayerIndex
		
	else
		for i = 1, nMemCount do
			PlayerIndex = GetTeamMember(i)
			if ( IsCaptain() == 1) then
				nPreservedPlayerIndex = PlayerIndex;
				PlayerIndex = nOldPlayerIndex;
				return nPreservedPlayerIndex
				
			end
		end
		PlayerIndex = nOldPlayerIndex;
		return 0;
	end
end



