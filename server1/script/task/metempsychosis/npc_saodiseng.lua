-- ====================== �ļ���Ϣ ======================

-- ������Ե�����Խ�ϰ� - NPC�Ի�����
-- �ļ�������npc_saodiseng.lua
-- �����ߡ����ӷ��~
-- ����ʱ�䣺2009-02-04 16:25:15

-- ======================================================
Include("\\script\\task\\metempsychosis\\task_head.lua")
Include("\\script\\task\\metempsychosis\\task_func.lua")
Include("\\script\\task\\metempsychosis\\translife_4.lua")
Include("\\script\\task\\metempsychosis\\translife_5.lua")

-- ��Խ��ǿ��Ǩ�Ƶ� �������˴�
function beidou_translife_main()
	CreateTaskSay({"<dec><npc>L�i ��n 1 ng��i n�a? Xem ra chuy�n ta ��t ���c <B�c ��u Tr��ng Sinh Thu�t - T�m Ph�p Thi�n> kh�ng c�n l� b� m�t n�a r�i. L� n�o vi�c ph� v� c�ng kh�ng l�m cho thi�n h� s� h�i hay sao. Vi�c �� nh� th� n�y r�i, ng��i t�m ta c� vi�c g�.",		"Ph� v� c�ng? Ng��i ��ng d�a ta ch�?/zhuansheng_ondialog",
		"Ki�m tra s� l��ng tr�ng c�y tr�ng sinh 5/TRANSLIFE5_queryTreeNumber",
		"Ki�m tra k� n�ng tr�ng sinh 4 c�n d� �i�m k� n�ng/querySkillPoint_4",
		"T�y �i�m k� n�ng tr�ng sinh 4/wantClearSkillPoint_4",
		"V� c�ng, t�m ph�p c�i g�! L�i th�m 1 k� �i�n kh�ng/OnCancel"
		});
end

function zhuansheng_ondialog()
	if (GetTask(TSK_ZHUANSHENG_FLAG) == 1) then
		Msg2Player("�� h�c <B�c ��u Tr��ng Sinh Thu�t - C� S� Thi�n>");
	end
	
	local tbOpp = {"<dec><npc>Kh�ng sai, l� n�o ng��i kh�ng bi�t? Tu luy�n B�c ��u Tr��ng Sinh Thu�t xong. C�p b�c c�a ��i hi�p s� th�nh c�p 10, t�t c� k�  n�ng v� c�ng s� b� ph�, ��t ��n c�p b�c t��ng �ng  m�i c� th� h�i ph�c (c�p 90, 120 s� kh�i ph�c c�c k� n�ng v�n c�). Ngo�i ra, s� b�o l�u t�t c� nh�ng �i�m k� n�ng v� ti�m n�ng c�a ��i hi�p.<enter> N�i chung, ��i hi�p c�n b�t ��u t� ��u. Nh�ng c�ng ��ng  qu� n�n n�ng, ��i ng��i l�n c�p 120 130 s� t�i xu�t  giang h�, thi�n h� n�y v�n l� thi�n h� c�a ng��i m�."};
	local n_level = GetLevel();
	local n_transcount = ST_GetTransLifeCount();
	
	local n_date = tonumber(GetLocalDate("%Y%m%d"));
	
	if (n_transcount == 0 and n_level == 199 and (n_date >= ZHUANSHENG_ITEM_BEGIN and n_date <= ZHUANSHENG_ITEM_ENDLE)) then --��Ҫ����ʱ������
		tinsert(tbOpp, "Ta mu�n t�m hi�u v� B�c ��u Ti�n ��n/zhuansheng_xiandan");
	end
	
	tinsert(tbOpp, "Xin h�i tu luy�n <B�c ��u Tr��ng Sinh Thu�t - T�m Ph�p Thi�n> c�n nh�ng �i�u ki�n g�?/zhuansheng_help_require");
	tinsert(tbOpp, "L�m th� n�o c� th� h�c <B�c ��u Tr��ng Sinh Thu�t - T�m Ph�p Thi�n>?/zhuansheng_help_method");
	tinsert(tbOpp, "Xin h�i ��ng c�p c�a ta c� th� l�u gi� bao nhi�u �i�m k� n�ng v� ti�m n�ng?/zhuansheng_help_prop");
	tinsert(tbOpp, "Xin h�i ta c� th� tu luy�n ��n m�c �� n�o r�i?/zhuansheng_query");
	tinsert(tbOpp, "Xin h�i th�i gian �� chuy�n sinh l�n k� ti�p: /zhuansheng_time");
	tinsert(tbOpp, " K�t th�c ��i tho�i!/OnCancel");
	
	CreateTaskSay(tbOpp);
