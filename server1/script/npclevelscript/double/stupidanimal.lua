-----------------------------------------------
--Create by yfeng 2004-05-20
-----------------------------------------------

-----------------------------------------------
--����2���㣬�����κ���f(x)=k*x+b
--y= (y2-y1)*(x-x1)/(x2-x1)+y1
--��x2=x1, ��x=c,��ֱ����һ����ֱ��x���ֱ��
--���ǿ���ȡ��y=����ֵ
--��ˣ������֪����(x1,y1),(x2,y2)����ù���2���
--����Ϊ��
function Line(x,x1,y1,x2,y2)
	if(x2==x1) then
		return y2
	end
	return (y2-y1)*(x-x1)/(x2-x1)+y1
end

-----------------------------------------------
--����2���㣬��2���κ���f(x)=a*x2+c
--y= (y2-y1)*x*x/(x2*x2-x1*x1)-(y2-y1)*x1*x1/(x2*x2-x1*x1)+y1
--��x1����x2 < 0 ,y =0
--��x2=x1, ��x=c,��һ����ֱ��x���ֱ��
--���ǿ���ȡ��y=����ֵ
--��ˣ������֪����(x1,y1),(x2,y2)����ù���2���
--����Ϊ��extrac
function Conic(x,x1,y1,x2,y2)
	if((x1 < 0) or (x2<0))then 
		return 0
	end
	if(x2==x1) then
		return y2
	end
	return (y2-y1)*x*x/(x2*x2-x1*x1)-(y2-y1)*x1*x1/(x2*x2-x1*x1)+y1
end

