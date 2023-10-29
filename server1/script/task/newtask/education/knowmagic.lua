-- �������书·�ߣ��������ű���˽⣩
-- BY:xiaoyang (2004-11-30)
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\branch\\branch_head.lua")

function Uworld1000_knowmagic()
	Describe(DescLink_GeDaMenPaiSkills.."<#>:  V� h�c kh�ng c� c�nh gi�i t�i cao. Th�t ra v� c�ng c�c m�n ph�i quan tr�ng nh�t v�n l� si�ng n�ng luy�n t�p.",11,
	"Nga My ph�i/Uworld1000_emei",
	"���ng M�n/Uworld1000_tangmen",
	"Thi�n V��ng Bang/Uworld1000_tianwang",
	"Thi�n Nh�n Gi�o/Uworld1000_tianren",
	"V� �ang ph�i/Uworld1000_wudang",
	"Th�y Y�n m�n/Uworld1000_cuiyan",
	"Thi�u L�m ph�i/Uworld1000_shaolin",
	"C�i Bang/Uworld1000_gaibang",
	"C�n L�n ph�i/Uworld1000_kunlun",
	"Ng� ��c Gi�o/Uworld1000_wudu",
	"Sau s� h�i ti�p/no")
end

function Uworld1000_emei()
	Describe(DescLink_GeDaMenPaiSkills.."<#>:Nga Mi l� m�n ph�i do n� nhi s�ng l�p.'Nga Mi' v�a l� t�n g�i c�a v� s� t� s�ng l�p m�n ph�i v�a l� th�nh ��a n�i Nga Mi ",4,
	"Ki�m T�ng/Uworld1000_emeijianzong",
	"Kh� T�ng/Uworld1000_emeiqizong",
	"H� tr� /Uworld1000_emeifuzhu",
	"Sau s� h�i ti�p/no")
end

function Uworld1000_tangmen()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: ���ng m�n h�ng c� Xuy�n Th�c, �m kh� v� h�a kh� �� l�ng danh thi�n h�. Ng��i trong giang h� nghe ��n ���ng m�n th�y ��u bi�n s�c.",5,
	"Phi �ao/Uworld1000_tangmenfeidao",
	"N� ti�n/Uworld1000_tangmennujian",
	"Phi Ti�u/Uworld1000_tangmenfeibiao",
	"C�m b�y/Uworld1000_tangmenxianjing",
	"Sau s� h�i ti�p/no")
end

function Uworld1000_tianwang()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: Ng�y tr��c S� V��ng Chung T��ng kh�i binh t�i ��ng ��nh h�, kh�ng Kim ch�ng T�ng! V� sau S� V��ng b� s�t h�i, ngh�a qu�n t�n D��ng Y�u l�m th� l�nh, x�ng l� ��i Th�nh Thi�n V��ng! Ngh�a qu�n ph�t tri�n th�n t�c. V� sau b� Nh�c Phi ti�u di�t. Sau n�y con g�i D��ng y�u l� D��ng Anh tr� l�i n�i ��y, chi�u t�p ngh�a qu�n, n�i ti�p nghi�p l�n!",5,
	"�ao Thi�n V��ng/Uworld1000_daotianwang",
	"Th��ng Thi�n V��ng/Uworld1000_qiangtianwang",
	"Ch�y Thi�n V��ng/Uworld1000_chuitianwang",
	"H� tr� /Uworld1000_fuzhutianwang",
	"Sau s� h�i ti�p/no")
end

function Uworld1000_tianren()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: Thi�n Nh�n Gi�o l� t� ch�c c�a Kim Qu�c nh�m ��i ph� v�i V� L�m Nh�n s� c�a T�ng Qu�c, ���c phong l� T�t M�n Gi�o Qu�c gi�o c�a ��i Kim, gi�o ch� l� Kim Qu�c Qu�c s� Ho�n Nhan H�ng Li�t, cao th� trong gi�o nhi�u v� s�, c�n chi�u m� th�m ph�n �� Ch�nh ph�i v� T� ph�i c�a T�ng Qu�c",4,
	"Chi�n Nh�n/Uworld1000_zhanren",
	"Ma Nh�n/Uworld1000_moren",
	"Ch� Nh�n/Uworld1000_zuzhouren",
	"Sau s� h�i ti�p/no")
