-------------------------------------------------------------------------
-- FileName		:	task_huoqimihan.lua
-- Author		:	zifeiyu
-- CreateTime	:	2005-09-10 
-- Desc			:	<#>�����ܺ�
-------------------------------------------------------------------------
DescLink_huoqimihan ="<#><link=image:\\spr\\item\\questkey\\taskobj075.spr>H�a T�t M�t H�m<link>"
function main()
	Describe(DescLink_huoqimihan.."<#> <enter>C� ��n m�a trung thu l� ��c C� minh ch� t�p h�p c�c cao th� v� Minh Nguy�t tr�n, v�a th�ng b�o tin t�c v� l�m, v�a t� ch�c h�i thi l�m b�nh."
	.."<enter>  ��c d��c c�a ���ng M�n v� s�c v� v�, tr�ng ph�i ch�t ngay l�o t�c. Ng��i ph�i h�t s�c c�n th�n kh�ng ���c �� l� th�n ph�n c�a m�nh. N�u b� ch�ng ph�t gi�c, h�y u�ng ngay vi�n ��c d��c n�y, s� l�m v�o t�nh tr�ng ch�t t�m th�i. T�c kh�c s� c� ng��i ��n c�u ng��i", 1, "K�t th�c ��i tho�i/no")
	return 1
end

function no()
end