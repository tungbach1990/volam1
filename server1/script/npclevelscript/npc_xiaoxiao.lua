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
	if(StyleName=="Level1") then
		return floor(Link(Level,{{1,1},{100,35}}))
	end;
	if(StyleName=="Level2" or StyleName=="Level3" or StyleName=="Level4") then
		return floor(Link(Level,{{1,1},{100,60},{101,60}}))
	end;

	if(StyleName=="AIMode") then  --������ѪAIģʽ
		return 2
	end
	if(StyleName=="AIParam1") then --�޵���ʱ��Ѳ�߸���20%
		return floor(Link(Level,{{1,10},{20,20},{60,50},{100,80},{101,80}}))
	end
	if(StyleName=="AIParam2") then --ʣ��������������ٷֱȵ�ʱ��ִ����Ӧ����
		return floor(Link(Level,{{1,50},{80,50},{81,25},{100,25}}))
	end
	if(StyleName=="AIParam3") then --��AIParam2��������ֵ�ʱ���Ƿ�ִ����Ӧ����ĸ���
		return floor(Link(Level,{{1,10},{80,10},{81,5},{100,5}}))
	end
	if(StyleName=="AIParam4") then 	--��AIParam2��������ֲ�����Ҫִ����Ӧ����ʹ�ûظ�
									--���ܵĸ��� ��ӦSkillList����ļ��� 1
		return 100
	end
	if(StyleName=="AIParam5") then --skill2��ʹ�ø���:��ͨ������
		return floor(Link(Level,{{1,25},{50,25},{50,10},{80,10},{80,0},{100,0}}))
	end
	if(StyleName=="AIParam6") then --skill3��ʹ�ø���:����������
		return floor(Link(Level,{{1,15},{50,15},{50,40},{80,40},{80,38},{100,38}}))
	end
	if(StyleName=="AIParam7") then --skill4��ʹ�ø���:Զ�̹���
		return floor(Link(Level,{{1,0},{50,0},{50,5},{80,5},{80,7},{100,7}}))
	end
	if(StyleName=="AIParam8") then --��������
		return 20
	end
	if(StyleName=="AIParam9") then --Ѳ�߸���
		return floor(Link(Level,{{1,20},{50,40},{80,60},{100,70},{101,70}}))
	end
	
	if(StyleName=="Skill1") then --��Ѫ��������
		return 101
	end
	if(StyleName=="Skill2" or StyleName=="Skill3") then --�������й���
		if(Series==0) then
			return 419
		elseif(Series==1) then
			return 420
		elseif(Series==2) then
			return 421
		elseif(Series==3) then
			return 422
		elseif(Series==4) then
			return 423
		end
		return 418
	end
	if(StyleName=="Skill4" ) then --Զ�����й���
		if(Level < 60 ) then  --60����ǰ��Զ�̹���
			return 418
		end
		if(Series==0) then
			return 424
		elseif(Series==1) then
			return 425
		elseif(Series==2) then
			return 426
		elseif(Series==3) then
			return 427
		elseif(Series==4) then
			return 428
		end
		return 418
	end
	if(StyleName=="PhysicalDamageBase") then --���չ���
		return 2*floor(5*Level*2/3)
	end;
	if(StyleName=="PhysicalMagicBase") then --���չ���
		if(Series==0) then
			return 2*floor((Link(Level,{{1,5},{20,50},{60,300},{100,600}})/2)*2/3)
		elseif(Series==1) then
			return 0
		elseif(Series==2) then
			return 0
		elseif(Series==3) then
			return 0
		elseif(Series==4) then
			return 0
		end
		return 100
	end;
	if(StyleName=="PoisonDamageBase") then --�ⶾ����
		return 0
	end;
	if(StyleName=="PoisonMagicBase") then --�ڶ�����
		if(Series==0) then
			return 0
		elseif(Series==1) then
			return 2*floor((Link(Level,{{1,5},{20,50},{60,300},{100,600}})/20)*2/3)
		elseif(Series==2) then
			return 0
		elseif(Series==3) then
			return 0
		elseif(Series==4) then
			return 0
		end
		return 100
	end;
	if(StyleName=="ColdDamageBase") then --�������
		return 0
	end;
	if(StyleName=="ColdMagicBase") then --�ڱ�����
		if(Series==0) then
			return 0
		elseif(Series==1) then
			return 0
		elseif(Series==2) then
			return 2*floor((Link(Level,{{1,5},{20,50},{60,300},{100,600}})/2)*2/3)
		elseif(Series==3) then
			return 0
		elseif(Series==4) then
			return 0
		end
		return 100
	end;
	if(StyleName=="FireDamageBase") then --��𹥻�
		return 0
	end;
	if(StyleName=="FireMagicBase") then --�ڻ𹥻�
		if(Series==0) then
			return 0
		elseif(Series==1) then
			return 0
		elseif(Series==2) then
			return 0
		elseif(Series==3) then
			return 2*floor((Link(Level,{{1,5},{20,50},{60,300},{100,600}})/2)*2/3)
		elseif(Series==4) then
			return 0
		end
		return 100
	end;
	if(StyleName=="LightingDamageBase") then --���׹���
		return 0
	end
	if(StyleName=="LightingMagicBase") then --���׹���
		if(Series==0) then
			return 0
		elseif(Series==1) then
			return 0
		elseif(Series==2) then
			return 0
		elseif(Series==3) then
			return 0
		elseif(Series==4) then
			return 2*floor((Link(Level,{{1,5},{20,50},{60,300},{100,600}})/2)*2/3)
		end
		return 100
	end;
	if(StyleName=="PhysicsResist") then --�տ�
		if(Series==3) then
			return floor(Link(Level,{{1,10},{20,30},{60,70},{100,95}}))
		elseif(Series==0) then
			return floor(Link(Level,{{1,0},{100,25}}))
		elseif(Series==2) then
			return floor(Link(Level,{{1,0},{100,25}}))
		elseif(Series==1) then
			return floor(Link(Level,{{1,0},{20,-10},{60,-15},{100,-30}}))
		elseif(Series==4) then
			return floor(Link(Level,{{1,0},{100,25}}))
		end
		return 0
	end
	if(StyleName=="ColdResist") then --����
		if(Series==4) then
			return floor(Link(Level,{{1,10},{20,30},{60,70},{100,95}}))
		elseif(Series==2) then
			return floor(Link(Level,{{1,0},{100,25}}))
		elseif(Series==0) then
			return floor(Link(Level,{{1,0},{100,25}}))
		elseif(Series==3) then
			return floor(Link(Level,{{1,0},{20,-10},{60,-15},{100,-30}}))
		elseif(Series==1) then
			return floor(Link(Level,{{1,0},{100,25}}))
		end
		return 0
	end
	if(StyleName=="FireResist") then --���
		if(Series==2) then
			return floor(Link(Level,{{1,10},{20,30},{60,70},{100,95}}))
		elseif(Series==3) then
			return floor(Link(Level,{{1,0},{100,25}}))
		elseif(Series==1) then
			return floor(Link(Level,{{1,0},{100,25}}))
		elseif(Series==0) then
			return floor(Link(Level,{{1,0},{20,-10},{60,-15},{100,-30}}))
		elseif(Series==4) then
			return floor(Link(Level,{{1,0},{100,25}}))
		end
		return 0
	end
	if(StyleName=="LightResist") then  --�׷�
		if(Series==1) then
			return floor(Link(Level,{{1,10},{20,30},{60,70},{100,95}}))
		elseif(Series==3) then
			return floor(Link(Level,{{1,0},{100,25}}))
		elseif(Series==0) then
			return floor(Link(Level,{{1,0},{100,25}}))
		elseif(Series==2) then
			return floor(Link(Level,{{1,0},{20,-10},{60,-15},{100,-30}}))
		elseif(Series==4) then
			return floor(Link(Level,{{1,0},{100,25}}))
		end
		return 0
	end
	if(StyleName=="PoisonResist") then  --����
		if(Series==0) then
			return floor(Link(Level,{{1,10},{20,30},{60,70},{100,95}}))
		elseif(Series==3) then
			return floor(Link(Level,{{1,0},{100,25}}))
		elseif(Series==1) then
			return floor(Link(Level,{{1,0},{100,25}}))
		elseif(Series==4) then
			return floor(Link(Level,{{1,0},{20,-10},{60,-15},{100,-30}}))
		elseif(Series==2) then
			return floor(Link(Level,{{1,0},{100,25}}))
		end
		return 0
	end
	
	
Param1 = GetParam(ParamStr,1);
Param2 = GetParam(ParamStr,2);

result = GetData(Level, Param1, Param2);
return result;
end;

--�ؼ����ݵļ��㺯��
function GetNpcKeyData(Series, Level, StyleName, Param1, Param2, Param3)
if (StyleName == "Exp") then
	return GetExp(Level, Param1, Param2);
end;

if (StyleName == "Life") then
	return GetLife(Level, Param1, Param2);
end;

if (StyleName == "AttackRating") then
	if(Level < 30) then
		return GetAttackRating(Level, Param1, Param2)
	end
	return floor(GetAttackRating(Level, Param1, Param2)*1.2);
end;

if (StyleName == "Defense") then
	if(Level < 30) then
		return GetDefense(Level, Param1, Param2)
	end
	return floor(GetDefense(Level, Param1, Param2)*1.1);
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
return floor(Param1);
end;

--����ֵ���㺯��
function GetLife(Level, Param1, Param2)
return floor(Param1);
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

