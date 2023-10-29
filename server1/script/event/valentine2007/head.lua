Include("\\script\\lib\\basic.lua");

TSK_VALENTINE_ROSE_DATE = 1596
TSK_VALENTINE_ROSE_ADDEXP = 1597


PRM_ROSETREE_PLAYID = 1
PRM_ROSETREE_EVENT = 2	--byte: eventid=1; state=2; phase=3; task = 4;
PRM_ROSETREE_TIME = 3		
PRM_ROSETREE_POINT = 4;	--phase <= 3 then time; byte:pure=1;norm=2;bud =3;

TB_ROSETREE_TASK = {2,3,4}
TB_ROSETREE_NPCID = {1252, 1253, 1254, 1255};
TB_ROSETREE_ROSEPROP = {
	{6,1,1362,1,0,0},
	{6,1,1363,1,0,0},
	{6,1,1364,1,0,0},
}
TB_ROSETREE_TASKTIME = {20, 20, 15, 10};

DEC_ROSETREE_SZSEX = {[0]="��i hi�p",[1]="N� hi�p"}
DEC_ROSETREE_STASK = {"T��i n��c","B�n ph�n","C�t c� d�i","Di�t c�n tr�ng"};
DEC_ROSETREE_EVENT = {
"C�y hoa h�ng: T�i kh�t n��c qu�, v� <color=yellow>n� hi�p<color> n�y, sau <color=yellow>20 gi�y<color> h�y t��i n��c cho t�i. Nh�t ��nh ph�i ��ng gi�, nh� v�y t�i m�i c� th� tr� nh�ng b�ng hoa xinh ��p.",
"C�y hoa h�ng: Khi t�i �ang l�n, c�n r�t nhi�u dinh d��ng, v� <color=yellow>��i hi�p<color> n�y, sau <color=yellow>20 gi�y<color> h�y b�n ph�n cho t�i. N�u kh�ng t�i kh�ng th� l�n.",
"C�y hoa h�ng: Xung quanh t�i c� nhi�u c� d�i qu�, <color=yellow>15 gi�y<color> sau h�y c�t b� gi�p t�i. Ch� c� s� gi�p s�c c�a ��i b�n, t�i m�i c� th� tr��ng th�nh.",
"C�y hoa h�ng: �i, d��ng nh� c� nh�ng con s�u b� l�n ng��i t�i, <color=yellow>10 gi�y<color> sau xin h�y gi�p t�i ti�u di�t ch�ng.",
"C�y hoa h�ng: C�m �n ��i b�n �� ch�m nom t�i. Hi�n t�i t�i �� tr� ra nh�ng hoa h�ng r�t ��p, c� %s xin ��i b�n h�y mau ch�ng h�i l�y.",
};

DEC_ROSETREE_OTHER = {
"C�y hoa h�ng: M�a xu�n ��n r�i! H�y c�ng t�i vui xu�n.",
"C�y hoa h�ng: Gi� xu�n �m �p, cho d� con ���ng ph�a tr��c c� �i ��n t�n c�ng hay kh�ng th� t�i v�n th�ch b�n, cho ��n khi t�i kh�ng c�n tr�n c�i ��i n�y n�a...",
"C�y hoa h�ng: T�i �� d�ng l�ng y�u th��ng �� tr� ra nh�ng b�ng hoa t��i ��p...",
"C�y hoa h�ng: T�nh y�u nh� n��c cu�n �i, th�ng ng�y nh� gi�c m�ng v�ng tr�i qua. T�i ��ng ��y d��i tia n�ng �m �p, tay ��t l�n ng�c, l�ng ngh� ��n nh�ng hoa h�ng trong tim. Xin ch�c ��i b�n m�t L� T�nh Nh�n vui v� h�nh ph�c!",
};

TB_XINNIANLIHUA_AREA = {174,121,153,101,99,100,20,53,1,11,37,78,80,162,176,2,21,167,193}

function checkValentine2007Date(nlimitdate)
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if (nDate <= nlimitdate) then
		return 1;
	end;
	return 0;
end;

function checkValentine2007Limit()
	if (GetLevel() >= 80 and GetExtPoint(0) > 0) then
		return 1;
	else
		return 0;
	end;
end;