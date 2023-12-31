Include("\\script\\tong\\workshop\\workshop_head.lua")
--铜钱价值量=200W
aLevelOutputCoef = {}
aLevelScale = {}
aLevelContributionCoef = {}
aLevelCoinShop = {}
aLevelContributionShop = {}
WEIZHUANG_LEVEL = 5	--伪装面具等级要求
TEAMMASK_LEVEL = 3	--队伍面具制作等级要求
TONGMASK_LEVEL = 7	--帮会面具制作等级要求
aPriceTeamMask = {}	--队伍面具样子对应的价格
aPriceTongMask = {} --帮会面具样子对应的价格
PRICEMASK_WEIZHUANG = 1000
function LoadLevelData()
	local b1 = TabFile_Load("\\settings\\tong\\workshop\\mianju_level_data.txt", "mianjuLevelData")
	if b1~=1 then
		print("тc t謕 config v� t竎 phng m苩 n� th蕋 b筰!")
		return
	end
	local nRowCount = TabFile_GetRowCount("mianjuLevelData")
	for y = 2, nRowCount do
		local nLevel = tonumber(TabFile_GetCell("mianjuLevelData", y, "LEVEL"))
		aLevelCoinShop[nLevel] = tonumber(TabFile_GetCell("mianjuLevelData", y, "COIN_SHOP"))
		aLevelContributionShop[nLevel] = tonumber(TabFile_GetCell("mianjuLevelData", y, "CONTRIBUTION_SHOP"))		
		aLevelScale[nLevel] = tonumber(TabFile_GetCell("mianjuLevelData", y, "SCALE"))
		aLevelOutputCoef[nLevel] = tonumber(TabFile_GetCell("mianjuLevelData", y, "OUTPUT_COEF"))
		aLevelContributionCoef[nLevel] = tonumber(TabFile_GetCell("mianjuLevelData", y, "CONTRIBUTION_COEF"))
	end
	--TabFile_UnLoad("mianjuLevelData")
	--非Relay端加载Feature配置文件
	if MODEL_RELAY ~= 1 then
		b1 = TabFile_Load("\\settings\\item\\feature_data.txt", "FeatureData")
		if b1~=1 then
			print("тc t謕 config feature_data th蕋 b筰!")
			return
		end
		nRowCount = TabFile_GetRowCount("FeatureData")
		for y = 2, nRowCount do
			local nFeature = tonumber(TabFile_GetCell("FeatureData", y, "FEATURE"))
			aPriceTeamMask[nFeature] = tonumber(TabFile_GetCell("FeatureData", y, "TEAM_MASK_PRICE"))		
			aPriceTongMask[nFeature] = tonumber(TabFile_GetCell("FeatureData", y, "TONG_MASK_PRICE"))		
		end
	end
end
LoadLevelData()

if MODEL_GAMESERVER == 1 or MODEL_RELAY == 1 then
--------------------如果非客户端---------------------------
function ws_main(nTongID, nWorkshopID)
	if SVR_CheckUse(nTongID, nWorkshopID, "T鎛g qu秐 D� dung phng") ~= 1 then
		return 0
	end
	Say("<#>T鎛g qu秐 D� dung phng: Xem 72 ph衟 bi課 h鉧 c馻 ta! Ch� c� ngh� kh玭g t韎 ch� kh玭g c� vi謈 bi課 kh玭g th祅h. \n c竎 lo筰 m苩 n�, lo筰 g� c騨g c�, xem th� cho bi誸!", 3, "Ta mu鑞 xem th� /#use_g_1_ok("..nTongID..","..nWorkshopID..")", 
		"M苩 n� c bi謙/#SpecialMask("..nTongID..","..nWorkshopID..")", "Kh玭g c莕 u/cancel");
	return 1;
end

function use_g_1_ok(nTongID, nWorkshopID)
	if (TWS_GetDayOutput(nTongID, nWorkshopID) < 100) then
		Say("<#>T鎛g qu秐 D� dung phng: Th藅 ng ti誧, h玬 nay m苩 n�  ph﹏ ph竧 h誸 r錳, ng祔 mai h穣 n v藋!", 0)
		return 0;
	end
	TWS_ApplyUse(nTongID, nWorkshopID);
