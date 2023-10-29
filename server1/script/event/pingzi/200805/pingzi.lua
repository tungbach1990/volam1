
Include("\\script\\event\\pingzi\\200805\\compose.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\event\\pingzi\\200805\\head.lua")
Include("\\script\\event\\pingzi\\200805\\recipe.lua")


function pingzi0805:main()
	self:ResetTask()
	
	if not self:IsActTime() then
		return 
	end
	
	
	if GetLevel() < 50 then
		return Say(format("��ng c�p kh�ng �� %s, kh�ng th� tham gia ho�t ��ng.",50), 0)
	end
	
	local tbSay = 
	{
		"<dec><npc>��i hi�p mu�n ��i ph�n th��ng n�o?<enter>Ph�n th��ng 1: 'Phong' x 1 + 'H�a' x 1 + 'Li�n' x 1 + 'Th�nh' x 1 + 3 v�n l��ng<enter>Ph�n th��ng 2: 'M�ng' x 3 + 'VLTK' x 3 + '3' x 3 + 'Tu�i' x 3 + 10 v�n l��ng<enter>Ph�n th��ng 3: 'M�ng' x 3 +'VLTK' x 3 + '3' x 3 + 'Tu�i' x 3 + ��i h� l� bao x 1",
		format("Nh�n ph�n th��ng 1/#%s:draw(1)", self.szClassName),
		format("Nh�n ph�n th��ng 2/#%s:draw(2)", self.szClassName),
		format("Nh�n ph�n th��ng 3/#%s:draw(3)", self.szClassName),
		"Ta s� gh� l�i sau/OnCancel"
	}
	CreateTaskSay(tbSay)
end


function pingzi0805:draw(nRecipeId)
	self:ResetTask()
	if GetLevel() < 50 then
		return Say(format("��ng c�p kh�ng �� %s, kh�ng th� tham gia ho�t ��ng.",50), 0)
	end
	local nCount = GetTask(self.TSK_Recipe1Count)
	if nRecipeId == 1 and nCount >= self.nMaxRecipe1Count then
		return Say(format("Ph�n th��ng n�y ch� c� th� ��i <color=yellow>%d<color> l�n.", nCount),0)
	end
	local tbRecipe = self.tbRecipe[nRecipeId]
	if nRecipeId == 1 then
		pingzi0805_ComposeClass:Compose("Nguy�n li�u mang theo kh�ng ��.", tbRecipe.tbItemList, tbRecipe.nMoney, tbAwardTemplet.GiveAwardByList, tbAwardTemplet, tbRecipe.tbAwardItem, self.szClassName, 1, SetTask, self.TSK_Recipe1Count, nCount + 1)
	else
		pingzi0805_ComposeClass:Compose("Nguy�n li�u mang theo kh�ng ��.", tbRecipe.tbItemList, tbRecipe.nMoney, tbAwardTemplet.GiveAwardByList, tbAwardTemplet, tbRecipe.tbAwardItem, self.szClassName)
	end
end

function pingzi0805:Detailed(nStep)
	local tbSay = nil
	if nStep == 1 then
		tbSay = 
		{
			"<dec><npc><enter>Ph�n th��ng 1: 'Phong' x 1 + 'H�a' x 1 + 'Li�n' x 1 + 'Th�nh' x 1 + 3 v�n l��ng = 2 tri�u �i�m kinh nghi�m.<enter>Ph�n th��ng 2: 'M�ng' x 3 + 'VLTK' x 3 + '3' x 3 + 'Tu�i' x 3 + 10 v�n l��ng = B�nh kem nh� � v� Ph�n th��ng ng�u nhi�n.<enter>Ph�n th��ng 3: 'M�ng' x 3 + 'VLTK' x 3 + '3' x 3 + 'Tu�i' x 3 +  ��i h� l� bao x 1 = B�nh kem nh� � v� ph�n th��ng ng�u nhi�n ho�c B�nh kem c�t t��ng.",
			format("Nh�n l�nh ph�n th��ng/#%s:main()", self.szClassName),
			"Ta s� gh� l�i sau/OnCancel"
		}
	else
		tbSay = 
		{
			"<dec><npc>V�n Ni�n Gia: Trong th�i gian ho�t ��ng, ��i hi�p c� c� h�i nh�t ���c c�c L� bao khi ��nh qu�i, b�n trong c� ch�a nguy�n li�u m� ta c�n.<enter>Th�i gian ho�t ��ng: t� 11-06-2008 ��n 24:00 13-07-2008",
			format("Ph�n th��ng g�m nh�ng g�?/#%s:Detailed(1)", self.szClassName),
			"Ta s� gh� l�i sau/OnCancel"
		}	
	end
	
	CreateTaskSay(tbSay)
end