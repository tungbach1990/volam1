TEMP_QID = 122;
TEMP_QCHOOSE = 123;
GOLD_TIMESTEMP = 4001;
GOLD_SERIES = 4000;
GOLD_COUNT = 4002;
FIRSTDAY = 816;

GLBID_GOLD_LOTTERY_COUNT = 6;	--ȫ�ֱ���ID of ���������ѷ����Ļƽ��Ʊ��
-- �ߴ���е�ͼ
-- 1-����, 2-�ɶ�, 3-����, 4-�꾩, 5-����, 6-����, 7-�ٰ�
arynCityMapID = { 1, 11, 162, 37, 78, 80, 176 }
nMaxGoldLottery = 100000;		--ÿ̨GameServer�Ͽɷ��������ƽ��Ʊ��

function onPayTicket()
if (IsCharged() ~= 1 ) then
	 Say("�Բ�������δ��ֵ�������޷��μ��ŵ�ʢ���Ʊ���", 0)
	return
end
nCount = GetPayTicketCount();

if (nCount == 0 ) then
	Say("�Բ�������û���һ���Ʊ��ʱ�䣬�����ڱ���ʱ���糿9�㵽��������22�����һ��ɣ�лл��", 0) 
	return
end;

Tab = {};

for i = 1, nCount + 1 do 
	Tab[i] = GetQuestionTip(GetPayTicket(i)).."/OPAsk";
end;

Tab[nCount + 1] = "���ҽ���/Cancel";
Say("��Ҫ���������ֽ�?", nCount + 1, Tab)
end;

function OPAsk(nSel)
	nQuestion, nBonus = GetPayTicket(nSel + 1);
	if (nQuestion > 0 ) then 
		nAnswer = GetQAnswer(nQuestion)
		if (nAnswer > 0) then 
			if (nQuestion ~= 1000) then 
				str = format("����:%s�����:%s ,����:%d����Ҫ�ҽ���?", GetQuestion(nQuestion), GetChoose(nQuestion, nAnswer), nBonus )
			else
				lGold = GetByte(nAnswer, 1);
				lYing = GetByte(nAnswer,2);
				lTong = GetByte(nAnswer,3);
				str = format("����:%s, ���:����%d�顢����%d�顢ͭ��%d��, ����:%d����Ҫ�ҽ���?", GetQuestion(nQuestionI), lGold, lYing, lTong,nBonus)
			end
			Say(str, 2, "�ҽ�/OPOnPayFor", "���ҽ�/Cancel");
			SetTaskTemp(TEMP_QID, nQuestion)
		end
	end
end;


