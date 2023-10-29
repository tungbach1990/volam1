--Create by yfeng 2004-06-01

KString={} --�Զ���String������

--------------------------------------
--�÷��ѷ�Splitor�����ַ���String
--���ط��ѳ������ַ�������
--------------------------------------
function KString.Split(String,Splitor)
	if(Splitor==nil) then
		Splitor="\t"
	end
	local strArray={}
	local strStart=1
	local splitorLen = strlen(Splitor)
	local index=strfind(String,Splitor,strStart)
	if(index==nil) then
		strArray[1]=String
		return strArray
	end
	local i=1
	while index do
		strArray[i]=strsub(String,strStart,index-1)
		i=i+1
		strStart=index+splitorLen
		index = strfind(String,Splitor,strStart)
	end
	strArray[i]=strsub(String,strStart,strlen(String))
	return strArray
end

----------------------------------------------------
--���ַ�������strArray�еĸ�Ԫ�ذ������ϲ����ַ���
----------------------------------------------------
function KString.Join(StrArray,Insertor)
	local maxItem = getn(StrArray)
	if(maxitem ==0) then
		return nil
	end
	if(Insertor==nil) then
		Insertor=""
	end
	local i
	local str=""
	for i=1,maxItem do
		str=str..StrArray[i]..Insertor
	end
	return str
end

----------------------------------------------------
--ɾ���ַ����е�ǰ��ո�
----------------------------------------------------
function KString.Trim(Str)
	local start,last = strfind(Str,"%S+.*%S+")
	if(start==nil or last==nil) then
		return Str
	end
	return strsub(Str,start,last)
end