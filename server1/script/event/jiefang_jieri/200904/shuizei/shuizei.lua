Include("\\script\\event\\jiefang_jieri\\200904\\taskctrl.lua");
Include("\\script\\lib\\awardtemplet.lua")
--Phong v�n l�nh b�i - ho�n th�nh 1 l�n nhi�m v� thu th�p c�ng tr�ng l�nh - Modified by DinhHQ - 20110920
Include("\\script\\activitysys\\g_activity.lua")
tbjf0904_shuizei_exp =
{
	[1]	= {nExp = 30, 	nRate = 0.3},
	[2]	= {nExp = 30, 	nRate = 0.4},
	[3]	= {nExp = 30, 	nRate = 0.2},
	[4]	= {nExp = 30, 	nRate = 0.05},
	[5]	= {nExp = 30, 	nRate = 0.05},
};


function join_shuizei_act()
	if (0 == jf0904_shuizei_IsActtime()) then
		Say("Kh�ng ph�i l� trong th�i gian ho�t ��ng.", 0);
		return
	end
	
	jf0904_InitTaskctrl();
	
	if(GetTask(jf0904_TSK_shuizei_GetTask) ~= 0) then
		Say("Ng��i �� nh�n nhi�m v� ti�u di�t th�y t�c r�i.", 0);
		return
	end
	
	Say("Thuy�n phu b� B�c: D�o n�y Th�y T�c th��ng ho�nh h�nh b� ��o, c��p b�c nhi�u chi�c thuy�n qua l�i 2 b� Phong L�ng ��. Ng��i c� mu�n th� thi�n h�nh ��o, ti�u di�t nh�ng t�n c��p n�y kh�ng?", 2, "Ta �� cho ch�ng 1 b�i h�c ��ch ��ng./join_shuizei_act_cf", "Ta �ang r�t b�n, khi kh�c s� quay l�i./OnCancel");
end

function join_shuizei_act_cf()
	if (GetLevel() < 50 or GetExtPoint(0) < 1) then
		Say("��i hi�p v�n ch�a �� c�p 50 ho�c v�n ch�a n�p th�, v� v�y kh�ng th� tham gia ho�t ��ng", 0);
		return
	end

	if (GetTask(jf0904_TSK_shuizei_FulfilTaskTime) <= 0) then
		Say("H�m nay kh�ng th� nh�n th�m nhi�m v� Ti�u di�t th�y t�c n�a.", 0);
		return
	end
	
	Say("Nh�n nhi�m v� ti�u di�t th�y t�c th�nh c�ng!", 0);
	SetTask(jf0904_TSK_shuizei_FulfilTaskTime, GetTask(jf0904_TSK_shuizei_FulfilTaskTime) - 1);
	SetTask(jf0904_TSK_shuizei_GetTask, 1);
end

function fullfill_shuizei_act()
	if (0 == jf0904_shuizei_IsActtime()) then
		Say("Kh�ng ph�i l� trong th�i gian ho�t ��ng.", 0);
		return
	end
	
	if (GetTask(jf0904_TSK_shuizei_GetTask) ~= 1) then
		Say("V�n ch�a nh�n nhi�m v� th�y t�c, v� v�y kh�ng th� tr� nhi�m v� ���c!", 0);
		return
	end
	
	give_shuizei_award_lingpai();
end


function give_shuizei_award_lingpai()
	GiveItemUI("Giao truy c�ng l�nh", "Xin m�i b� truy c�ng l�nh v�o � b�n d��i, m�i l�n ch� ���c b� 1 c�i.", "submit_zhuigongling", "no")
end

function submit_zhuigongling(nCount)
	if (nCount ~= 1) then
		Say("B� v�o s� l��ng kh�ng ��ng!", 2, "Xin l�i! Ta s� b� l�i./give_shuizei_award_lingpai", "Ta s� quay l�i sau/no")
		return 
	end
	local nItemIdx = GetGiveItemUnit(1);
	local ng, nd, np = GetItemProp(nItemIdx);
	if (ng == 6 and nd == 1 and np == 2015) then
		RemoveItemByIndex(nItemIdx);
		SetTask(jf0904_TSK_shuizei_GetTask, 0);
		Say("Thuy�n phu: Ch�c m�ng ��i hi�p! ��y l� ph�n th��ng x�ng ��ng d�nh cho v� anh h�ng.", 0);
		--Phong v�n l�nh b�i - ho�n th�nh 1 l�n nhi�m v� thu th�p c�ng tr�ng l�nh - Modified by DinhHQ - 20110920
		G_ACTIVITY:OnMessage("FLD_Collect_Item_VNG");
		give_shuizei_award_exp();
	else
		Say("V�t ph�m b�n �� v�o kh�ng ch�nh x�c!", 2, "Xin l�i! Ta s� b� l�i./give_shuizei_award_lingpai", "Ta s� quay l�i sau/no");
	end
end


function give_shuizei_award_exp()
	local nstep = random(1, 100000);
	local ncurstep 	= 0;
	local naddedexp = 0;
	for i = 1, getn(tbjf0904_shuizei_exp) do
		if (ncurstep + tbjf0904_shuizei_exp[i].nRate * 100000 >= nstep) then
			naddedexp = tbjf0904_shuizei_exp[i].nExp;
			break;
		end
		ncurstep = ncurstep + tbjf0904_shuizei_exp[i].nRate * 100000;
	end
	
	AddOwnExp(naddedexp * 10000);
	
end

function jf0904_shuizei_IsActtime()
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	return (nDate >= jf0904_act_dateS);
end

function about_shuizei()
	Say("L� quan: Ho�t ��ng ti�u di�t th�y t�c b�t ��u t� ng�y 28/04/2009. Trong th�i gian ho�t ��ng ��i hi�p c� th� ��n 6 �i�m c�a b� b�c nam Phong L�ng �� �� l�nh th��ng.", 0);
end