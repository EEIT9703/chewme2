--建立分享文表格

use CMDB;
go
IF EXISTS (SELECT name FROM sysobjects㰊㰼㰼㰼䠠䅅੄            圀䠀䔀刀䔀 琀礀瀀攀㴀✀甀✀ 䄀一䐀 渀愀洀攀 㴀 ✀䄀爀琀椀挀氀攀匀栀愀爀攀✀⤀      ഀ਀䈀䔀䜀䤀一ഀ਀搀爀漀瀀 琀愀戀氀攀 䄀爀琀椀挀氀攀匀栀愀爀攀ഀ਀䔀一䐀ഀ਀最漀ഀ਀ഀ਀ഀ਀ഀ਀挀爀攀愀琀攀 琀愀戀氀攀 䄀爀琀椀挀氀攀匀栀愀爀攀⠀ഀ਀愀爀琀椀挀氀攀䤀䐀            椀渀琀  䤀䐀䔀一吀䤀吀夀 ⠀㄀Ⰰ㄀⤀ 渀漀琀 渀甀氀氀Ⰰഀ਀洀攀洀䤀搀                    椀渀琀Ⰰഀ਀愀琀琀爀愀挀琀椀漀渀䤀䐀     椀渀琀Ⰰഀ਀挀漀渀琀攀渀琀猀          瘀愀爀挀栀愀爀⠀䴀䄀堀⤀Ⰰഀ਀挀漀渀猀琀爀愀椀渀琀 䄀爀琀椀挀氀攀匀栀愀爀攀开瀀爀椀洀愀爀礀开欀攀礀 瀀爀椀洀愀爀礀 欀攀礀 ⠀愀爀琀椀挀氀攀䤀䐀⤀⤀㬀ഀ਀ഀ਀最漀ഀ਀䤀䘀 䔀堀䤀匀吀匀 ⠀匀䔀䰀䔀䌀吀 渀愀洀攀 䘀刀伀䴀 猀礀猀漀戀樀攀挀琀猀ഀ਀            圀䠀䔀刀䔀 琀礀瀀攀㴀✀甀✀ 䄀一䐀 渀愀洀攀 㴀 ✀愀琀琀爀愀挀琀椀漀渀猀✀⤀ഀ਀䈀䔀䜀䤀一ഀ਀䄀氀琀攀爀 吀䄀䈀䰀䔀 䄀爀琀椀挀氀攀匀栀愀爀攀 䄀䐀䐀 䌀伀一匀吀刀䄀䤀一吀 䘀䬀开䤀䌀开愀琀琀爀愀挀琀椀漀渀䤀䐀 䘀伀刀䔀䤀䜀一 䬀䔀夀⠀愀琀琀爀愀挀琀椀漀渀䤀䐀⤀ 刀䔀䘀䔀刀䔀一䌀䔀匀 愀琀琀爀愀挀琀椀漀渀猀⠀愀琀琀爀愀挀琀椀漀渀䤀䐀⤀ഀ਀䔀一䐀ഀ਀最漀ഀ਀ഀ਀䤀䘀 䔀堀䤀匀吀匀 ⠀匀䔀䰀䔀䌀吀 渀愀洀攀 䘀刀伀䴀 猀礀猀漀戀樀攀挀琀猀ഀ਀            圀䠀䔀刀䔀 琀礀瀀攀㴀✀甀✀ 䄀一䐀 渀愀洀攀 㴀 ✀洀攀洀戀攀爀猀✀⤀ഀ਀䈀䔀䜀䤀一ഀ਀䄀氀琀攀爀 吀䄀䈀䰀䔀 䄀爀琀椀挀氀攀匀栀愀爀攀 䄀䐀䐀 䌀伀一匀吀刀䄀䤀一吀 䘀䬀开䤀䌀开洀攀洀䤀搀 䘀伀刀䔀䤀䜀一 䬀䔀夀⠀洀攀洀䤀搀⤀ 刀䔀䘀䔀刀䔀一䌀䔀匀 洀攀洀戀攀爀猀⠀洀攀洀䤀搀⤀ഀ਀䔀一䐀ഀ਀最漀ഀ਀ഀ਀椀渀猀攀爀琀 椀渀琀漀 䄀爀琀椀挀氀攀匀栀愀爀攀 瘀愀氀甀攀猀⠀✀㄀✀Ⰰ✀㄀✀Ⰰ✀ꠀ澘給蹙❿⤀ഀ਀椀渀猀攀爀琀 椀渀琀漀 䄀爀琀椀挀氀攀匀栀愀爀攀 瘀愀氀甀攀猀⠀✀㈀✀Ⰰ✀㈀✀Ⰰ✀紀ə깯❎⤀ഀ਀椀渀猀攀爀琀 椀渀琀漀 䄀爀琀椀挀氀攀匀栀愀爀攀 瘀愀氀甀攀猀⠀✀㌀✀Ⰰ✀㌀✀Ⰰ✀଀ⅎk驎腛趉뭑❓⤀ഀ਀椀渀猀攀爀琀 椀渀琀漀 䄀爀琀椀挀氀攀匀栀愀爀攀 瘀愀氀甀攀猀⠀✀㐀✀Ⰰ✀㐀✀Ⰰ✀紀ə깯❎⤀ഀ਀ഀ਀猀攀氀攀挀琀 ⨀ 昀爀漀洀 䄀爀琀椀挀氀攀匀栀愀爀攀ഀ਀㴽㴽㴽਽            圀䠀䔀刀䔀 琀礀瀀攀㴀✀甀✀ 䄀一䐀 渀愀洀攀 㴀 ✀愀爀琀椀挀氀攀开猀栀愀爀攀✀⤀      ഀ਀䈀䔀䜀䤀一ഀ਀搀爀漀瀀 琀愀戀氀攀 愀爀琀椀挀氀攀开猀栀愀爀攀ഀ਀䔀一䐀ഀ਀最漀ഀ਀ഀ਀ഀ਀ഀ਀挀爀攀愀琀攀 琀愀戀氀攀 愀爀琀椀挀氀攀开猀栀愀爀攀⠀ഀ਀愀爀琀椀挀氀攀䤀䐀            椀渀琀  䤀䐀䔀一吀䤀吀夀 ⠀㄀Ⰰ㄀⤀ 渀漀琀 渀甀氀氀Ⰰഀ਀洀䤀搀                    椀渀琀Ⰰഀ਀愀琀琀爀愀挀琀椀漀渀䤀䐀     椀渀琀Ⰰഀ਀挀漀渀琀攀渀琀猀          瘀愀爀挀栀愀爀⠀䴀䄀堀⤀Ⰰഀ਀挀漀渀猀琀爀愀椀渀琀 愀爀琀椀挀氀攀开猀栀愀爀攀开瀀爀椀洀愀爀礀开欀攀礀 瀀爀椀洀愀爀礀 欀攀礀 ⠀愀爀琀椀挀氀攀䤀䐀⤀⤀㬀ഀ਀ഀ਀最漀ഀ਀䤀䘀 䔀堀䤀匀吀匀 ⠀匀䔀䰀䔀䌀吀 渀愀洀攀 䘀刀伀䴀 猀礀猀漀戀樀攀挀琀猀ഀ਀            圀䠀䔀刀䔀 琀礀瀀攀㴀✀甀✀ 䄀一䐀 渀愀洀攀 㴀 ✀愀琀琀爀愀挀琀椀漀渀猀✀⤀ഀ਀䈀䔀䜀䤀一ഀ਀䄀氀琀攀爀 吀䄀䈀䰀䔀 愀爀琀椀挀氀攀开猀栀愀爀攀 䄀䐀䐀 䌀伀一匀吀刀䄀䤀一吀 䘀䬀开䤀䌀开愀琀琀爀愀挀琀椀漀渀䤀䐀 䘀伀刀䔀䤀䜀一 䬀䔀夀⠀愀琀琀爀愀挀琀椀漀渀䤀䐀⤀ 刀䔀䘀䔀刀䔀一䌀䔀匀 愀琀琀爀愀挀琀椀漀渀猀⠀愀琀琀爀愀挀琀椀漀渀䤀䐀⤀ഀ਀䔀一䐀ഀ਀䈀䔀䜀䤀一ഀ਀䄀氀琀攀爀 吀䄀䈀䰀䔀 愀爀琀椀挀氀攀开猀栀愀爀攀 䄀䐀䐀 䌀伀一匀吀刀䄀䤀一吀 䘀䬀开䤀䌀开洀䤀搀 䘀伀刀䔀䤀䜀一 䬀䔀夀⠀洀䤀搀⤀ 刀䔀䘀䔀刀䔀一䌀䔀匀 洀攀洀戀攀爀猀⠀洀攀洀䤀搀⤀ഀ਀䔀一䐀ഀ਀最漀ഀ਀ഀ਀椀渀猀攀爀琀 椀渀琀漀 愀爀琀椀挀氀攀开猀栀愀爀攀 瘀愀氀甀攀猀⠀✀㄀✀Ⰰ✀㄀✀Ⰰ✀ꠀ澘給蹙❿⤀ഀ਀椀渀猀攀爀琀 椀渀琀漀 愀爀琀椀挀氀攀开猀栀愀爀攀 瘀愀氀甀攀猀⠀✀㈀✀Ⰰ✀㈀✀Ⰰ✀紀ə깯❎⤀ഀ਀椀渀猀攀爀琀 椀渀琀漀 愀爀琀椀挀氀攀开猀栀愀爀攀 瘀愀氀甀攀猀⠀✀㌀✀Ⰰ✀㌀✀Ⰰ✀଀ⅎk驎腛趉뭑❓⤀ഀ਀椀渀猀攀爀琀 椀渀琀漀 愀爀琀椀挀氀攀开猀栀愀爀攀 瘀愀氀甀攀猀⠀✀㐀✀Ⰰ✀㐀✀Ⰰ✀紀ə깯❎⤀ഀ਀ഀ਀猀攀氀攀挀琀 ⨀ 昀爀漀洀 愀爀琀椀挀氀攀开猀栀愀爀攀ഀ਀㸾㸾㸾‾牢湡档✠慭瑳牥‧景栠瑴獰⼺术瑩畨⹢潣⽭䕅呉㜹㌰振敨海㉥朮瑩
