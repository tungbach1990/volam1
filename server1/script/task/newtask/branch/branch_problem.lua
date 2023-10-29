--�ν��ʴ� ��ż����һ���޴���д��������
--by xiaoyang
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\branch\\branch_head.lua")

function branch_songjinproblem()

	Describe("D��i ��y l� c�c c�u h�i v� Chi�n tr��ng T�ng Kim. H�y chu�n b� tinh th�n nh�! B�t ��u ���c ch�a?<enter>",2,"B�t ��u!/branch_problemstart","�� ta suy ngh� k� l�i xem/no")
end

function branch_problemstart()
	Describe(DescLink_SongJinProblem.."1.Khi �� bi�n th�nh NPC gi� c�, l�m sao �� bi�t ���c t�a �� c�n ��n v� c�m ���c So�i k�?<enter>"
	.."A: Sau khi �o�t ���c So�i K�, � th�ng b�o s� b�o t�a �� m�c ti�u c�n ��n, ho�c t�y � nh�p v�o c� hi�u �� bi�t ���c t�a �� m�c ti�u. C� hi�u s� kh�ng m�t cho ��n khi ��n ���c m�c ti�u, ti�p t�c nh�p v�o c� hi�u �� c�m So�i K� v� m�t �i C� hi�u.<enter>" --y
	.."B: Sau khi �o�t ���c So�i K�, � th�ng b�o s� b�o t�a �� m�c ti�u c�n ��n, ho�c t�y � nh�p v�o c� hi�u �� bi�t ���c t�a �� m�c ti�u, nh�ng c� hi�u s� m�t �i. Sau khi ��n ���c m�c ti�u, ti�p t�c nh�p v�o c� hi�u �� c�m So�i K� v� m�t �i C� hi�u.<enter>"
	.."C: Sau khi �o�t ���c So�i K�, � th�ng b�o s� b�o t�a �� m�c ti�u c�n ��n, ho�c t�y � nh�p v�o c� hi�u �� bi�t ���c t�a �� m�c ti�u. Sau khi ��n ���c m�c ti�u, ti�p t�c nh�p v�o C� hi�u �� c�m So�i K�. C� hi�u b�t lu�n s� d�ng th� n�o c�ng kh�ng m�t �i.<en"
	.."Trong 3 ��p �n b�n tr�n, ��p �n n�o ch�nh x�c?<enter>",
	3,"A/branch_problem1a","B/branch_problem1b","C/branch_problem1c")
end

function branch_problem1a()
		Describe(DescLink_SongJinProblem.."2.Th�i gian b�t ��u T�ng Kim ��i chi�n c�a phi�n b�n m�i l� m�y gi�?<enter>"
	.."A: B�t ��u b�o danh t� 12:00 ��n 24:00  m�i ng�y. Th�i gian b�o danh l� 30 ph�t. Sau khi k�t th�c b�o danh s� ch�nh th�c khai chi�n, th�i gian chi�n ��u l� 60 ph�t <enter>"
	.."B: Kh�ng c� th�i gian c� ��nh m� s� do h� th�ng th�ng b�o.<enter>"
	.."C: M�i ng�y b�t ��u b�o danh v�o l�c 11h:00, 13h:00; 15h:00; 17h:00; 19h:00; 21h:00. Th�i gian b�o danh l� 30 ph�t. B�o danh k�t th�c ch�nh th�c khai chi�n. Th�i gian chi�n ��u 60 ph�t.<enter>" --y
	.."Trong 3 ��p �n b�n tr�n, ��p �n n�o ch�nh x�c?<enter>",
	3,"A/branch_problem2a","B/branch_problem2b","C/branch_problem2c")
	
end

function branch_problem1b()
	Talk(1,"","Xin l�i! B�n �� tr� l�i sai! Th� l�i nh�!")
	return
end

function branch_problem1c()
	Talk(1,"","Xin l�i! B�n �� tr� l�i sai! Th� l�i nh�!")
	return
end

function branch_problem2a()
	Talk(1,"","Xin l�i! B�n �� tr� l�i sai! Th� l�i nh�!")
	return
end

function branch_problem2b()
	Talk(1,"","Xin l�i! B�n �� tr� l�i sai! Th� l�i nh�!")
	return
end

