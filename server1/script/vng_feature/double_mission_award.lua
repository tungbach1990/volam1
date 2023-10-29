tbVnX2Award = {}
tbVnX2Award.nStartDate = 201303110000
tbVnX2Award.nEndDate = 201303172400
tbVnX2Award.tbDuration = {
	["SJ"] = {201303110000, 201303172400},--T�ng Kim
	["COT"] = {201303110000, 201303172400},--V��t �i
	["YDBZ"] = {201303110000, 201303172400},--Vi�m ��
	["DRUM"] = {201303110000, 201303172400},--Tr�ng Kh�i Ho�n
	["TIANLU"] = {201304290000, 201305062400},--c�y thi�n l�c
}
function tbVnX2Award:IsActive(strType)
	local nCurDate = tonumber(date("%Y%m%d%H%M"))	
	if nCurDate < self.tbDuration[strType][1] or nCurDate > self.tbDuration[strType][2] then
		return nil
	end
	return 1
end

function tbVnX2Award:X2SongJin(nPoint)
	if self:IsActive("SJ") then
		nPoint = nPoint * 2
		Msg2Player(format("Tu�n l� v�ng: B�n ���c nh�n ��i �i�m t�ch l�y T�ng Kim, nh�n ���c <color=yellow>%d<color> �i�m t�ch l�y.", nPoint))		
	end
	return nPoint
end

function tbVnX2Award:X2ChallengeOfTime(nExp)
	if self:IsActive("COT") then
		nExp = nExp * 2
		Msg2Player(format("Tu�n l� v�ng: B�n ���c nh�n ��i �i�m kinh nghi�m khi qua �i, nh�n ���c <color=yellow>%d<color> �i�m kinh nghi�m.", nExp))		
	end
	return nExp
end

function tbVnX2Award:X2YDBZ(nExp)
	if self:IsActive("YDBZ") then
		nExp = nExp * 2
		Msg2Player(format("Tu�n l� v�ng: B�n ���c nh�n ��i �i�m kinh nghi�m khi qua �i, nh�n ���c <color=yellow>%d<color> �i�m kinh nghi�m.", nExp))		
	end
	return nExp
end

function tbVnX2Award:X2Drum(nExp)
	if self:IsActive("DRUM") then
		nExp = nExp * 2		
	end
	return nExp
end

function tbVnX2Award:X2Tianlu(nExp)
	if self:IsActive("TIANLU") then
		nExp = nExp * 2		
	end
	return nExp
end