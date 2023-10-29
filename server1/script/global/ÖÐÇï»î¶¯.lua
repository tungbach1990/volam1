-- Const List
aryAwardTime = { 1900, 2400, 928 }									--�콱ʱ��� ( { ��ʼʱ�䣬 ����ʱ�� } ʱ���ʽΪHHMM )
aryAwardItem = {{ "�𻨾�",   {6,1,125,1,0,0,0} },	--��Ʒ����
				{ "���丣����Բ��", {6,1,126,1,0,0,0} }}
		
MingZi=50											--���ֺϳɼ���
QiuZi=30
GeZi=30
YingZi=80
JuZi=10
WangZi=80
YuanZi=10

-- Talking String
STR_Do_Nothing		 = "��ֻ�������/do_nothing"
STR_Next_Page		 = "��һҳ"
STR_OK			 	 = "��֪���ˣ�лл��"
STR_Main			 = { "��٣����Ǹ������������٣�һ���е��ش�����Ҷ��������﷢�͡������һ������ɷ�������Ʒ��������Ҫ��ȡ������",
						 "��������ڵ�����",
		 				 "����������������",
		 				 "����һ���μӲ����ջ",
		 				 "���������μӺϳɵ���",		--5
		 				 "���������μӼ�ʫ���콱Ʒ",
		 				 "�����ģ���ȡ������Ʒ",
		 				 "��ֻ�������",
		 				 "��ȡ������Ʒ",
		 				 "�������������������˽�ָ��ʮȫ����" }		--10
STR_About_MA		 = { "    ��˵������������϶���Ϊ�Ͳ�ס�˼��į���ڰ���ʮ�����죬͵������ĸ�������ҩ���������ɡ��Ӵ���������飬ҹҹ�غ��¹�������ҹҹ�Կռ��£���˼������������Բ���������������˰���ʮ�����¼��µķ��ס�",
						 "    Ҳ��˵��ũ������ʮ����һ��ǡ���ǵ��ӳ����ʱ�̣����Ҷ����������������ﱨ�����ס�ÿ����һ�죬�Ҽһ��������ž���һ�������¡����±��������ա����¸߹ң���Ʈ�㣬����Ҳ���������;�������������е�˼��֮�顣",
						 "    ÿ����һ�죬�Ҽһ��������ž���һ�������£����±��������ա����¸߹ң���Ʈ�㣬����Ҳ���������;�������������е�˼��֮�顣",
						 "���Ѿ�֪����" }
STR_About_Rules		 = { "    �����ϲ����������������ҲΪ�����׼�����ľ����׷���Ľ��ջ������<color=red>������<color>��<color=red>��ʫ��<color>��<color=red>Ʒ�±�<color>��<color=red>������<color>����",
						 "������", 
						 "��ʫ��",
						 "Ʒ�±�", 
						 "������",						--5
						 "���Ѿ�������",
						 "    ���������һ����ף������죬������е���ٶԻ�ѡ�������Ϸ����ÿ�ν���<color=red>һǧ��<color>���Ϳ��Կ�ʼ������Ϸ��Ҫ��<color=red>������������Ŀ<color>�Ϳ���������һ��<color=red>���ⵥ��<color>��������������ͨ���ֺϳɳ�<color=red>��һ������ͨ����<color>���Լ��ڲμӼ�ʫ�ʻ�л�ȡ��Ʒ��",
						 "    ���������һ����ף������죬�ڻ�ڼ䣬��ҿ�������ٴ���һЩ������ʫ������ȡ��ͬ�Ľ�Ʒ��������;������õ��֣�<color=red>���<color>��<color=red>�����ͨ����<color>����<color=red>������<color>��<color=red>������ⵥ��<color>����<color=red>�ϳɵ���<color>��<color=red>������ͨ����<color>������ȡÿ�ֽ�Ʒ����Ҫƥ��һ����ͨ����һ�������֡�",
						 "    ���������һ����ף������죬��<color=red>���¶�ʮ��������<color>����� <color=red>19:00~24:00<color> ʱ���������������Ҷ����Ե���ٴ������ȡһ�ν�����Ʒ��<color=red>���丣����Բ��<color>��<color=red>�𻨾�<color>������Լ����Ʒ�±������¡�",
						 "    ���������һ����ף������죬�ڻ�ڼ䣬<color=red>��ɽ<color>��<color=red>���ɽ<color>��<color=red>����ɽ<color>�����羰����Ҷ��ܿ����¾���������������졢�������",
						 "���������˵��" }	--11