end

--ת��������
function zhuansheng_help_require()
	
	CreateTaskSay({"<dec><npc>�i�u ki�n r�t ��n gi�n"
		.."<enter>  ".."1. Y�u c�u ��ng c�p tr�ng sinh:"
		.."<enter>    "..format("L�n tr�ng sinh th� %d, ��ng c�p kh�ng ���c nh� h�n %d", 1, TB_LEVEL_LIMIT[1])
		.."<enter>    "..format("L�n tr�ng sinh th� %d, ��ng c�p kh�ng ���c nh� h�n %d", 2, TB_LEVEL_LIMIT[2])
		.."<enter>    "..format("L�n tr�ng sinh th� %d, ��ng c�p kh�ng ���c nh� h�n %d", 3, TB_LEVEL_LIMIT[3])
		.."<enter>    "..format("L�n tr�ng sinh th� %d, ��ng c�p kh�ng ���c nh� h�n %d", 4, TB_LEVEL_LIMIT[4])
		.."<enter>    "..format("L�n tr�ng sinh th� %d, ��ng c�p kh�ng ���c nh� h�n %d", 5, TB_LEVEL_LIMIT[5])
		.."<enter>  ".."2. �� h�c <B�c ��u Tr��ng Sinh Thu�t - C� S� Thi�n>"
		.."<enter>  ".."3. C�i b� t�t c� trang b� v� ng�a tr�n ng��i."
		.."<enter>  ".."4. B�t bu�c ph�i tho�t kh�i chi�n ��i v� l�m li�n ��u."
		.."<enter>  ".."5. Kh�ng ���c c�n nhi�m v� ch�a ho�n th�nh (S�t th�, t�n s�, D� T�u)."
		.."<enter>  ".."6. Chuy�n sinh l�n th� 1 ��n th� 3 c�n c� 100 v�n l��ng, chuy�n sinh l�n th� 4 c�n c� 200 v�n l��ng"
		.."<enter>  "..format("7. Chuy�n sinh l�n 4 c�n c� %d c�i %s.", TBITEMNEED_4[1].nCount, TBITEMNEED_4[1].szName)
		.."<enter>  "..format("8. Chuy�n sinh l�n 4 c�n c� %d c�i %s.", TBITEMNEED_4[2].nCount, TBITEMNEED_4[2].szName)
		.."<enter>  ".."9. Ch�a nh�n ho�c ch�a ho�n th�nh nhi�m v� k� n�ng c�p 150"
		.."<enter>  "..format("10. tr�ng sinh l�n 5 y�u c�u %d c�i %s", TBITEMNEED_5[1].nCount, TBITEMNEED_5[1].szName)
		--.."<enter>  "..format("11. tr�ng sinh l�n 5 y�u c�u %d c�i %s", TBITEMNEED_5[2].nCount, TBITEMNEED_5[2].szName)
		--.."<enter>  "..format("12. tr�ng sinh l�n 5 y�u c�u %d c�i %s", TBITEMNEED_5[3].nCount, TBITEMNEED_5[3].szName)
		--.."<enter>  ".."13. tr�ng sinh l�n 5 c�n ph�i tr�ng 400 C�y Thi�n L�c.",
		"T�m hi�u vi�c kh�c./zhuansheng_ondialog",
		"Ta hi�u r�i./OnCancel"});
end

--ת���ĺô�
function zhuansheng_help_effect()
	CreateTaskSay({"<dec><npc>1. Thu ���c �i�m d� k� n�ng v� ti�m n�ng"
	.."<enter>  ".."2. Thu ���c kh�ng t�nh c� gi�i h�n cao h�n, c� ���c n�ng l�c sinh t�n nhi�u h�n."
	.."<enter>  ".."3. T�ng gi�i h�n k� n�ng v� c�ng cao nh�t, s� c� ���c l�c c�ng k�ch m�nh h�n v� t�c �� ��nh nhanh h�n."
	.."<enter>  ".."4. C� th� s� d�ng 1 s� trang b� m�i nh�t"
	.."<enter>  ".."5. Thu ���c c� h�i 1 l�n t�y �i�m mi�n ph�",
		"T�m hi�u vi�c kh�c./zhuansheng_ondialog",
		"Ta hi�u r�i./OnCancel"});
