Include("\\script\\bonusvlmc\\func_check.lua");

function AcceptEXPBonusTK()
	SetGlbValue(GlbVar1, 1)
	SetTask(TSK_Active_TK, 1)
	AddGlobalNews("V� L�m Minh Ch� <color=yellow> "..VLMC_Name.." <color> k�u g�i c�c anh h�ng h�o ki�t trong thi�n h� h�y ��ng l�n h�p s�c ch�ng gi�c ngo�i bang. Nh�ng ai c� tinh th�n y�u n��c h�y nhanh ch�ng ��n t��ng ��i b�o danh �� ���c nh�n ph�n th��ng nh�n ��i �i�m kinh nghi�m khi  tham gia chi�n tr��ng !")
	Msg2Player("V� L�m Minh Ch� <color=yellow> "..VLMC_Name.." <color> bang th��ng nh�n ��i �i�m kinh nghi�m khi tham gia chi�n tr��ng !")
	WriteLog(date("%Y%m%d %H%M%S").."\t".."VLMC"..GetAccount().."\t"..GetName().."\t".."VLMC k�ch ho�t nh�n ��i EXP T�ng Kim")
end

function AcceptActiveX2EXP()
	SetGlbValue(GlbVar2, 1)
	SetTask(TSK_Active_x2EXP, 1)
	AddGlobalNews("V� L�m Minh Ch� <color=yellow> "..VLMC_Name.." <color> bang th��ng nh�n ��i �i�m kinh nghi�m khi ��nh qu�i, M�i t�t c� c�c anh h�ng h�o ki�t h�y mau nhanh ch�ng ��n t��ng ��i b�o danh nh�n th��ng")
	Msg2Player("V� L�m Minh Ch� <color=yellow> "..VLMC_Name.." <color> bang th��ng nh�n ��i �i�m kinh nghi�m khi ��nh qu�i")
	WriteLog(date("%Y%m%d %H%M%S").."\t".."VLMC"..GetAccount().."\t"..GetName().."\t".."VLMC k�ch ho�t ��nh qu�i nh�n nh�n ��i �i�m kinh nghi�m")
end

function GetEXPBonus()
	SetTask(TSK_GetBonusEXP, 1)
	AddSkillState(451, 20, 1, 18*60*180);
	Say("Ch�c m�ng ��i hi�p nh�n ���c hi�u qu� Nh�n ��i kinh nghi�m!");
	Msg2Player("B�n nh�n ���c hi�u qu� nh�n ��i kinh nghi�m trong v�ng 60 ph�t.");
	WriteLog(date("%Y%m%d %H%M%S").."\t".."VLMC"..GetAccount().."\t"..GetName().."\t".."nh�n nh�n ��i �i�m kinh nghi�m")
end

function Get2xExpTK()
	local nDate = tonumber(GetLocalDate("%y%m%d"))
	SetTask(TSK_Get2ExpTK, nDate)
	Say("Ch�c m�ng ��i hi�p nh�n ���c nh�n ��i kinh nghi�m trong chi�n tr��ng T�ng Kim!");
	Msg2Player("B�n nh�n ���c hi�u qu� nh�n ��i kinh nghi�m trong chi�n tr��ng T�ng Kim tr�n 21h00");
	WriteLog(date("%Y%m%d %H%M%S").."\t".."VLMC"..GetAccount().."\t"..GetName().."\t".."nh�n nh�n ��i �i�m kinh nghi�m T�ng Kim 21h00")
end

function ResetGlbValue()
	SetGlbValue(1252,0)
	SetGlbValue(1253,0)
end