STR_Gift			 = { "    �Բ�������û�г俨�����ȳ俨��",
						 "    �Բ������ھ��¶�ʮ������������� 19:00~24:00 ���ʱ������ȡ��Ʒ��",
						 "    �Բ������ĵȼ�������ʮ����",
						 "    �Բ������Ѿ���ȡ����Ʒ�ˡ�",
						 "�������һ��" }
STR_Guess			 = { "    �Բ��������ˣ������ǲ������ڼ�������",
						 "�Բ����������㣡��Ҫ",
						 "�����ӡ�",
						 "    ǰ��������û�£�д�˼�����գ�������Ҫ��Ҫ����һ�£�ֻҪ<color=red>һǧ������<color>����<color=red>�����������<color>���Ҿ͸���һ��<color=red>���ⵥ��<color>��",
						 "����������",						--5
						 "����μ������",
						 "����Ŀ��",
						 "��ֻ����ôһ����������ģ��ٽ������ɣ�",
						 "���õ�һ���֣�",
						 "������",							--10
						 "    ��Ȼ����ʫ�飬�Ϸ��壬��������ŵ�Ľ�Ʒ������һ��<color=red>���ⵥ��<color>�������˻�Ҫ��Ҫ���Ϸ��ٿ�������",
						 "    ��ֻ����ôһ����������ģ��ٽ������ɣ���Ҫ��Ҫ�����Ϸ򿼿�����" }
STR_Reward_Note		 = { "    ��������һЩ���Ƶ�ʫ�䣬��������ϸպ������<color=red>ȱʧ�ĵ���<color>���Ҿ��͸���һ����Ʒ��",
						 "    ��Ȼ��Ӣ�۳����갡��",
						 "��ϲ�������õ� ",
						 "    ���콱Ʒ<color=red>",
						 "<color>��Ҫ�����",
						 "�����ʫ����û������Ҫ�����أ�",
						 "��ֻ�������",
						 "���ߴ��һ������Ϣ����˵�еĹ���ܽ���Ѿ��������ȡ�ˣ���Ҽ���Ŭ������",
						 "���ߴ��һ������Ϣ����˵�еķ��¹����Ѿ��������ȡ�ˣ���Ҽ���Ŭ������",
						 "���ߴ��һ������Ϣ����˵�еĶ�������ƽ�װ���Ѿ��������ȡ�ˣ���Ҽ���Ŭ������",
						 "��Ҫ��ȡ������Ʒ",
						 "����μ������" }
STR_Reward_Poem		 = { "��__��ʱ�У���__������ ",
						 "������__�£����Ĺ���__ ",
						 "__������������__¶մʪ ",
						 "��__���ǻ�����__Ӱ���� ",
						 "����Ū��__������__�˼� ",
						 "__�������£���Ӱ����__ ",
						 "��ͷ__���£���ͷ__���� ",
						 "��__�˳��ã�ǧ�ﹲ�__ " }
STR_Reward_Reward	 = { "���̻�+2��PKҩ�裩",
						 "�����꼪�����",
						 "���ɲ�¶��",
						 "�����丣����Բ����",
						 "���𻨾ƣ�",
						 "������ܽ�أ�",
						 "�����¹��أ�",
						 "����������ƽ�װ������һ����" }
STR_Reward_Func		 = { "/yes1",
						 "/yes2",
						 "/yes3",
						 "/yes4",
						 "/yes5",
						 "/yes6",
						 "/yes7",
						 "/yes8" }
STR_Combin_Note		 = { "    ����ж���ĵͼ��֣������õ������������������<color=red>һ�鵥��<color>��ͬ����<color=red>һ�������ֺ�һ����ͨ��<color>����<color=red>һǧ��������<color>���һ��������Դ����������ȡ��һ���ĵ��֣����ʧ�ܽ����˻����������֣���Ȼ��������ÿ�κϳɵ�<color=red>һǧ��������<color>��",
						 "    �ϳ�����Ҫ<color=red>һǧ��������<color=red>������Ǯ���񲻹��������´������ɡ�",
						 "���Ե�Ƭ�̡�",
						 "���õ����� ",
						 "    ʧ���ˣ���<color=red>",
						 "<color>����Ҳ������ô�úϳɵ��ģ��´��������������ɡ�",
						 "    ��ϳɡ�<color=red>",
						 "<color>������Ҫ<color=red>",
						 "<color>����û������Ҫ�����أ��ǲ��������ˣ��Ͽ��ȥ���������ɡ�",
						 "��ֻ�������/do_nothing",		--10
						 "��Ҫ�ϳ���������",
						 "����μ������" }
STR_Combin_Word		 = { "��",
						 "��",
						 "��",
						 "Ӱ",
						 "��",
						 "��",
						 "Ը" }