end

function Uworld1000_wudang()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: V� �ang s�n c�n g�i l� Th�i H�a s�n, ���c m�nh danh l�:'Trung Qu�c ��o gi�o danh s�n'. V� �ang ph�i ���c phong l� 'Huy�n Thi�n Tr�n V� ��i ��'. V� �ang ph�i �� c� l�ch s� l�u ��i. S�ng l�p m�n ph�i l� t� s� 'L�p Th�p ��o nh�n' Tr��ng Tam Phong",4,
	"Ki�m T�ng/Uworld1000_wudangjianzong",
	"Kh� T�ng/Uworld1000_wudangqizong",
	"H� tr� /Uworld1000_wudangfuzhu",
	"Sau s� h�i ti�p/no")
end

function Uworld1000_cuiyan()
	Describe(DescLink_GeDaMenPaiSkills.."<#>:L� 1 m�n ph�i th�n b� � V�n Nam, t��ng truy�n T� s� l�p ph�i l� 1 v� n� hi�p b� t�nh nh�n ph� r�y, b� �i �n c� �� qu�n h�t s� ��i?�� ��n v�ng n�i bi�n th�y V�n Nam xa x�i h�o l�nh,tr�n ���ng �i Ng��i g�p nhi�u c� nhi b� b� r�i �em v� nu�i d��ng v� truy�n th� v� c�ng.Th�y Y�n m�n v� ���ng M�n c�ng x�ng l� 'V� L�m Nh� M�n', ch� ti�c l� h�nh tung th�n b� n�n x�a nay �t Nam t� h�n n�o ���c th�a ni�m mong ��c.Th�y Y�n m�n cu�i c�ng l� Thi�n ���ng hay ��a ng�c.",4,
	"��n �ao/Uworld1000_cuiyandandao",
	"Song �ao/Uworld1000_cuiyanshuangdao",
	"H� tr� /Uworld1000_cuiyanfuzhu",
	"�� ta suy ngh� l�i!/no")
end

function Uworld1000_shaolin()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: Thi�u L�m T� s�ng l�p t� th�i B�c Ng�y Hi�u V�n �� N�m Th�i H�a th� 19 (C�ng Nguy�n n�m 495) ",5,
	"Quy�n Thi�u L�m/Uworld1000_quanshaolin",
	"C�n Thi�u L�m/Uworld1000_gunshaolin",
	"�ao Thi�u L�m/Uworld1000_daoshaolin",
	"H� tr� /Uworld1000_shaolinfuzhu",
	"�� ta suy ngh� l�i!/no")
end

function Uworld1000_gaibang()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: L�ch s� c�a C�i Bang n�i ra r�t d�i, ���c m�nh danh Thi�n H� �� Nh�t Bang. C�i Bang bang ch�ng nh� Ng�a h� t�ng long nh�n t�i v� s�.",4,
	"Ch��ng C�i/Uworld1000_zhanggai",
	"C�n C�i/Uworld1000_gungai",
	"H� tr� /Uworld1000_gaibangfuzhu",
	"�� ta suy ngh� l�i!/no")
end

function Uworld1000_kunlun()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: C�n L�n ph�i � t�n T�y V�c, tuy ���c s�ng l�p �� l�u nh�ng sau khi S� T� khai ph�i qua ��i, trong ph�i kh�ng c� ai l� xu�t ch�ng. M�i cho ��n h�n tr�m n�m tr��c, C�n Lu�n ph�i xu�t hi�n m�t v� k� nh�n. Ng��i n�y kh�ng nh�ng t�o ���c uy danh l�ng l�y trong v� l�m Trung Nguy�n m� c�n gi�p t�n tu�i c�a C�n Lu�n b�t ��u lan r�ng kh�p v� l�m.",5,
	"�ao C�n L�n/Uworld1000_daokunlun",
	"Ki�m C�n L�n/Uworld1000_jiankunlun",
	"B�a ch� /Uworld1000_zuzhoukunlun",
	"H� tr� /Uworld1000_kunlunfuzhu",
	"�� ta suy ngh� l�i!/no")
