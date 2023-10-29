--==============һ������������===============
Include("\\script\\lib\\common.lua")
Include("\\script\\missions\\leaguematch\\head.lua")
-- �������򣬽�Ʒ��
function tmp_help_award(tbData, nLevel)
	local tbAward	= tbData.award_rank[nLevel]
	local str = "    1. Ph�n th��ng t�ch l�y: b�n th�ng nh�n ���c "..(5*nLevel).."�i�m, h�a "..(2*nLevel).." �i�m, thua: 0 �i�m. M�i tr�n ��u s� c� th�m <color=red>�i�m th��ng kinh nghi�m<color>. Th�ng hay thua ��u c� �i�m th��ng t��ng �ng\n"
		.."    2. Ph�n th��ng x�p h�ng: Sau khi giai �o�n ��u k�t th�c, c�n c� v�o thn�h t�ch chi�n ��i, s� x�p h�ng <color=red> t� 1 ��n "..tbAward[getn(tbAward)][1]..", th�nh vi�n c� th� nh�n ���c ph�n th��ng x�p h�ng (�i�m vinh d�).\n"
		.."    <t>����������\n"
		.."   th� h�ng    ph�n th��ng"
	if (tbData.max_member ~= 1) then
		str	= str.."(Th�nh vi�n chi�n ��i m�i ng��i)"
	end

	local nLastRank	= 1
	for nAward = 1, getn(tbAward) do
		local nRank	= tbAward[nAward][1]
		local szRank
		if (nLastRank == nRank) then
			szRank	= nRank
		else
			szRank	= nLastRank.."-"..nRank
		end
		str = str.."\n"..strfill_left(format("    th� %s ", szRank), 16)..tbAward[nAward][2].."�i�m vinh d�"
		nLastRank	= nRank + 1
	end

	return str
end

