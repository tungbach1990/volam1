-- �ļ�������doubleexp.lua
-- �����ߡ���wangjingjun
-- ���ݡ��������׵۱��ع��ص�ʱ���ж��Ƿ���Ҫ��������
-- ����ʱ�䣺2012-03-02 13:08:16

local tbDouble = {
	{"\\script\\activitysys\\config\\41\\extend.lua", "pActivity:DoubleExp_YDBZ",},
	}
function YDBZ_checkdoubleexp(nExp)
	for i=1, getn(%tbDouble) do
		local tbfunc = %tbDouble[i]
		nExp = DynamicExecuteByPlayer(PlayerIndex, tbfunc[1], tbfunc[2], nExp)
	end
	--Nh�n ��i �i�m t�ch lu� V��t �i Vi�m �� - Modified By DinhHQ - 20130305
	nExp = DynamicExecuteByPlayer(PlayerIndex, "\\script\\vng_feature\\double_mission_award.lua", "tbVnX2Award:X2YDBZ", nExp)
	return nExp
end