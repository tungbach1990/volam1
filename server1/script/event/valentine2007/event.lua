Include("\\script\\event\\valentine2007\\head.lua");

function isValentine2007()
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if (nDate >= 20070213 and nDate <= 20070215) then
		return 1;
	else
		return 0;
	end;
end;

function Valentine2007_main()
	Say("Nguy�t L�o: Kh�ng bi�t t� bao gi�, Giang T�n Th�n l�i b�t ��u m�t b�u kh�ng kh� ng�t ng�o ��n th�. �� ch�c cho ng�y l� ��c bi�t n�y, l�o phu s� t�ng cho c�c v� ��i hi�p m�t �t <color=yellow>H�t hoa h�ng<color>. C�c v� c� th� c�ng 'ng��i �y' ��n nh�ng n�i s�n thanh th�y t�, t� tay tr�ng <color=yellow>c�y hoa h�ng<color> cho ri�ng m�nh.", 3,
			"V�ng, ta mu�n nh�n h�t hoa h�ng/want_take_roseseed",
			"Ta mu�n t�m hi�u ho�t ��ng L� T�nh Nh�n/about_valentine2007", 
			"Ta s� quay l�i sau/no");
end;

function want_take_roseseed()
	if (checkValentine2007Limit() ~= 1) then
		Say("Nguy�t L�o: Th�t ng�i qu�, l�o phu ch� t�ng H�t hoa h�ng cho nh�ng ng��i ch�i <color=yellow>c�p tr�n 80 �� n�p th�<color>.", 0);
		return 0;
	end;
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if (GetTask(TSK_VALENTINE_ROSE_DATE) ~= nDate) then
		Say("Nguy�t L�o: <color=yellow>T� 13/02/2007 ��n h�t 15/02/20007<color>, c�c nh�n s� v� l�m c�p tr�n 80 �� n�p th� m�i c� th� t�m l�o phu �� nh�n <color=yellow>1<color> h�t hoa h�ng, b�n mu�n nh�n kh�ng?", 2, 
		"V�ng, ta mu�n nh�n h�t hoa h�ng/sure_task_roseseed",
		"Ta c� vi�c ph�i �i/no");
	else
		Say("Nguy�t L�o: M�i ng�y ch� c� th� nh�n ���c <color=yellow>1<color> h�t hoa h�ng. H�m nay ch�ng ph�i ng��i �� nh�n r�i hay sao?", 0);
	end;
end;

function sure_task_roseseed()
	if (isValentine2007() == 1) then
		local nDate = tonumber(GetLocalDate("%Y%m%d"));
		if (GetTask(TSK_VALENTINE_ROSE_DATE) ~= nDate) then
			AddItem(6,1,1361,1,0,0);
			SetTask(TSK_VALENTINE_ROSE_DATE, nDate)
			WriteLog(format("[L� Tinh Nh�n 2007]\t%sName:%s\tAccount:%s\t �� nh�n 1 h�t hoa h�ng.", GetLocalDate("%Y-%m-%d %H:%M:%S"), GetName(), GetAccount()));
			Say("Nguy�t L�o: H�t hoa h�ng ��y, h�y mau t�m m�t n�a kia �� tr�ng c�y hoa h�ng �i.", 0);
		end;
	end;
end;

function about_valentine2007()
	Say("Nguy�t L�o: Trong th�i gian ho�t ��ng, ng��i ch�i c�p tr�n 80 �� n�p th� m�i ng�y c� th� nh�n ���c 1 h�t hoa h�ng. C�ng t� ��i v�i m�t ng��i ch�i kh�c ph�i �� c�ng nhau tr�ng hoa. Trong khi tr�ng, tr�n ng�n c�y s� xu�t hi�n 'd�u ch�m than', nh�p v�o c�y hoa h�ng �� nh�n ���c m�t nhi�m v� T��i n��c, B�n ph�n, C�t c� d�i, Di�t s�u b�. N�u ��i b�n ho�n th�nh nhi�m v� tr�n trong th�i gian quy ��nh, thao t�c c�ng ch�nh x�c, hoa h�ng s� c�ng r�c r�. H�y mau ch�ng tham gia!", 0);
end;