-- ��������
-- ��ʽ1��
--	{"��Ŀ����", "��������", 1/2(�޶�����ѡ)},
--	�޶���1��ֻ��Ե������ͣ�2��ֻ��Զ��ˣ�nil��ȫ������ͬ��
-- ��ʽ2��
--	{"��Ŀ����", function(���ذ������ݵĺ���), 1/2(�޶�����ѡ)},
-- ��ʽ3��
--	{
--		"��Ŀ����",
--		{
--			"��������������",
--			"�߼�����������",
--		},
--		1/2(�޶�����ѡ)
--	},
tmp_help = {
	{
		"<t>Gi�i thi�u ",
		{
			"    Lo�i h�nh V� l�m ki�t xu�t li�n ��u l�n n�y l� <color=red><s><color>, ng��i tham gia ��ng c�p ph�i t� <color=red>80-119<color>. Ng��i ch�i ��n g�p <color=red>S� gi� ki�t xu�t<color> b�o danh th�nh l�p chi�n ��i, sau �� v�o H�i tr��ng li�n ��u Ki�t xu�t ti�n h�nh thi ��u",
			"    Lo�i h�nh V� l�m li�n ��u l�n n�y l� <color=red><s><color>, ng��i than gia ��ng c�p ph�i t� <color=red>120<color>. ��n g�p <color=red>S� gi� li�n ��u<color>, b�o danh th�nh l�p chi�n ��i, sau �� v�o H�i tr��ng v� l�m li�n ��u ti�n h�nh thi ��u",
		}
	},
	{"Quy tr�nh b�o danh tham gia thi ��u", "    Trong giai �o�n thi ��u, ng��i ch�i c� th� b�o danh tham gia b�t c� c�c lo�i h�nh thi ��u n�o, nh�ng k�hng ���c ph�p th�nh l�p chi�n ��i m�i", 1},
	{"Quy tr�nh b�o danh tham gia thi ��u", "B�o danh tham gia <s>, c�n ph�i th�nh l�p chi�n ��i. Ng��i ch�i c� th� l�a ch�n chi�n ��i c�a m�nh, c�ng c� th� gia nh�p chi�n ��i ng��i kh�c. Sau khi ��i tr��ng t� ��i v�i ng��i kh�c, s� n�i chuy�n v�i Quan vi�n <t>, ch�n <color=red>chi�n ��i <t> c�a ta, chi�n ��i l�p t�c ���c th�nh l�p. S� l��ng th�nh vi�n t�i �a l� <color=red><d> ng��i<color><e>.", 2},
	{"R�i kh�i ��i thi ��u", "    Trong <color=red>giai �o�n ngh� c�ch kho�ng<color>, ng��i ch�i c� th� t�y � tho�t ly chi�n ��i. Trong giai �o�n thi ��u, n�u chi�n ��i c�a m�nh <color=red>ch�a ��n l�c thi ��u<color>, ng��i ch�i c� th� t� � r�i kh�i chi�n ��i, n�u �� ��u r�i th� kh�ng th� r�i ��i. <color=yellow>Sau khi r�i kh�i chi�n ��i s� kh�ng ���c nh�n ph�n th��ng x�p h�ng<color>. <color=yellow>Sau khi r�i kh�i chi�n ��i ng��i ch�i s� kh�ng th� quay tr� l�i thi ��u<color>.", 1},
	{"R�i kh�i ��i thi ��u", "    Trong <color=red>giai �o�n ngh� c�ch kho�ng<color>, ng��i ch�i c� th� t�y � tho�t ly chi�n ��i. Trong giai �o�n thi ��u, n�u chi�n ��i c�a m�nh <color=red>ch�a ��n l�c thi ��u<color>, ng��i ch�i c� th� t� � r�i kh�i chi�n ��i, n�u �� ��u r�i th� kh�ng th� r�i ��i. <color=yellow>Sau khi r�i kh�i chi�n ��i s� kh�ng ���c nh�n ph�n th��ng x�p h�ng<color>. N�u ��i tr��ng r�i kh�i ��i th� quy�n ��i tr��ng s� ���c chuy�n giao cho ng��i kh�c. <color=yellow>n�u chi�n ��i kh�ng c�n ai th� s� t� ��ng b� gi�i t�n<color>. M�i l�n li�n ��u k�t th�c, chi�n ��i n�o kh�ng ph� h�p cho l�n sau c�ng s� t� ��ng b� gi�i t�n", 2},
	{"S� tr�n thi ��u", "M�i tu�n t� th� Hai ��n th� N�m, t� <color=red>18h: 00- 19h: 00<color> c� th� ��u <color=yellow>4 tr�n<color>. 3 ng�y c�n l�i t� <color=red>18h: 00-19h: 00<color> v� <color=red>21h: 00-22h: 00<color> c� th� ��u <color=yellow>8 tr�n<color>. To�n giai �o�n thi ��u <color=red>(M�i th�ng t� 8-28)<color> ��u t�t c� <color=yellow>108 tr�n<color>. M�i chi�n ��i tham gia t�i �a <color=red>48 tr�n<color> "},
	{"L�u tr�nh thi ��u", "    ��i vi�n c�a chi�n ��i ��i tho�i v�i <t> �� v�o h�i tr��ng <t>, sau �� ti�p t�c ��i tho�i v�i quan vi�n trong h�i tr��ng �� ���c ��a v�o khu v�c chu�n b�. ��n gi� thi ��u, ��i vi�n tham gia s� t� ��ng ���c ��a v�o ��u tr��ng. <color=red>C� th� t� do ch�n binh kh� v� trang b�<color>."},
	{"Quy t�c thi ��u",	-- ����
[[    1������������һ�����Է�ɱ��ʱ��ʤ��
    2���ڱ���������<color=red>������һ�Ӳ���ѡ��ͬʱ���ڱ�������<color>������һ��ֱ�ӻ�ʤ��
    3���ڱ���ʱ�������˫����δ�ֳ�ʤ�������ж�˫����Ч������������Ч���������ٵ�һ����ʤ����һ��Ϊ��������Ч����������ͬ�����ж�ƽ�֡�
    4���μӱ�����<color=red>�ֿյ�ս��<color>ֱ����ʤ��
    5��ս�ӻ��ּ��㣺ʤ�߻�ȡ<pw>�֣�ƽ�߻�ȡ<pt>�֣����߻�ȡ0�֡�
    6������˫���ڱ�����ֻ��ʹ��ҩ����۵ĸ���ҩƷ��
    7��ÿ������˫������<color=red>�볡10���Ӻ�<color>��ʼ����������ʱ��Ϊ 14 ����50�롣
    8��ÿ��������<color=red>��Ъʱ��<color>Ϊ 10 ���ӡ�<color=red>׼��ʱ��<color>Ϊ5���ӡ�
]], 1},
	{"Quy t�c thi ��u",	-- ����
[[    1��������<color=red>����һ�����Է�ѡ��ȫ��ɱ��<color>ʱ��ʤ��
    2���ڱ���������<color=red>������һ�Ӳ���ѡ��ͬʱ���ڱ�������<color>������һ��ֱ�ӻ�ʤ��
    3���ڱ���ʱ�������˫����δ�ֳ�ʤ�������ж�<color=red>ʣ���������ս��<color>��ʤ�����<color=red>˫��ʣ��������ͬ<color>������˫�����ж�Ա��Ч�����������ж�ʤ��,��Ч��������С��һ����ʤ����Ч����������ͬ������ƽ��
    4���μӱ�����<color=red>�ֿյ�ս��<color>ֱ����ʤ��
    5��ս�ӻ��ּ��㣺ʤ�߻�ȡ<pw>�֣�ƽ�߻�ȡ<pt>�֣����߻�ȡ0�֡�
    6������˫���ڱ�����ֻ��ʹ��ҩ����۵ĸ���ҩƷ��
    7��ÿ������˫������<color=red>�볡10���Ӻ�<color>��ʼ����������ʱ��Ϊ 14 ����50�롣
    8��ÿ��������<color=red>׼��ʱ��<color>Ϊ5���ӡ�
]], 2},
	{"<<δ����>>",
[[��Ч��������������ڱ�����������Ϊ�ܵ��Է��˺����жԷ������������ʧ��Ѫ���ܺ�(���������˺�֮ǰ).

��Ч���˼������
    1�������ÿ���ܵ��˺���,�����꿹�ԡ������޼��ȸ��ּӳ����غ�,�������������˺�֮ǰ��Ҫ�۳���Ѫ��������Ч����������;
    2�����ÿ�����ܵ����为��Ѫ����ʧ��Ѫ��������Ч����������;
    3�����ÿ�����ܵ���������ʧ��Ѫ��������Ч�˺�������;
    4�����ÿ���򶾷���������ʧ��Ѫ��������Ч�˺�������;
    5�������ʹ�ü��ܶ����ĵ�Ѫ����������Ч�˺�������.
]]
	},
	{"Quy t�c b�o danh", "    <color=red><t>�i�m t�ch l�y thi ��u <t><color>d�ng �� l�m c�n c� x�p h�ng <t>. K�t th�c tr�n ��u, ��i th�ng nh�n ���c <color=red><pw><color>�i�m, h�a <color=red><pt><color> �i�m; thua <color=red>0<color> �i�m. M�i l�n <t> k�t th�c, c�n c� v�o <color=red>t�ng �i�m c�a chi�n ��i<color> �� x�p th� h�ng. N�u �i�m t��ng ��ng s� c�n c� v�o <color=yellow>t� l� th�ng<color> �� x�p h�ng. n�u t� l� th�ng c�ng t��ng ��ng s� c�n c� v�o <color=green> t�ng s� th�i gian tham gia thi ��u c�a m�i chi�n ��i<color> �� x�p h�ng. Giai �o�n thi ��u <t> sau, �i�m t�ch l�y s� ���c t�nh l�i t� ��u"},
	{"Quy t�c gi�i th��ng", tmp_help_award},
}

