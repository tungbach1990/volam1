function OnDeath()
	skill_level = HaveMagic("D� C�u Quy�n ")
	if (skill_level >= 0) then
		if (skill_level < 10) then
			Talk(1,"","Bia luy�n c�ng m�t ch�t ph�n �ng c�ng kh�ng c�, b�n c�n ph�i luy�n nhi�u h�n!")
		elseif (skill_level < 20) then
			Talk(1,"","Bia luy�n c�ng h�nh nh� c� lung lay m�t ch�t, b�n luy�n t�p c�n �t l�m!")
		elseif (skill_level < 30) then
			Talk(1,"","Bia luy�n c�ng ch� r�i ra v�i h�n �� nh�, b�n luy�n t�p v�n ch�a ��!")
		elseif (skill_level < 40) then
			Talk(1,"","Bia luy�n c�ngb� b�n ��nh th�ng m�t l� l�n, quy�n ph�p c�a b�n �� c� m�t th�nh t�u!")
		else
			Talk(1,"","<color=red>Xin ch�c m�ng! Bia luy�n c�ng b� ��nh n�t th�nh t�ng m�nh, quy�n ph�p c�a b�n �� luy�n th�nh!<color>")
		end
	end
end;