STR_Combin_Request	 = { "����+�ƣ�",
						 "����+ʱ��",
						 "����+�ʣ�",
						 "����+�裩",
						 "��Ӱ+�ڣ�",
						 "����+�ˣ�",
						 "����+˼��" }
STR_Combin_Func		 = { "/Combin1",
						 "/Combin2",
						 "/Combin3",
						 "/Combin4",
						 "/Combin5",
						 "/Combin6",
						 "/Combin7" }						
						
		 
-- Start of Proc
--function main()
--	Say(STR_Main[1], 9, 
--		STR_Main[2].."/about_mid_autumn",
--		STR_Main[3].."/about_game_rules",
--		STR_Main[4].."/guess_at_riddle",
--		STR_Main[5].."/Combination",
--		STR_Main[6].."/GetReward",
--		STR_Main[7].."/take_gift",
--		STR_Main[9].."/onGift",
--		STR_Main[10].."/lg_onRingGift",
--		STR_Main[8].."/do_nothing" )
--end

-- ------------------------------------------------------------------------------------------------
-- ------------------------------------------ ���˵� ----------------------------------------------
-- ------------------------------------------------------------------------------------------------
function on_mid_autumn()
	Say( 
		STR_Main[1],
		5,
--		STR_Main[2].."/about_mid_autumn",
		STR_Main[3].."/about_game_rules",
		STR_Main[4].."/guess_at_riddle",
		STR_Main[5].."/Combination",
		STR_Main[6].."/GetReward",
--		STR_Main[7].."/take_gift",
		STR_Main[8].."/do_nothing"
		);
end

-- ------------------------------------------------------------------------------------------------
-- ------------------------------------------ �������� --------------------------------------------
-- ------------------------------------------------------------------------------------------------
function about_mid_autumn()
	Say(STR_About_MA[1], 1,
		STR_Next_Page.."/about_mid_autumn_b" )
end
function about_mid_autumn_b()
	Say(STR_About_MA[2], 1,
		STR_About_MA[4].."/main" )
end

-- ------------------------------------------------------------------------------------------------
-- ------------------------------------------ ��Ϸ˵�� --------------------------------------------
-- ------------------------------------------------------------------------------------------------
function about_game_rules()
	Say(STR_About_Rules[1], 5,
		STR_About_Rules[2].."/rule_a",
		STR_About_Rules[3].."/rule_b",
		STR_About_Rules[4].."/rule_c",
		STR_About_Rules[5].."/rule_d",
		STR_About_Rules[6].."/main" )
end

function rule_a()
	Say(STR_About_Rules[7], 1,
		STR_About_Rules[11].."/about_game_rules" )
end

function rule_b()
	Say(STR_About_Rules[8], 1,
		STR_About_Rules[11].."/about_game_rules" )
end

function rule_c()
	Say(STR_About_Rules[9], 1,
		STR_About_Rules[11].."/about_game_rules" )
end

function rule_d()
	Say(STR_About_Rules[10], 1,
		STR_About_Rules[11].."/about_game_rules" )
end

-- ------------------------------------------------------------------------------------------------
-- ------------------------------------------ ��ȡ��Ʒ --------------------------------------------
-- ------------------------------------------------------------------------------------------------
function take_gift()					--��������( -1:δ�俨  -2:��ǰ�����콱ʱ��  -3���ȼ�����50  -4:������� )
	local nCurrTime = tonumber(date("%H%M"))
	local nCurrData = tonumber(date("%m%d"))

	if( IsCharged() ~= 1 ) then						--�Ƿ�����
		Say(STR_Gift[1], 1,
			STR_OK.."/main" )
		return -1
	end
	if not ((nCurrTime >= aryAwardTime[1]) and (nCurrTime <= aryAwardTime[2]) and (nCurrData == aryAwardTime[3])) then					--�Ƿ����콱ʱ��
		Say(STR_Gift[2], 1,
			STR_OK.."/main" )
		return -2
	end	
	if (GetLevel() < 50) then						--�ȼ��Ƿ����50
		Say(STR_Gift[3], 1,
			STR_OK.."/main" )
		return -3
	end
	
	if (GetTask(702) == 5) then						--�Ƿ��������
		Say(STR_Gift[4], 1,
			STR_OK.."/main" )
		return -4
	else
        AddItem( aryAwardItem[1][2][1], aryAwardItem[1][2][2], aryAwardItem[1][2][3], aryAwardItem[1][2][4], aryAwardItem[1][2][5], aryAwardItem[1][2][6] , aryAwardItem[1][2][7])
        Msg2Player( STR_Gift[5]..aryAwardItem[1][1] )
        AddItem( aryAwardItem[2][2][1], aryAwardItem[2][2][2], aryAwardItem[2][2][3], aryAwardItem[2][2][4], aryAwardItem[2][2][5], aryAwardItem[2][2][6] , aryAwardItem[2][2][7])
        Msg2Player( STR_Gift[5]..aryAwardItem[2][1] )
		SetTask(702, 5)
	end	
	