end

--���ѧϰת��
function zhuansheng_help_method()
	CreateTaskSay({"<dec><npc>N�u nh� ng��i �� h�c qua <B�c ��u Tr��ng Sinh Thu�t - C� S� Thi�n>, th� ta c� th� ��c kh�u   quy�t d�y ng��i <B�c ��u Tr��ng Sinh Thu�t - T�m Ph�p Thi�n>."
		.. "Chuy�n sinh l�n 1 ��n l�n 3 c�n c� 10 ng�n v�n l��ng l� ���c, chuy�n sinh l�n 4 th� ph�i 20 ng�n v�n, ha ha."
		.. "<enter>Nh�c nh� m�t ch�t l�, n�u nh� mu�n chuy�n sinh l�n 4, tr��c ti�n b�n th�n m�nh c�n ph�i nh�n nhi�m v�, sau �� h�y �i"
		.. "<color=yellow>Tr��ng B�ch S�n Nam, D��c V��ng ��ng T�ng 4, Sa M�c S�n ��ng 3, Kh�a Lang ��ng <color> ��nh b�i <color=yellow> S��ng �ao, Xuy�n S�n, T�t Phong, �nh C�n <color>"
		.. "M�i c� t� l� nh�t ��nh nh�n ���c T�ch L�ch ��n v�t c�n thi�t �� chuy�n sinh 4."
		.. "<enter>  N�u mu�n tr�ng sinh 5, c�n ph�i nh�n nhi�m v�, sau �� tham gia "
		.. "<color=yellow>Chi�n Tr��ng T�ng Kim <color> �i�m t�ch l�y <color=yellow> 300 �i�m <color> tr� l�n."
		.. "S� d�ng <color=yellow> Long Huy�t Ho�n <color> tham gia <color=yellow> th�i gian khi�u chi�n <color> v� v��t qua <color=yellow> �i <color> th� 17."
		.. "S� d�ng <color=yellow> Vi�m �� L�nh <color> tham gia <color=yellow> Vi�m �� b�o T�ng <color> v� v��t qua <color=yellow> �i <color> th� 6."
		.. "C� th� nh�n <color=yellow>V� C�c Ti�n ��n<color>, m�<color=yellow>Tinh M� B�o R��ng, Qu� Tr�ng B�o R��ng<color>c� th� nh�n ���c<color=yellow>H�c Long Ti�n ��n<color>."
		.. "��ng th�i c�n ph�I tr�ng<color=yellow>400 C�y Thi�n L�c<color>.",
		"���c, ta mu�n h�c ngay./zhuansheng_want_learn",
		"Nh�n nhi�m v� chuy�n sinh 4/wantGetTranslifeTask_4",
		"Nh�n nhi�m v� tr�ng sinh 5/TRANSLIFE5_wantGetTranslifeTask",
		"Ta mu�n t�m hi�u chi ti�t h�n/zhuansheng_ondialog",
		"Ta bi�t r�/OnCancel"});
end

--��Ҫѧϰת��
--�ڴ��ж��Ƿ����ת��������
function zhuansheng_want_learn()
	local n_transcount = ST_GetTransLifeCount()
	
	if (n_transcount >= NTRANSLIFE_MAX) then
		CreateTaskSay({"<dec><npc>"..format("L�n chuy�n sinh th� %d v�n ch�a m�, th�i gian c� th� s� c�p nh�t sau", NTRANSLIFE_MAX+1), 
			" K�t th�c ��i tho�i!/OnCancel"});
		return 0;
	end

	if (check_zhuansheng() == 0) then
		return 0;
	end
	
	if (n_transcount == 0) then
		CreateTaskSay({"<dec><npc>".."L�n chuy�n sinh th� nh�t 5 lo�i ph�ng ng� s� gia t�ng.", 
			"���c, ta mu�n h�c ngay./#zhuansheng_sure_learn(-1)", " K�t th�c ��i tho�i!/OnCancel"});
	elseif (n_transcount < 0 or n_transcount >=5) then
		Say("Tr�ng th�i b�t th��ng xin m�i li�n l�c v�i nh� �i�u h�nh x� l�.", 0);
	else
		local tbOpp = {"<dec><npc>".."Xin m�i ch�n �i�m ph�ng ng� mu�n t�ng:"};
		
		for k, sz in TB_BASE_RESIST do
			tinsert(tbOpp, format("%s%s/#zhuansheng_sure_learn(%d)", "+", sz, k));
		end
		tinsert(tbOpp, " K�t th�c ��i tho�i!/OnCancel")
		CreateTaskSay(tbOpp);
		
	end