tmp_main = {	--officer���Ի�
	"Giang h� phong ba lo�n kh�i, nh�ng b� c�c th�i lai. ��n khi c� 1 anh h�ng ki�t xu�t xu�t hi�n c�ng l� l�c 1 trang s� m�i ���c vi�t n�n. Ai s� l� anh h�ng h�o ki�t th�ng nh�t thi�n h� lo�n tranh n�y v� m�t m�i?",
	"Nh�m �� tr�nh anh h�ng h�o ki�t m�t l�n n�a ph�n tranh c� l�i cho Kim binh, ��c C� Minh ch� �� cho t� ch�c nh�ng cu�c tranhh h�ng quy m� �� t�m ra nh�n t�i ph�c qu�c",
}

tmp_creat = "    sau khi l�p chi�n ��i tham gia <s>, b�n c� th� <color=red>t� m�nh l� ��i tr��ng<color><enter>"
	.."    Sau khi l�p chi�n ��i, b�t c� l�c n�o b�n c�ng c� th� m�i ng��i kh�c tham gia ho�c tham gia v�o t� ��i ng��i kh�c. M�i chi�n ��i ch� ���c t�i �a <d> ng��i (c� ��i tr��ng). <color=red>N�u ch�a ��n l�c thi ��u<color> v� c�ng <color=red>ch�a ��u qua tr�n n�o<color>, ng��i c� th� t�y � ly khai chi�n ��i. Ng��i x�c ��nh l�p chi�n �� c�a m�nh ch�?"

