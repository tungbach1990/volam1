-- ====================== �ļ���Ϣ ======================

-- ������Ե�����һ׷Ѱ���׵����������׽ű�

-- Edited by �ӷ��~
-- 2008/07/24 13:43

-- ======================================================

Include("\\script\\event\\guoqing_jieri\\200808\\head.lua");	-- ������Ϣ�ļ�
Include("\\script\\lib\\pay.lua");

function main()
	zxmp_reset_vertsk();
	
	if (zxmp_200808_itemdate() ~= 1) then
		Msg2Player("V�t ph�m qu� h�n s� d�ng, t� ��ng m�t �i.")
		return 0;
	end
	
	if (GetLevel() < 50 or IsCharged() == 0) then
			Say("Ch� c� ng��i ch�i c�p tr�n 50 �� n�p th� m�i c� th� s� d�ng.", 0)
		return 1;
	end
	
	local n_ran = random(100*10000);
	local n_sum = 0;
	local n_idx = 0;
	local sz_msg = "";
	
	for i, tb in TB_ZHUIXUNMIPU_ITEMLIST do
		n_sum = n_sum + tb.n_rate * 10000;
		if (n_sum >= n_ran) then
			n_idx = i;
			
			if (tb.n_type == 2) then
				local ng, nd, sz_name = tb.tb_itemid[1], tb.tb_itemid[2], tb.sz_name;
				AddGoldItem(ng, nd);
				sz_msg = format("Nh�n ���c trang b� Ho�ng Kim %s", sz_name);
			elseif (tb.n_type == 1) then
				local ng, nd, np, nl, ns, nlk, sz_name = tb.tb_itemid[1], tb.tb_itemid[2], tb.tb_itemid[3], 
										tb.tb_itemid[4], tb.tb_itemid[5], tb.tb_itemid[6], tb.sz_name;
				AddItem(ng, nd, np, nl, ns, nlk);
				sz_msg = format("Nh�n ���c %s", sz_name);
			elseif (tb.n_type == 3) then
				
				AddRepute(tb.n_repute);
				sz_msg = format("Nh�n ���c %d �i�m danh v�ng", tb.n_repute);
			end
			if (sz_msg ~= "") then
				Msg2Player(sz_msg);
				WriteLog(format("[%s]\t%s\tName:%s\tAccount:%s\t %s��","D��ng sinh b� ph�",
							GetLocalDate("%Y-%m-%d,%X"),
							GetName(),
							GetAccount(),
							sz_msg	));
			end
			break
		end
	end
	
	if (n_idx == 0) then
		return 1;
	end
	
	local n_addexp = zxmp_200808_checkexp();
	
	if (n_addexp <= 0) then
		Msg2Player("�� ��t gi�i h�n 800 tri�u �i�m kinh nghi�m, kh�ng th� ti�p t�c nh�n n�a.");
	else
		AddOwnExp(n_addexp);
		SetTask(TSK_ZXMP_MAXEXP, GetTask(TSK_ZXMP_MAXEXP) + n_addexp);
		Msg2Player(format("B�n nh�n ���c %d �i�m kinh nghi�m.",n_addexp));
		WriteLog(format("[S� d�ng %s]\t%s\tName:%s\tAccount:%s\t t�ng %s �i�m kinh nghi�m.", "D��ng sinh b� ph�",
						GetLocalDate("%Y-%m-%d,%X"),
						GetName(),
						GetAccount(),
						n_addexp	));
	end
end