end

function zhuansheng_sure_learn(n_resist)
	if (check_zhuansheng() == 0) then
		return 0;
	end
	
	local n_transcount = ST_GetTransLifeCount();
	
	if (n_transcount >= 2) then
		for i = 2, n_transcount do
			local n_translevel, n_transresist = zhuansheng_get_gre(i);
			if (n_translevel ~= 0 and n_transresist == n_resist) then
				CreateTaskSay({"<dec><npc>"..format("��y l� l�n chuy�n sinh th� %d v� �� ch�n %s kh�ng th� ch�n nhi�u l�n 1 �i�m ph�ng ng�, xin m�i h�y ch�n l�i.", i, TB_BASE_RESIST[n_resist]),
								"Ta mu�n ch�n l�i/zhuansheng_want_learn",
								" K�t th�c ��i tho�i!/OnCancel"});
				return 0;
			end
		end
	end
	
	SetTaskTemp(TSKM_ZHUANSHENG_RESISTID, n_resist);
	if (n_transcount == 2 and GetLevel() >= 190) then
		SetTask(TSK_ZHUANSHENG_AWARD, 1);
	end
	local nlevel = GetLevel();
	--ת��ʱ�Ĵ���
	LeaveTeam();	--��ɢ��ӹ�ϵ
	
	ST_DoTransLife();		--ִ��ת�������Զ�����\\script\\global\\translife.lua��main���� ����ֵΪ1Ϊ�ɹ����ɹ�����¼ת��ǰ�ĵȼ���
	
	CreateTaskSay({"<dec><npc>Ng��i �� h�c <B�c ��u Tr��ng Sinh Thu�t - T�m Ph�p Thi�n> r�i.", "�a ta s� ph� �� ch� gi�o/OnCancel"});
end

function check_zhuansheng()
	-- Խ�ϰ�������ת�� ��� 5��
	if (check_zhuansheng_level() ~= 1) then	
		return 0;
	end
	
	if zhuansheng_check_common() ~= 1 then
		return 0
	end

	local ntranscount = ST_GetTransLifeCount()
	--Make change translife for free - Modified by DinhHQ - 20130531
--	if (ntranscount == 2 and GetCash() < 3000000) then				--jxbҪ1��
--		CreateTaskSay({"<dec><npc>H�nh nh� ti�n v�n ch�a �� <color=red>3000000<color>.", "���c r�i./OnCancel"});
--		return 0;
--	end
	-- ��Ҫ��4��ת�����ж��Ƿ����999��������������������������ķ� �� ����jxb
--	if ntranscount == 3 then
		--Make change translife for free - Modified by DinhHQ - 20130531
--		for i=1,getn(TBITEMNEED_4) do
--			local tbProb = TBITEMNEED_4[i].tbProb
--			if CalcItemCount(3,tbProb[1], tbProb[2],tbProb[3], -1) < TBITEMNEED_4[i].nCount then
--				CreateTaskSay({TB_TRANSLIFE_ERRORMSG[13 + i], "���c r�i./OnCancel"})
--				return 0
--			end
--		end
		
		-- 4ת����jxb
--		if GetCash() < ZHUANSHENG_TUITION_4 then	
--			CreateTaskSay({TB_TRANSLIFE_ERRORMSG[13], "���c r�i./OnCancel"});
--		return 0;
--		end
--	end
	
	-- 5ת�ж�
	if ntranscount==4 and TRANSLIFE5_canTranslife()==0 then
		return 0
	end
	
	-- ����ֵ����Ϊ��GetExp()>=0
	if GetLevel()==200 and GetExp()<0 then 
		CreateTaskSay({TB_TRANSLIFE_ERRORMSG[20], "���c r�i./OnCancel"})
		return 0
	end
	
	--������ɱ������
	return 1;
end	