end

function Uworld1000_wudu()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: B�n gi�o ch� m�i th�nh l�p v�i n�m nay nh�ng ph�t tri�n r�t m�nh. Ng� ��c gi�o t� ch�c nghi�m ng�t, Gi�o ch� s�ng l�p ph�i H�c Di�n Lang Qu�n. Ng� ��c gi�o l� 1 t� ch�c th�n b�, ng��i trong giang h� nghe ��n ��u bi�n s�c. T�n ch� c�a Ng� ��c gi�o l� 'L�i �ch quy�t ��nh b�n th�', c� l�i m�i l�m, kh�ng qu�n b�t k� chuy�n th� phi ch�nh t�. Ng� ��c gi�o c�n c� 1 �i�u l� 'K� ��c t�i v�i Ng� ��c gi�o, s� ch�t kh�ng to�n th�y'.",5,
	"Ch��ng ��c/Uworld1000_zhangdu",
	"�ao ��c/Uworld1000_daodu",
	"B�a ch� /Uworld1000_zuzhouwudu",
	"H� tr� /Uworld1000_wudufuzhu",
	"�� ta suy ngh� l�i!/no")
end

function Uworld1000_emeijianzong()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: Ki�m T�ng: Nh�t Di�p Tri Thu (Nh�p m�n) , Nga Mi Ki�m Ph�p (c�p 10) , Th�i Song V�ng Nguy�t (c�p 30) , B�t Di�t B�t Tuy�t (c�p 60) , Ph�t Ph�p V� Bi�n (tr�n ph�i) , Tam Nga T� Tuy�t (c�p 90) .",1,"Sau s� quay l�i/no")
end

function Uworld1000_emeiqizong()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: Kh� T�ng: Phi�u Tuy�t Xuy�n V�n (Nh�p m�n) , Nga Mi Ch��ng Ph�p (c�p 10) , T� T��ng ��ng Quy (c�p 30) , Ph�t Quang Ph� Chi�u (c�p 60) , Ph�t Ph�p V� Bi�n (tr�n ph�i) , Phong S��ng To�i �nh (c�p 90) .",1,"Sau s� quay l�i/no")
end

function Uworld1000_emeifuzhu()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: V� c�ng h� tr�: T� H�ng Ph� �� (c�p 20) , M�ng �i�p (c�p 30) , L�u Th�y (c�p 40) , Ph�t T�m T� H�u (c�p 50) , Thanh �m Ph�n X��ng (c�p 60) , Ph� �� Ch�ng Sinh (c�p 90) .",1,"Sau s� quay l�i/no")
end

function Uworld1000_tangmenfeidao()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: Phi �ao: T�ch L�ch ��n (Nh�p m�n) , ���ng M�n �m Kh� (c�p 10) , Truy T�m Ti�n (c�p 30) , Ti�u L� Phi �ao (c�p 60) , T�m Nh�n (tr�n ph�i) , Nhi�p H�n Nguy�t �nh (c�p 90) .",1,"Sau s� quay l�i/no")
end

function Uworld1000_tangmennujian()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: T� Ti�n: T�ch L�ch ��n (Nh�p m�n) , ���ng M�n �m Kh� (c�p 10) , M�n Thi�n Hoa V� (c�p 30) , Thi�n La ��a V�ng (c�p 60) , T�m Nh�n (tr�n ph�i) , B�o V� L� Hoa (c�p 90) .",1,"Sau s� quay l�i/no")
end

function Uworld1000_tangmenfeibiao()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: Phi Ti�u: T�ch L�ch ��n (Nh�p m�n) , ���ng M�n �m Kh� (c�p 10) , �o�t H�n Ti�u (c�p 30) , T�n Hoa Ti�u (c�p 60) , T�m Nh�n (tr�n ph�i) , C�u Cung Phi Tinh (c�p 90) .",1,"Sau s� quay l�i/no")
end

