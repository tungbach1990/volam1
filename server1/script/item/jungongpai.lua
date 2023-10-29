--zero 2007-07-30
IncludeLib("SETTING");
JUNGONGPAI_exp={
	100000,
	{2000000,30},
	{3000000,40},
	{5000000,30}}
function main(nItem)	
	local nEndYear= GetItemParam(nItem, 1);
	local nMonthDay= GetItemParam(nItem, 2);
	
	if( nEndYear < tonumber(GetLocalDate("%Y")) or nMonthDay < tonumber(GetLocalDate("%m%d")) ) then
		Say("Hu�n c�ng b�i T�ng Kim ph�i ���c s� d�ng tr��c 24:00 ng�y h�m sau, Hu�n c�ng b�i n�y �� qu� h�n.",0)
		return 0;
	end
		
	
	
	local prob = JUNGONGPAI_exp[1];
	local sum = 0;
	local num = random(1,prob);
	for i = 2,getn(JUNGONGPAI_exp) do
		local odds = JUNGONGPAI_exp[i][2];
		sum = sum + odds * prob/100;
		if num < sum then
			AddOwnExp(JUNGONGPAI_exp[i][1])
			Msg2Player(format("S� d�ng Hu�n c�ng b�i T�ng Kim nh�n ���c %d �i�m kinh nghi�m.",JUNGONGPAI_exp[i][1]))
			WriteLog(format("[Hu�n c�ng b�i T�ng Kim]\t date:%s \t Account:%s \t Name:%s \t S� d�ng Hu�n c�ng b�i T�ng Kim nh�n ���c %d �i�m kinh nghi�m \t	",GetLocalDate("%Y-%m-%d %H:%M:%S"),GetAccount(),GetName(),JUNGONGPAI_exp[i][1]));
			break;
		end
	end
end

function GetDesc(nItem)
	local nEndYear= GetItemParam(nItem, 1);
	local nMonthDay= GetItemParam(nItem, 2);
	local nEndMonth=floor(nMonthDay/100);
	local nEndDay=mod(nMonthDay,100);
	return "Th�i h�n s� d�ng:"..nEndYear.."n�m"..nEndMonth.."nguy�t "..nEndDay.."nh�t ";
end