function branch_problem2c()
		Describe(DescLink_SongJinProblem.."3. Sau khi v�o khu v�c chi�n ��u, l�m th� n�o �� bi�t ���c t�nh h�nh chi�n s� hi�n t�i? <enter>"
	.."A:Ng��i ch�i c� th� t�y l�c s� d�ng ph�m ~ ( ph�m n�m tr�n ph�m tab) �� ��ng ho�c m� giao di�n chi�n b�o, s� t�nh h�nh chi�n cu�c hi�n t�i.<enter>"--y
	.."B:Ng��i ch�i ch� c� th� bi�t ���c t�nh h�nh chi�n s� trong � th�ng b�o � g�c tr�i b�n d��i <enter>"
	.."C:Ng��i ch�i c� th� ��n Qu�n Nhu Quan � h�u doanh �� h�i t�nh h�nh chi�n s�<enter>" 
	.."Trong 3 ��p �n b�n tr�n, ��p �n n�o ch�nh x�c?<enter>",
	3,"A/branch_problem3a","B/branch_problem3b","C/branch_problem3c")
end

function branch_problem3a()
	Describe(DescLink_SongJinProblem.."4. B�o danh T�ng Kim ��i chi�n phi�n b�n m�i c�n nh�ng �i�u ki�n g�? <enter>"
	.."A: Kh�ng h�n ch� ��ng c�p, ch� c�n ��ng ph� b�o danh 3000 l��ng l� c� th� tham gia. Sau khi b�o danh k�t th�c, kh�ng th� b�o danh n�a.<enter>"
	.."B:Ng��i ch�i c�n ��t ���c ho�c v��t qua c�p 40 v� ��ng ph� b�o danh 3000 l��ng l� c� th� tham gia. Sau khi th�i gian b�o danh k�t th�c nh�ng s� ng��i b�o danh tham chi�n ch�a ��n 400 ng��i, v�n c� th� ti�p t�c b�o danh tham gia.<enter>"--y
	.."C:Ng��i ch�i c�n��t ���c ho�c v��t qua c�p 40 v� ��ng ph� b�o danh 3000 l��ng l� c� th� tham gia. Sau khi th�i gian b�o danh k�t th�c, kh�ng th� b�o danh n�a.<enter>" 
	.."Trong 3 ��p �n b�n tr�n, ��p �n n�o ch�nh x�c?<enter>",
	3,"A/branch_problem4a","B/branch_problem4b","C/branch_problem4c")
end

function branch_problem3b()
	Talk(1,"","Xin l�i! B�n �� tr� l�i sai! Th� l�i nh�!")
	return
end

function branch_problem3c()
	Talk(1,"","Xin l�i! B�n �� tr� l�i sai! Th� l�i nh�!")
	return
end

function branch_problem4a()
	Talk(1,"","Xin l�i! B�n �� tr� l�i sai! Th� l�i nh�!")
	return
end

function branch_problem4b()
	Describe(DescLink_SongJinProblem.."5.Ng��i ch�i �o�t ���c So�i K�, bi�n th�nh qu�n c�m c�, c�c gi� tr� thu�c t�nh c� thay ��i kh�ng?<enter>"
	.."A: C�. C�c thu�c t�nh c�a ng��i ch�i nh� kh�ng t�nh v� l�c t�n c�ng ��u ���c t�ng.<enter>"
	.."B: Kh�ng c� thay ��i g�.<enter>"
	.."C: C�. T�c �� ch�y c�a ng��i ch�i s� b� gi�m theo, c�c thu�c t�nh kh�c kh�ng thay ��i.<enter>" --y
	.."Trong 3 ��p �n b�n tr�n, ��p �n n�o ch�nh x�c?<enter>",
	3,"A/branch_problem5a","B/branch_problem5b","C/branch_problem5c")
end

function branch_problem4c()
	Talk(1,"","Xin l�i! B�n �� tr� l�i sai! Th� l�i nh�!")
	return
end

function branch_problem5a()
	Talk(1,"","Xin l�i! B�n �� tr� l�i sai! Th� l�i nh�!")
	return
end

function branch_problem5b()
	Talk(1,"","Xin l�i! B�n �� tr� l�i sai! Th� l�i nh�!")
	return
end

function branch_problem5c()
	Describe(DescLink_SongJinProblem.."6. Khi tham gia T�ng Kim ��i chi�n, b� r�t m�ng ph�i l�m th� n�o?<enter>"
	.."A: Sau khi b�o danh b� r�t m�ng gi�a ch�ng ho�c �ang tham chi�n b� r�t m�ng, v�o m�ng l�i c� th� tr�c ti�p �i b�o danh b�ng c�ch ��i tho�i xin gia nh�p, kh�ng c�n ph�i ��ng th�m ph� b�o danh.<enter>"--y
	.."B: Sau khi b�o danh b� r�t m�ng gi�a ch�ng ho�c �ang tham chi�n b� r�t m�ng, v�o m�ng l�i c� th� tr�c ti�p ��i tho�i xin gia nh�p, nh�ng ph�i ��ng th�m ph� b�o danh.<enter>"
	.."C: Sau khi b�o danh b� r�t m�ng gi�a ch�ng ho�c �ang tham chi�n b� r�t m�ng, v�o m�ng l�i kh�ng th� gia nh�p n�a, ch� c� th� ��i ttr�n sau.<enter>" 
	.."Trong 3 ��p �n b�n tr�n, ��p �n n�o ch�nh x�c?<enter>",
	3,"A/branch_problem6a","B/branch_problem6b","C/branch_problem6c")
