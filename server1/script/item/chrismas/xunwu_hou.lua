----------------------------------------------------------------
	--FileName:	xunwu_hou.lua
	--Creater:	firefox
	--Date:		2005-12-19
	--Comment:	ʥ���ڻ��������Ѱ���
	--			���ܣ�ÿ���ʹ��10�Σ�ÿʹ��һ�α���������һ��װ��
-----------------------------------------------------------------
Uworld0001 = 2001
MAX_USETIME = 10
--��һ�ֽ�Ϊ����ʹ�ô���
--�ڶ��ֽ�Ϊ���ʹ�õ�����
function main()
	use_day = GetByte(GetTask(Uworld0001), 2)
	
	nDay = tonumber(date("%d"))
	if (use_day ~= nDay) then
		SetTask(Uworld0001, SetByte(GetTask(Uworld0001), 1, 0))
	end
	use_time = GetByte(GetTask(Uworld0001), 1)
	if (use_time >= MAX_USETIME) then
		Talk(1, "", "Nh�ng con kh� �� ng� say h�t r�i! B�n h�y mau ��n b�t n�!")
	else
		--AddItem()
		SetTask(Uworld0001, SetByte(GetTask(Uworld0001), 1, use_time + 1))
		Msg2Player("B�n nh�n ���c 1 b� trang b� ng�u nhi�n")
	end
	return 1
end