end

function SpecialMask(nTongID, nWorkshopID)
	Say("<#>T鎛g qu秐 D� dung phng: Ngi mu鑞 l祄 lo筰 m苩 n� n祇?", 4, "M苩 n� ng魕 trang/#Mask_WeiZhuang("..nTongID..","..nWorkshopID..")",
		"M苩 n� T� i/#Mask_Team("..nTongID..","..nWorkshopID..")", "M苩 n� Bang h閕/#Mask_Tong("..nTongID..","..nWorkshopID..")",
		"Kh玭g c莕 u/cancel")
end

function Mask_WeiZhuang(nTongID, nWorkshopID)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	if (nLevel < WEIZHUANG_LEVEL)then
		Say("T鎛g qu秐 D� dung phng: M苩 n� ng魕 trang s� mang l筰 k� n╪g ng魕 trang, gi髉 cho ngi 甧o n� s� ng魕 trang th祅h h譶h tng d� dung c馻 ngi ch琲 kh竎. Nh璶g khi ng c蕄 c馻 D� dung phng t n c蕄 <color=red>"..WEIZHUANG_LEVEL.."<color> m韎 c� th� ch� t竎 lo筰 m苩 n� n祔, hi謓 tai v蒼 ch璦  c蕄 ",
			1, "L骳 kh竎 ta quay l筰 v藋./cancel")
		return
	end
	Say("T鎛g qu秐 D� dung phng: M苩 n� ng魕 trang s� mang l筰 k� n╪g ng魕 trang, gi髉 cho ngi 甧o n� s� ng魕 trang th祅h h譶h tng d� dung c馻 ngi ch琲 kh竎. Ch� t竎 m苩 n� ng魕 trang c莕 s� d鬾g <color=yellow>"..PRICEMASK_WEIZHUANG.."<color> 甶觤 c鑞g hi課, c� ng � kh玭g?",
			2, "M鋓 s� nh� t鎛g qu秐 v藋/#GetMask1("..nTongID..","..nWorkshopID..")", "Ta ch� h醝 qua cho bi誸/cancel")
end

function GetMask1(nTongID, nWorkshopID)
	if (GetContribution() < PRICEMASK_WEIZHUANG)then
		Say("T鎛g qu秐 D� dung phng: 觤 c鑞g hi課 kh玭g , h穣 ra s鴆 v� bang h閕 .",1,"Kh玭g  sao/cancel")
		return
	end	
	AddContribution(-PRICEMASK_WEIZHUANG)
	Say("T鎛g qu秐 D� dung phng: M苩 n� ng魕 trang c� th阨 gian s� d鬾g l� 24 gi�, c� th� ng魕 trang 頲 10 l莕.",1,
			"Xin 產 t�, ta 甶 th� ngay y/cancel")
	AddItem(0,11,366,1,0,0)		
	Msg2Player("B筺 nh薾 頲 m閠 m苩 n� ng魕 trang")
end

function Mask_Team(nTongID, nWorkshopID)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	if (nLevel < TEAMMASK_LEVEL)then
		Say("T鎛g qu秐 D� dung phng: M苩 n� i trng c� th� do i trng ho芻 th祅h vi猲 trong i s� d鬾g. Sau khi s� d鬾g th� t蕋 c� c竎 th祅h vi猲 s� gi鑞g h謙 nhau trong m閠 kho秐g th阨 gian. C� 甶襲 ng c蕄 D� dung phng t c蕄 <color=red>"..TEAMMASK_LEVEL.."<color> m韎 c� th� ch� t竎 lo筰 m苩 n� n祔, hi謓 v蒼 ch璦  c蕄",
			1, "L骳 kh竎 ta quay l筰 v藋./cancel")
		return
	end
	Say("T鎛g qu秐 D� dung phng: M苩 n� i trng c� th� do i trng ho芻 th祅h vi猲 trong i s� d鬾g. Sau khi s� d鬾g th� t蕋 c� c竎 th祅h vi猲 s� gi鑞g h謙 nhau trong m閠 kho秐g th阨 gian. Ch� t竎 lo筰 m苩 n� n祔 c莕 s� d鬾g m閠 輙 甶觤 c鑞g hi課 v� 1 lo筰 m苩 n� bang h閕  l祄 m蓇, c� ng � kh玭g?",
			2, "M鋓 s� nh� t鎛g qu秐 v藋/#GetMask2("..nTongID..","..nWorkshopID..")", "Ta ch� h醝 qua cho bi誸/cancel")
