Include("\\script\\event\\zhongqiu_jieri\\200808\\timectrl.lua")
Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\lib\\awardtemplet.lua")

function zhongqiu0808_zoumadeng_buy()
	local tbSay = 
	{
		"<dec><npc>Mua 1 n�n �� c�n 5000 l��ng, ng��i ��ng � mua ch�?",
		"X�c nh�n/zhongqiu0808_zoumadeng_buy_ok",
		"H�y b� /OnExit"
	}
	CreateTaskSay(tbSay)
end

function zhongqiu0808_zoumadeng_buy_ok()
	local tbItem =	{szName="N�n ��", tbProp={6, 1, 1820, 1, 0, 0}}
	local nJxb = 5000
	if Pay(5000) == 1 then
		tbAwardTemplet:GiveAwardByList(tbItem,"Mua n�n ��" )
	else
		Say("Ng�n l��ng tr�n ng��i kh�ng ��!", 0)
	end
end