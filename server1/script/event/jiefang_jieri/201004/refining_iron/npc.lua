-- 炼金活动 Npc对话
Include("\\script\\event\\jiefang_jieri\\201004\\refining_iron\\head.lua")
Include("\\script\\task\\system\\task_string.lua");

-- Npc对话
function tbRefiningIron:NpcTalk()
	
	if tbRefiningIron:IsCarryOn() ~= 1 then
		return
	end
	
	local tbTaskSay = {"<dec><npc>Trong th阨 gian ho箃 ng, c竎 v� i hi謕 c� th� n y n﹏g c蕄 th衟 tinh luy謓. Th衟 tinh luy謓 c蕄 th蕄 c� th� th玭g qua c竎 ho箃 ng phong l╪g  v� 竜 chi課 s� nh薾 頲, ho芻 c� th� mua v藅 ph萴 n祔 t筰 K� Tr﹏ C竎. Gh衟 2 th衟 c蕄 th蕄 c� th� nh薾 頲 1 th衟 tinh luy謓 c蕄 cao h琻",};
	
	for i = 2,9 do
		tinsert(tbTaskSay, format("Ta mu鑞 luy謓 th衟 tinh luy謓 c蕄 %d/#tbRefiningIron:UpdataIron(%d)", i, i));
	end
	
	tinsert(tbTaskSay, "H駓 b� /Cancel");
	CreateTaskSay(tbTaskSay);
end

-- 升级铁
function tbRefiningIron:UpdataIron(nLevel)
	
	-- 未举行
	if tbRefiningIron:IsCarryOn() ~= 1 then
		return
	end
	
	-- Bug
	if nLevel <= 1 or nLevel > 10 then
		return
	end	
	
	-- 背包空间
	if CalcFreeItemCellCount() < 1 then
		CreateTaskSay({"Xin h穣 s緋 x誴 l筰 h祅h trang!",  "Л頲 r錳./Cancel",});
		return 
	end	
		
	-- 原料不足
	if CalcItemCount(3, 6, 1, 2293, nLevel - 1) < 2 then
		CreateTaskSay({format("<dec><npc>Xin h穣 chu萵 b� 2 th衟 tinh luy謓 c蕄 %d!",nLevel - 1),  "Л頲 r錳./Cancel",});
		return
	end
	
	-- 扣除失败
	if ConsumeItem(3, 2, 6, 1, 2293, nLevel - 1) ~= 1 then
		Msg2Player("Kh蕌 tr� th衟 tinh luy謓 th蕋 b筰");
		return
	end
	
	-- 合成失败
	if random(1, 100) > self.tbUpdataRate[nLevel] then
		local tbAwardItem = 
		{
			szName="Th衟 Tinh Luy謓", 
			tbProp={6,1, 2293, nLevel - 1,0,0},
			nCount = 1,
			nExpiredTime=self.nCloseDate,
		};
		tbAwardTemplet:GiveAwardByList(tbAwardItem, "Th衟 tinh luy謓 g閜 th蕋 b筰, tr� l筰 th衟 tinh luy謓.");
		CreateTaskSay({"<dec><npc>Th藅 ng ti誧, luy謓 th衟  th蕋 b筰! Ta ngh� l莕 sau s� th祅h c玭g !",  "Л頲 r錳./Cancel",});
		return	
	end
	
	-- 合成成功
	local tbAwardItem = 
	{
		szName="Th衟 Tinh Luy謓", 
		tbProp={6,1, 2293, nLevel,0,0},
		nCount = 1,
		nExpiredTime=self.nCloseDate,
	};
	tbAwardTemplet:GiveAwardByList(tbAwardItem, "Gh衟 th衟 tinh luy謓");
	
	-- 高品质提示
	if nLevel >= 7 then
		local szmsg = format("Ch骳 m鮪g cao th� %s  nh薾 頲 th衟 tinh luy謓 c蕄 %d. Hi v鋘g ngi s� c� nhi襲 may m緉 h琻 n鱝!", GetName(), nLevel);
		local _, nTongId = GetTongName(); 
		if nTongId ~= 0 then
			Msg2Tong(nTongId, szmsg);
		end
		Msg2SubWorld(szmsg);
	end
	
end