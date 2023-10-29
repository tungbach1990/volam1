Include("\\script\\lib\\basic.lua");

TSK_33_COOKIES_DATE = 2550
TSK_33_COOKIES_ADDEXP = 2551
TSK_33_COOKIES_COUNT = 2552

PRM_PAN_PLAYID = 1
PRM_PAN_EVENT = 2	--byte: eventid=1; state=2; phase=3; task = 4;
PRM_PAN_TIME = 3		
PRM_PAN_POINT = 4;	--phase <= 3 then time; byte:pure=1;norm=2;bud =3;

TB_PAN_TASK = {2,3,4}
TB_PAN_NPCID = {1272, 1273, 1274, 1275};
TB_PAN_COOKIESPROP = {
	{6,1,1395,1,0,0},
	{6,1,1396,1,0,0},
	{6,1,1397,1,0,0},
}
TB_PAN_TASKTIME = {20, 20, 20, 20};

DEC_PAN_SZSEX = {[0]="��i hi�p",[1]="N� hi�p"}
DEC_PAN_STASK = {"��i v� ��u xanh","nh�o b�t","B� nh�n v�o b�nh","Th�m c�i"};
DEC_PAN_EVENT = {
"B�p l�a nh�: N� hi�p, xin h�y ��i 20 gi�y sau m�i c� th� ��i v� ��u xanh!",
"B�p l�a nh�: ��i hi�p, xin h�y ��i 20 gi�y sau m�i c� th� Nh�o b�t",
"B�p l�a nh�: Nh� v�, xin h�y ��i 20 gi�y sau m�i c� th� B� nh�n v�o b�nh.",
"B�p l�a nh�: Nh� v�, xin h�y ��i 20 gi�y sau m�i c� th� Th�m c�i",
"B�p l�a nh�: B�nh �� ch�n r�i, t�ng c�ng c� %s  xin h�y v�t ra.",
};

DEC_PAN_OTHER = {--�ȴ����ʱ���Ķ԰�.�����ʾһ��
"B�p l�a nh�: Ta �ang ch�y ��y!",
"B�p l�a nh�: N�ng qu� �i m�t!",
"B�p l�a nh�: �i th�i n�ng qu�!",
"B�p l�a nh�: N��c �� s�i, �ang b�c h�i ��y!",
};

TB_XINNIANLIHUA_AREA = {174,121,153,101,99,100,20,53,1,11,37,78,80,162,176,2,21,167,193}

function checkcookies2007Date(nlimitdate)
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if (nDate <= nlimitdate) then
		return 1;
	end;
	return 0;
end;

function checkcookies2007Limit()
	if (GetLevel() >= 50 and GetExtPoint(0) > 0) then
		return 1;
	else
		return 0;
	end;
end;