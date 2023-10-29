Include("\\script\\npclevelscript\\lib.lua");

--��������
function SetLife(level,param1,param2,param3)
	return Quadratic(level,param1,param2,param3);
end;

--���þ���ֵ
function SetExp(level,param1,param2,param3)
	return Quadratic(level,param1,param2,param3);
end;

--��������
function SetAR(level,param1,param2,param3)
	return Quadratic(level,param1,param2,param3);
end;

--��������
function SetDP(level,param1,param2,param3)
	return Quadratic(level,param1,param2,param3);
end;

--���û�����������
function SetMinDamage(level,param1,param2,param3)
	return Quadratic(level,param1,param2,param3);
end;

--���û�����������
function SetMaxDamage(level,param1,param2,param3)
	return Quadratic(level,param1,param2,param3);
end;

--���û��
function SetFireResist(level,param1,param2)
	return Linear(level,param1,param2);
end;

--�����շ�
function SetPhysicsResist(level,param1,param2)
	return Linear(level,param1,param2);
end;

--���ñ���
function SetColdResist(level,param1,param2)
	return Linear(level,param1,param2);
end;

--�����׷�
function SetLightResist(level,param1,param2)
	return Linear(level,param1,param2);
end;

--���ö���
function SetPoisonResist(level,param1,param2)
	return Linear(level,param1,param2);
end;

--�����չ�����
function SetPhysicalDamageBase(level,param1,param2)
	return Linear(level,param1,param2);
end;

--���ö�������
function SetPoisonDamageBase(level,param1,param2)
	return Linear(level,param1,param2);
end;

--���ñ�������
function SetColdDamageBase(level,param1,param2)
	return Linear(level,param1,param2);
end;

--���û𹥻���
function SetFireDamageBase(level,param1,param2)
	return Linear(level,param1,param2);
end;

--�����׹�����
function SetLightingDamageBase(level,param1,param2)
	return Linear(level,param1,param2);
end;

--���ü���1�ȼ�
function SetSkillLevel1(level,param1,param2)
	local nLevel = Linear(level,param1,param2);
	if nLevel >= 64 then
		nLevel = 63
	end
	return nLevel
end;

--���ü���2�ȼ�
function SetSkillLevel2(level,param1,param2)
	local nLevel = Linear(level,param1,param2);
	if nLevel >= 64 then
		nLevel = 63
	end
	return nLevel
end;

--���ü���3�ȼ�
function SetSkillLevel3(level,param1,param2)
	local nLevel = Linear(level,param1,param2);
	if nLevel >= 64 then
		nLevel = 63
	end
	return nLevel
end;

--���ü���4�ȼ�
function SetSkillLevel4(level,param1,param2)
	local nLevel = Linear(level,param1,param2);
	if nLevel >= 64 then
		nLevel = 63
	end
	return nLevel
end;

--���ù⻷���ܵȼ�
function SetAuraSkillLevel(level,param1,param2)
	local nLevel = Linear(level,param1,param2);
	if nLevel >= 64 then
		nLevel = 63
	end
	return nLevel
end;

--���ñ������ܵȼ�
function SetPasstSkillLevel(level,param1,param2)
	local nLevel = Linear(level,param1,param2);
	if nLevel >= 64 then
		nLevel = 63
	end
	return nLevel
end;

--���������ظ���ֵ
function SetLifeReplenish(level,param1,param2)
	return Linear(level,param1,param2);
end;
