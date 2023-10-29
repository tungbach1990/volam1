NA_MONEYGIFT_MAX_MONEY				=	1000000			--����������һ�������Ǯ��
NA_MONEYGIFT_DAYMAX_MONEY			= 200000			--ÿ���������һ�������Ǯ��
NA_MONEYGIFT_SV_DAYMAX_MONEY	= 350000000	--ÿ̨����������ÿ�նһ������ֵ3.5��
NA_MONEYGIFT_MONEY						= 20000

TSK_NA_MONEYGIFT_MAXMONEY			= 1194			--��ǰ�ѻ�õĽ�Ǯͳ��
TSK_NA_MONEYGIFT_DAYMAXMONEY 	= 1195			--���ջ�õĽ�Ǯͳ��
TSK_NA_MONEYGIFT_LASTDAY			= 1196			--���һ�ζһ�����������
TSK_NA_MONEYGIFT_ISTAKED			= 1197			--�ý�ɫ�Ƿ��ܹ��һ�����

GTSK_NA_MONEYGIFT_SVLASTDAY		= 831				--���һ�ζһ���Ʒ����������
GTSK_NA_MONEYGIFT_SVMAXMONEY	= 832				--��������Ѷһ�������Ǯ������

EXT_NA_MONEYGIFT_ACCT					= 2					--��չ�㣬������ɫ�μӻ
TB_MONEYGIFT_MSG = {
	"<#>Qu� kh�ch ch�a n�p th�, kh�ng th� tham gia ho�t ��ng n�y!",
	"<#>Ch� nh�ng ng��i ��ng c�p tr�n 50 m�i c� th� tham gia ho�t ��ng n�y.",
	"<#>Ng��i �� c� 3 nh�n v�t tham gia ho�t ��ng n�y, kh�ng th� tham gia th�m ���c n�a.",
	"<#>Qu� kh�ch �� ��i �� 100 v�n trong ho�t ��ng n�y! C�m �n �� �ng h�!",
	"<#>H�m nay qu� kh�ch �� ��i �� 20 v�n. Mai l�i ��n nh�!",
	"<#>Th�t ng�i qu�! Ta m�i ��i h�t ti�n! H�y th� �i c�c th�nh kh�c ho�c ng�y mai quay l�i nh�. Ch�c vui v�!",
	"<#>H�nh nh� qu� kh�ch kh�ng c� �Qu� Qu�c Kh�nh�!",
}
function vm_NationalDay()
	Say("<#>Qu�c kh�nh vui v�! H�y mau �i luy�n c�ng, t�m ���c �Qu� Qu�c Kh�nh� ��n ��y ta s� ��i cho ph�n qu� th� v�!", 2,
	"��i qu� Qu�c Kh�nh/NA_want2changegift",
	"Ta ch� ��n xem th�i/OnCancel");
end;

function NA_want2changegift()
	if (NA_istakedgift() == 0) then
		return 0;
	end;
	
	if (CalcEquiproomItemCount(6,1,1155,-1) >= 1 and ConsumeEquiproomItem(1, 6, 1, 1155, -1)) then
		SetTask(TSK_NA_MONEYGIFT_MAXMONEY, GetTask(TSK_NA_MONEYGIFT_MAXMONEY) + NA_MONEYGIFT_MONEY);
		SetTask(TSK_NA_MONEYGIFT_DAYMAXMONEY, GetTask(TSK_NA_MONEYGIFT_DAYMAXMONEY) + NA_MONEYGIFT_MONEY);
		SetGlbValue(GTSK_NA_MONEYGIFT_SVMAXMONEY, GetGlbValue(GTSK_NA_MONEYGIFT_SVMAXMONEY) + NA_MONEYGIFT_MONEY);
		Earn(NA_MONEYGIFT_MONEY);
		WriteLog("[Ho�t ��ng Qu�c Kh�nh]\t"..date().." \tName:"..GetName().."\tAccount:"..GetAccount().." Nh�n ���c"..NA_MONEYGIFT_MONEY.." l��ng")
		Say("<#>Xin nh�n ng�n l��ng. Ch�c Qu�c Kh�nh vui v�!", 1, "Nh�n ng�n l��ng/OnCancel")
		if (GetTask(TSK_NA_MONEYGIFT_ISTAKED) == 0) then
			SetTask(TSK_NA_MONEYGIFT_ISTAKED, 1);
			AddExtPoint(EXT_NA_MONEYGIFT_ACCT, 1);
		end;
	else
		Say(TB_MONEYGIFT_MSG[7], 0);
	end;
end;

function NA_istakedgift()
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	
	if (GetTask(TSK_NA_MONEYGIFT_LASTDAY) ~= nDate) then
		SetTask(TSK_NA_MONEYGIFT_LASTDAY, nDate);
		SetTask(TSK_NA_MONEYGIFT_DAYMAXMONEY, 0);
	end;
	
	if (GetGlbValue(GTSK_NA_MONEYGIFT_SVLASTDAY) ~= nDate) then
		SetGlbValue(GTSK_NA_MONEYGIFT_SVLASTDAY, nDate);
		SetGlbValue(GTSK_NA_MONEYGIFT_SVMAXMONEY, 0);
	end;

	if (GetTask(TSK_NA_MONEYGIFT_ISTAKED) == 0) then
		if (IsCharged() ~= 1) then	--��ֵ
			Say(TB_MONEYGIFT_MSG[1], 0);
		elseif (GetLevel() < 50) then	--50��
			Say(TB_MONEYGIFT_MSG[2], 0);
		elseif (GetExtPoint(EXT_NA_MONEYGIFT_ACCT) >= 3) then	--3����ɫ
			Say(TB_MONEYGIFT_MSG[3], 0);
		else
			return 1;
		end;
		return 0;
	else
		if (GetTask(TSK_NA_MONEYGIFT_MAXMONEY) >= NA_MONEYGIFT_MAX_MONEY) then	--��ɫ��ȡ�����
			Say(TB_MONEYGIFT_MSG[4], 0);
		elseif (GetTask(TSK_NA_MONEYGIFT_DAYMAXMONEY) >= NA_MONEYGIFT_DAYMAX_MONEY) then		--ÿ�������
			Say(TB_MONEYGIFT_MSG[5], 0);
		elseif (GetGlbValue(GTSK_NA_MONEYGIFT_SVMAXMONEY) >= NA_MONEYGIFT_SV_DAYMAX_MONEY) then	--�������������
			Say(TB_MONEYGIFT_MSG[6], 0);
		else
			return 1;
		end;
		return 0;
	end;
end;

function IsCharged()
	if( GetExtPoint( 0 ) >= 1 ) then
		return 1;
	else
		return 0;
	end;
end;