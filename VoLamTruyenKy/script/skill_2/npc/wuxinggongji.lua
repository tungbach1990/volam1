--�������������ڼ��㼼��������
--���巽����
--����1�������ȣ��������ٶȣ��������ظ��˺���������Χ���������Ӧ�ȼ�������
-- SkillExp(i) = Exp1*a^(i-1)*time*range

function GetSkillLevelData(levelname, data, level)

if (levelname == "physicsenhance_p") then
return Getphysicsdamage_p(level)
end;

if (levelname == "attackrating_p") then
return Getackrating_p(level)
end;

if (levelname == "seriesdamage_p") then
return Getseriesdamage_p(level)
end;

str1 = ""
return str1
end;

function Param2String(Param1, Param2, Param3)
return Param1..","..Param2..","..Param3
end;

function Getphysicsdamage_p(level)
result = 150+5*level
return Param2String(result,0,0)
end;

function Getackrating_p(level)
result = 200+5*level
return Param2String(result,0,0)
end;

function Getseriesdamage_p(level)
result = 30+floor(level/2)
return Param2String(result,0,0)
end;
