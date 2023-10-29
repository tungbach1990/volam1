-- by yfeng

if not BAN_HEAD then
	Include("\\script\\global\\ban.lua")
end

function main(itemIdx)
	local mapid,_,_ = GetWorldPos()
	if(checkSJMaps(mapid)) then
		Msg2Player("Trong chi�n tr��ng T�ng Kim kh�ng th� s� d�ng ��i B�o ho�n.")
		return 1
	end
	local _,_,detail = GetItemProp(itemIdx)
	if(detail == 218) then --������
		AddSkillState(511,15,1,18*180)
		return 0
	end
	if(detail == 219) then --������
		AddSkillState(512,15,1,18*180)
		return 0
	end
	if(detail == 220) then --�շ���
		AddSkillState(513,20,1,18*180)
		return 0
	end
	if(detail == 221) then --������
		AddSkillState(514,20,1,18*180)
		return 0
	end
	if(detail == 222) then --������
		AddSkillState(515,20,1,18*180)
		return 0
	end
	if(detail == 223) then --�����
		AddSkillState(516,20,1,18*180)
		return 0
	end
	if(detail == 224) then --�׷���
		AddSkillState(517,20,1,18*180)
		return 0
	end
	if(detail == 225) then --������
		AddSkillState(518,20,1,18*180)
		return 0
	end
	if(detail == 226) then --������
		AddSkillState(519,20,1,18*180)
		return 0
	end
	if(detail == 227) then --������
		AddSkillState(520,20,1,18*180)
		return 0
	end
	if(detail == 228) then --������
		AddSkillState(521,20,1,18*180)
		return 0
	end
	if(detail == 229) then --�չ���
		AddSkillState(522,10,1,18*180)
		return 0
	end
	if(detail == 230) then --������
		AddSkillState(523,10,1,18*180)
		return 0
	end
	if(detail == 231) then --������
		AddSkillState(524,10,1,18*180)
		return 0
	end
	if(detail == 232) then --����
		AddSkillState(525,10,1,18*180)
		return 0
	end
	if(detail == 233) then --�׹���
		AddSkillState(526,10,1,18*180)
		return 0
	end
	if(detail == 234) then --������
		AddSkillState(527,10,1,18*180)
		return 0
	end
	if(detail == 235) then --������
		AddSkillState(528,10,1,18*180)
		return 0
	end

end

function GetDesc(itemIdx)
	local _,_,detail = GetItemProp(itemIdx)
	if(detail == 218) then --������
		return "<color=blue>Trong 3 ph�t:\n T�c �� xu�t chi�u ngo�i c�ng: t�ng 30%\n T�c �� xu�t chi�un�i c�ng: T�ng 30%<color>"
	end
	if(detail == 219) then --������
		return "<color=blue>Trong 3 ph�t:\n T�c �� di chuy�n: T�ng 30%<color>"
	end
	if(detail == 220) then --�շ���
		return "<color=blue>Trong 3 ph�t:\n Ph�ng v�t l�: T�ng 40%<color>"
	end
	if(detail == 221) then --������
		return "<color=blue>Trong 3 ph�t:\n Kh�ng ��c: T�ng 40%<color>"
	end
	if(detail == 222) then --������
		return "<color=blue>Trong 3 ph�t:\n Kh�ng b�ng: T�ng 40%<color>"
	end
	if(detail == 223) then --�����
		return "<color=blue>Trong 3 ph�t:\n Kh�ng h�a: T�ng 40%<color>"
	end
	if(detail == 224) then --�׷���
		return "<color=blue>Trong 3 ph�t:\n Kh�ng l�i: T�ng 40%<color>"
	end
	if(detail == 225) then --������
		return "<color=blue>Trong 3 ph�t:\n Th�i gian b� th��ng: Gi�m 40%<color>"
	end
	if(detail == 226) then --������
		return "<color=blue>Trong 3 ph�t:\n Th�i gian cho�ng: Gi�m 40%<color>"
	end
	if(detail == 227) then --������
		return "<color=blue>Trong 3 ph�t:\n Th�i gian tr�ng ��c: Gi�m 40%<color>"
	end
	if(detail == 228) then --������
		return "<color=blue>Trong 3 ph�t:\n Th�i gian l�m ch�m: Gi�m 40%<color>"
	end
	if(detail == 229) then --�չ���
		return "<color=blue>Trong 3 ph�t:\n S�t th��ng v�t l� h� ngo�i c�ng: T�ng 200%\n S�t th��ng v�t l� h� n�i c�ng: T�ng 100 �i�m<color>"
	end
	if(detail == 230) then --������
		return "<color=blue>Trong 3 ph�t:\n ��c s�t h� ngo�i c�ng: T�ng 10 �i�m/l�n\n ��c s�t h� n�i c�ng: T�ng 10 �i�m/l�n<color>"
	end
	if(detail == 231) then --������
		return "<color=blue>Trong 3 ph�t:\n B�ng s�t h� ngo�i c�ng: T�ng 100 �i�m\n B�ng s�t h� n�i c�ng: T�ng 100 �i�m<color>"
	end
	if(detail == 232) then --����
		return "<color=blue>Trong 3 ph�t:\n H�a s�t h� ngo�i c�ng: T�ng 100 �i�m\n H�a s�t h� n�i c�ng: T�ng 100 �i�m<color>"
	end
	if(detail == 233) then --�׹���
		return "<color=blue>Trong 3 ph�t:\n L�i s�t ngo�i c�ng: T�ng 100 �i�m\n L�i s�t n�i c�ng: T�ng 100 �i�m<color>"
	end
	if(detail == 234) then --������
		return "<color=blue>Trong 3 ph�t:\n Sinh l�c l�n nh�t: T�ng 1000 �i�m<color>"
	end
	if(detail == 235) then --������
		return "<color=blue>Trong 3 ph�t:\n N�i l�c l�n nh�t: T�ng 1000 �i�m<color>"
	end

end