function OPOnPayFor()
	nQuestion = GetTaskTemp(TEMP_QID)
	nTotal, nRight, nBonus = CheckTicket(75, nQuestion);
	
	if (nTotal == 0) then
		Say("�Բ���������Ĳ�Ʊû�д�ԣ��ٽ���������Ҫ����Ŷ��Ҳ��󽱾��ڵ��������ƽ�װ���أ�", 0)
	else
		nTotalBonus = nBonus * nRight
		local str = "";
		if (nQuestion ~= 1000) then 
			str = format("��һ����%d�����ཱƱ,�����н�����%d��,�õ����ܽ���Ϊ%d,��ϲ��!������н�,���ǻ������͸����ƽ��Ʊ,ƾ�˲�Ʊ���ܻ���һ���ƽ�װ��Ŷ���ƽ��Ʊ�Ŀ������ھ��ڽ����22��30��24�㡣", nTotal,nRight, nTotalBonus);
		else
			str = format("��һ����%d�����ཱƱ,�����н�����%d��,�õ����ܽ���Ϊ%d,��ϲ��!������н�,���ǻ������͸����ƽ��Ʊ,ƾ�˲�Ʊ���ܻ���һ�������ŵ�ʢ��Ļƽ�װ���󽱣�������������9��1�ա�9��2����22��30��24�㡣", nTotal,nRight, nTotalBonus);
		end
		
		local logstr = format("[Lottery] Acc:%s Role:%s Q:%d QSum:%d QWin:%d Bonus:%d", GetAccount(), GetName(), nQuestion, nTotal, nRight, nTotalBonus )
		WriteLog(logstr);	
		Earn(nTotalBonus);
		Say(str,0)
		
		for i = 1, nRight do 
			item = AddItem(6,1,76, 1,0,0);
			LotteryId = getGoldLotteryID();
			LotteryTime = getCurrTime();
			SetSpecItemParam(item , 1, LotteryId)
			SetSpecItemParam(item , 2, LotteryTime)
			P3 = SetByte(GetByte(LotteryId, 3), 2, GetByte(LotteryId,4))
			P4 = SetByte(GetByte(LotteryTime, 3), 2, GetByte(LotteryTime,4))
			SetSpecItemParam(item , 3, P3)
			SetSpecItemParam(item , 4, P4)
			SetSpecItemParam(item, 5, nQuestion)
			if (nQuestion == 1000) then 
				SetSpecItemParam(item, 5, 1000)
				UpdateSDBRecord("GoldLottery0901", LotteryId, LotteryTime, 0) --�ƽ�󽱼�¼Ϊ9��1�յĲ�Ʊ
			else
				UpdateSDBRecord("GoldLottery"..date("%m%d"),LotteryId, LotteryTime, 0)
			end
			SyncItem(item)
		end;
	end;
end;

function Cancel()

end;

function onPayforGoldLottery()
	local PayTab={};
	if (tonumber(date("%m%d")) > 831 ) then 
		Say("�Բ��𣬱����ŵ�ʢ�����ͨ�ƽ��Ʊ�Ķҽ���Ѿ������ˡ�",0)
		return
	end
	
	nIntervalDay = tonumber(date("%m%d")) - FIRSTDAY + 1;
	
	if (nIntervalDay <=0) then 
		return
	end

	for i = 1, nIntervalDay do 
		nMonth = floor((FIRSTDAY + nIntervalDay - i) / 100)
		nDay = mod(FIRSTDAY + nIntervalDay - i , 100)
		PayTab[i] = nMonth.."��"..nDay.."�ջƽ��Ʊ/doPayforGold"
	end;
	PayTab[nIntervalDay + 1] = "���öҽ���/Cancel";
	Say("��Ҫ�һ���һ��Ļƽ��Ʊ�󽱣�", getn(PayTab), PayTab);
--	Say("�����н��Ļƽ��Ʊ��Ϊ["..GetGlbValue(GOLD_TIMESTEMP).."-"..GetGlbValue(GOLD_SERIES).."],���߿ɵõ�����õ��ƽ�װ��һ������Ҫ�ҽ���", 2, "�õ�/doPayforGold", "������/Cancel")
end

function doPayforGold(nDay)

	ldate = tonumber(date("%m%d"))
	
	if (ldate > 831) then 
		return 
	end
	
	nIntervalDay = ldate - FIRSTDAY + 1;

	if (nIntervalDay <= 0) then
		return
	end

	nSel =  nIntervalDay - nDay - 1;
	dayGOLD_SERIES = GOLD_SERIES + nSel * 2;
	dayGOLD_TIMESTEMP = GOLD_TIMESTEMP + nSel * 2;

	if ( GetGlbValue(dayGOLD_TIMESTEMP) == 0 ) then 
		Say("�Բ���Ŀǰ�����ڵĻƽ��Ʊ������δ���������Ժ��ٶҽ���лл��", 0)
		return
	end;

	 nItem = FindSpecItemParam2(1, 76, GetGlbValue(dayGOLD_SERIES), GetGlbValue(dayGOLD_TIMESTEMP));
	if (nItem > 0) then
		if (RemoveItemByIndex(nItem) > 0) then 
			Say("��ϲ�㣬��Ļƽ��Ʊ�н��ˣ���ûƽ�װ��һ����", 0)
			
			nMonth = floor((FIRSTDAY + nSel)/100);
			nDay = mod( (FIRSTDAY + nSel) , 100)

			AddGoldItem(0, random(159,167))
			Msg2Player("��ϲ���ûƽ�װ��һ����")
			WriteLog(GetAccount()..","..GetName().."����"..FIRSTDAY+nSel.."�ƽ��Ʊ�󽱣���ûƽ�װ��һ������ƱID"..GetGlbValue(dayGOLD_TIMESTEMP).."-".. GetGlbValue(dayGOLD_SERIES))
			msg = "��ϲ:���"..GetName().." ����"..nMonth.."��"..nDay.."�յĻƽ��Ʊ�󽱣���ûƽ�װ��һ����";
			AddGlobalCountNews(msg, 1);
		end
	else
		Say("�Բ����н���Ϊ"..GetGlbValue(dayGOLD_TIMESTEMP).."-"..GetGlbValue(dayGOLD_SERIES).."�������Ͽ����Ļƽ��Ʊ��û��ƥ����н����롣", 0)
	end