end

function IsCharged()					--�ж�����Ƿ�����
	if( GetExtPoint( 0 ) >= 1 ) then
		return 1
	else
		return 0
	end
end

-- ------------------------------------------------------------------------------------------------
-- ------------------------------------------ ���i���� --------------------------------------------
-- ------------------------------------------------------------------------------------------------
function guess_at_riddle()
	local mpay		 = 1000		--��Ҫ֧���Ľ��X����

	Say(STR_Guess[4], 2,
		STR_Guess[5].."/get_question",
		STR_Guess[6].."/main" )	
end
function get_question()
	local mpay		 = 1000		--��Ҫ֧���Ľ��X����
	
	if ( GetCash() >= mpay ) then
		SetTaskTemp(250, 0)		--���õ�ǰ��ĿΪ�� 0 ��
		SetTaskTemp(251, 0)		--���õ�ǰ��Ϊ�� 0
		Pay(mpay)
		gquestion()
	else
		Say(STR_Guess[1], 1,
			STR_OK.."/main" )
		Msg2Player(STR_Guess[2]..mpay..STR_Guess[3])
	end
end


-- �����������Ŀ
function gquestion()
	local qid_min		 = 2001						--�����ʼID
	local qid_max		 = 2220						--������ID
	local qid			 = random(qid_min, qid_max)	--ȷ��һ����ĿID	
	local question		 = GetQuestion(qid)			--ȡ����
	local qchoose		 = {GetChoose(qid , 1),		--ȡ��ѡ�� A
							GetChoose(qid , 2),		--ȡ��ѡ�� B
							GetChoose(qid , 3),		--ȡ��ѡ�� C
							GetChoose(qid , 4)}		--ȡ��ѡ�� D
	local qrextemp		 = 0						--��������ʱ�����±�
	local qchoosetemp	 = "_"						--��������ʱ����
	local qanswer		 = GetQAnswer(qid)			--ȡ��(�𰸱��)
    local gttc			 = GetTaskTemp(250) + 1
    local inttemp		 = {1,2,3,4}
	SetTaskTemp(250, gttc)							--���ڽ��е���Ŀ�ִ�
	SetTaskTemp(251, 0)

	qrextemp = random(1, 3)
	qchoosetemp = qchoose[4]
	qchoose[4] = qchoose[qrextemp]
	qchoose[qrextemp] = qchoosetemp
	if (qrextemp == qanswer) then
		qanswer = 4
	elseif (qanswer == 4) then
		qanswer = qrextemp
	end
	
	qrextemp = random(1, 2)
	qchoosetemp = qchoose[3]
	qchoose[3] = qchoose[qrextemp]
	qchoose[qrextemp] = qchoosetemp
	if (qrextemp == qanswer) then
		qanswer = 3
	elseif (qanswer == 3) then
		qanswer = qrextemp
	end
	
	qrextemp = 1
	qchoosetemp = qchoose[2]
	qchoose[2] = qchoose[qrextemp]
	qchoose[qrextemp] = qchoosetemp
	if (qrextemp == qanswer) then
		qanswer = 2
	elseif (qanswer == 2) then
		qanswer = qrextemp
	end

	SetTaskTemp(251, qanswer)						--ӛ䛮�ǰ���}��
	Say(question, 4, 
		qchoose[1].."/answerproc_a",
		qchoose[2].."/answerproc_b",
		qchoose[3].."/answerproc_c",
		qchoose[4].."/answerproc_d" )
end
	
function answerproc_a()					--ѡ��� A
	if (GetTaskTemp(251) == 1) then		--�Ƿ�����ȷ��
		if (GetTaskTemp(250) >= 5) then
			add_random_special_word()
		else
			gquestion()
		end
	else
		Msg2Player(STR_Guess[8])
		--guess_at_riddle()
		Say(STR_Guess[12], 2,
			STR_Guess[5].."/get_question",
			STR_Guess[6].."/main" )
	end
end	
function answerproc_b()					--ѡ��� B
	if (GetTaskTemp(251) == 2) then		--�Ƿ�����ȷ��
		if (GetTaskTemp(250) >= 5) then
			add_random_special_word()
		else
			gquestion()
		end
	else
		Msg2Player(STR_Guess[8])
		--guess_at_riddle()
		Say(STR_Guess[12], 2,
			STR_Guess[5].."/get_question",
			STR_Guess[6].."/main" )
	end