end

function Mask_Tong(nTongID, nWorkshopID)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	if (nLevel < TONGMASK_LEVEL)then
		Say("T鎛g qu秐 D� dung phng: M苩 n� bang h閕 c� th� do bang ch� ho芻 trng l穙 s� d鬾g. Sau khi s� d鬾g th� t蕋 c� c竎 th祅h vi猲 s� gi鑞g h謙 nhau trong m閠 kho秐g th阨 gian. C� 甶襲 ng c蕄 D� dung phng t c蕄 <color=red> "..TONGMASK_LEVEL.."<color>m韎 c� th� ch� t竎 lo筰 m苩 n� n祔, hi謓 v蒼 ch璦  c蕄.",
			1, "L骳 kh竎 ta quay l筰 v藋./cancel")
		return
	end
	local nFigure = TONGM_GetFigure(nTongID, GetName())
	if (nFigure ~= TONG_MASTER and nFigure ~= TONG_ELDER)then
		Say("T鎛g qu秐 D� dung phng: Bang qui ch� cho ph衟 bang ch� v� trng l穙  ta ch� t竎 lo筰 m苩 n� n祔, ngi th� kh玭g th訁", 1, 
			"Th藅 l� ti誧 qu�/cancel")
		return
	end
	Say("T鎛g qu秐 D� dung phng: M苩 n� bang h閕 c� th� do bang ch� ho芻 trng l穙 s� d鬾g. Sau khi s� d鬾g th� t蕋 c� c竎 th祅h vi猲 s� gi鑞g h謙 nhau trong m閠 kho秐g th阨 gian.  Ch� t竎 lo筰 m苩 n� n祔 c莕 s� d鬾g m閠 輙 甶觤 c鑞g hi課 v� 1 lo筰 m苩 n� bang h閕  l祄 m蓇, c� ng � kh玭g?",
			2, "M鋓 s� nh� t鎛g qu秐 v藋/#GetMask3("..nTongID..","..nWorkshopID..")", "Ta ch� h醝 qua cho bi誸/cancel")
end

--队伍面具
function GetMask2(nTongID, nWorkshopID)
	GiveItemUI("Ch� t筼 m苩 n� i ng�","T鎛g qu秐 D� dung phng: H穣 b� v祇 m閠 lo筰 m苩 n� thng  l祄 m蓇, ch� t筼 th祅h c玭g s� m蕋 甶 v藅 m蓇 n祔.", "MakeMask2", "onCancel" );
end

--帮会面具
function GetMask3(nTongID, nWorkshopID)
	GiveItemUI("Ch� t筼 m苩 n� bang h閕","T鎛g qu秐 D� dung phng: H穣 b� v祇 m閠 lo筰 m苩 n� thng  l祄 m蓇, ch� t筼 th祅h c玭g s� m蕋 甶 v藅 m蓇 n祔.", "MakeMask3", "onCancel" );
end

