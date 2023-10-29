Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

TB_JiangHuXingBaoDian = {
		[32] = {
			szTitleMsg = "<dec>�� tr�i qua bi�t bao nhi�u �n o�n giang h�, ng��i c� ph�i l� �� c� m�t ��m huynh �� t� mu�i ��ng cam c�ng kh�? Ng��i c� mu�n l�nh ��o h�, c�ng nhau t�o ra m�t m�n v� c�ng V�n Th� B�t Di�t, c��p �o�t quy�n s� h�u b�y th�nh tr�, �� cho h� c� th� c�ng nhau h��ng vinh hoa ph� qu�. V�y th� h�y l�p ra bang h�i ri�ng cho m�nh, vi�t v�o �� c�c �n o�n t�nh th�, nhi n� t�nh tr��ng, c��p thuy�n, �o�t th�nh, c��p boss~",
			tbOpt = {
				[1] = {"Th�nh l�p bang h�i", 33},
				[2] = {"Khu v�c bang h�i", 34},
				[3] = {"k�t c�u t� ch�c", 35},
				[4] = {"qu� c�a bang h�i", 36},
				[5] = {"l�i nhu�n c�a bang h�i", 37},
				[6] = {"Li�n minh bang h�i", 38},
				[7] = {"M�c ti�u bang h�i h�ng tu�n", 39},
				[8] = {"bang h�i gi�i t�n", 40}
			},
		},
		[33] = { szTitleMsg = "<dec>Sau khi h�i �� c�c �i�u ki�n b�n d��i, ng��i c� th� ��n Hoa S�n (293.218) t�m T�ng Kim ch��ng m�n nh�n �� th�nh l�p bang h�i.<enter>1.Gamer kh�ng thu�c bang h�i, m�n ph�i n�o, hi�n l�n ch� ��.��ng c�p tr�ng sinh 2 150 tr� l�n<enter>3.gi� tr� thanh v�ng 450 tr� l�n, thanh v�ng c� th� nh�n ���c th�ng qua l�m nhi�m v�, bao g�m nhi�m v� t�n th� <enter>4 t� l� th�ng k� 30 tr� l�n <enter>5. chi�n l�i ph�m T�ng Kim ��i th�nh:Nh�c V��ng Ki�m (�i�m t�ch lu� t�ng Kim c� th� d�ng �� ��i Nh�c V��ng h�n th�ch t�i Qu�n Nhu Quan, 100 Nh�c V��ng H�n Th�ch c� th� ��i ���c 1 thanh Nh�c V��ng Ki�m; c� th� mua tr�c ti�p Nh�c V��ng Ki�m l� bao t�i K� Tr�n C�t m� ra �� nh�n).<enter>6.Ti�n:100 v�n l��ng",tbOpt = {{"Tr� v�", 32},},},
		[34] = { szTitleMsg = "<dec>Ng��i c� th� t�i ch� t� r��u c�a th�t ��i th�nh th� s� d�ng d�o c�'Thanh ��ng ��nh' �� thi�t l�p m�t t�m b�n �� ��c l�p c�a bang h�i, ��i v�i b�y th�nh th� kh�c nhau th� b�n �� s� kh�c nhau",tbOpt = {{"Tr� v�", 32},},},
		[35] = { szTitleMsg = "<dec>ng��i c� th� ra l�nh cho nhi�u nh�t l� 7 tr��ng l�o, nhi�u nh�t 56 ��i tr��ng, ��i v�i c�c h� ph�i kh�c nhau c� th� ��i nhi�u nh�t 56 t�n, m�i t�n d�i nh�t l� 4 ch� h�n",tbOpt = {{"Tr� v�", 32},},},
		[36] = { szTitleMsg = "<dec>Qu� bang h�i l� m�t h� th�ng chung, d�ng �� c�t gi� t�i s�n chung c�a bang h�i",tbOpt = {{"Tr� v�", 32},},},
		[37] = { szTitleMsg = "<dec>Ng��i c� th� th�ng qua ph��ng th�c ti�n th��ng �� ph�n chia qu� cho c�c th�nh vi�n bang h�i, c� th� th�ng qua giao di�n ti�n th��ng ph�n chia ph�t th��ng cho 3 c�p b�c kh�c nhau c�a bang h�i l� tr��ng l�o, ��i tr��ng v� bang ch�ng",tbOpt = {{"Tr� v�", 32},},},
		[38] = { szTitleMsg = "<dec>Ng��i c�ng c� th� li�n k�t v�i c�c bang h�i kh�c l�p th�nh li�n minh bang h�i, trong m�i bang h�i li�n minh c�n ph�i c� m�t bang h�i minh ch�, c� �t nh�t m�t bang h�i th�nh vi�n, v� kh�ng v��t qu� 7 bang h�i th�nh vi�n",tbOpt = {{"Tr� v�", 32},},},
		[39] = { szTitleMsg = "<dec>Do h� th�ng ch�n ng�u nhi�n m�t trong c�c t�nh n�ng T�ng Kim, D� T�u, V��t A�,�Ch� c� bang h�i m�i ho�n th�nh nhi�m v� n�y.C�c th�nh vi�n bang h�i ��u c� th� nh�n ���c nh�ng l�i �ch phong ph�, bang ch� c�n c� th� nh�n ���c l�nh b�i BOSS",tbOpt = {{"Tr� v�", 32},},},
		[40] = { szTitleMsg = "<dec>Khi bang h�i ng��i kh�ng �� 16 ng��i th� s� ti�n v�o k� kh�o nghi�m, n�u nh� sau 3 ng�ys� th�nh vi�n kh�ng �� 16 ng��i th� bang h�i s� gi�i t�n. H�y t�o t�nh �o�n k�t gi�a c�c anh em trong bang",tbOpt = {{"Tr� v�", 32},},},
	};
	
function main()
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex);
	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = "<npc>V� thi�u hi�p n�y c� mu�n gia nh�p bang h�i kh�ng?"
	
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog)
	
	tbDailog:AddOptEntry("Xem tin t�c h� tr� bang h�i", TongHelp);
	tbDailog:AddOptEntry("M� giao di�n chi�u m� bang h�i", NeedOpenTongZhaoMu);
	
	tbDailog:Show()
end

function jianghuxing_showdiag(nidx, nbackidx)
	local tb_dailog = {};
	
	if (not TB_JiangHuXingBaoDian[nidx].szTitleMsg) then
		print("Error!!There Is No Titlemsg!!");
		return
	end
	
	tb_dailog[1] = TB_JiangHuXingBaoDian[nidx].szTitleMsg;
	
	if (TB_JiangHuXingBaoDian[nidx].tbOpt) then
		for nkey, szopp in TB_JiangHuXingBaoDian[nidx].tbOpt do
			tinsert(tb_dailog, format("%s/#jianghuxing_showdiag(%d)", szopp[1], szopp[2]));
		end
	end
	
	tinsert(tb_dailog, "K�t th�c ��i tho�i/OnCancel");
	
	CreateTaskSay(tb_dailog);
end

function OnCancel()
end

function NeedOpenTongZhaoMu()
	OpenTongZhaoMu()
end

function TongHelp()
	jianghuxing_showdiag(32)
end
