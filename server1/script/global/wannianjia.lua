Include("\\script\\event\\pingzi\\200805\\pingzi.lua");	-- ƴ����Ϸ
Include("\\script\\event\\young_hero\\hero.lua");		-- ����Ӣ��
Include("\\script\\task\\system\\task_string.lua");
function main()
	wannianjia_main();
end


function wannianjia_main()
	local nDateH = tonumber(GetLocalDate("%Y%m%d%H"));
	local tbSay = 
	{
		"<dec><npc>V� L�m Truy�n K� �� b��c sang tu�i th� 3, ch�c m�ng qu�c th�i d�n an, nh� nh� h�nh ph�c, ng��i ng��i �m no. Ch�ng hay ��i hi�p c�n g�?",
	}
	if pingzi0805:IsActTime() then
		tinsert(tbSay, "Ta mu�n ti�n h�nh gh�p ch�./#pingzi0805:main()");
	end
	if (nDateH >= hero_nDate_S and nDateH <= hero_nDate_E) then
		tinsert(tbSay, "Ta mu�n tham gia ho�t ��ng Anh H�ng Thi�u Ni�n/#here_main()");
	end
	tinsert(tbSay, "T�m hi�u c�ch ��i ph�n th��ng/wannianjia_Detailed");
	tinsert(tbSay, "Ta s� gh� l�i sau/OnCancel");
	CreateTaskSay(tbSay);
end
--�˽�һ�����
function wannianjia_Detailed(nStep)
	local tbSay = 
	{
		"<dec><npc>C� 2 ho�t ��ng l�n, ��i hi�p mu�n t�m hi�u ho�t ��ng n�o?",
		"T�m hi�u Ho�t ��ng gh�p ch�/#pingzi0805:Detailed()",
		"T�m hi�u Ho�t ��ng Anh H�ng Thi�u Ni�n/#hero_intruduction()",
		"Tr� l�i/wannianjia_main"
	}
	
	CreateTaskSay(tbSay);
end


function OnCancel()
	
end