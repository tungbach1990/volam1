--ȡ����|�ָ�Ĳ����ĺ�����
function GetParam(strParam, index)
	nLastBegin = 1
	for i=1, index - 1 do
		nBegin = strfind(strParam, "|", nLastBegin)
		--if nBegin == nil then
		--	print(strParam)
		--	return "0"
		--end
		nLastBegin = nBegin + 1
	end;
	num = 1
	strnum = strsub(strParam, nLastBegin)
	nEnd = strfind(strnum, "|")
	if nEnd == nil then 
		return strnum
	end
	str1 = strsub(strnum,1,nEnd -1);
	return str1
end;

--���Ժ�����ȡ��y=kx+c
function Linear(x,k,c)
	return floor(k*x+c);
end;

--���κ�����ȡ��y=ax^2+bx+c
function Quadratic(x,a,b,c)
	return floor(a*x*x+b*x+c);
end;