--ת�����ܱ�����Ǳ�ܵ� ���ܵ�˵��
function zhuansheng_help_prop()
	local nlevel = GetLevel();
	local ncurexp = GetExp();
	local ntranscount = ST_GetTransLifeCount();
	
	if (check_zhuansheng_level() ~= 1) then
		return 0;
	end
	
	local nmgpoint, nprop, nresist, naddskill  = 	TB_LEVEL_REMAIN_PROP[nlevel][ntranscount+1][1],
													TB_LEVEL_REMAIN_PROP[nlevel][ntranscount+1][2],
													TB_LEVEL_REMAIN_PROP[nlevel][ntranscount+1][3],
													TB_LEVEL_REMAIN_PROP[nlevel][ntranscount+1][4];
	
	local sz_res = "Ch�n 1 lo�i kh�ng t�nh";
	local sz_addskill = "";
	
	if (ntranscount == 0) then
		sz_res = "T�t c� kh�ng t�nh";
	end
	
	if (nlevel == 199 and ncurexp >= ZHUANSHENG_XIANDAN_MINEXP and ntranscount == 0) then
		nmgpoint, nprop, nresist, naddskill  = 	TB_LEVEL_REMAIN_PROP[200][ntranscount+1][1],
												TB_LEVEL_REMAIN_PROP[200][ntranscount+1][2],
												TB_LEVEL_REMAIN_PROP[200][ntranscount+1][3],
												TB_LEVEL_REMAIN_PROP[200][ntranscount+1][4];
		sz_addskill = "[Hi�n t�i kinh nghi�m �� v��t qu� 2 t�:]";
	end
	
	CreateTaskSay({"<dec><npc>"..format("Theo nh� c�p %d c�a ng��i v� tr�ng sinh %d l�n, %s c� th� t�ng <color=yellow>%d<color> ti�m n�ng, <color=yellow>%d <color> k� n�ng, t�ng <color=yellow>%d%%<color> kh�ng t�nh (%s), n�ng cao <color=yellow>%d <color> gi�i h�n k� n�ng cao nh�t.", 
				nlevel, (ntranscount+1), sz_addskill, nprop, nmgpoint, nresist, sz_res, naddskill), 
		"T�m hi�u vi�c kh�c./zhuansheng_ondialog",
		"���c r�i./OnCancel"});
end


function zhuansheng_query()
	--do return Say("δ���", 0)end
	local n_transcount = ST_GetTransLifeCount();
	local nmgpoint, nprop, nskill = 0,0,0;
	local tbresist = {0, 0, 0, 0, 0};
	local sz_msg = "";
	
	if (n_transcount ~= 0) then
		for i = 1, n_transcount do
			nlevel, nresistid = zhuansheng_get_gre(i);
			
			nmgpoint = TB_LEVEL_REMAIN_PROP[nlevel][i][1] + nmgpoint;
			nprop  = TB_LEVEL_REMAIN_PROP[nlevel][i][2] + nprop;
			nskill = TB_LEVEL_REMAIN_PROP[nlevel][i][4] + nskill;
			if (nresistid >= 0 and nresistid <= 4) then
				tbresist[nresistid+1] = tbresist[nresistid+1] + TB_LEVEL_REMAIN_PROP[nlevel][i][3];
				sz_msg = sz_msg.."<enter>"..format("Tr�ng sinh l�n %d ��ng c�p: %d; ch�n kh�ng t�nh: %s", i, nlevel, TB_BASE_RESIST[nresistid]);
			elseif (nresistid == 255) then
				tbresist[1] = tbresist[1] + TB_LEVEL_REMAIN_PROP[nlevel][i][3];
				tbresist[2] = tbresist[2] + TB_LEVEL_REMAIN_PROP[nlevel][i][3];
				tbresist[3] = tbresist[3] + TB_LEVEL_REMAIN_PROP[nlevel][i][3];
				tbresist[4] = tbresist[4] + TB_LEVEL_REMAIN_PROP[nlevel][i][3];
				tbresist[5] = tbresist[5] + TB_LEVEL_REMAIN_PROP[nlevel][i][3];
				sz_msg = sz_msg.."<enter>"..format("Tr�ng sinh l�n %d ��ng c�p: %d; ch�n kh�ng t�nh: %s", i, nlevel, "T�t c� kh�ng t�nh");
			end
		end
	end
	
	CreateTaskSay({format("%s<enter>%s<enter>%s<enter>%s<enter>%s<enter>%s<enter>%s<enter>%s<enter>%s<enter>%s%s", 
					"<dec><npc>",
					format("S� l�n chuy�n sinh: %d", n_transcount),
					format("Thu ���c �i�m k� n�ng: %d", nmgpoint),
					format("Thu ���c �i�m ti�m n�ng: %d", nprop),
					format("�i�m k� n�ng cao nh�t t�ng th�m: %d", nskill),
					format("H�a ph�ng t�ng: %d", tbresist[1]),
					format("B�ng ph�ng t�ng: %d", tbresist[2]),
					format("��c ph�ng t�ng: %d", tbresist[3]),
					format("L�i ph�ng t�ng: %d", tbresist[4]),
					format("Ph� ph�ng t�ng: %d", tbresist[5]),
					sz_msg
					), 
			"T�m hi�u vi�c kh�c./zhuansheng_ondialog",
			"���c r�i./OnCancel"});
	