function Uworld1000_tangmenxianjing()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: C�m b�y: ��a Di�m H�a (c�p 10) , ��c Th�ch C�t (c�p 20) , Xuy�n T�m Th�ch (c�p 30) , H�n B�ng Th�ch (c�p 40) , L�i K�ch Thu�t (c�p 50) , Lo�n ho�n K�ch (c�p 90) .",1,"Sau s� quay l�i/no")
end

function Uworld1000_daotianwang()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: Thi�n V��ng �ao: Kinh L�i Tr�m (Nh�p m�n) , Thi�n V��ng �ao ph�p (c�p 10) , B�t Phong Tr�m (c�p 30) , V� T�m Tr�m (c�p 60) , Thi�n V��ng Chi�n � (tr�n ph�i) , Ph� Thi�n Tr�m (c�p 90) .",1,"Sau s� quay l�i/no")
end

function Uworld1000_qiangtianwang()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: Thi�n V��ng Th��ng: H�i Phong L�c Nh�n (Nh�p m�n) , Thi�n V��ng Th��ng ph�p (c�p 10) , D��ng Quan Tam �i�p (c�p 30) , Huy�t Chi�n B�t Ph��ng (c�p 60) , Thi�n V��ng Chi�n � (tr�n ph�i) , Truy Tinh Tr�c Nguy�t (c�p 90) .",1,"Sau s� quay l�i/no")
end

function Uworld1000_chuitianwang()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: Thi�n V��ng Ch�y: Tr�m Long Quy�t (Nh�p m�n) , Thi�n V��ng Ch�y ph�p (c�p 10) , H�ng V�n Quy�t (c�p 30) , Th�a Long Quy�t (c�p 60) , Thi�n V��ng Chi�n � (tr�n ph�i) , Truy Phong Quy�t (c�p 90) .",1,"Sau s� quay l�i/no")
end

function Uworld1000_fuzhutianwang()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: H� tr�: T�nh T�m Quy�t (c�p 20) , �o�n H�n Th�ch (c�p 40) , Kim Chung Tr�o (c�p 50) .",1,"Sau s� quay l�i/no")
end

function Uworld1000_zhanren()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: Chi�n Nh�n: T�n D��ng Nh� Huy�t (Nh�p m�n) , Thi�n Nh�n M�u Ph�p (c�p 10) , Li�t H�a T�nh Thi�n (c�p 30) , Th�u Thi�n Ho�n Nh�t (c�p 60) , Thi�n Ma Gi�i Th� (tr�n ph�i) , V�n Long K�ch (c�p 90) .",1,"Sau s� quay l�i/no")
end

function Uworld1000_moren()
	Describe(DescLink_GeDaMenPaiSkills.."<#>:Ma Nh�n: ��n Ch� Li�t Di�m (Nh�p m�n) , Thi�n Nh�n �ao Ph�p (c�p 10) , Th�i S�n �i�n H�i (c�p 30) , Ma Di�m Th�t S�t (c�p 60) , Thi�n Ma Gi�i Th� (tr�n ph�i) , Thi�n Ngo�i L�u Tinh (c�p 90) .",1,"Sau s� quay l�i/no")
end

function Uworld1000_zuzhouren()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: B�a Ch�: H�a Li�n Ph�n Hoa (c�p 10) , �o �nh Phi H� (c�p 20) , Phi H�ng V� T�ch (c�p 30) , Bi T� Thanh Phong (c�p 40) , L�ch Ma �o�t H�n (c�p 50) , Nhi�p H�n Lo�n T�m (c�p 90) .",1,"Sau s� quay l�i/no")
end

function Uworld1000_wudangjiancong()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: Ki�m T�ng: Th��ng H�i Minh Nguy�t (Nh�p m�n) , V� �ang Ki�m Ph�p (c�p 10) , Ki�m Phi Kinh Thi�n (c�p 30) , Tam Ho�n Thao Nguy�t (c�p 60) , Th�i C�c Th�n C�ng (tr�n ph�i) , Nh�n Ki�m H�p Nh�t (c�p 90) .",1,"Sau s� quay l�i/no")
end

