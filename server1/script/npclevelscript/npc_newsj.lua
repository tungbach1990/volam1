-----------------------------------------------
--Create by handsome Huihui 2013-3-11
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
	if(StyleName=="Level1" or StyleName=="Level2" or StyleName=="Level3" or StyleName=="Level4") then
		return floor(Link(Level,{{100,20},{140,60},{141,60}}))
	end;

	if(StyleName=="AIMode") then  
		return ParamStr
	end
	if(StyleName=="AIParam1") then 
		return ParamStr
	end
	if(StyleName=="AIParam2") then 
		return ParamStr
	end
	if(StyleName=="AIParam3") then 
		return ParamStr
	end
	if(StyleName=="AIParam4") then 	
		return ParamStr
	end
	if(StyleName=="AIParam5") then 
		return ParamStr
	end
	if(StyleName=="AIParam6") then 
		return ParamStr
	end
	if(StyleName=="AIParam7") then 
		return ParamStr
	end
	if(StyleName=="AIParam8") then 
		return ParamStr
	end
	if(StyleName=="AIParam9") then 
		return ParamStr
	end
	
	if( StyleName=="Skill3" or StyleName=="Skill4" or StyleName=="Skill1" or StyleName=="Skill2") then
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
	
		if(StyleName=="AuraSkillLevel") then
		param1=GetParam(ParamStr,1);
		param2=GetParam(ParamStr,2);
		return param2;
	end;
	if(StyleName=="AuraSkillId") then
		return ParamStr
	end
	if(StyleName=="PasstSkillLevel") then
		param1=GetParam(ParamStr,1);
		param2=GetParam(ParamStr,2);
		return param2;
	end;
	if(StyleName=="PasstSkillId") then
		return ParamStr
	end
	
	if(StyleName=="PhysicalDamageBase") then --���չ���
		return floor(Level)
	end;
	if(StyleName=="PhysicalMagicBase") then --���չ���
		if(Series==0) then
			return floor(Level)
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
			return floor(Level/5)
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
			return floor(Level)
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
			return floor(Level)
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
			return floor(Level)
		end
		return 100
	end;
	if(StyleName=="PhysicsResist") then --�տ�
		if(Series==0) then
			return floor(Link(Level,{{100,75},{120,95},{121,95}}))
		elseif(Series==1) then
			return floor(Link(Level,{{100,65},{120,95},{121,95}}))
		elseif(Series==2) then
			return floor(Link(Level,{{100,75},{120,95},{121,95}}))
		elseif(Series==3) then
			return floor(Link(Level,{{100,85},{120,95},{121,95}}))
		elseif(Series==4) then
			return floor(Link(Level,{{100,75},{120,95},{121,95}}))
		end
		return 0
	end
	if(StyleName=="ColdResist") then --����
		if(Series==2) then
			return floor(Link(Level,{{100,75},{120,95},{121,95}}))
		elseif(Series==3) then
			return floor(Link(Level,{{100,65},{120,95},{121,95}}))
		elseif(Series==0) then
			return floor(Link(Level,{{100,75},{120,95},{121,95}}))
		elseif(Series==4) then
			return floor(Link(Level,{{100,85},{120,95},{121,95}}))
		elseif(Series==1) then
			return floor(Link(Level,{{100,75},{120,95},{121,95}}))
		end
		return 0
	end
	if(StyleName=="FireResist") then --���
		if(Series==3) then
			return floor(Link(Level,{{100,75},{120,95},{121,95}}))
		elseif(Series==0) then
			return floor(Link(Level,{{100,65},{120,95},{121,95}}))
		elseif(Series==1) then
			return floor(Link(Level,{{100,75},{120,95},{121,95}}))
		elseif(Series==2) then
			return floor(Link(Level,{{100,85},{120,95},{121,95}}))
		elseif(Series==4) then
			return floor(Link(Level,{{100,75},{120,95},{121,95}}))
		end
		return 0
	end
	if(StyleName=="LightResist") then  --�׷�
		if(Series==4) then
			return floor(Link(Level,{{100,75},{120,95},{121,95}}))
		elseif(Series==3) then
			return floor(Link(Level,{{100,75},{120,95},{121,95}}))
		elseif(Series==0) then
			return floor(Link(Level,{{100,75},{120,95},{121,95}}))
		elseif(Series==1) then
			return floor(Link(Level,{{100,85},{120,95},{121,95}}))
		elseif(Series==2) then
			return floor(Link(Level,{{100,65},{120,95},{121,95}}))
		end
		return 0
	end
	if(StyleName=="PoisonResist") then  --����
		if(Series==1) then
			return floor(Link(Level,{{100,75},{120,95},{121,95}}))
		elseif(Series==3) then
			return floor(Link(Level,{{100,75},{120,95},{121,95}}))
		elseif(Series==4) then
			return floor(Link(Level,{{100,65},{120,95},{121,95}}))
		elseif(Series==0) then
			return floor(Link(Level,{{100,85},{120,95},{121,95}}))
		elseif(Series==2) then
			return floor(Link(Level,{{100,75},{120,95},{121,95}}))
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
	return floor(GetAttackRating(Level, Param1, Param2));
end;

if (StyleName == "Defense") then
	return floor(GetDefense(Level, Param1, Param2));
end;

if (StyleName == "MinDamage") then
return GetMinDamage(Level, Param1, Param2);
end;

if (StyleName == "MaxDamage") then
return GetMaxDamage(Level, Param1, Param2);
end;

result = Param1;
return result;
end;

--ͨ�õ����Լ��㹫ʽ��
function GetData(Level, Param1, Param2)
result = Param1 * Level + Param2;
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
return floor(Param1);
end;

--�����ʼ��㺯����
function GetDefense(Level, Param1, Param2)
return floor(Param1);
end;


--��С�˺����㺯��
function GetMinDamage(Level, Param1, Param2)
return floor(Param1);
end;


--����˺����㺯��
function GetMaxDamage(Level, Param1, Param2)
return floor(Param1);
end;