-----------------------------------------------
--����2���㣬��-2���κ���f(x)=a*sqrt(x2)+c
--y=(y2-y1)*x/(sqrt(x2)-sqrt(x1))+y1-(y2-y1)/((sqrt(x2)-sqrt(x1))
--��x2����x1<0, y=0,
--��x1=x2,��x=c,��һ����ֱ��x���ֱ��
--���ǿ���ȡ��y=����ֵ
--��ˣ������֪����(x1,y1),(x2,y2)����ù���2���
--����Ϊ��extrac
function Extrac(x,x1,y1,x2,y2)
	if((x1 < 0) or (x2<0))then 
		return 0
	end
	if(x2==x1) then
		return y2
	end
	return (y2-y1)*(x-x1)/(x2-x1)+y1
end

-----------------------------------------------
--���������:Link(x,points)
--����points�ṩ��һϵ�е㣬�����ڵ��������������
--return yֵ
--x ����ֵ
--points �㼯��
--���磺points������{{x1,y1,func=xxx},{x2,y2,func=xxx},...{xn,yn,func=xxx}}��ӳ��
function Link(x,points)
	num = getn(points)
	if(num<2) then
		return -1
	end
	for i=1,num do
		if(points[i][3]==nil) then
			points[i][3]=Line
		end
	end
	if(x < points[1][1]) then
		return points[1][3](x,points[1][1],points[1][2],points[2][1],points[2][2])
	end
	if(x > points[num][1]) then
		return points[num][3](x,points[num-1][1],points[num-1][2],points[num][1],points[num][2])
	end
	
	c = 2
	for i=2,num do
		if((x >= points[i-1][1]) and (x <= points[i][1])) then
			c = i
			break
		end
	end
	return points[c][3](x,points[c-1][1],points[c-1][2],points[c][1],points[c][2])
end


--����NPC����
--���Լ�������԰�����
--Exp��Life��LifeReplenish��AttackRating��Defense��MinDamage��MaxDamage��
--Level1��Level2��Level3��Level4��



--ȡ����|�ָ�Ĳ����ĺ�����

function GetParam(strParam, index)
nLastBegin = 1
for i=1, index - 1 do
nBegin = strfind(strParam, "|", nLastBegin)
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



--�������������һ������ΪNPC�ȼ����ȶ�������Ϊ�������ͣ������������Ǵ����npcs�е��ַ�����
--��һ��npc�����õĽű����Բ����ǵ��������������롣
function GetNpcLevelData(Series, Level, StyleName, ParamStr)
	if(StyleName=="AIMode") then  --��������AIģʽ
		return ParamStr
	end
	if(strfind(StyleName,"AIParam%d")) then 
		return ParamStr
	end
	
	if(strfind(StyleName,"Skill%d")) then 
		return ParamStr
	end
	if(StyleName=="PhysicalDamageBase") then --���չ���
		return 0
	end;
	if(StyleName=="PhysicalMagicBase") then --���չ���
		return 0
	end;
	if(StyleName=="PoisonDamageBase") then --�ⶾ����
		return 0
	end;
	if(StyleName=="PoisonMagicBase") then --�ڶ�����
		return 0
	end;
	if(StyleName=="ColdDamageBase") then --�������
		return 0
	end;
	if(StyleName=="ColdMagicBase") then --�ڱ�����
		return 0
	end;
	if(StyleName=="FireDamageBase") then --��𹥻�
		return 0
	end;
	if(StyleName=="FireMagicBase") then --�ڻ𹥻�
		return 0
	end;
	if(StyleName=="LightingDamageBase") then --���׹���
		return 0
	end;
	if(StyleName=="LightingMagicBase") then --���׹���
		return 0
	end;
	
	
Param1 = GetParam(ParamStr,1);
Param2 = GetParam(ParamStr,2);

result = GetData(Level, Param1, Param2);
return result;
end;

--�ؼ����ݵļ��㺯��
function GetNpcKeyData(Series, Level, StyleName, Param1, Param2, Param3)
if (StyleName == "Exp") then
return GetExp(Level, Param1, Param2)*2;
end;

if (StyleName == "Life") then
return GetLife(Level, Param1, Param2);
end;

if (StyleName == "AttackRating") then
return GetAttackRating(Level, Param1, Param2);
end;

if (StyleName == "Defense") then
return GetDefense(Level, Param1, Param2);
end;

if (StyleName == "MinDamage") then
return GetMinDamage(Level, Param1, Param2);
end;

if (StyleName == "MaxDamage") then
return GetMaxDamage(Level, Param1, Param2);
end;

result = Param1 * Level * Level + Param2 * Level + Param3;
return result;
end;

--ͨ�õ����Լ��㹫ʽ��
function GetData(Level, Param1, Param2)
result = Param2 * Level + Param1;
return floor(result);
end;

--���µ�DataPara1��ʾ���Ժ���y=kx+b�е�b��DataPara2��ʾk��
--����ֵ���㹫ʽ
function GetExp(Level, Param1, Param2)

if (Level <= 10) then
DataPara1=40
DataPara2=5
return GetData(Level, DataPara1, DataPara2)
end;

if (Level <= 20) then
DataPara1=120
DataPara2=5
return GetData(Level-10, DataPara1, DataPara2)
end;

if (Level <= 30) then
DataPara1=240
DataPara2=5
return GetData(Level-20, DataPara1, DataPara2)
end;

if (Level <= 40) then
DataPara1=360
DataPara2=5
return GetData(Level-30, DataPara1, DataPara2)
end;

if (Level <= 50) then
DataPara1=480
DataPara2=5
return GetData(Level-40, DataPara1, DataPara2)
end;

if (Level <= 60) then
DataPara1=600
DataPara2=5
return GetData(Level-50, DataPara1, DataPara2)
end;

if (Level <= 70) then
DataPara1=720
DataPara2=5
return GetData(Level-60, DataPara1, DataPara2)
end;

if (Level <= 80) then
DataPara1=800
DataPara2=5
return GetData(Level-70, DataPara1, DataPara2)
end;

if (Level <= 90) then
DataPara1=900
DataPara2=5
return GetData(Level-80, DataPara1, DataPara2)
end;

if (Level <= 100) then
DataPara1=1000
DataPara2=5
return GetData(Level-90, DataPara1, DataPara2)
end;

result = Param2 * Level + Param1;
return floor(result);
end;


--����ֵ���㺯��
function GetLife(Level, Param1, Param2)

if (Level <= 10) then
DataPara1=50
DataPara2=3
return GetData(Level, DataPara1, DataPara2)
end;

if (Level <= 20) then
DataPara1=122
DataPara2=8
return GetData(Level-10, DataPara1, DataPara2)
end;

if (Level <= 30) then
DataPara1=270
DataPara2=30
return GetData(Level-20, DataPara1, DataPara2)
end;

if (Level <= 40) then
DataPara1=900
DataPara2=35
return GetData(Level-30, DataPara1, DataPara2)
end;

if (Level <= 50) then
DataPara1=1450
DataPara2=60
return GetData(Level-40, DataPara1, DataPara2)
end;

if (Level <= 60) then
DataPara1=2100
DataPara2=48
return GetData(Level-50, DataPara1, DataPara2)
end;

if (Level <= 70) then
DataPara1=2950
DataPara2=54
return GetData(Level-60, DataPara1, DataPara2)
end;

if (Level <= 80) then
DataPara1=3500
DataPara2=58
return GetData(Level-70, DataPara1, DataPara2)
end;

if (Level <= 90) then
DataPara1=5050
DataPara2=11
return GetData(Level-80, DataPara1, DataPara2)
end;

if (Level <= 100) then
DataPara1=6450
DataPara2=11
return GetData(Level-90, DataPara1, DataPara2)
end;

result = Param2 * Level + Param1;
return floor(result);
end;



--�����ʼ��㺯��
function GetAttackRating(Level, Param1, Param2)

if (Level <= 10) then
DataPara1=10
DataPara2=3
return GetData(Level, DataPara1, DataPara2)
end;

if (Level <= 20) then
DataPara1=50
DataPara2=4
return GetData(Level-10, DataPara1, DataPara2)
end;

if (Level <= 30) then
DataPara1=100
DataPara2=5
return GetData(Level-20, DataPara1, DataPara2)
end;

if (Level <= 40) then
DataPara1=250
DataPara2=5
return GetData(Level-30, DataPara1, DataPara2)
end;

if (Level <= 50) then
DataPara1=400
DataPara2=5
return GetData(Level-40, DataPara1, DataPara2)
end;

if (Level <= 60) then
DataPara1=500
DataPara2=5
return GetData(Level-50, DataPara1, DataPara2)
end;

if (Level <= 70) then
DataPara1=600
DataPara2=5
return GetData(Level-60, DataPara1, DataPara2)
end;

if (Level <= 80) then
DataPara1=700
DataPara2=5
return GetData(Level-70, DataPara1, DataPara2)
end;

if (Level <= 90) then
DataPara1=800
DataPara2=5
return GetData(Level-80, DataPara1, DataPara2)
end;

if (Level <= 100) then
DataPara1=900
DataPara2=5
return GetData(Level-90, DataPara1, DataPara2)
end;

result = Param2 * Level + Param1;
return floor(result);
end;



--�����ʼ��㺯����
function GetDefense(Level, Param1, Param2)

if (Level <= 10) then
DataPara1=10
DataPara2=0
return GetData(Level, DataPara1, DataPara2)
end;

if (Level <= 20) then
DataPara1=50
DataPara2=3
return GetData(Level-10, DataPara1, DataPara2)
end;

if (Level <= 30) then
DataPara1=100
DataPara2=5
return GetData(Level-20, DataPara1, DataPara2)
end;

if (Level <= 40) then
DataPara1=150
DataPara2=5
return GetData(Level-30, DataPara1, DataPara2)
end;

if (Level <= 50) then
DataPara1=200
DataPara2=5
return GetData(Level-40, DataPara1, DataPara2)
end;

if (Level <= 60) then
DataPara1=300
DataPara2=5
return GetData(Level-50, DataPara1, DataPara2)
end;

if (Level <= 70) then
DataPara1=400
DataPara2=5
return GetData(Level-60, DataPara1, DataPara2)
end;

if (Level <= 80) then
DataPara1=500
DataPara2=5
return GetData(Level-70, DataPara1, DataPara2)
end;

if (Level <= 90) then
DataPara1=600
DataPara2=5
return GetData(Level-80, DataPara1, DataPara2)
end;

if (Level <= 100) then
DataPara1=800
DataPara2=10
return GetData(Level-90, DataPara1, DataPara2)
end;

result = Param2 * Level + Param1;
return floor(result);
end;


--��С�˺����㺯��
function GetMinDamage(Level, Param1, Param2)

if (Level <= 10) then
DataPara1=3
DataPara2=0.3
return floor(GetData(Level, DataPara1, DataPara2))
end;

if (Level <= 20) then
DataPara1=8
DataPara2=0.3
return floor(GetData(Level-10, DataPara1, DataPara2))
end;

if (Level <= 30) then
DataPara1=13
DataPara2=0.4
return floor(GetData(Level-20, DataPara1, DataPara2))
end;

if (Level <= 40) then
DataPara1=20
DataPara2=0.5
return floor(GetData(Level-30, DataPara1, DataPara2))
end;

if (Level <= 50) then
DataPara1=29
DataPara2=0.5
return floor(GetData(Level-40, DataPara1, DataPara2))
end;

if (Level <= 60) then
DataPara1=39
DataPara2=0.6
return floor(GetData(Level-50, DataPara1, DataPara2))
end;

if (Level <= 70) then
DataPara1=50
DataPara2=0.7
return floor(GetData(Level-60, DataPara1, DataPara2))
end;

if (Level <= 80) then
DataPara1=65
DataPara2=0.8
return floor(GetData(Level-70, DataPara1, DataPara2))
end;

if (Level <= 90) then
DataPara1=85
DataPara2=0.9
return floor(GetData(Level-80, DataPara1, DataPara2))
end;

if (Level <= 100) then
DataPara1=112
DataPara2=1
return floor(GetData(Level-90, DataPara1, DataPara2))
end;

result = Param2 * Level + Param1;
return floor(result);
end;


--����˺����㺯��
function GetMaxDamage(Level, Param1, Param2)

if (Level <= 10) then
DataPara1=3
DataPara2=0.3
return floor(GetData(Level, DataPara1, DataPara2))
end;

if (Level <= 20) then
DataPara1=8
DataPara2=0.3
return floor(GetData(Level-10, DataPara1, DataPara2))
end;

if (Level <= 30) then
DataPara1=13
DataPara2=0.4
return floor(GetData(Level-20, DataPara1, DataPara2))
end;

if (Level <= 40) then
DataPara1=20
DataPara2=0.5
return floor(GetData(Level-30, DataPara1, DataPara2))
end;

if (Level <= 50) then
DataPara1=29
DataPara2=0.5
return floor(GetData(Level-40, DataPara1, DataPara2))
end;

if (Level <= 60) then
DataPara1=39
DataPara2=0.6
return floor(GetData(Level-50, DataPara1, DataPara2))
end;

if (Level <= 70) then
DataPara1=50
DataPara2=0.7
return floor(GetData(Level-60, DataPara1, DataPara2))
end;

if (Level <= 80) then
DataPara1=65
DataPara2=0.8
return floor(GetData(Level-70, DataPara1, DataPara2))
end;

if (Level <= 90) then
DataPara1=85
DataPara2=0.9
return floor(GetData(Level-80, DataPara1, DataPara2))
end;

if (Level <= 100) then
DataPara1=112
DataPara2=1
return floor(GetData(Level-90, DataPara1, DataPara2))
end;

result = Param2 * Level + Param1;
return floor(result);
end;