--====Functions====
--���ص�ǰ��ɫ���Բμӵı������ͣ�nilΪ���ܲ���
function tmp_player_type()
	local nLevel = wlls_player_level()
	return iif(nLevel > 0, nLevel, nil)
end

--��鵱ǰ��ɫ�Ƿ���Լ���ָ����ս��
function tmp_check_addmem(n_capidx, n_lid, n_mtype)
	if (n_mtype ~= wlls_player_type()) then
	 	return "Xin l�i! ��i vi�n trong nh�m:"..GetName().." v� <color=red>lo�i h�nh tham gia thi ��u<color> c�a chi�n ��i b�n kh�ng ph� h�p! Cho n�n kh�ng th� v�o chi�n ��i c�a b�n!"
	end
end

function tmp_str(str, tbData)
	str	= gsub(str, "<s>", tbData.name)
	str	= gsub(str, "<d>", tbData.max_member)
	str	= gsub(str, "<e>", tbData.addmem_ex)
	return str
end

function tmp_process_data(tbData)
	-- Ĭ��ֵ
	if (not tbData.addmem_ex) then
		tbData.addmem_ex	= ""
	end
	if (not tbData.text_creat) then
		tbData.text_creat	= tmp_str(tmp_creat, tbData)
	end
	if (not tbData.player_type) then
		tbData.player_type	= tmp_player_type
	end
	if (not tbData.check_addmem) then
		tbData.check_addmem	= tmp_check_addmem
	end

	--������ͼ�����������ҵ�ĳһ��ͼ��Ӧ�ı������͡��������š��������ͣ�
	local tbMapIdx = {}
	for nMType, tbMType in tbData.match_type do
		for nGroup, tbGroup in tbMType.map do
			for i = 1, 3 do
				tbMapIdx[tbGroup[i]] = {nMType, nGroup, i}
			end
		end
	end
	tbData.map_index = tbMapIdx

	-- �����������
	local nCount = 0
	local nMultiple = iif(tbData.max_member == 1, 1, 2)
	local tbSpecialHelp	= tbData.help_msg	-- �ض�������Ϣ
	if (not tbSpecialHelp) then
		tbSpecialHelp	= {}
	end
	tbData.help_msg	= {}
	for _, tbTopic in tmp_help do
		local szTitle	= tmp_str(tbTopic[1], tbData)
		local varText, nLimit
		if (tbSpecialHelp[tbTopic[1]]) then	-- ���Զ��������Ϣ
			varText	= tbSpecialHelp[tbTopic[1]]
			nLimit	= nil
		else
			varText	= tbTopic[2]
			nLimit	= tbTopic[3]
		end
		if (not nLimit or nLimit == nMultiple) then
			nCount	= nCount + 1
			local szType	= type(varText)
			local tbText	= {"", ""}
			if (szType == "function") then
				tbText[1]	= varText(tbData, 1)
				tbText[2]	= varText(tbData, 2)
			elseif (szType == "table") then
				tbText[1]	= varText[1]
				tbText[2]	= varText[2]
			else
				tbText[1]	= tostring(varText)
				tbText[2]	= tbText[1]
			end

			tbData.help_msg[nCount]	= {}
			for nLevel = 1, 2 do
				tbText[nLevel]	= tmp_str(tbText[nLevel], tbData)
				tbText[nLevel]	= gsub(tbText[nLevel], "<t>", WLLS_LEVEL_DESC[nLevel])
				tbText[nLevel]	= gsub(tbText[nLevel], "<pw>", 5*nLevel)
				tbText[nLevel]	= gsub(tbText[nLevel], "<pt>", 2*nLevel)
				tbData.help_msg[nCount][nLevel]	= {
					gsub(szTitle, "<t>", WLLS_LEVEL_DESC[nLevel]),
					tbText[nLevel],
				}
			end
		end
	end

	-- ����Officer���Ի�����
	tbData.text_main[1]	= tmp_main[1]..tbData.text_main[1]
	tbData.text_main[2]	= tmp_main[2]..tbData.text_main[2]
end