function Uworld1000_wudangqizong()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: Kh� T�ng: N� L�i Ch� (Nh�p m�n ) , V� �ang Quy�n Ph�p (c�p 10) , B�c C�p Nhi Ph�c (c�p 30) , V� Ng� V� Ki�m (c�p 60) , Th�i C�c Th�n C�ng (tr�n ph�i) , Thi�n ��a V� C�c (c�p 90) .",1,"Sau s� quay l�i/no")
end

function Uworld1000_wudangfuzhu()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: V� c�ng H� tr�:  Th�t Tinh Tr�n (c�p 20) , Th� V�n Tung (c�p 40) , T�a V�ng V� Ng� (c�p 50) .",1,"Sau s� quay l�i/no")
end

function Uworld1000_cuiyandandao()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: ��n �ao: Phong Hoa Tuy�t Nguy�t (Nh�p m�n) , Th�y Y�n �ao Ph�p (c�p 10) , V� �� L�i Hoa (c�p 30) , M�c D� L�u Tinh (c�p 60) , B�ng C�t Tuy�t T�m (tr�n ph�i) , B�ng Tung V� �nh (c�p 90) .",1,"Sau s� quay l�i/no")
end

function Uworld1000_cuiyanshuangdao()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: Song �ao: Phong Quy�n T�n Tuy�t (Nh�p m�n) , Th�y Y�n Song �ao (c�p 10) , Ph� V�n T�n Tuy�t (c�p 30) , B�ch H�i Tri�u Sinh (c�p 60) , B�ng C�t Tuy�t T�m?tr�n ph�i) , B�ng T�m Ti�n T�  c�p 90) .",1,"Sau s� quay l�i/no")
end

function Uworld1000_cuiyanfuzhu()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: H� tr�: B�ng T�m Tr�i �nh (c�p 20) , H� Th� H�n B�ng (c�p 40) , Tuy�t �nh (c�p 50) .",1,"Sau s� quay l�i/no")
end

function Uworld1000_quanshaolin()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: Thi�u L�m Quy�n: H�ng Long B�t V� (Nh�p m�n) , Thi�u L�m Quy�n Ph�p (c�p 10) , La H�n Tr�n (c�p 30) , Long Tr�o H� Tr�o (c�p 50) , Nh� Lai Thi�n Di�p (tr�n ph�i) , ��t Ma �� Giang (c�p 90) .",1,"Sau s� quay l�i/no")
end

function Uworld1000_gunshaolin()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: Thi�u L�m C�n: Kim Cang Ph�c Ma (Nh�p m�n) , Thi�u L�m C�n Ph�p (c�p 10) , La H�n Tr�n (c�p 30) , Ho�nh T�o L�c H�p (c�p 50) , Nh� Lai Thi�n Di�p (tr�n ph�i) , Ho�nh T�o Thi�n Qu�n (c�p 90) .",1,"Sau s� quay l�i/no")
end

function Uworld1000_daoshaolin()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: Thi�u L�m �ao: Kim Cang Ph�c Ma (Nh�p m�n) , Thi�u L�m �ao Ph�p (c�p 10) , La H�n Tr�n (c�p 30) , Ma Ha V� L��ng (c�p 50) , Nh� Lai Thi�n Di�p (tr�n ph�i) , V� T��ng Tr�m (c�p 90) .",1,"Sau s� quay l�i/no")
end

function Uworld1000_shaolinfuzhu()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: H� tr�: B�t ��ng Minh V��ng (c�p 20) , S� T� H�ng (c�p 40) , D�ch C�n Kinh (c�p 60) .",1,"Sau s� quay l�i/no")
end

function Uworld1000_zhanggai()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: Ch��ng C�i: Ki�n Nh�n Th�n Th� (Nh�p m�n) , C�i Bang Ch��ng Ph�p (c�p 10) , Gi�ng Long Ch��ng (c�p 30) , Kh�ng Long H�u H�i (c�p 50) , T�y �i�p Cu�ng V� (tr�n ph�i) , Phi Long T�i Thi�n (c�p 90) .",1,"Sau s� quay l�i/no")
end

