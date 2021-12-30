----description: 新手村_小兰
--author: wangzg	
--date: 2003/7/18
--Modify:2003/7/21 wangzg
--update 2003/7/28 yuanlan
--Update: 2003-08-07 Dan_Deng
-- Update: Dan_Deng(2003-09-09) 修改装备属性生成方式

Include("\\script\\global\\itemhead.lua")

function main(sel) 
  	UTask_world38=GetTask(66)
  	if ((UTask_world38 == 0) and (GetLevel() >= 6)) then		-- 需要6级以上才能做任务
  		Talk(3, "select", "Ti觰 c� nng t筰 so l筰 kh鉩 l鉩 th秏 thng v藋?", "Gia gia m綾 b謓h r錳! Nh璶g nh� ta l筰 kh玭g c� ti襫 mua thu鑓.", "Mu鑞 mua thu鑓 g�?")
  	elseif (UTask_world38 == 1) then
		Talk(1,"","C竚 琻 huynh! Thu鑓 c馻 玭g n閕 t玦 trc y l� do Ch� dc 甶誱 b鑓.")
  	elseif (UTask_world38 == 5) then
  		if (HaveItem(186) == 1) then
  			DelItem(186)
  			Talk(1,"","Th藅 c秏 琻 huynh! Ta c� m閠 chi誧 nh蒼, xin huynh nh薾 cho!")
  			SetTask(66,10)
  			i = random(0,3)
  			if (i < 3) then 
  				i = 8 
  			else 
  				i = 9 
  			end
  			AddRepute(i)
  			AddNote("Giao X� Hng H� C鑤 Cao cho Ti觰 Lan, ho祅 th祅h nhi謒 v�. ")
  			Msg2Player("Giao X� Hng H� C鑤 Cao cho Ti觰 Lan, ho祅 th祅h nhi謒 v�. ")
  			if (random(0,3) == 0) then				-- 25%的机率得二级戒指
				p1,p2,p3,p4,p5,p6 = RndItemProp(6,15)
  				AddItem(0,3,0,2,random(0,4),GetLucky(), p1,p2,p3,p4,p5,p6)
  				Msg2Player("Nh薾 頲 nh蒼 qu� Tr竚. ")
  			else
				p1,p2,p3,p4,p5,p6 = RndItemProp(6,10)
  				AddItem(0,3,0,1,random(0,4),GetLucky(), p1,p2,p3,p4,p5,p6)
  				Msg2Player("C� 頲Ho祅g Ng鋍 Gi韎 ch�. ")
  			end
  			Msg2Player("Danh v鋘g c馻 b筺 t╪g th猰 "..i.."甶觤.")
  		else
  			Say("B筺 kh玭g c萵 th薾 l祄 m蕋 X� Hng H� C鑤 Cao, n誹 mu鑞 ho祅 th祅h nhi謒 v� b筺 ph秈 c� X� Hng H� C鑤 Cao.", 2, "Ta 甶 ki誱 th猰 ti襫/find", "T譵 ch� ti謒 thu鑓 l祄 thu鑓 m韎 /redo")
  		end		
	elseif ((UTask_world38 > 1) and (UTask_world38 < 10)) then			-- 任务中的普通对话
		Talk(1,"","C竚 琻 huynh! Thu鑓 c馻 玭g n閕 t玦 trc y l� do Ch� dc 甶誱 b鑓.")
  	elseif (UTask_world38 >= 10) then			-- 完成任务后的对话
  		Talk(1,"","C秏 琻 huynh! C� thu鑓 r錳, b謓h c馻 玭g n閕 nh蕋 nh s� kh醝.")
	else					-- 非任务对话
  		Talk(1,"","g n閕 Gia gia tu鎖  cao, s鴆 kh醗 l筰 kh玭g t鑤! Ta ch� hy v鋘g m譶h bi誸 y thu藅  tr� b謓h cho 玭g.")
	end
end;

function select()
	Say("Ta c騨g kh玭g bi誸 l� thu鑓 g�, ch輓h l� trc y Ch� dc 甶誱 cho 玭g ta.", 2, "Gi髉 l祄 thu鑓 /yes", "Kh玭g li猲 quan n vi謈 c馻 ta /no")
end;

function yes()
	Talk(1,"","C竚 琻 huynh! Thu鑓 c馻 玭g n閕 t玦 trc y l� do Ch� dc 甶誱 b鑓.")
	SetTask(66,1)
	AddNote("Nh薾 nhi謒 v�: Gi髉 g Ti觰 Lan t譵 thu鑓. ")
	Msg2Player("Nh薾 nhi謒 v�: Gi髉 g Ti觰 Lan t譵 thu鑓. ")
end;

function no()
end;

function find()
end;

function redo()
Talk(1,"","дn dc 甶誱 l蕐 thu鑓!")
SetTask(66, 2)
SetTask(67, 0)
AddNote("<color=red> B雐 v� X� Hng H� C鑤 Cao b� m蕋, vui l遪g 甶 t譵 g ch� ti謒 thu鑓 l祄 l筰 thu鑓. <color> ")
Msg2Player("B雐 v� X� Hng H� C鑤 Cao b� m蕋, vui l遪g 甶 t譵 g ch� ti謒 thu鑓 l祄 l筰 thu鑓. ")
end;