end


function zhuansheng_xiandan()
	
	CreateTaskSay({"<dec><npc>".."'B�c ��u ti�n ��n' l� lo�i linh d��c m� v� v� l�m cao th� c� n�i c�ng th�m h�u n�o mu�n h�c 'B�c ��u tr��ng sinh thu�t'  ��u ph�i d�ng ��n, sau khi s� d�ng c� th� t�ng th�m nhi�u ph�n c�ng l�c. Ch� t�o B�c ��u Ti�n ��n b�t bu�c c�p 199 v� c� 201000 v�n kinh nghi�m m�i ch� t�o ���c, l�c ch� t�o B�c ��u Ti�n ��n nh�ng kinh nghi�m v��t qu� 2 t� s� chuy�n h�a v�o ti�n ��n. N�n nh� r�ng ph�i chuy�n sinh xong m�i s� d�ng ���c, m�i ng��i nhi�u nh�t s� d�ng 1 linh ��n, ��ng th�i b�t bu�c trong v�ng 30 ng�y ph�i s� d�ng. Ti�n ��n c� ��n v� kinh nghi�m l� 1000 v�n, v� v�y nh�ng kinh nghi�m th�a c� nh�ng s� kh�ng b� l��t b� �i. Ng��i mu�n ch� t�o 'B�c ��u Ti�n ��n' kh�ng?",
				"Ch� t�o B�c ��u Ti�n ��n/zhuansheng_makexiandan",
				"T�m hi�u v� �i�m kinh nghi�m/zhuansheng_help_xiandan",
				"Ta mu�n t�m hi�u th�m./zhuansheng_ondialog",
				" K�t th�c ��i tho�i!/OnCancel"
				});
end


function zhuansheng_makexiandan()
	local n_level = GetLevel();
	local n_transcount = ST_GetTransLifeCount();
	if (n_level ~= 199 or n_transcount ~= 0) then
		return
	end
	
	if (GetTask(TSK_ZHUANSHENG_XIANDAN) > 0) then
		CreateTaskSay({"<dec><npc>".."M�i ng��i ch� c� th� ch� t�o 1 B�c ��u Ti�n ��n, c�c h� kh�ng th� l�m th�.", " K�t th�c ��i tho�i!/OnCancel"});
		return
	end
	
	local n_curexp = GetExp();
	if (n_curexp - ZHUANSHENG_XIANDAN_MINEXP >= ZHUANSHENG_XIANDAN_BASEEXP) then
		local n_addexp = n_curexp - ZHUANSHENG_XIANDAN_MINEXP;
		n_addexp = floor(n_addexp / 10e7) * 10e7;
		CreateTaskSay({"<dec><npc>".."Ng��i c�"..n_addexp.." kinh nghi�m s� b� chuy�n v�o ti�n ��n. Ng��i c� x�c nh�n mu�n ch� t�o 'B�c ��u Ti�n ��n'?",
				"��ng r�i, ta mu�n luy�n ti�n ��n!/zhuansheng_surexiandan",
				"Ta mu�n t�m hi�u th�m./zhuansheng_ondialog",
				" K�t th�c ��i tho�i!/OnCancel"});
	else
		CreateTaskSay({"<dec><npc>".."Theo nh� c�ng l�c c�a c�c h� kh�ng th� luy�n th�nh B�c ��u Ti�n ��n, mu�n luy�n th�nh ti�n ��n th� xin h�y luy�n th�m th�i gian n�a nh�!",
				"Ta mu�n t�m hi�u th�m./zhuansheng_ondialog",
				" K�t th�c ��i tho�i!/OnCancel"});
	end