end	
function answerproc_c()					--ѡ��� C
	if (GetTaskTemp(251) == 3) then		--�Ƿ�����ȷ��
		if (GetTaskTemp(250) >= 5) then
			add_random_special_word()
		else
			gquestion()
		end
	else
		Msg2Player(STR_Guess[8])
		--guess_at_riddle()
		Say(STR_Guess[12], 2,
			STR_Guess[5].."/get_question",
			STR_Guess[6].."/main" )
	end
end	
function answerproc_d()					--ѡ��� D
	if (GetTaskTemp(251) == 4) then		--�Ƿ�����ȷ��
		if (GetTaskTemp(250) >= 5) then
			add_random_special_word()
		else
			gquestion()
		end
	else
		Msg2Player(STR_Guess[8])
		--guess_at_riddle()
		Say(STR_Guess[12], 2,
			STR_Guess[5].."/get_question",
			STR_Guess[6].."/main" )
	end
end	

function qfail()				--�ش����
end
-- ��Ŀ����

function add_random_special_word()
	local qitem		 	 = {426,427,428,429,430,431,432,433}				--ӛ��п��ܵĪ������(����ƥ��)
	local qitem_rate	 = {763,863,913,963,983,993,998,1000}				--ӛ��п��ܵĪ�����߳��F�C��
						--  763 100  50  50  20  10   5    2
	local accuracy		 = 1000						--�S�C������
	local drop_rate		 = random(1, accuracy)		--�_����Ʒ��͵�һ���S�C��
		
	if ( drop_rate <= qitem_rate[1] ) then
		AddItem(4,qitem[1],1,1,0,0,0)
	elseif ( drop_rate <=  qitem_rate[2] ) then
		AddItem(4,qitem[2],1,1,0,0,0)
	elseif ( drop_rate <=  qitem_rate[3] ) then
		AddItem(4,qitem[3],1,1,0,0,0)
	elseif ( drop_rate <=  qitem_rate[4] ) then
		AddItem(4,qitem[4],1,1,0,0,0)
	elseif ( drop_rate <=  qitem_rate[5] ) then
		AddItem(4,qitem[5],1,1,0,0,0)
	elseif ( drop_rate <=  qitem_rate[6] ) then
		AddItem(4,qitem[6],1,1,0,0,0)
	elseif ( drop_rate <=  qitem_rate[7] ) then
		AddItem(4,qitem[7],1,1,0,0,0)
	elseif ( drop_rate <= accuracy ) then
		AddItem(4,qitem[8],1,1,0,0,0)
	end
	Msg2Player(STR_Guess[9])
--	guess_at_riddle()
	Say(STR_Guess[11], 2,
		STR_Guess[5].."/get_question",
		STR_Guess[6].."/main" )
end

-- ------------------------------------------------------------------------------------------------
-- ------------------------------------------ ��ʫ�콱Ʒ���� --------------------------------------
-- ------------------------------------------------------------------------------------------------
function GetReward()
	Say(STR_Reward_Note[1],9,
		STR_Reward_Poem[1]..STR_Reward_Reward[1]..STR_Reward_Func[1],
		STR_Reward_Poem[2]..STR_Reward_Reward[2]..STR_Reward_Func[2],
		STR_Reward_Poem[3]..STR_Reward_Reward[3]..STR_Reward_Func[3],
		STR_Reward_Poem[4]..STR_Reward_Reward[4]..STR_Reward_Func[4],
		STR_Reward_Poem[5]..STR_Reward_Reward[5]..STR_Reward_Func[5],
		STR_Reward_Poem[6]..STR_Reward_Reward[6]..STR_Reward_Func[6],
		STR_Reward_Poem[7]..STR_Reward_Reward[7]..STR_Reward_Func[7],
		STR_Reward_Poem[8]..STR_Reward_Reward[8]..STR_Reward_Func[8],
		STR_Reward_Note[7].."/main")
end

function yes1()                                                                 -- �̻���2��Pkҩ��
	if ((GetItemCountEx(418)>=1) and (GetItemCountEx(426))>=1) then
	  	DelItemEx(418)
	  	DelItemEx(426)
	  	for i=1,2 do 
	    	local x=random(1,10)
	    	AddItem(6,0,x,1,0,0,0)
	  	end
	  	AddItem(6,0,11,1,0,0,0)
	  	Msg2Player(STR_Reward_Note[3]..STR_Reward_Reward[1].."��")
	  	GetReward()
	else
		Say(STR_Reward_Note[4]..STR_Reward_Reward[1]..STR_Reward_Note[5]..STR_Reward_Poem[1]..STR_Reward_Note[6], 2,
			STR_Reward_Note[11].."/GetReward",
			STR_Reward_Note[12].."/main" )
	end
end