function Uworld1000_gungai()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: C�n C�i: Duy�n M�n Th�c B�t (Nh�p m�n) , C�i Bang B�ng Ph�p (c�p 10) , �� C�u Tr�n (c�p 30) , B�ng �� �c C�u (c�p 50) , T�y �i�p Cu�ng V� (tr�n ph�i) , Thi�n H� V� C�u (c�p 90) .",1,"Sau s� quay l�i/no")
end

function Uworld1000_gaibangfuzhu()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: H� tr�: H�a Hi�m Vi Di (c�p 20) , Ho�t B�t L�u Th� (c�p 40) , Ti�u Di�u C�ng (c�p 60) .",1,"Sau s� quay l�i/no")
end

function Uworld1000_daokunlun()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: �ao C�n L�n: H� Phong Ph�p (Nh�p m�n) , �ao C�n L�n ph�p (c�p 10) , Nh�t Kh� Tam Thanh (c�p 30) , Cu�ng Phong S�u �i�n (c�p 50) , S��ng Ng�o C�n L�n (tr�n ph�i) , Ng�o Tuy�t Ti�u Phong (c�p 90) .",1,"Sau s� quay l�i/no")
end

function Uworld1000_jiankunlun()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: Ki�m C�n L�n: Cu�ng L�i Ch�n ��a (Nh�p m�n) , Ki�m C�n L�n Ph�p (c�p 10) , Thi�n T� T�n L�i (c�p 30) , Ng� L�i Ch�nh Ph�p (c�p 60) , S��ng Ng�o C�n L�n (tr�n ph�i) , L�i ��ng C�u Thi�n (c�p 90) .",1,"Sau s� quay l�i/no")
end

function Uworld1000_zuzhoukunlun()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: B�a Ch�: Th�c Ph��c Ch� (c�p 10) , Ky B�n Ph� (c�p 20) , B�c Minh ��o H�i (c�p 30) , Khi H�n Ng�o Tuy�t (c�p 40) , M� Tung �o �nh (c�p 50) , T�y Ti�n T� C�t (c�p 90) .",1,"Sau s� quay l�i/no")
end

function Uworld1000_kunlunfuzhu()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: H� tr�: Thanh Phong Ph� (c�p 10) , Thi�n Thanh ��a Tr�c (c�p 30) , Kh� T�m Ph� (c�p 40) .",1,"Sau s� quay l�i/no")
end

function Uworld1000_zhangdu()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: Ch��ng ��c: ��c Sa Ch��ng (Nh�p m�n) , Ng� ��c Ch��ng Ph�p (c�p 10) , U Minh Kh� L�u (c�p 30) , Thi�n C��ng ��a S�t (c�p 60) , Ng� ��c K� Kinh (tr�n ph�i) , �m Phong Th�c C�t (c�p 90) .",1,"Sau s� quay l�i/no")
end

function Uworld1000_daodu()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: �ao ��c: Huy�t �ao ��c S�t (Nh�p m�n) , Ng� ��c �ao Ph�p (c�p 10) , B�ch ��c Xuy�n T�m (c�p 30) , Chu C�p Thanh Minh (c�p 60) , Ng� ��c K� Kinh (tr�n ph�i) , Huy�n �m Tr�m (c�p 90) .",1,"Sau s� quay l�i/no")
end

function Uworld1000_zuzhouwudu()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: B�a Ch�: C�u Thi�n Cu�ng L�i (c�p 10) , X�ch Di�m Th�c Thi�n (c�p 20) , B�ng Lam Huy�n Tinh (c�p 30) , Xuy�n Y Ph� Gi�p (c�p 40) , Xuy�n T�m ��c Th�ch (c�p 50) , �o�n C�n H� C�t (c�p 90) .",1,"Sau s� quay l�i/no")
end

function Uworld1000_wudufuzhu()
	Describe(DescLink_GeDaMenPaiSkills.."<#>: V� c�ng H� tr�:  T�p Nan D��c Kinh (c�p 20) , V� H�nh ��c (c�p 30) , V�n ��c Th�c T�m (c�p 40) .",1,"Sau s� quay l�i/no")
end



function no()
end