--队伍面具
function MakeMask2(nCount)		
	if(nCount <= 0) then
		Say("<#>T鎛g qu秐 D� dung phng: Kh玭g c� nguy猲 li謚 kh玭g th� ch� t竎!", 1, "Ha ha, t nhi猲 ta qu猲 m蕋./cancel")
		return
	end	
	if(nCount > 1) then
		Say("<#>T鎛g qu秐 D� dung phng: Ngi ch� c莕 b� v祇 1 m苩 n� l� 頲 r錳, b� v祇 nhi襲 th�  l祄 g�?", 1, "鮩, ta bi誸 r錳/cancel")
		return
	end		
	local itemIdx = GetGiveItemUnit( 1 )
	local g,d,_ = GetItemProp(itemIdx)
	if(g ~= 0 or d ~= 11) then --错误道具
		Say("<#>T鎛g qu秐 D� dung phng: Зy l� m苩 n�  sao, ta kh玭g hoa m総 ch�?",1,", ta a nh莔 r錳, tr� l筰 cho ta./cancel")
		return nil
	end
	local nFeature = GetMaskFeature(itemIdx)
	if (not nFeature) then
		Say("T鎛g qu秐 D� dung phng: Kh玭g 頲 r錳, m苩 n� n祔 kh玭g th� d飊g 頲.", 1, "Ta i m閠 c竔 v藋./cancel")
		return
	end
	local nPrice = aPriceTeamMask[nFeature]
	if (not nPrice)then
		Say("T鎛g qu秐 D� dung phng: Kh玭g 頲 r錳, kh玭g th� d飊g m苩 n� n祔 l祄 m蓇  ch� t筼 m苩 n� i ng�.", 1, "Ta i m閠 c竔 v藋./cancel")
		return
	end	
	Say("T鎛g qu秐 D� dung phng: D飊g m苩 n� m蓇 n祔  ch� t筼 m苩 n� i ng� c莕 ti猽 ph� <color=yellow>"..nPrice.."<color> 甶觤 c鑞g hi課, n誹 ngi ng � th� ta s� ng th� v藋.",
		2, "L祄 phi襫 t鎛g qu秐 r錳./#TeamMaskMake("..nFeature..","..nPrice..","..itemIdx..")", "в ta suy ngh� l筰./cancel")
end

--帮会面具
function MakeMask3(nCount)		
	if(nCount <= 0) then
		Say("<#>T鎛g qu秐 D� dung phng: Kh玭g c� nguy猲 li謚 kh玭g th� ch� t竎!",1, "Ha ha, t nhi猲 ta qu猲 m蕋./cancel")
		return
	end	
	if(nCount > 1) then
		Say("<#>T鎛g qu秐 D� dung phng: Ngi ch� c莕 b� v祇 1 m苩 n� l� 頲 r錳, b� v祇 nhi襲 th�  l祄 g�?",1, "鮩, ta bi誸 r錳/cancel")
		return
	end		
	local itemIdx = GetGiveItemUnit( 1 )
	local g,d,_ = GetItemProp(itemIdx)
	if(g ~= 0 or d ~= 11) then --错误道具
		Say("<#>T鎛g qu秐 D� dung phng: Зy l� m苩 n�  sao, ta kh玭g hoa m総 ch�?",1,", ta a nh莔 r錳, tr� l筰 cho ta./cancel")
		return nil
	end
	local nFeature = GetMaskFeature(itemIdx)
	if (not nFeature) then
		Say("T鎛g qu秐 D� dung phng: Kh玭g 頲 r錳, m苩 n� n祔 kh玭g th� d飊g 頲.", 1, "Ta i m閠 c竔 v藋./cancel")
		return
	end
	local nPrice = aPriceTongMask[nFeature]
	if (not nPrice)then
		Say("T鎛g qu秐 D� dung phng: Kh玭g 頲 r錳, kh玭g th� d飊g m苩 n� n祔 l祄 m蓇  ch� t筼 m苩 n� bang h閕.", 1, "Ta i m閠 c竔 v藋./cancel")
		return
	end	
	Say("T鎛g qu秐 D� dung phng: D飊g m苩 n� m蓇 n祔  ch� t筼 m苩 n� i ng� s� ti猽 ph� ng﹏ s竎h ki課 thi誸<color=yellow> "..nPrice.."<color> 甶觤 c鑞g hi課, n誹 ngi ng � th� ta s� ng th� v藋.",
		2, "L祄 phi襫 t鎛g qu秐 r錳./#TongMaskMake("..nFeature..","..nPrice..","..itemIdx..")", "в ta suy ngh� l筰./cancel")
