-------------------------------------------------------------------------
-- FileName		:	task_shenzhaoyuan1.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-08-31 18:02:14
-- Desc			:	����Զ���ָ�һ��������
-------------------------------------------------------------------------

DescLink_ShenZhaoYuan ="<#><link=image:\\spr\\item\\questkey\\taskobj075.spr>B� quy�t l�m b�nh c�a Th�m Thi�u Vi�n<link>"

function main()
	Describe(DescLink_ShenZhaoYuan.."<#>: Th�ng 5 n�m Thi�u H�ng th� 30, T�ng Kim t�m ngh� h�a, 2 b�n ��u lui binh �� ngh� ng�i. D�n ch�ng n�m �y ���c m�a, gia ��nh �o�n t�. th�n th�n tr�n tr�n ��u l�m l� t� �n tr�i ��t. T�c thi l�m b�nh c�ng t� �� m� c�.<enter>"
	.."Ng��i c� nghe n�i v� Thi�t M�c Ch�n ch�a? �� l� 1 ��i anh h�ng c�a M�ng C�, �� t�ng th�ng l�nh binh M�ng C� l�m ch�n ��ng ch�u �u v� th�ng t�nh g�n h�t Trung Nguy�n <enter>"
	.."Trung Nguuy�n l� m�t v�ng ��t m�u m� v� v�y lu�n ph�i ��i ��u v�i bao cu�c x�m l��c.<enter>"
	.."  Th�m Thi�u Vi�n",1,"K�t th�c ��i tho�i/no")
	return 1
end

function no()
end