end

function branch_problem6a()
	Describe(DescLink_SongJinProblem.."7. Phi�n b�n T�ng Kim m�i c� t�n th�t khi t� vong hay kh�ng?<enter>"
	.."A: C� t�n th�t nh�t ��nh khi t� vong, s� m�t �i m�t s� �i�m kinh nghi�m nh�t ��nh, sau khi t� vong ���c chuy�n ��n h�u doanh c�a chi�n tr��ng, c� th� ti�p t�c x�ng l�n chi�n tuy�n.<enter>"
	.."B: Kh�ng c� b�t k� t�n th�t n�o, sau khi t� vong ���c chuy�n ��n h�u doanh chi�n tr��ng, ng��i ch�i c� th� ti�p t�c x�ng l�n chi�n tuy�n.<enter>"--y
	.."C: C�. Sau khi t� vong s� kh�ng th� gia nh�p chi�n tr��ng nh�ng s� kh�ng m�t �i�m kinh nghi�m v� ti�n.<enter>" 
	.."Trong 3 ��p �n b�n tr�n, ��p �n n�o ch�nh x�c?<enter>",
	3,"A/branch_problem7a","B/branch_problem7b","C/branch_problem7c")
end

function branch_problem6b()
	Talk(1,"","Xin l�i! B�n �� tr� l�i sai! Th� l�i nh�!")
	return
end

function branch_problem6c()
	Talk(1,"","Xin l�i! B�n �� tr� l�i sai! Th� l�i nh�!")
	return
end

function branch_problem7a()
	Talk(1,"","Xin l�i! B�n �� tr� l�i sai! Th� l�i nh�!")
	return
end

function branch_problem7b()
	Describe(DescLink_SongJinProblem.."8.C� th� mua C�ng c� T�ng Kim chuy�n d�ng kh�ng?<enter>"
	.."A: C� th�. Tr��c khi khai chi�n, ng��i ch�i c� th�  d�ng �i�m t�ch l�y �� ��i c�ng c� chuy�n d�ng t�i Qu�n Nhu Quan.<enter>"--y
	.."B: C� th�. Ng��i ch�i  c� th� ��n Qu�n Nhu Quan b�t c� l�c n�o �� mua c�ng c� T�ng Kim chuy�n d�ng, c�n ph�i t�n m�t s� ti�n nh�t ��nh.<enter>"
	.."C: Kh�ng th�. Ng��i ch�i ch� c� th� nh�n ���c khi h� g�c m�t NPC  trong chi�n tr��ng.<enter>" 
	.."Trong 3 ��p �n b�n tr�n, ��p �n n�o ch�nh x�c?<enter>",
	3,"A/branch_problem8a","B/branch_problem8b","C/branch_problem8c")
end

function branch_problem7c()
	Talk(1,"","Xin l�i! B�n �� tr� l�i sai! Th� l�i nh�!")
	return
end

function branch_problem8a()
	Describe(DescLink_SongJinProblem.."9. Sau khi gia nh�p chi�n tr��ng c� th� b�y b�n v�t ph�m kh�ng?<enter>"
	.."A: Ng��i ch�i ch� c� th� b�y b�n �  �i�m b�o danh T�ng Kim.<enter>"
	.."B: Ng��i ch�i kh�ng th� b�y b�n trong chi�n tr��ng v� �i�m b�o danh T�ng Kim.<enter>"
	.."C: Ng��i ch�i c� th� b�y b�n trong chi�n tr��ng v� �i�m b�o danh T�ng Kim.<enter>" --y
	.."Trong 3 ��p �n b�n tr�n, ��p �n n�o ch�nh x�c?<enter>",
	3,"A/branch_problem9a","B/branch_problem9b","C/branch_problem9c")	
end

function branch_problem8b()
	Talk(1,"","Xin l�i! B�n �� tr� l�i sai! Th� l�i nh�!")
	return
end

function branch_problem8c()
	Talk(1,"","Xin l�i! B�n �� tr� l�i sai! Th� l�i nh�!")
	return
