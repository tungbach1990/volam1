Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\event\\zhongqiu_jieri\\200808\\sanyue\\hecheng.lua")
Include("\\script\\event\\zhongqiu_jieri\\200808\\longzhu\\hecheng.lua")
Include("\\script\\event\\zhongqiu_jieri\\200808\\taskctrl.lua")
function main()
	zhongqiu0808_npc_main()
end
function zhongqiu0808_npc_main()
	if zhongqiu0808_IsActDate() ~= 1 then
		return Say("Ho�t ��ng �� k�t th�c.", 0)
	end
	local tbSay = 
	{
		"<dec><npc>Ho�t ��ng trung thu di�n ra t� 05-09-2008 ��n 24:00 ng�y 05-10-2008, bao g�m 6 ho�t ��ng, mu�n t�m hi�u ho�t ��ng n�o?",
		"Ho�t ��ng b�nh trung thu Th��ng Nguy�t/zhongqiu0808_hecheng_dialog",
		"Ho�t ��ng Long ch�u - Ph�ng v�/zhongqiu0808_longzhuhecheng_dialog",
		"Ho�t ��ng ��n k�o qu�n/#zhongqiu0808_ActContent(1)",
		"Ho�t ��ng B�c ��u l�o nh�n/#zhongqiu0808_ActContent(4)",
		"Ho�t ��ng huy ch��ng chi�n c�ng/#zhongqiu0808_ActContent(3)",
		"Ho�t ��ng �y th�c thu th�p/#zhongqiu0808_ActContent(2)",
		"T�i h� ch� ti�n ���ng qua ��y!/OnCancel",
	}
	CreateTaskSay(tbSay);
end



function zhongqiu0808_ActContent(nStep)
	local tbSay = nil
	if nStep == 1 then
		tbSay = 
		{
			"<dec><npc>Ho�t ��ng ��n k�o qu�n di�n ra t� 05-09-2008 ��n 24 gi� ng�y 05-10-2008. Th�i gian c� th�: T� th� hai ��n th� n�m m�i tu�n: 19:00 - 19:59, 21:30 - 22:29; Th� s�u, th� b�y v� ch� nh�t m�i tu�n: 11:00 - 11:59, 19:00 - 19:59, 21:30 - 22:29. Sau khi ho�t ��ng ���c b�t ��u, ��n k�o qu�n s� xu�t hi�n tr�n t�t c� b�n ��, ng��i ch�i c� th� d�ng n�n �� (c� th� mua t�i NPC h�ng rong) �� th�p ��n (ph�i c�n c� theo tu�n t� ��ng T�y Nam B�c �� th�p ��n) th� m�i c� th� nh�n ���c gi�i th��ng.",
			"K�t th�c ��i tho�i/OnCancel"
		}
		
	elseif nStep == 2 then
		tbSay = 
		{
			"<dec><npc>T� 05-09-2008 ��n 24:00 ng�y 05-10-2008, ng��i ch�i �y th�c tr�n m�ng b�ng c�c lo�i B�ch C�u Ho�n s� nh�n ���c h�p Ti�n V�.",
			"K�t th�c ��i tho�i/OnCancel"
		}
	elseif nStep == 3 then
		tbSay = 
		{
			"<dec><npc>Trong th�i gian ho�t ��ng t� 05-09-2008 ��n 24:00 ng�y 05-10-2008, 20 ng��i ��ng ��u chi�n tr��ng �o�t danh hi�u ��i t��ng phe Kim ho�c ��i t��ng phe T�ng s� nh�n ���c huy ch��ng chi�n c�ng. Ngo�i ra ng��i ch�i c� th� ��n NPC Qu�n Nhu Quan b�n T�ng ho�c b�n Kim, s� d�ng 2000 �i�m t�ch l�y T�ng Kim �� ��i 1 C�ng tr�ng l�nh b�i. S� d�ng Chi�n c�ng huy ch��ng v� C�ng tr�ng l�nh b�i s� nh�n ���c �i�m kinh nghi�m v� v�t ph�m gi� tr�.",
			"K�t th�c ��i tho�i/OnCancel"
		}
		
	elseif nStep == 4 then
		tbSay = 
		{
			"<dec><npc>Trong th�i gian ho�t ��ng (05-09-2008 ��n 24:00 ng�y 05-10-2008), v�o th� s�u, th� b�y, ch� nh�t h�ng tu�n s� di�n ra ho�t ��ng B�c ��u l�o nh�n.",
			"K�t th�c ��i tho�i/OnCancel"
		}
	end
	CreateTaskSay(tbSay);
end


function OnCancel()
	
end