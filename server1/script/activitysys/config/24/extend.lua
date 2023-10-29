Include("\\script\\activitysys\\config\\24\\head.lua")
Include("\\script\\activitysys\\config\\24\\config.lua")

pActivity.tbRankTitle = 
{
	[1] = "L�ng V�n",
	[2] = "Tuy�t Th�",
	[3] = "Ph� Qu�n",
	[4] = "Ng�o tuy�t",
	[5] = "Kinh L�i",
	[6] = "Ng� Phong",
	[7] = "Ph� Quang",
	[8] = "Kh�p Th�n",
	[9] = "K�nh Thi�n",
	[10] = "V� C�c",
}
function pActivity:IsOpen()
	return nil;
end

function pActivity:CheckFortuneRank(nRank)
	local nCurRank = GetPlayerFortuneRank();
	if (type(nRank) ~= "number" or type(nCurRank) ~= "number" or
		nRank <= 0 or nRank > 10 or nCurRank <= 0 or nCurRank > 10 or
		nCurRank < nRank) then
	
		if (type(self.tbRankTitle[nRank]) == "string") then
			Talk(1,"",format("Ng��i c�n ph�i ��t ��n <color=red>%s<color> m�i c� th� mua ��oc v�t ph�m n�y", self.tbRankTitle[nRank]));
		else
			Talk(1,"","Ng��i v�n kh�ng th� mua v�t ph�m n�y");
		end
		return nil;
	end
	
	return 1;
end