end

function TeamMaskMake(nFeature, nPrice, nItemIdx)
	if (GetContribution() < nPrice)then
		Say("T鎛g qu秐 D� dung phng: D飊g m苩 n� n祔 l祄 m蓇 cho m苩 n� i ng� c莕 s� d鬾g <color=yellow>"..nPrice.."<color> 甶觤 c鑞g hi課. 觤 c鑞g hi課 c馻 ngi kh玭g , h穣 g鉷 s鴆 cho bang h閕 trc .",
			1,"Kh玭g  sao/cancel")
		return
	end
	--再次检查item
	local g,d,_ = GetItemProp(nItemIdx)
	if(g ~= 0 or d ~= 11) then --错误道具
		Msg2Player("M苩 n� m蓇 c馻 ngi u?:W")
		return
	end
	--删除原料
	if (RemoveItemByIndex(nItemIdx) ~= 1)then
		Msg2Player("M苩 n� m蓇 c馻 ngi u?:W")
		return
	end	
	Say("T鎛g qu秐 D� dung phng: M苩 n� i ng� c� th� gi髉 cho t蕋 c� th祅h vi猲 trong i gi鑞g nhau trong v遪g 2 gi�.",
		1, "Xin 產 t�, ta 甶 th� ngay y/cancel")		
	local nIdx = AddItem(6,1,1108,1,0,0)
	SetSpecItemParam(nIdx, 1, nFeature)
	SyncItem(nIdx)
	AddContribution(-nPrice)
	Msg2Player("Nh薾 頲 m閠 m苩 n� i ng�")
end

function TongMaskMake(nFeature, nPrice, nItemIdx)
	local _,nTongID = GetTongName()
	if (nTongID == 0)then
		return
	end
	if (TONG_GetBuildFund(nTongID) < nPrice)then
		Say("T鎛g qu秐 D� dung phng: D飊g m苩 n� n祔 l祄 m蓇 cho m苩 n� bang h閕 c莕 s� d鬾g <color=yellow><color=yellow>"..nPrice.."<color> 甶觤 ng﹏ s竎h ki課 thi誸. Ng﹏ s竎h ki課 thi誸 kh玭g !",
			1,"Kh玭g  sao/cancel")
		return
	end
	--再次检查item
	local g,d,_ = GetItemProp(nItemIdx)
	if(g ~= 0 or d ~= 11) then --错误道具
		Msg2Player("M苩 n� m蓇 c馻 ngi u?:W")
		return
	end
	--删除原料
	if (RemoveItemByIndex(nItemIdx) ~= 1)then
		Msg2Player("M苩 n� m蓇 c馻 ngi u?:W")
		return
	end		
	Say("T鎛g qu秐 D� dung phng: M苩 n� bang h閕 c� th� gi髉 cho t蕋 c� bang ch髇g gi鑞g nhau trong v遪g 3 gi�.",
		1, "Xin 產 t�, ta 甶 th� ngay y/cancel")
	local nIdx = AddItem(6,1,1109,1,0,0)
	if (nIdx <= 0) then return end
	SetSpecItemParam(nIdx, 1, nFeature)
	SyncItem(nIdx)
	TONG_ApplyAddBuildFund(nTongID, -nPrice)
	local szMsg = GetName().." ti猽 hao "..nPrice.." v筺 ng﹏ s竎h ki課 thi誸 bang  ch� t筼 m苩 n� bang h玦."
	Msg2Tong(nTongID, szMsg)
	TONG_ApplyAddEventRecord(nTongID, szMsg)
end
----------------------------------------------------------------------------------------------------
function MAINTAIN_R(nTongID, nWorkshopID) --日常活动
	if nWorkshopID <= 0 then
		return 0
	end	
	local eType = TWS_GetType(nTongID, nWorkshopID)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	local nTotal = floor(aLevelOutputCoef[nLevel]*(TONG_GetMemberCount(nTongID)) * 100)
	TWS_ApplyAddDayOutput(nTongID, nWorkshopID, nTotal)
	return 1