end

function branch_problem9a()
	Talk(1,"","Xin l�i! B�n �� tr� l�i sai! Th� l�i nh�!")
	return
end

function branch_problem9b()
	Talk(1,"","Xin l�i! B�n �� tr� l�i sai! Th� l�i nh�!")
	return
end

function branch_problem9c()
	Describe(DescLink_SongJinProblem.."10. Trong chi�n tr��ng T�ng Kim, c� th� t�y � ��i phe ���c kh�ng? <enter>"
	.."A: Kh�ng ���c. Ng��i ch�i  khi tham gia b�o danh b�n n�o, sau n�y trong t�t c� c�c chi�n d�ch ng��i ch�i nh�t thi�t ph�i tham gia b�n ��.<enter>"
	.."B: Kh�ng! M�i ng��i trong 1 l�n chi�n d�ch ch� c� th� tham gia 1 phe. <enter>"
	.."C: ���c! Tr�n ��u tham gia phe n�y, tr�n sau c� th� tham gia phe kia. <enter>"--y
	.."Trong 3 ��p �n b�n tr�n, ��p �n n�o ch�nh x�c?<enter>",
	3,"A/branch_problem10a","B/branch_problem10b","C/branch_problem10c")	
end

function branch_problem10a()
	Talk(1,"","Xin l�i! B�n �� tr� l�i sai! Th� l�i nh�!")
	return
end

function branch_problem10b()
	Talk(1,"","Xin l�i! B�n �� tr� l�i sai! Th� l�i nh�!")
	return
end

function branch_problem10c()
	Describe(DescLink_SongJinProblem.."11. L�m th� n�o �� v�o chi�n tr��ng T�ng Kim?<enter>"
	.."A:  C� th� ��n �i�m b�o danh phe T�ng t�i T��ng D��ng, �i�m b�o danh phe Kim t�i Chu Ti�n Tr�n ho�c s� d�ng T�ng Kim Chi�u th� �� tr�c ti�p ��n �i�m b�o danh.<enter>"--y
	.."B: ��n Xa phu tr� m�t kho�n ti�n nh�t ��nh �� ��n �i�m b�o danh.<enter>"
	.."C: ��n v� binh th�nh m�n n�p 5000 l��ng �� tr�c ti�p ��a ��n chi�n tr��ng T�ng Kim.<enter>" 
	.."Trong 3 ��p �n b�n tr�n, ��p �n n�o ch�nh x�c?<enter>",
	3,"A/branch_problem11a","B/branch_problem11b","C/branch_problem11c")	
end

function branch_problem11a()
	Describe(DescLink_SongJinProblem.."12. L�m th� n�o c� ���c T�ng Kim Chi�u th�?<enter>"
	.."A: ��nh qu�i v�t c� ���c.<enter>"
	.."B: C� th� ��n ti�m t�p h�a �� mua, m�i c�i 5000 l��ng.<enter>"--y
	.."C: C�n d�ng v�t ph�m ��c bi�t �� ��i.<enter>" 
	.."Trong 3 ��p �n b�n tr�n, ��p �n n�o ch�nh x�c?<enter>",
	3,"A/branch_problem12a","B/branch_problem12b","C/branch_problem12c")	
end

function branch_problem11b()
	Talk(1,"","Xin l�i! B�n �� tr� l�i sai! Th� l�i nh�!")
	return
end

function branch_problem11c()
	Talk(1,"","Xin l�i! B�n �� tr� l�i sai! Th� l�i nh�!")
	return
end

function branch_problem12a()
	Talk(1,"","Xin l�i! B�n �� tr� l�i sai! Th� l�i nh�!")
	return
end

function branch_problem12b()
	Describe("Ch�c m�ng b�n �� ��p ch�nh x�c! B�n �� qua �i!",1,"K�t th�c ��i tho�i/branch_problemend")
end

function branch_problem12c()
	Talk(1,"","Xin l�i! B�n �� tr� l�i sai! Th� l�i nh�!")
	return
end

function branch_problemend()
	Uworld1053 = nt_getTask(1053)
	Uworld1057 = nt_getTask(1057)
	Uworld1061 = nt_getTask(1061)
	AddOwnExp(200000)
	if ( Uworld1053 == 30 ) then
		nt_setTask(1053,40)
	elseif ( Uworld1057 == 50 ) then
		nt_setTask(1057,60)
	elseif ( Uworld1061 == 50 ) then
		nt_setTask(1061,60)
	end
	Msg2Player("B�n �� qua �i th�nh c�ng! C� th� nh�n nhi�m v� ti�p theo!")
end