-- oddsaward.lua by wangbin 2005-09-02
-- items: һ��table��ÿһ��Ϊһ������ֵ
function get_odds_award(items, base)
	local valve = random(0, base*1000) / 1000
	local odds = 0
	local i = 1
	while (i <= getn(items)) do
		odds = odds + items[i]
		if (odds >= valve) then
			return i
		end
		i = i + 1
	end
	return -1
end