end

function USE_R(nTongID, nWorkshopID)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	if nLevel < 1 then
		return 0
	end
	local nLeft = TWS_GetDayOutput(nTongID, nWorkshopID);
	if (TWS_IsOpen(nTongID, nWorkshopID) ~= 1 or nLeft < 100) then
		return 0
	end
	return 1;
end

function USE_G_1(nTongID, nWorkshopID)
	ws_main(nTongID, nWorkshopID)
end

function use_buy_1(nTongID, nWorkshopID)
	if (TWS_GetDayOutput(nTongID, nWorkshopID) <= 0) then
		Say("<#>T鎛g qu秐 D� dung phng: Th藅 ng ti誧, h玬 nay m苩 n�  ph﹏ ph竧 h誸 r錳, ng祔 mai h穣 n v藋!", 0)
		return
	end
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	local nScale = aLevelScale[nLevel]	
	Sale(aLevelCoinShop[nLevel], CURRENCYTYPE_COIN, nScale, "BuyCallBack1(%d,%d,"..nTongID..","..nWorkshopID..")")
end

function use_buy_2(nTongID, nWorkshopID)
	if (TWS_GetDayOutput(nTongID, nWorkshopID) <= 0) then
		Say("<#>T鎛g qu秐 D� dung phng: Th藅 ng ti誧, h玬 nay m苩 n�  ph﹏ ph竧 h誸 r錳, ng祔 mai h穣 n v藋!", 0)
		return
	end
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	local nScale = aLevelContributionCoef[nLevel] --直接用贡献度等级系数作打折系数
	Sale(aLevelContributionShop[nLevel], CURRENCYTYPE_CONTRIBUTION, nScale, "BuyCallBack2(%d,%d,"..nTongID..","..nWorkshopID..")")
end

function BuyCallBack1(nItemIdx, nPrice, nTongID, nWorkshopID)
	local nValue = TWS_GetDayOutput(nTongID, nWorkshopID)
	_dbgMsg("S� nh藀 v祇 c遪 l筰 *100: "..nValue)
	if (nValue <= 0)then
		CloseShop()
		Say("<#>T鎛g qu秐 D� dung phng: Th藅 ng ti誧, h玬 nay m苩 n�  ph﹏ ph竧 h誸 r錳, ng祔 mai h穣 n v藋!", 0)
		return 0
	end
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	--铜钱打折花费贡献度=面具原价*(1-打折系数)*1铜钱的价值量/10000*贡献度等级系数
	local nContribution = (nPrice - floor(aLevelScale[nLevel]/100*nPrice))*200*aLevelContributionCoef[nLevel]/100
	if (GetContribution() < nContribution)then
		CloseShop()
		Msg2Player(format("觤 c鑞g hi課 kh玭g , c莕 ph秈 c� %d 甶觤 c鑞g hi課!", nContribution))
		return 0
	end
	AddContribution(-nContribution)
	Msg2Player(format("Л頲 璾 i n猲 ch� ti猽 hao %d 甶觤 c鑞g hi課!", nContribution))
	TWS_ApplyAddDayOutput(nTongID, nWorkshopID, -100)
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_WEEK_WSCONSUME, nContribution)
	return 1
end

function BuyCallBack2(nItemIdx, nPrice, nTongID, nWorkshopID)
	local nValue = TWS_GetDayOutput(nTongID, nWorkshopID)
	if (nValue <= 0)then
		CloseShop()
		Say("<#>T鎛g qu秐 D� dung phng: Th藅 ng ti誧, h玬 nay m苩 n�  ph﹏ ph竧 h誸 r錳, ng祔 mai h穣 n v藋!", 0)
		return 0
	end
	TWS_ApplyAddDayOutput(nTongID, nWorkshopID, -100)
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_WEEK_WSCONSUME, nPrice)
	return 1
end