function yes2()                                                                 -- ���꼪���
	if ((GetItemCountEx(419)>=1) and GetItemCountEx(427)>=1) then
	  	DelItemEx(419)
	  	DelItemEx(427)
	  	AddItem(6,1,19,1,0,0,0)
	  	Msg2Player(STR_Reward_Note[3]..STR_Reward_Reward[2].."��")
	  	GetReward()
	else
		Say(STR_Reward_Note[4]..STR_Reward_Reward[2]..STR_Reward_Note[5]..STR_Reward_Poem[2]..STR_Reward_Note[6], 2,
			STR_Reward_Note[11].."/GetReward",
			STR_Reward_Note[12].."/main" )
	end
end

function yes3()                                                                 -- �ɲ�¶
	if ((GetItemCountEx(420)>=1) and GetItemCountEx(428)>=1) then
	  	DelItemEx(420)
	  	DelItemEx(428)
	  	AddItem(6,1,71,1,0,0,0)
	  	Msg2Player(STR_Reward_Note[3]..STR_Reward_Reward[3].."��")
	  	GetReward()
	else
		Say(STR_Reward_Note[4]..STR_Reward_Reward[3]..STR_Reward_Note[5]..STR_Reward_Poem[3]..STR_Reward_Note[6], 2,
			STR_Reward_Note[11].."/GetReward",
			STR_Reward_Note[12].."/main" )
	end
end

function yes4()                                                                 -- ���丣����Բ��
	if ((GetItemCountEx(421)>=1) and GetItemCountEx(429)>=1) then
	  	DelItemEx(421)
	  	DelItemEx(429)
	  	AddItem(6,1,126,1,0,0,0)
	  	Msg2Player(STR_Reward_Note[3]..STR_Reward_Reward[4].."��")
	  	GetReward()
	else
		Say(STR_Reward_Note[4]..STR_Reward_Reward[4]..STR_Reward_Note[5]..STR_Reward_Poem[4]..STR_Reward_Note[6], 2,
			STR_Reward_Note[11].."/GetReward",
			STR_Reward_Note[12].."/main" )
	end
end

function yes5()                                                                 -- �𻨾�
	if ((GetItemCountEx(422)>=1) and GetItemCountEx(430)>=1) then
	  	DelItemEx(422)
	  	DelItemEx(430)
	  	AddItem(6,1,125,1,0,0,0)
	  	Msg2Player(STR_Reward_Note[3]..STR_Reward_Reward[5].."��")
	  	GetReward()
	else
		Say(STR_Reward_Note[4]..STR_Reward_Reward[5]..STR_Reward_Note[5]..STR_Reward_Poem[5]..STR_Reward_Note[6], 2,
			STR_Reward_Note[11].."/GetReward",
			STR_Reward_Note[12].."/main" )
	end
end

function yes6()                                                                 -- ����ܽ��
	if ((GetItemCountEx(423)>=1) and GetItemCountEx(431)>=1) then
	  	DelItemEx(423)
	  	DelItemEx(431)
	  	AddItem(6,1,128,1,0,0,0)
	  	Msg2Player(STR_Reward_Note[3]..STR_Reward_Reward[6].."��")
	  	local n=GetGlbValue(12)+1
	  	SetGlbValue(12,n)
			WriteLog(date("%H%M%S").."		ACC- "..GetAccount().. ",		 CHAR- "..GetName().."		"..STR_Reward_Reward[6]);
	  	AddGlobalNews(STR_Reward_Note[8])
	  	GetReward()
	else
		Say(STR_Reward_Note[4]..STR_Reward_Reward[6]..STR_Reward_Note[5]..STR_Reward_Poem[6]..STR_Reward_Note[6], 2,
			STR_Reward_Note[11].."/GetReward",
			STR_Reward_Note[12].."/main" )
	end
end

function yes7()                                                                 -- ���¹���
	if ((GetItemCountEx(424)>=1) and GetItemCountEx(432)>=1) then
	  	DelItemEx(424)
	  	DelItemEx(432)
	  	AddItem(6,1,127,1,0,0,0)
	  	Msg2Player(STR_Reward_Note[3]..STR_Reward_Reward[7].."��")
	  	local n=GetGlbValue(11)+1
	  	SetGlbValue(11,n)
			WriteLog(date("%H%M%S").."		ACC- "..GetAccount().. ",		 CHAR- "..GetName().."		"..STR_Reward_Reward[7]);
	  	AddGlobalNews(STR_Reward_Note[9])
	  	GetReward()
	else
		Say(STR_Reward_Note[4]..STR_Reward_Reward[7]..STR_Reward_Note[5]..STR_Reward_Poem[7]..STR_Reward_Note[6], 2,
			STR_Reward_Note[11].."/GetReward",
			STR_Reward_Note[12].."/main" )
	end