end


function zhuansheng_surexiandan()
	local n_level = GetLevel();
	local n_transcount = ST_GetTransLifeCount();
	if (n_level ~= 199 or n_transcount ~= 0) then
		return
	end
	
	if (CalcFreeItemCellCount() < 10) then
		CreateTaskSay({"<dec><npc>".."H�nh trang kh�ng �� 10 �, xin m�i h�y thu d�n h�nh l�.", " K�t th�c ��i tho�i!/OnCancel"});
		return
	end
	
	local n_curexp = GetExp();
	if (n_curexp - ZHUANSHENG_XIANDAN_MINEXP >= ZHUANSHENG_XIANDAN_BASEEXP) then
		local n_addexp = n_curexp - ZHUANSHENG_XIANDAN_MINEXP;
		
		local nitemidx = AddItem(6,1,1970,1,1,0);
		if (nitemidx > 0) then

			ReduceOwnExp(n_addexp);
			
			SetSpecItemParam(nitemidx, 1, floor(n_addexp / ZHUANSHENG_XIANDAN_BASEEXP));
			ITEM_SetExpiredTime(nitemidx, ZHUANSHENG_ITEM_EXTIME);	-- ��Ч��30��
			SyncItem(nitemidx);
			SetTask(TSK_ZHUANSHENG_XIANDAN, 1);
			WriteLog(format("[%s]\t%s\tName:%s\tAccount:%s\tMakeSuccess,LEVEL:%d,FACTION:%d,ReduceExp:"..n_addexp..",ItemExp:%d",
						"B�c ��u Ti�n ��n",
						GetLocalDate("%Y-%m-%d %X"),GetName(), GetAccount(),
						GetLevel(), GetLastFactionNumber(), floor(n_addexp / ZHUANSHENG_XIANDAN_BASEEXP)));
			Msg2Player(format("Thu ���c 1 %s", "B�c ��u Ti�n ��n"));
		end
	end
	
end


function zhuansheng_help_xiandan()
	CreateTaskSay({"<dec><npc>".."Ph�m nh�ng ng��i c� c�p 199 v� h�n 2 t� kinh nghi�m tu luy�n 'B�c ��u Tr��ng Sinh Thu�t' s� ���c n�ng cao nh�ng thu�c t�nh, nh�ng nh�ng kinh nghi�m th�a ra s� b� l�ng ph�. V� v�y c� m�t ng�y kia ta v� 1 v� �n s� ph�t minh ra lo�i ti�n ��n n�y, th�ng qua 'B�c ��u Ti�n ��n' ng��i c� th� l�u gi� nh�ng kinh nghi�m c�n th�a �� l�c tr�ng sinh xong th� c� th� s� d�ng.",
				"Ta mu�n t�m hi�u th�m./zhuansheng_ondialog",
				" K�t th�c ��i tho�i!/OnCancel"});
end


function zhuansheng_time()
	local ntranscount = ST_GetTransLifeCount();
	local n_last_time = GetTask(TSK_ZHUANSHENG_LASTTIME);
	local n_cur_time = GetCurServerTime();
	local n_add_time = n_cur_time - n_last_time;
	
	if (ntranscount == 0) then
		CreateTaskSay({"<dec><npc>".."C�c h� v�n ch�a h�c B�c ��u Truy�n Sinh Thu�t, ch� c�n �� �i�u ki�n n�y th� c� th� chuy�n sinh ngay l�p t�c.", " K�t th�c ��i tho�i!/OnCancel"})
	else
		if (n_add_time >= TB_TRANSTIME_LIMIT[ntranscount]*24*60*60) then
			CreateTaskSay({"<dec><npc>".."�� �� �i�u ki�n gi�n c�ch th�i gian chuy�n sinh, ch� c�n �� �i�u ki�n th� c� th� l�p t�c chuy�n sinh.", " K�t th�c ��i tho�i!/OnCancel"})
		else
			
			CreateTaskSay({"<dec><npc>"..format("C�n %d ng�y m�i c� th� ti�p t�c chuy�n sinh.",ceil((TB_TRANSTIME_LIMIT[ntranscount]*24*60*60 - n_add_time) / (24*60*60))), " K�t th�c ��i tho�i!/OnCancel"})
		end
	end
end