function USE_G_2(nTongID, nWorkshopID)
	Say("<#>T鎛g qu秐 D� dung phng: Nh鱪g m苩 n� ph� th玭g do bang ta ch� t筼 c� th� d飊g 甶觤 c鑞g hi課  i.", 2, 
		--"铜钱购买/#use_buy_1("..nTongID..","..nWorkshopID..")", 
		"D飊g 甶觤 c鑞g hi課  i/#use_buy_2("..nTongID..","..nWorkshopID..")", 
		"Kh玭g mua u/cancel");
end

function cancel()
end

else
-----------------如果是客户端---------------
function GET_DESC(nTongID, nWorkshopID, nType)
	if (nTongID == 0) then
		return "<color=water>Kh玭g c� bang h閕"
	end
	local bOpen	--是否开启
	local bPause --是否暂停
	local nCurLevel --当前等级
	local nUseLevel --当前使用等级
	local nOpenFund --当前开启消耗
	local nMaintainFund --当前维护消耗
	local szCoinMask = {"--","M苩 n� ph� th玭g","M苩 n� Boss s竧 th�","M苩 n� Boss i Ho祅g Kim","M苩 n� Boss i Ho祅g Kim","M苩 n� trung ni猲","M苩 n� thanh ni猲","M苩 n� thi誹 ni猲","M苩 n� anh h飊g","M苩 n� ng祔 xu﹏","M苩 n� ng祔 xu﹏"} --当前铜钱能买的面具种类
	local nContriMask --当前贡献度能买得面具种类
	local nScale  --当前购买面具优惠度
	local dMaskCount	--当前每日面具产出总量提高
	if (nWorkshopID ~= 0)then
		bOpen = TWS_IsOpen(nTongID, nWorkshopID) 
		bPause = TONG_GetPauseState(nTongID) 
		nCurLevel = TWS_GetLevel(nTongID, nWorkshopID) 
		nUseLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
		nOpenFund = wsGetOpenCost(nTongID, nType, nUseLevel) 
		nMaintainFund = wsGetMaintainCost(nTongID, nType, nUseLevel, bOpen) 
		if(nUseLevel > 0)then
			nContriMask = nUseLevel * 7
			nScale = format("%.1f",aLevelScale[nUseLevel] / 10)
			dMaskCount = format("%.2f", aLevelOutputCoef[nUseLevel] / aLevelOutputCoef[1])	
		else
			nContriMask ="--"
			nScale = "--"
			dMaskCount = "--"			
		end
	else	--作坊未建立时只显示下一级信息
		nCurLevel = 0
		bOpen = 1
		nUseLevel = 0
	end
	--下级信息
	local nUpgradeCostFund, nNextMaintainFund, nNextScale, nNextOpenFund, dNextMaskCount,szNextCoinMask,nNextContriMask
	if (nCurLevel < wsGetMaxLevel(nTongID, nType))then
		nUpgradeCostFund = wsGetUpgradeCostFund(nTongID, nType, nCurLevel)  --升级消耗
	else
		nUpgradeCostFund = "--"
	end
	if (nUseLevel < wsGetMaxLevel(nTongID, nType))then		
		nNextMaintainFund = wsGetMaintainCost(nTongID, nType, nUseLevel+1, bOpen)  --下级维护消耗
		nNextOpenFund = wsGetOpenCost(nTongID, nType, nUseLevel+1) 	--下级开启消耗
		szNextCoinMask = szCoinMask[nUseLevel + 2]	--下级铜钱能买的面具种类
		nNextContriMask = (nUseLevel + 1) * 7	--下级贡献度能买得面具种类
		nNextScale = format("%.1f",aLevelScale[nUseLevel + 1] / 10) --下级购买面具优惠度
		dNextMaskCount = format("%.2f", aLevelOutputCoef[nUseLevel + 1] / aLevelOutputCoef[1]) --下级每日面具产出总量提高
	else		
		nNextMaintainFund = "--"
		nNextOpenFund = "--"
		szNextCoinMask = "--"
		nNextContriMask = "--"
		nNextScale = "--"
		dNextMaskCount = "--"
	end	
	if (nWorkshopID ~= 0)then
		local state 
		if bPause == 1 then state="<color=yellow>T筸 ng鮪g" elseif bOpen == 1 then state="<color=green>Khai m�" else state="<color=red>сng c鯽" end
		local szMsg = "Tr筺g th竔 t竎 phng: "..state.."<color>\n"..
			"Ъng c蕄 t竎 phng: <color=gold>"..nCurLevel.."<color>\n"..
			"Ъng c蕄 s� d鬾g hi謓 t筰: <color=gold>"..nUseLevel.."<color>\n"..
			"S秐 lng m苩 n� s秐 xu蕋 h祅g ng祔 t╪g l猲: <color=gold>"..dMaskCount.."<color> l莕\n"..		
			"фi 甶觤 璾 i m苩 n�: <color=gold>"..nScale.."<color> ph莕 tr╩\n"..
			--"铜钱购买面具增加：<color=gold>"..szCoinMask[nUseLevel + 1].."<color>\n"..
			"Lo筰 m苩 n� d飊g 甶觤 c鑞g hi課 i: <color=gold>"..nContriMask.."<color> lo筰\n"..
			"Ng﹏ s竎h chi課 b� chi cho ph� b秓 tr� bang m鏸 ng祔: <color=gold>"..nMaintainFund.." v筺<color>\n"..
			"Ng﹏ s竎h ki課 thi誸 ban u: <color=gold>"..nOpenFund.." v筺<color>\n"..
			"Ng﹏ s竎h ki課 thi誸  n﹏g c蕄: <color=gold>"..nUpgradeCostFund.." v筺<color>\n"..
			"<color=green>Ъng c蕄 s� d鬾g k� ti誴 <color>\n"..
			"<color=water>S秐 lng m苩 n� h祅g ng祔 t╪g l猲: <color=Violet>"..dNextMaskCount.."<color> l莕\n"..		
			"фi 甶觤 璾 i m苩 n�: <color=Violet>"..nNextScale.."<color> ph莕 tr╩\n"..
			--"铜钱购买面具增加：<color=Violet>"..szNextCoinMask.."<color>\n"..
			"Lo筰 m苩 n� d飊g 甶觤 c鑞g hi課 i: <color=Violet>"..nNextContriMask.."<color> lo筰\n"..
			"Ng﹏ s竎h chi課 b� chi cho ph� b秓 tr� bang m鏸 ng祔: <color=Violet>"..nNextMaintainFund.." v筺<color>\n"..
			"Ng﹏ s竎h ki課 thi誸 ban u: <color=Violet>"..nNextOpenFund.." v筺<color>\n"
		return szMsg
	else
		local szMsg = "Tr筺g th竔 t竎 phng: <color=water>Ch璦 th祅h l藀<color>\n"..
			"Ng﹏ s竎h ki課 th誸 c莕  x﹜ d鵱g: <color=gold>"..nUpgradeCostFund.." v筺<color>\n"..
			"<color=green>Ъng c蕄 k� ti誴 <color>\n"..
			"<color=water>S秐 lng m苩 n� h祅g ng祔 t╪g l猲: <color=Violet>"..dNextMaskCount.."<color> l莕\n"..		
			"фi 甶觤 璾 i m苩 n�: <color=Violet>"..nNextScale.."<color> ph莕 tr╩\n"..
			--"铜钱购买面具增加：<color=Violet>"..szNextCoinMask.."<color>\n"..
			"Lo筰 m苩 n� d飊g 甶觤 c鑞g hi課 i: <color=Violet>"..nNextContriMask.."<color> lo筰\n"..
			"Ng﹏ s竎h chi課 b� chi cho ph� b秓 tr� bang m鏸 ng祔: <color=Violet>"..nNextMaintainFund.." v筺<color>\n"..
			"Ng﹏ s竎h ki課 thi誸 ban u: <color=Violet>"..nNextOpenFund.." v筺<color>\n"
		return szMsg
	end
end

end