end

function yes8()                                                                 -- ��������ƽ�װ��
	if ((GetItemCountEx(425)>=1) and GetItemCountEx(433)>=1) then
	  	DelItemEx(425)
	  	DelItemEx(433)
	  	local x=random(159,167)
	  	AddGoldItem(0,x)
	  	local n=GetGlbValue(10)+1
	  	SetGlbValue(10,n)
			WriteLog(date("%H%M%S").."		ACC- "..GetAccount().. ",		 CHAR- "..GetName().."		"..STR_Reward_Reward[8]);
	  	Msg2Player(STR_Reward_Note[3]..STR_Reward_Reward[8].."��")
	  	AddGlobalNews(STR_Reward_Note[10])
	  	GetReward()
	else
		Say(STR_Reward_Note[4]..STR_Reward_Reward[8]..STR_Reward_Note[5]..STR_Reward_Poem[8]..STR_Reward_Note[6], 2,
			STR_Reward_Note[11].."/GetReward",
			STR_Reward_Note[12].."/main" )
	end
end

-- ------------------------------------------------------------------------------------------------
-- ------------------------------------------ �ϳɲ��� --------------------------------------------
-- ------------------------------------------------------------------------------------------------
function Combination()
	local mpay		 = 1000		--��Ҫ֧���Ľ��X����
	
	if ( GetCash() < mpay ) then
		Say(STR_Combin_Note[2], 1,
			STR_OK.."/main" )
		Msg2Player(STR_Guess[2]..mpay..STR_Guess[3])
	else
		Say(STR_Combin_Note[1], 2,
			STR_Guess[5].."/Combination_List",
			STR_Guess[6].."/main" )
	end
end
function Combination_List()
	local i=GetCash()
	if (i>=1000) then
		Say(STR_Combin_Note[1],8,
			STR_Combin_Word[1]..STR_Combin_Request[1]..STR_Combin_Func[1],
			STR_Combin_Word[2]..STR_Combin_Request[2]..STR_Combin_Func[2],
			STR_Combin_Word[3]..STR_Combin_Request[3]..STR_Combin_Func[3],
			STR_Combin_Word[4]..STR_Combin_Request[4]..STR_Combin_Func[4],
			STR_Combin_Word[5]..STR_Combin_Request[5]..STR_Combin_Func[5],
			STR_Combin_Word[6]..STR_Combin_Request[6]..STR_Combin_Func[6],
			STR_Combin_Word[7]..STR_Combin_Request[7]..STR_Combin_Func[7],
			STR_Combin_Note[10] )
	end
end

function Combin1()                                                                 -- ��
	if ((GetItemCountEx(418)>=1) and GetItemCountEx(426)>=1) then
	  	if (Pay(1000) > 0 ) then 
	  		DelItemEx(418)
	  		DelItemEx(426)
	  		local x=random(1,100) 
	  		if (x<=MingZi) then
            	AddItem(4,419,1,1,0,0,0)
	    		Msg2Player(STR_Combin_Note[4]..STR_Combin_Word[1])
	  		else
				Say(STR_Combin_Note[5]..STR_Combin_Word[1]..STR_Combin_Note[6], 1,
					STR_OK.."/Combination" )
	  		end
	  	end
	else
		Say(STR_Combin_Note[7]..STR_Combin_Word[1]..STR_Combin_Note[8]..STR_Combin_Request[1]..STR_Combin_Note[9], 2,
			STR_Combin_Note[11].."/Combination",
			STR_Combin_Note[12].."/main" )
	end
end

function Combin2()                                                                 -- ��
	if ((GetItemCountEx(419)>=1) and GetItemCountEx(427)>=1) then
		if (Pay(1000) > 0 ) then 
	  		DelItemEx(419)
	  		DelItemEx(427)
	  		local x=random(1,100) 
	  		if (x<=QiuZi) then
            	AddItem(4,420,1,1,0,0,0)
	    		Msg2Player(STR_Combin_Note[4]..STR_Combin_Word[2])
	 		else
				Say(STR_Combin_Note[5]..STR_Combin_Word[2]..STR_Combin_Note[6], 1,
					STR_OK.."/Combination" )
	  		end
	  	end
	else
		Say(STR_Combin_Note[7]..STR_Combin_Word[2]..STR_Combin_Note[8]..STR_Combin_Request[2]..STR_Combin_Note[9], 2,
			STR_Combin_Note[11].."/Combination",
			STR_Combin_Note[12].."/main" )
	end
end