end;



function doPayforGreateGold()

	nIntervalDay = 901 - FIRSTDAY;
	
	dayGOLD_SERIES = GOLD_SERIES + nIntervalDay * 2;
	dayGOLD_TIMESTEMP = GOLD_TIMESTEMP + nIntervalDay * 2;

	if ( GetGlbValue(dayGOLD_TIMESTEMP) == 0 ) then 
		Say("�Բ���Ŀǰ�ŵ�ʢ�Ὰ���й��������Ļƽ��Ʊ�н��ſ�����δ���������Ժ��ٶҽ���лл��", 0)
		return
	end;

	
	nItem = FindSpecItemParam2(1, 76, GetGlbValue(dayGOLD_SERIES), GetGlbValue(dayGOLD_TIMESTEMP));
	if (nItem > 0) then
		if (RemoveItemByIndex(nItem) > 0) then 
			Say("���ҵع�ϲ�������Ļƽ��Ʊ�н��ˣ����˰���ϵ�л����󽱣�����ŵ�֮�ꡢ����֮�θ߼��ƽ��ָһ�ԣ�", 0)
			AddGoldItem(0, 141)
			AddGoldItem(0, 142)
			Msg2Player("������ŵ�֮�ꡢ����֮��һ�Իƽ��ָ��")
			WriteLog(GetAccount()..","..GetName().."���˰����й��ӽ������Ļƽ��Ʊ�󽱣���ð��˽�ָװ��һ�ס���ƱID"..GetGlbValue(dayGOLD_TIMESTEMP).."-".. GetGlbValue(dayGOLD_SERIES))
			msg = "���ҹ�ϲ:���"..GetName().." �����ŵ�ʢ���й��ӽ��������µĻƽ�󽱣�����ŵ�֮�ꡢ����֮�θ߼��ƽ��ָһ�ԣ�";
			AddGlobalNews(msg);
		end
	else
		Say("�Բ����н���Ϊ"..GetGlbValue(dayGOLD_TIMESTEMP).."-"..GetGlbValue(dayGOLD_SERIES).."�������Ͽ����Ļƽ��Ʊ��û��ƥ����н����롣", 0)
	end
end;



function getGoldLotteryID()
	local nMapCount = getn( arynCityMapID );
	local nCurrServerID = nMapCount + 1;
	for i = 1, nMapCount do
		if( SubWorldID2Idx( arynCityMapID[i] ) >= 0 ) then	--���õ�ͼ�Ƿ�������жϵ�ǰ������һ̨��������
			nCurrServerID = i;
			break;
		end
	end
	local nLotteryCount = GetGlbValue( GLBID_GOLD_LOTTERY_COUNT );
	SetGlbValue( GLBID_GOLD_LOTTERY_COUNT, nLotteryCount + 1 );
	return nMaxGoldLottery * ( nCurrServerID - 1 ) + nLotteryCount;
end

function getCurrTime()
	return tonumber( date( "%m%d%H%M%S" ) );
end