function Combin3()                                                                 -- ��
	if ((GetItemCountEx(420)>=1) and GetItemCountEx(428)>=1) then
		if (Pay(1000) > 0 ) then 
	  		DelItemEx(420)
	  		DelItemEx(428)
	  		local x=random(1,100) 
	  		if (x<=GeZi) then
            	AddItem(4,421,1,1,0,0,0)
	    		Msg2Player(STR_Combin_Note[4]..STR_Combin_Word[3])
	  		else
				Say(STR_Combin_Note[5]..STR_Combin_Word[3]..STR_Combin_Note[6], 1,
					STR_OK.."/Combination" )
	  		end
	  	end
	else
		Say(STR_Combin_Note[7]..STR_Combin_Word[3]..STR_Combin_Note[8]..STR_Combin_Request[3]..STR_Combin_Note[9], 2,
			STR_Combin_Note[11].."/Combination",
			STR_Combin_Note[12].."/main" )
	end
end

function Combin4()                                                                 -- Ӱ
	if ((GetItemCountEx(421)>=1) and GetItemCountEx(429)>=1) then
		if (Pay(1000) > 0 ) then 
	  		DelItemEx(421)
	  		DelItemEx(429)
	  		local x=random(1,100) 
	  		if (x<=YingZi) then
            	AddItem(4,422,1,1,0,0,0)
	    		Msg2Player(STR_Combin_Note[4]..STR_Combin_Word[4])
	  		else
				Say(STR_Combin_Note[5]..STR_Combin_Word[4]..STR_Combin_Note[6], 1,
					STR_OK.."/Combination" )
	  		end
	  	end
	else
		Say(STR_Combin_Note[7]..STR_Combin_Word[4]..STR_Combin_Note[8]..STR_Combin_Request[4]..STR_Combin_Note[9], 2,
			STR_Combin_Note[11].."/Combination",
			STR_Combin_Note[12].."/main" )
	end
end

function Combin5()                                                                 -- ��
	if ((GetItemCountEx(422)>=1) and GetItemCountEx(430)>=1) then
	  	if (Pay(1000) > 0 ) then 
	  		DelItemEx(422)
	  		DelItemEx(430)
	  		local x=random(1,100) 
	  		if (x<=JuZi) then
            	AddItem(4,423,1,1,0,0,0)
	    		Msg2Player(STR_Combin_Note[4]..STR_Combin_Word[5])
	  		else
				Say(STR_Combin_Note[5]..STR_Combin_Word[5]..STR_Combin_Note[6], 1,
					STR_OK.."/Combination" )
	  		end
	  	end
	else
		Say(STR_Combin_Note[7]..STR_Combin_Word[5]..STR_Combin_Note[8]..STR_Combin_Request[5]..STR_Combin_Note[9], 2,
			STR_Combin_Note[11].."/Combination",
			STR_Combin_Note[12].."/main" )
	end
end

function Combin6()                                                                 -- ��
	if ((GetItemCountEx(423)>=1) and GetItemCountEx(431)>=1) then
	  	if (Pay(1000) > 0 ) then 
	    	DelItemEx(423)
	    	DelItemEx(431)
	  		local x=random(1,100) 
	  		if (x<=WangZi) then
            	AddItem(4,424,1,1,0,0,0)
	    		Msg2Player(STR_Combin_Note[4]..STR_Combin_Word[6])
			else
				Say(STR_Combin_Note[5]..STR_Combin_Word[6]..STR_Combin_Note[6], 1,
					STR_OK.."/Combination" )
			end
		end
	else
		Say(STR_Combin_Note[7]..STR_Combin_Word[6]..STR_Combin_Note[8]..STR_Combin_Request[6]..STR_Combin_Note[9], 2,
			STR_Combin_Note[11].."/Combination",
			STR_Combin_Note[12].."/main" )
	end
end

function Combin7()                                                                 -- Ը
	if ((GetItemCountEx(424)>=1) and GetItemCountEx(432)>=1) then
		if (Pay(1000) > 0 ) then 
	  		DelItemEx(424)
	  		DelItemEx(432)
	  		local x=random(1,100) 
	  		if (x<=YuanZi) then
            	AddItem(4,425,1,1,0,0,0)
	    		Msg2Player(STR_Combin_Note[4]..STR_Combin_Word[7])
	  		else
				Say(STR_Combin_Note[5]..STR_Combin_Word[7]..STR_Combin_Note[6], 1,
					STR_OK.."/Combination" )
	  		end
		end
	else
		Say(STR_Combin_Note[7]..STR_Combin_Word[7]..STR_Combin_Note[8]..STR_Combin_Request[7]..STR_Combin_Note[9], 1,
			STR_Combin_Note[11].."/Combination",
			STR_Combin_Note[12].."/main" )
	end
end

function do_nothing()
end