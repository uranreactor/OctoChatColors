-- vanilla 1.12 + TurtleWoW / OctoWoW
--- .hcmessages 60 		turns off all death message below 60
--- alt+0177 = ±  (+-)

TurtleChatColorsVer = 1.32
local tccGuildBrackets = 1
local CLORANGE = "|cFFEEDD55"
local CDYELLOW = "|cFFC9CC00"
local CGUILD = "|cFF3CE13F"
local CYELLOW = "|cFFFFFF00"
local CGREEN = "|cFF00FF00"
local CDGREEN = "|cFF00BB00"
local CBLUE = "|cFF7070FF"
local CWHITE = "|cFFFFFFFF"
local CORANGE = "|cFFFF8000"
local CBROWN = "|cFFFFB080"
local CPURPLE = "|cFFD060D0"
local CPINK = "|cFFFF80FF"
local CRED = "|cFFFF0000"
local CLRED = "|cFFFF8080"
local CLLRED = "|cFFFFA8A8"
local CLGREEN = "|cFF80FF80"
local CLLGREEN = "|cFFDDFF88"
local CLGRAY = "|cFFC0C0C0"
local CBGRAY = "|cFFC0E0E0"
local CGRAY  = "|cFF888888"
local CDGRAY = "|cFF707070"
local CLBLUE = "|cFF40FFFF"
local CEND = "|r"
local CMYCOLOR = "|cFFFF8060"
local CSTART = CBLUE.."-"..CYELLOW.."-"..CBLUE.."- "
local TurtleChatColorsHooked = false
local grip = CLRED.." RIP"..CRED.." :("
local gripmsg = false
local TurtleChatColors_Names = {}
local TurtleChatColors_Level = {}
local GSnum = 0
local CSV = ""

CSV = "zulgurub=Zul'Gurub,loch modan=LochModan,crescent grove=CrescentGrove,gilneas city=GilneasCity,scarlet monastery=ScarletMonastery,guild base=GuildBase,guild bank=GuildBank,zul gurub=Zul'Gurub"
CSV=CSV..",blackwing lair=BlackwingLair,wailing cavern=WailingCavern,molten core=MoltenCore,dire maul=DireMaul,dm east=DM:east,dm north=DM:north,dm west=DM:west,sunken temple=SunkenTemple,plaguelands"
CSV=CSV..",zul farrak=Zul'Farrak,zul farak=Zul'Farrak,zul'farak=Zul'Farrak,brd princess=BRD:princess,black morass=BlackMorass,blackfathom deep=BlackfathomDeep,razorfen downs=RazorfenDowns,razorfen kraul=RazorfenKraul"
CSV=CSV..",ragefire chasm=RagefireChasm,shadowfang keep=ShadowfangKeep,maraudon princess=Maraudon:princess,mara princess=Mara:princess,full run=Full-run,q run=Quest-run,quest run=Quest-run,arm cath=Cath-Arms"
CSV=CSV..",xp farm=XP-farm,xp run=XP-run,exp run=XP-run,elite quest=Elite-quest,aoe run=AoE-run,aoe farming=AoE-farming,aoe farm=AoE-farm,last spot=last-spot,emp run=Emp-run,emperor run=Emperor-run,jail break=JailBreak"
CSV=CSV..",main tank=MainTank,turtle wow=TurtleWoW,alterac valley=AlteracValley,warsong gulch=WarsongGulch,need mt=Need:MT,need ot=Need:OT,project epoch=project:Epoch,project ascension=project:Ascension"
CSV=CSV..",arcanite transmute=Arcanite-Transmute,pvp=PvP,pve=PvE,wpvp=wPvP,turtle mount=Turtle-mount,darkmoon faire=DarkmoonFaire,dragonmaw retreat=DragonmawRetreat,kara crypt=KaraCrypt"
CSV=CSV..",strat undead=Strat:UD,strath undead=Strat:UD,strat live=Strat:Live,strath live=Strat:Live,strat living=Strat:Live,sm arm=SM:Arm,hateforge quarry=HateForgeQuarry,rep run=Repu-run,repu run=Repu-run"
CSV=CSV..",vanilla wow=VanillaWoW,ranged dps=ranged-DPS,melee dps=melee-DPS,dmwest=DM:West,dmeast=DM:East,dmnorth=DM:North,cath/arms=Cath-Arms,arathi basin=ArathiBasin,first aid=FirstAid,war mode=WarMode"
CSV=CSV..",feral druid=FeralDruid,resto druid=RestoDruid,combat log=CombatLog,arms sm=SM:Arm,booty bay=BootyBay,lava run=lava-run,kara 10=Kara10,flight path=FlightPath,sw gates=SW:gates,aq 40=AQ40"
CSV=CSV..",princess run=princess-run,maraudon princess run=Maraudon:Princess-run,leveling guild=leveling-Guild,escort quest=escort-quest,guild leader=GuildLeader,guild invite=Guild-invite,repair bot=RepairBot"
CSV=CSV..",emerald sanctum=EmeraldSanctum,guild charter=Guild-charter,raid times=raid-times,honorable kill=HonorableKill,burning crusade=BurningCrusade,classic wow=ClassicWoW,world pvp=world-PvP"
CSV=CSV..",server first=ServerFirst,corpse camp=corpse-camp,ninja loot=ninjaloot,tarren mill=TarrenMill,tauren mill=TarrenMill,arms warrior=arms-warrior"
local cPos,chReplace1,chReplace2,cp1,cp2 = nil,{},{}
for part in string.gmatch(CSV, "([^,]+)") do cPos=strfind(part,"=")
	if cPos then cp1=strsub(part,1,cPos-1); cp2=strsub(part,cPos+1)
		if cp1~="" and cp2~="" then table.insert(chReplace1,strsub(part,1,cPos-1)); table.insert(chReplace2,strsub(part,cPos+1)) end end end

CSV = "lf,lfm,lfg,lf1m,lf2m,lf3m,lf4m,wtb,buying,wts,selling,wtt,brd,lbrs,ubrs,bwl,zg,zf,dmw,dme,dmn,epl,wpl,stv,sm,hfq,aq,aq20,aq40,mc,dmf,dps,rdps,f,twow,sw,bs,av,wsg"
local chatUP = {}; for part in string.gmatch(CSV, "([^,]+)") do if part~="" then table.insert(chatUP, part) end end

CSV = "ES,BB,BM,FARM,QUEST,ARM,AH,IF,SS,TM"
local chLocBig = {};  for part in string.gmatch(CSV, "([^,]+)") do if part~="" then table.insert(chLocBig, part) end end

CSV = "elites,elite,lochmodan,redridge,wetlands,wetland,gbase,guildbase,gbank,guildbank,dmf,stv,wpl,blackmorass,morass,westfall,arathi,mulgore,hogger,alah'thalas,dragonmawretreat,dr,karacrypt,sml,sma,smc,smg"
CSV=CSV..",sw,stormwind,ironforge,darnassus,darna,darn,undercity,uc,thunderbluff,tb,orgrimmar,orgri,org,ogri,sw:gates,goldshire,southshore,tarrenmill,jintha'alor,ubers,barrens,theramore,northshire"
CSV=CSV..",silithus,duskwood,westfall,bootybay,ratchet,everlook,gadgetzan,desolace,elwynn,ashenvale,darkshore,darkshire,lakeshire,tanaris,un'goro,winterspring,stocks,strat:live,azshara,stonard,hammerfall"
CSV=CSV..",deadmines,deathmines,deathmine,deadmine,dm,vc,wailingcaverns,wailingcavern,wc,stockades,stockade,crescentgrove,cg,gnomeregan,gnomer,ragefirechasm,rfc,sm:armory,hinterlands,hinterland"
CSV=CSV..",blackfathomdeeps,blackfathomdeep,blackfathom,bfd,razorfendowns,razorfen,rfd,razorfenkraul,rfk,rr,shadowfangkeep,sfk,swv,stranglethorn,princess-runs,maraudon:princess-runs,atal'hakkar,atal'hakar"
CSV=CSV..",scarletmonastery,sm,graveyard,graveyards,gy,library,lib,cathedral,cath,armory,cath-arms,sm:arms,sm:arm,gilneascity,gilneas,gc,sunkentemple,st,uldaman,ulda,uld,zul'farrak,zulfarrak,zulfarak,zf,maraudon,mara,maraudon:princess,mara:princess"
CSV=CSV..",hfq,hateforgequarry,hateforge,scholomance,scholo,sholo,stratholme,strath,strat,ud,strat:ud,live,brm,brd,arena,brd:princess,lbrs,ubrs,rend,diremaul,dm,dme,dm:e,dmn,dm:n,dmw,dm:w,dm:,dm:east,dm:north,dm:west,tribute,trib,direm"
CSV=CSV..",karazhan,kara,kara5,kara10,kara20,kara40,zulgurub,zul'gurub,zg,onyxia,kazzak,ony,nefarian,nefa,hyjal,emeraldsanctum,stormwrought,ungoro"
CSV=CSV..",moltencore,mc,blackwinglair,bwl,ahn'qiraj,ahnqiraj,aq,aq20,aq40,naxxramas,naxramas,naxx,nax"
local chLocation = {};  for part in string.gmatch(CSV, "([^,]+)") do if part~="" then table.insert(chLocation, part) end end
local CLOCATION = "|cFFEEFFAA"

CSV = "tank,tanks,dps,dd,rdpsmt,ot,offtank,maintank,1heal,1healer,1tank,1dps,2dps,3dps,escort,healer,healers,heal,healz,heals,fullrun,full-run,last-spot,qs,questrun,quest-run,xp-farm,xp-run,quest-runs,xp-runs,wanted:"
CSV=CSV..",elite-quest,elite-quests,aoe-runs,aoe-run,aoe,aoe-farm,aoe-farming,emp-run,emperor,repu-run,repu-runs,lotus,eels,petri,middleman,middle-man,7d,emp,xp,experience,jailbreak,gm,gm's,need:all,caster,congrats,congratz,gratz,grats,grat"
CSV=CSV..",enchanter,enchanting,enchants,ench,tailor,blacksmith,bs,alch,alchemist,crafter,questline,lockboxes,lockbox,need:mt,need:ot,transmute,fountain,turtle-mount,arcanite-transmute,jc,jewelcrafter,jcer,escort-quest,engineer,engi,leatherworker,lw"
CSV=CSV..",seller,pug,ranged-dps,melee-dps,nessingwary"
local chGreen = {}; for part in string.gmatch(CSV, "([^,]+)") do if part~="" then table.insert(chGreen, part) end end
local CROLEGREEN = "|cFFB8E800"

CSV = "lava,lava-run,lava-runs,hc,hcs,hardcore,hardcores,inferno,immortal,rip,f,wtf,pvp,wpvp,showtooltip,nohelf,:nohelf,afk,dnd,oom,<AFK>,mailbox,pm,pst,w,retail,dkp,dkps,epgp,addons,addon,cooking,firstaid"
CSV=CSV..",bg,battleground,battlegrounds,alteracvalley,av,wsg,ab,arathibasin,warsonggulch,warsong,twink,twinks,battlemasters,battlemaster,horde,combatlog,stitches,oops,nvm,hk,honorablekill,rppvp,sv"
CSV=CSV..",spam,spamming,reported,ignore,ignoring,bot,bots,lunatic,lunatics,warmode,gank,ganker,gankers,ganking,ganked,lag,lags,lagging,disconnect,disconnecting,disconnects,cod,nerfed,bugged,invite,inv"
CSV=CSV..",scam,scammer,scamming,world-pvp,dmg,corpse-camp,camping,corpse,devilsaur,ninjaloot,ninjalooter,ninjad,unseen,mods,offline,toxic,def,defense,hr"
local chRed = {}; for part in string.gmatch(CSV, "([^,]+)") do if part~="" then table.insert(chRed, part) end end
local CLIGHTRED = "|cFFFF9999"

CSV = "lf,lfg,lfm,lf1,lf2,lf3,lf4,lf1m,lf2m,lf3m,lf4m,lf5m,lf6m,lf7m,lf8m,lf9m,lfw,eu,na,en,group,que,queue,opening,alliance,selling,vanillawow,port,portal,bigwigs,bigwig,trainer,trainers,server,servers,serverfirst"
CSV=CSV..",summon,summons,sum,summ,summoning,recruiting,jed,project:ascension,ascension,epoch,project:epoch,devs,grp,party,dungeon,dung,dungeons,inviting,blizzard,blizz,fishing"
local chBlue = {}; for part in string.gmatch(CSV, "([^,]+)") do if part~="" then table.insert(chBlue, part) end end
local CLFMBLUE = "|cFF66DDFF"

CSV = "wts,wtb,wtt,turtlewow,twow,guild,guildleader,github,guild-invite,leveling-guild,leveling-guilds,tent,tents,pve,macro,macros,google,wiki,SR,ambershire,nordanaar,vendor,vendors,bijou,bijous,raid,raids,raiding,raiders,gardening,rmt"
CSV=CSV..",guild-charter,raid-times,fp,flightpath,flightpaths,rp,tmog,transmog,roleplay,roleplaying,roleplayer,rppve,tbc,wotlk,pandaria,draenor,cataclysm,burningcrusade,bc,vanilla,classicwow,repairbot,turtle,online,reputation,repu,rep"
CSV=CSV..",achievement,attune,attunement,attuned,attu"
local chLGreen = {}; for part in string.gmatch(CSV, "([^,]+)") do if part~="" then table.insert(chLGreen, part) end end
local CWTSGREEN = "|cFF77FF77"

-- Create lookup tables for O(1) word color lookup instead of O(n) list iteration
local wordColor = {}
local wordUppercase = {}

for _, word in ipairs(chatUP) do
    wordUppercase[word] = true
end

for _, word in ipairs(chLGreen) do wordColor[word] = CWTSGREEN end
for _, word in ipairs(chBlue) do wordColor[word] = CLFMBLUE end
for _, word in ipairs(chRed) do wordColor[word] = CLIGHTRED end
for _, word in ipairs(chGreen) do wordColor[word] = CROLEGREEN end
for _, word in ipairs(chLocation) do wordColor[word] = CLOCATION end
for _, word in ipairs(chLocBig) do wordColor[word] = CLOCATION end

wordColor["mage"] = "|cff69ccf0"; wordColor["mages"] = "|cff69ccf0"; wordColor["frostmage"] = "|cff69ccf0"; wordColor["frostmages"] = "|cff69ccf0"; wordColor["firemage"] = "|cff69ccf0"; wordColor["firemages"] = "|cff69ccf0"
wordColor["warlock"] = "|cff9482c9"; wordColor["warlocks"] = "|cff9482c9"; wordColor["locks"] = "|cff9482c9"; wordColor["lock"] = "|cff9482c9"
wordColor["priest"] = "|cffffffff"; wordColor["priests"] = "|cffffffff"; wordColor["holypriests"] = "|cffffffff"
wordColor["druid"] = "|cffff7d0a"; wordColor["druids"] = "|cffff7d0a"; wordColor["restodruid"] = "|cffff7d0a"; wordColor["restodruids"] = "|cffff7d0a"; wordColor["feraldruid"] = "|cffff7d0a"; wordColor["feraldruids"] = "|cffff7d0a"; wordColor["drood"] = "|cffff7d0a"; wordColor["droods"] = "|cffff7d0a"; wordColor["boomkin"] = "|cffff7d0a"; wordColor["boomkins"] = "|cffff7d0a"; wordColor["moonkins"] = "|cffff7d0a"; wordColor["moonkin"] = "|cffff7d0a"; wordColor["orange"] = "|cffff7d0a"; wordColor["oranges"] = "|cffff7d0a"
wordColor["shaman"] = "|cff0070de"; wordColor["shamans"] = "|cff0070de"
wordColor["paladin"] = "|cfff58cba"; wordColor["paladins"] = "|cfff58cba"; wordColor["retri"] = "|cfff58cba"; wordColor["retpal"] = "|cfff58cba"; wordColor["retpala"] = "|cfff58cba"; wordColor["pala"] = "|cfff58cba"; wordColor["palas"] = "|cfff58cba"
wordColor["rogue"] = "|cfffff569"; wordColor["rogues"] = "|cfffff569"; wordColor["rouge"] = "|cfffff569"
wordColor["hunter"] = "|cffabd473"; wordColor["hunters"] = "|cffabd473"; wordColor["huntard"] = "|cffabd473"; wordColor["hunt"] = "|cffabd473"
wordColor["warrior"] = "|cffc79c6e"; wordColor["warriors"] = "|cffc79c6e"; wordColor["warrs"] = "|cffc79c6e"; wordColor["prot"] = "|cffc79c6e"; wordColor["fury"] = "|cffc79c6e"; wordColor["arms-warrior"] = "|cffc79c6e"

local function gkiir(kirtxt) if kirtxt then DEFAULT_CHAT_FRAME:AddMessage(CSTART..CMYCOLOR..kirtxt..CEND) end end
local function DCFmsg(dcftxt) if dcftxt then DEFAULT_CHAT_FRAME:AddMessage(dcftxt) end end
local function CharChain(scc,scn) local sctxt=""; if scc and scn then for i=1,scn do sctxt=sctxt..scc end end return sctxt end

local TCCcount = table.getn(chReplace1) + table.getn(chatUP) + table.getn(chLocBig) + table.getn(chLocation) + table.getn(chGreen) + table.getn(chRed) + table.getn(chBlue) + table.getn(chLGreen) + 45
DCFmsg(CROLEGREEN.."TurtleChatColors loaded "..CYELLOW..TCCcount..CROLEGREEN.." highlight-words!")

function TCCHighlightStrs (message)
  if (message ~= "") and (message ~= nil) then
	if string.upper(strsub(message,-2))==":(" then message=strsub(message,1,-3)..CLRED..":("
	elseif string.upper(message)=="GZ" or string.upper(message)=="GZ!" then message=CWTSGREEN..message
	end
	
	local s,e
	local lmessage = strlower(message)
	for tcf = 1,table.getn(chReplace1) do 
		s,e = strfind(lmessage, chReplace1[tcf])
		if s and e then 
			message = strsub(message,1,s-1)..chReplace2[tcf]..strsub(message,e+1)
			s,e = strfind(strlower(message), chReplace1[tcf])
			if s and e then message = strsub(message,1,s-1)..chReplace2[tcf]..strsub(message,e+1) end
		end
	end
	
	local num = 0
	local seps = " .,?!;/()+=@&#*"
	local stxt, wtxt = {},{}
	local sep,word,chr = "","",""				
	if (message ~= "") and (message ~= nil) then
		for i = 1, strlen(message) do
			chr = strsub(message,i,i)
			if IsIn(seps,chr) then
				if strlen(word)>0 then
					wtxt[num] = word
					num = num+1
					word = ""
					sep = ""
				end
				sep = sep..chr
			else
				if strlen(sep)>0 or i==1 then 
					if i==1 then num = num+1 end
					stxt[num] = sep
					sep = ""
					word = ""
				end
				word = word..chr
			end
		end
		if strlen(sep)>0 then stxt[num] = sep; num=num-1 
		elseif strlen(word)>0 then wtxt[num] = word; stxt[num+1]="" end
	end	
	
	for wrd = 1,num do 
		local lowerWord = strlower(wtxt[wrd])
		if wordUppercase[lowerWord] then
			wtxt[wrd] = strupper(wtxt[wrd])
		end
		local color = wordColor[lowerWord]
		if color then
			wtxt[wrd] = color .. wtxt[wrd] .. "|r"
		end
	end
	
	if wtxt[1] then
		local firstLower = strlower(wtxt[1])
		if strlen(firstLower) > 3 and (strsub(firstLower,1,3)=="wts" or strsub(firstLower,1,3)=="wtb") and strsub(firstLower,4,4) ~= " " then 
			wtxt[1] = CWTSGREEN .. strupper(strsub(wtxt[1],1,3)) .. "|r " .. strsub(wtxt[1],4)
		end
	end

	message = ""
	for i = 1,num do message = message..stxt[i]..wtxt[i] end
	message = message..stxt[num+1]		
	message = string.gsub(message, "%+%-", "\194\177")
	message = string.gsub(message, "%-%+", "\194\177")
	message = string.gsub(message, ":%(", CLRED..":%(|r")
	message = string.gsub(message, "<AFK>", CLRED.."<AFK>|r")
  end 
  return message
end

function IsIn (iitxt, iichr)
	if strlen(iichr)>0 and strlen(iitxt)>0 then	
		for iif = 1,strlen(iitxt) do 
			if strsub(iitxt,iif,iif)==strsub(iichr,1,1) then return true end 
		end
	end	
	return false
end

function TurtleChangeGuildChat (message)
	if string.upper(message)=="F :(" or string.upper(message)=="RIP" or string.upper(message)=="F" or string.upper(message)=="FF" then message=CLRED..string.upper(message)
	elseif string.upper(strsub(message,-2))==" F" then message=strsub(message,1,-2)..CLRED.."F"
	elseif string.upper(strsub(message,-4))==" RIP" then message=strsub(message,1,-4)..CLRED..strsub(message,-3)
	elseif string.upper(strsub(message,-5))==" F :(" then message=strsub(message,1,-5)..CLRED.."F :("
	end
	if strsub(message,1,1)=="+" then message=CLOCATION.."+|r"..strsub(message,2) end
	local a,b = string.find(message,"%[")
	local c,d = string.find(message,"%]")
	local e,f = string.find(message,"@")
	local g,h = string.find(message," ")
	if ((a and c and a<3 and b<c) or (e and g and e<3 and f<g)) and (not string.find(message,"cleanchat")) then
		local hName,gname,i
		if (a and c and a<3 and b<c) then hName = strsub(message,b+1,c-1) else hName = strsub(message,f+1,g-1) end
		gname = hName
		gReadRoster()
		i = string.find(gname," "); if i then gname=strsub(gname,1,i-1) end
		i = string.find(gname,"%("); if i then gname=strsub(gname,1,i-1) end
		i = string.find(gname,"/"); if i then gname=strsub(gname,1,i-1) end		
		gname = string.upper(strsub(gname,1,1))..string.lower(strsub(gname,2))
		local level,hClass = GetGuildMemberInfo(gname)
		local hColor = CLGRAY
		if level then 
			if not hClass then hClass="" end
			hColor = TurtleChatColors_GetClassColor(string.upper(hClass))
		end
		if (a and c and a<3 and b<c) then message = "["..hColor..hName.."|r]"..strsub(message,d+1)
		else message = "@"..hColor..hName.."|r"..strsub(message,h) end
	end
	message = TCCHighlightStrs(message)
	return message
end

function TurtleChangeSystem (message)
	local wasokk = false
	local omessage = message
	if message then	
		local a,b,c,d,e,f,g,h
		local HCstars=1
		local color, level, hName, hNameLink, hLevel, hClass, hColor, hKiller, hKillerLvl, hZone, hNote, oNote, hZoneCut
		
		if strsub(message,1,9)=="A tragedy" then 
			gReadRoster()
			if not (string.find(message," natural") or string.find(message," burned") or string.find(message," drowned") or string.find(message,"in PvP")) then
				hLevel=1
				_,a = string.find(message," character ")
				b,f = string.find(message," %(level ")
				g,_ = string.find(message,"%) has fallen to")
				hName = strsub(message,a+1,b-1)
				hNameLink = "|Hplayer:"..hName.."|h"..string.upper(hName).."|h"
				_,a = string.find(message,"fallen to ")
				b,c = string.find(message," %(level ",f)
				d,e = string.find(message,"%) in ")
				h,_ = string.find(message,". May")
				if e and h then hZoneCut = strsub(message,e+1,h-1) end
				if f and g then hLevel = tonumber(strsub(message,f+1,g-1)) end
				if hLevel==60 or hLevel=="60" then h,_ = string.find(message,". They") end
				if not h then h="??" end
				if a and b and c and d then
					hKiller = strsub(message,a+1,b-1)
					hKillerLvl = tonumber(strsub(message,c+1,d-1))
					if not (hKiller and hKillerLvl) then gkiir("ERROR! hKiller / hKillerLvl = nil") end
				else hKiller="??"; hKillerLvl="?" end
				level,hClass,hZone,hNote,_,oNote = GetGuildMemberInfo(hName)
				if not level then level=hLevel end
				if not level then _,level = TurtleChatColors_ClassData(string.upper(hName)); if level then gReadRoster(); level,hClass,hZone,hNote,_,oNote = GetGuildMemberInfo(hName) end end
				if level and e and h then
					if h~="??" then if not hZone or hZone=="" then hZone = strsub(message,e+1,h-1) end end
					if not hClass then hClass="" end
					hColor = TurtleChatColors_GetClassColor(string.upper(hClass))
				else hColor=CLGRAY; hClass=""; hNote=nil end
				if hZone==nil then hZone=hZoneCut end
				if hZone==nil then hZone="??" elseif string.find(hZone,"\\'") then hZone = string.gsub(hZone, "\\'", "'") end
				if hKillerLvl==nil then gkiir("ERROR! hKillerLvl nil"); hKillerLvl="?" end
				if hLevel==nil then gkiir("ERROR! hLevel nil"); hLevel="?"; HCstars=1; else HCstars = math.floor(hLevel/10) end
				if hKillerLvl=="?" or hLevel=="?" or hLevel<10 then gkiir(CYELLOW..message)
				elseif level and GetGuildMemberInfo(hName)~=nil then
					message = "   "..CRED..CharChain("*",HCstars)..CYELLOW.."*"..CLRED.."HC Death"..CYELLOW.."*"..CRED..CharChain("*",HCstars)..": "..hColor..hNameLink..CGRAY.." ("..CWHITE..hLevel..CGRAY..") "..CLORANGE.."has fallen to:\n"
					message = message.."   "..CharChain(" ",math.floor((HCstars+1)*1.3))..CLLRED..hKiller..CDGRAY.." ("..CLRED..hKillerLvl..CDGRAY..")"..CLORANGE.." @ ".."|cFFAA9999"..hZone
					if oNote then message = message..CGRAY.." ("..oNote..")" end
					if gripmsg then message = message..grip end
					wasokk=true
				else
					message = "   "..CRED..CharChain("*",HCstars)..CYELLOW.."*"..CLRED.."HC Death"..CYELLOW.."*"..CRED..CharChain("*",HCstars)..":  "..hColor..hNameLink..CGRAY.." ("..CWHITE..hLevel..CGRAY..") "..CLORANGE.."<< "
					message = message..CLLRED..hKiller..CDGRAY.." ("..CLRED..hKillerLvl..CDGRAY..") "..CLORANGE.."@ |cFFAA9999"..hZone
					if gripmsg then message = message..grip end
					wasokk=true
				end
			elseif string.find(message,"in PvP") then
				_,a = string.find(message," character ")
				b,f = string.find(message," %(level ")
				g,_ = string.find(message,"%) has fallen")
				hName = strsub(message,a+1,b-1)
				hNameLink = "|Hplayer:"..hName.."|h"..string.upper(hName).."|h"
				_,a = string.find(message,"in PvP to ")
				b,c = string.find(message," %(level ",f)
				d,e = string.find(message,"%) in ")
				h,_ = string.find(message,". May")
				if e and h then hZoneCut = strsub(message,e+1,h-1) end
				if not h then h,_ = string.find(message,". They"); if not h then h="??" end end
				if f and g then hLevel = tonumber(strsub(message,f+1,g-1)) end
				if a and b and c and d then
					hKiller = strsub(message,a+1,b-1)
					local kLevel = tonumber(strsub(message,c+1,d-1))
					if not (hKiller and kLevel) then gkiir("ERROR! hKiller / hLevel = nil"); kLevel=1 end
				else hKiller="??"; local kLevel=1 end
				level,hClass,hZone,hNote,_,oNote = GetGuildMemberInfo(hName)
				if not level then level=hLevel end
				if not level then _,level = TurtleChatColors_ClassData(string.upper(hName)); if level then gReadRoster(); level,hClass,hZone,hNote,_,oNote = GetGuildMemberInfo(hName) end end
				if level then
					if not hZone or hZone=="" then hZone = strsub(message,e+1,h-1) end
					if hClass==nil then hClass="" end
					hColor = TurtleChatColors_GetClassColor(string.upper(hClass))
				else hColor=CLGRAY; hClass=""; hNote=nil end
				if hLevel==nil then gkiir("ERROR! hLevel nil"); hLevel="?"; HCstars=1; else HCstars = math.floor(hLevel/10) end
				if hZone==nil then hZone="??" elseif string.find(hZone,"\\'") then hZone = string.gsub(hZone, "\\'", "'") end
				if hLevel=="?" or hLevel<10 then gkiir(CYELLOW..message)
				elseif level and GetGuildMemberInfo(hName)~=nil then
					message = "   "..CRED..CharChain("*",HCstars)..CYELLOW.."*"..CLRED.."HC Death"..CYELLOW.."*"..CRED..CharChain("*",HCstars)..": "..hColor..hNameLink..CGRAY.." ("..CWHITE..hLevel..CGRAY..") "..CLORANGE.."was killed in "..CLLRED.."PvP"..CLORANGE.." by:\n"
					message = message.."   "..CharChain(" ",math.floor((HCstars+1)*1.3))..CLLRED..hKiller..CGRAY.." ("..CRED..kLevel..CGRAY..") "..CLORANGE.." @ ".."|cFFAA9999"..hZone
					if oNote then message = message..CGRAY.." ("..oNote..")" end
					if gripmsg then message = message..grip end
					wasokk=true
				else
					message = "   "..CRED..CharChain("*",HCstars)..CYELLOW.."*"..CLRED.."HC Death"..CYELLOW.."*"..CRED..CharChain("*",HCstars)..":  "..hColor..hNameLink..CGRAY.." ("..CWHITE..hLevel..CGRAY..") "..CLORANGE.."in "..CLLRED.."PvP"..CLORANGE.." by "
					message = message..CLLRED..hKiller..CGRAY.." ("..CRED..kLevel..CGRAY..") "..CLORANGE.." @ ".."|cFFAA9999"..hZone
					if gripmsg then message = message..grip end
					wasokk=true
				end
			elseif string.find(message,"natural cau") or string.find(message," burned to ") or string.find(message," has drowned") then
				local hcause = ""
				_,a = string.find(message," character ")
				b,f = string.find(message," %(level ")
				g,_ = string.find(message,"%) died")
				_,e = string.find(message,"causes in ")
				if e then hcause = CLORANGE.."natural causes"
				else
					g,_ = string.find(message,"%) has burned")
					_,e = string.find(message,"to death in ")
					if g then hcause = CLRED.."burned"..CLORANGE.." to death"
					else
						g,_ = string.find(message,"%) has drowned")
						_,e = string.find(message,"drowned in ")
						if g then hcause = CLBLUE.."drowned" end
					end
				end
				h,_ = string.find(message,". May")
				if not h then h,_ = string.find(message,". They"); if not h then h="??" end end
				if hLevel==60 or hLevel=="60" then h,_ = string.find(message,". They") end
				hName = strsub(message,a+1,b-1)
				hNameLink = "|Hplayer:"..hName.."|h"..string.upper(hName).."|h"
				if f and g then hLevel = tonumber(strsub(message,f+1,g-1)); else hLevel=1 end
				level,hClass,hZone,hNote,_,oNote = GetGuildMemberInfo(hName)
				if not level then level=hLevel end
				if not level then _,level = TurtleChatColors_ClassData(string.upper(hName)); if level then gReadRoster(); level,hClass,hZone,hNote,_,oNote = GetGuildMemberInfo(hName) end end
				if level then
					if not hZone or hZone=="" then hZone = strsub(message,e+1,h-1) end
					if not hClass then hClass="" end
					hColor = TurtleChatColors_GetClassColor(string.upper(hClass))
				else hColor=CLGRAY; hClass=""; hNote=nil end
				if hLevel==nil then gkiir("ERROR! hLevel nil"); hLevel="?"; HCstars=1; else HCstars = math.floor(hLevel/10) end
				if hZone==nil then hZone="??" elseif string.find(hZone,"\\'") then hZone = string.gsub(hZone, "\\'", "'") end
				if hLevel=="?" or hLevel<10 then gkiir(CYELLOW..message)
				elseif level and GetGuildMemberInfo(hName)~=nil then
					message = "   "..CRED..CharChain("*",HCstars)..CYELLOW.."*"..CLRED.."HC Death"..CYELLOW.."*"..CRED..CharChain("*",HCstars)..": "..hColor..hNameLink..CGRAY.." ("..CWHITE..hLevel..CGRAY..") "..hcause..CLORANGE.." @ ".."|cFFAA9999"..hZone
					if oNote then message = message..CGRAY.." ("..oNote..")" end
					if gripmsg then message = message..grip end
					wasokk=true
				else
					message = "   "..CRED..CharChain("*",HCstars)..CYELLOW.."*"..CLRED.."HC Death"..CYELLOW.."*"..CRED..CharChain("*",HCstars)..":  "..hColor..hNameLink..CGRAY.." ("..CWHITE..hLevel..CGRAY..") "..hcause..CLORANGE.." @ ".."|cFFAA9999"..hZone
					if gripmsg then message = message..grip end
					wasokk=true
				end
			else
				message=omessage
			end 
		elseif (strsub(message,-8)=="ey face.") and (string.find(message,"Hardcore m") or string.find(message,"immortality")) then 
			gReadRoster()
			local e,_ = string.find(message," has reached level ")
			if e then 
				hName = strsub(message,1,e-1)
				hNameLink = "|Hplayer:"..hName.."|h"..string.upper(hName).."|h"
				level,hClass,hZone,hNote,_,oNote = GetGuildMemberInfo(hName)
				if not level then 
					_,level = TurtleChatColors_ClassData(string.upper(hName))
					if level then gReadRoster(); level,hClass,hZone,hNote,_,oNote = GetGuildMemberInfo(hName) end
				end
				if level then hColor = TurtleChatColors_GetClassColor(string.upper(hClass)) else hColor=CLGRAY; hClass=""; hZone=""; hNote="" end
				
				local _, _, hLevel_str = string.find(message, "reached level (%d+)")
				if hLevel_str then hLevel = tonumber(hLevel_str) else hLevel = 1 end
				if not hLevel then gkiir("ERROR! hLevel = nil"); hLevel=1 end

				if hLevel then HCstars = math.floor(hLevel/10) else HCstars=1 end
				if hLevel=="?" or hLevel<10 then gkiir(CYELLOW..message)
				elseif level and GetGuildMemberInfo(hName)~=nil then
					_,_,_,hNote,_,oNote = GetGuildMemberInfo(hName)
					message = "   "..CDGREEN..CharChain("*",HCstars)..hColor..hNameLink..CDGREEN..CharChain("*",HCstars)..CYELLOW.." has reached level "..CDGREEN.."*"..CWHITE..hLevel..CDGREEN.."*"..CYELLOW.." in Hardcore"..CDGREEN.." @ |cFFAA9999"..hZone..CYELLOW.." !"
					if oNote then message = message..CGRAY.." ("..oNote..")" end
					wasokk=true
				else
					message = "   "..CDGREEN..CharChain("*",HCstars)..hColor..hNameLink..CDGREEN..CharChain("*",HCstars)..CYELLOW.." has reached level "..CDGREEN.."*"..CWHITE..hLevel..CDGREEN.."*"..CYELLOW.." in Hardcore!"
					wasokk=true
				end
			else
				message=omessage
			end	
		elseif (strsub(message,-9)=="Immortal!") then 
			gReadRoster()
			a,_ = string.find(message," has transc")
			_,b = string.find(message,"reached level ")
			c,_ = string.find(message," on Hardcore")
			if a and b and c then
				hName = strsub(message,1,a-1)
				hNameLink = "|Hplayer:"..hName.."|h"..string.upper(hName).."|h"
				hLevel = tonumber(strsub(message,b+1,c-1))
				if not hLevel then gkiir("ERROR! hLevel = nil"); hLevel=60 end
				level,hClass,hZone,hNote,_,oNote = GetGuildMemberInfo(hName)				
				if not level then _,level = TurtleChatColors_ClassData(string.upper(hName)); if level then gReadRoster(); level,hClass,hZone,hNote,_,oNote = GetGuildMemberInfo(hName) end end
				if hNote then hNote=CGRAY.." ("..hNote..")|r"; else hNote="" end 
				if level then hColor = TurtleChatColors_GetClassColor(string.upper(hClass)) else hColor=CLGRAY; hClass=""; hZone="" end
				message = "   "..CDGREEN..CharChain("*",6)..hColor..hNameLink..CDGREEN..CharChain("*",6)..CYELLOW.." has transcended death and reached level "..CDGREEN.."*"..CWHITE..hLevel..CDGREEN.."*"..CYELLOW.." on Hardcore mode without dying once! "
				message = message..hColor..hName..CLORANGE.." shall henceforth be known as the "..CLGREEN.."IMMORTAL"..CLORANGE.." !"
				wasokk=true
			end 
		elseif (strsub(message,-13)=="no Challenge!") then 
			gReadRoster()
			a,_ = string.find(message," has laugh")
			if a then
				hName = strsub(message,1,a-1)
				hNameLink = "|Hplayer:"..hName.."|h"..string.upper(hName).."|h"
				level,hClass,hZone,hNote,_,oNote = GetGuildMemberInfo(hName)
				if hNote then hNote=CGRAY.." ("..hNote..")|r"; else hNote="" end 
				if not level then _,level = TurtleChatColors_ClassData(string.upper(hName)); if level then gReadRoster(); level,hClass,hZone = GetGuildMemberInfo(hName) end end
				if level then hColor = TurtleChatColors_GetClassColor(string.upper(hClass)) else hColor=CLGRAY; hClass=""; hZone="" end
				message = "   "..CDGREEN..CharChain("*",6)..hColor..hNameLink..CDGREEN..CharChain("*",6)..CYELLOW.." has laughed in the face of death in the "..CLRED.."Hardcore challenge"..CYELLOW..", and has begun the "..CRED.."INFERNO Challenge"..CYELLOW.."!"
				wasokk=true
			end 
        elseif strsub(message,1,7)=="XP gain" then 
			_,a = string.find(message," gain is")
			if a then				
				if strsub(message,-3)=="OFF" then message = strsub(message,1,a)..": "..CLRED.."OFF" else message = strsub(message,1,a)..": "..CGREEN.."ON" end
				message = CYELLOW..message
			end
			showrested(1)
			wasokk=true
		elseif string.find(message,"player") and strsub(message,-5)=="total" then message=nil; wasokk=true
		elseif string.find(message,"%[") and string.find(message," Level") and string.find(message," - ") then message=nil; wasokk=true
		elseif (strsub(message,1,15)=="Your auction of") and (strsub(message,-5)=="sold.") then 
			_,a = string.find(message,"auction of")
			b,_ = string.find(message,"sold.")
			hName = strsub(message,a+2,b-2)
			message = "   "..CYELLOW..strsub(message,1,a+1)..CGREEN.."*"..CWHITE..hName..CGREEN.."*"..CYELLOW..strsub(message,b-1)
			wasokk=true
			PlaySound("AuctionWindowClose")
		else 
			wasokk=true
			message = CYELLOW..message
		end	
	end
	return message
end

function showrested(sr)
	local p="player"
	local m=UnitXPMax(p)
	local r=GetXPExhaustion()
	local t
	if -1==(r or -1) then t=CLRED.."You are not rested." 
	else t="|cFF9999FFRested: "..CWHITE..(math.floor((r*1000)/(m*1.5))/10)..CGRAY.."%" end
	if sr then t=t.."            "..CDGRAY.."macro:  "..CLGRAY.."/run showrested()" end
	DCFmsg(CSTART..t..CEND)
	if sr then
		if UnitLevel("player")<5 then DCFmsg(CLRED.."You can't chat until level "..CYELLOW.."5"..CLRED.." !"..CEND) end
	end
end

function deletetorches()
	if endbag==nil then endbag=0 end
    for bag=0,4 do
        if (GetBagName(bag)~=nil) then
            for slot=GetContainerNumSlots(bag),1,-1 do
				if (GetContainerItemLink(bag,slot)) then
			        if (string.find(GetContainerItemLink(bag,slot), "Dim Torch")) then
						PickupContainerItem(bag,slot); DeleteCursorItem()
					end
			    end				
            end
        end
    end
end

function gReadRoster()
	local numGuild = GetNumGuildMembers()
	for i = 1, numGuild do
		local name,_,_,level,class = GetGuildRosterInfo(i)
		if( class and name ) then TurtleChatColors_ClassData(name, class, level) end
	end
end

function GetGuildMemberInfo(gname)
	local numGuild = GetNumGuildMembers()
	for i = 1, numGuild do
		local name,_,_,level,class,zone,nnote,onote,online = GetGuildRosterInfo(i)
		if onote=="" then onote=nil end
		if (class and name) then 
			if name == gname then 				
				if nnote=="" then nnote=nil end
				return level,class,zone,nnote,online,onote
			end
		elseif level and name==gname then
				if nnote=="" then nnote=nil end
				return level,class,zone,nnote,online,onote		
		end
	end
	return nil
end

function searchguild(arg)
	GSnum = 0
	if arg and arg~="" then
		gReadRoster()
		arg = string.lower(arg)
		local numGuild = GetNumGuildMembers()
		if numGuild>0 then
			DCFmsg(CYELLOW.."Searching for:  "..CWHITE..string.upper(arg)..CGRAY.." ...")
			for i = 1, numGuild do
				local name,_,_,level,class,zone,nnote,onote,online = GetGuildRosterInfo(i)
				if (class and name and not online) then 
					if string.find(string.lower(name),arg) then GShowGNInfo(name)
					elseif nnote~="" and string.find(string.lower(nnote),arg) then GShowGNInfo(name)
					elseif onote~="" and string.find(string.lower(onote),arg) then GShowGNInfo(name)
					end
				end
			end	
			for i = 1, numGuild do
				local name,_,_,level,class,zone,nnote,onote,online = GetGuildRosterInfo(i)
				if (class and name and online) then 
					if string.find(string.lower(name),arg) then GShowGNInfo(name)
					elseif nnote~="" and string.find(string.lower(nnote),arg) then GShowGNInfo(name)
					elseif onote~="" and string.find(string.lower(onote),arg) then GShowGNInfo(name)
					end
				end
			end	
			if GSnum>0 then DCFmsg(CWHITE..GSnum..CGRAY.." member(s) listed, you can click on a "..CLGRAY.."NAME"..CGRAY.." to whisper!")
			else gkiir(CRED.."No players found!") end
		else gkiir(CRED.."You are not in a GUILD!") end
	else gkiir(CLRED.."As parameter, you must specify a TEXT to find!:  /gs alch") end
end

function GShowGNInfo(hName)
	if hName then
		local hLevel,hClass,hZone,hNote,online,oNote = GetGuildMemberInfo(hName)
		if hLevel then
			GSnum = GSnum + 1
			local hColor = TurtleChatColors_GetClassColor(string.upper(hClass))
			local hNameLink = "|Hplayer:"..hName.."|h"..string.upper(hName).."|h"
			local note = ""
			if hNote and oNote then note = CGRAY.." ("..hNote.."|r"..CLGRAY.." / "..CGRAY..oNote..")|r"
			elseif hNote then note = CGRAY.." ("..hNote..")|r"
			elseif oNote then note = CGRAY.." ("..oNote..")|r" end 
			if online then online=CGRAY.." ("..CWHITE.."Online"..CGRAY..")" else online = CGRAY.." (Offline)" end
			local message="   "..CBGRAY..hLevel.."|r "..hColor..hNameLink.."|r"..note..CLORANGE.." @ "..CGREEN..hZone..online
			DCFmsg(message)
		end
	end
end

function TCC_SlashCommandHandler(arg)
	gkiir("/tcc:  '"..arg.."'")
	if arg and arg~="" then
		local _,_,command = string.find(arg,"(%l+)")		
		if (command) then
			if command=="gs" or command=="sg" then gkiir("GS!") end
			gkiir("command = "..command)
		end
	else
		gkiir("TurtleChatColors /tcc commands:")
		gkiir("dt - Deletes all 'Dim Torch' from your bags")
		gkiir("gs <or> sg - Search guildmembers and notes for a text (not case sensitive)")
		gkiir("                   Its the same as for example: /gsearch alch")
	end
end

function GSRC_SlashCommandHandler(argu)
	searchguild(argu)
end

function TurtleChatColors_OnLoad() 
	this:RegisterEvent("GUILD_ROSTER_UPDATE")
	this:RegisterEvent("VARIABLES_LOADED")
	this:RegisterEvent("PLAYER_LOGIN")
	this:RegisterEvent("PLAYER_ENTERING_WORLD")
	SlashCmdList["TCC"] = TCC_SlashCommandHandler
	SLASH_TCC1 = "/tcc"
	SLASH_TCC2 = "/turtlechatcolors"
	SlashCmdList["GSRC"] = GSRC_SlashCommandHandler
	SLASH_GSRC1 = "/gsearch"
	SLASH_GSRC2 = "/searchguild"
	SLASH_GSRC3 = "/guildsearch"
	SLASH_GSRC4 = "/gsrc"
	SLASH_GSRC5 = "/gsrch"
	SLASH_GSRC6 = "/searchg"
	SLASH_GSRC7 = "/gs"
end

function TurtleChatColors_OnEvent(event)
	if ((event == "PLAYER_ENTERING_WORLD") or (event == "PLAYER_LOGIN")) and (TurtleChatColorsHooked==false) then 
		TurtleChatColorsHooked = true
		TurtleChatColors_OrigChatFrame_OnEvent = ChatFrame_OnEvent
		ChatFrame_OnEvent = TurtleChatColors_ChatFrame_OnEvent
	end
	if (event == "VARIABLES_LOADED") then 
		SetWhoToUI(0)
		GuildRoster() 
	end	
	if (event == "GUILD_ROSTER_UPDATE") then gReadRoster() end
end

function TurtleChatColors_ChatFrame_OnEvent(event)
	if (event == "CHAT_MSG_SYSTEM") then
		local sysresult = TurtleChangeSystem(arg1)
		if sysresult==nil or sysresult=="" then return
		else this:AddMessage(sysresult); return end
	elseif (event == "CHAT_MSG_CHANNEL") then
		local ch = string.lower(arg9 or "")
		if ch == "world" or string.find(ch, "trade") or string.find(ch, "general") or string.find(ch, "looking") then 
			arg1 = TCCHighlightStrs(arg1)
			local chanID = "?"
			if arg4 then
				local _, _, num = string.find(arg4, "^(%d+)")
				if num then chanID = num end
			end
			local playerName = arg2 or "Unknown"
			local pColor = TurtleChatColors_ClassData(playerName)
			if pColor == "" or pColor == CGUILD then
				pColor = "|cFFFFD100"
			end
			local clickableName = pColor .. "|Hplayer:" .. playerName .. "|h" .. playerName .. "|h|r"
			local finalMsg = "[" .. chanID .. "] [" .. clickableName .. "]: " .. arg1
			local channelColor = ChatTypeInfo["CHANNEL"]
			if channelColor then
				this:AddMessage(finalMsg, channelColor.r, channelColor.g, channelColor.b)
			else
				this:AddMessage(finalMsg)
			end
			return
		end
	elseif (event == "CHAT_MSG_HARDCORE") then
		arg1 = TCCHighlightStrs(arg1)
	elseif (event == "CHAT_MSG_GUILD") then
		arg1 = TurtleChangeGuildChat(arg1)
	end
	TurtleChatColors_OrigChatFrame_OnEvent(event)
end

function TurtleChatColors_ClassData(arg2, class, level )
	if arg2 then arg2 = string.upper(arg2) end
	if class then class = string.upper(class) end
	if not TurtleChatColors_Names then TurtleChatColors_Names = {} end
	if not TurtleChatColors_Level then TurtleChatColors_Level = {} end
	if not arg2 then return "" end

	if not class then
		for name, color in TurtleChatColors_Names do
			if name == arg2 then 
				if pfUI and pfUI.chat then if pfUI.chat.classcolor then if pfUI.chat.classcolor~=1 then color=CGUILD end end end
				return color, TurtleChatColors_Level[arg2]
			end
		end
	end
    local found
    for name, color in TurtleChatColors_Names do
		if name == arg2 then 
			if TurtleChatColors_Level[name] == level then
				found = true
			end
		end
   	end
	if not found then
		local color = TurtleChatColors_GetClassColor( class )
		TurtleChatColors_Names[arg2] = color
		if level then
			TurtleChatColors_Level[arg2] = level
		else
			TurtleChatColors_Level[arg2] = 0
		end
	end
	return ""
end

CB_CLASS_MAGE     =	"MAGE"
CB_CLASS_WARLOCK  =	"WARLOCK"
CB_CLASS_PRIEST   =	"PRIEST"
CB_CLASS_DRUID    =	"DRUID"
CB_CLASS_SHAMAN   =	"SHAMAN"
CB_CLASS_PALADIN  =	"PALADIN"
CB_CLASS_ROGUE    =	"ROGUE"
CB_CLASS_HUNTER   =	"HUNTER"
CB_CLASS_WARRIOR  =	"WARRIOR"
if (GetLocale()=="deDE") then
	CB_CLASS_MAGE = "MAGIER"
	CB_CLASS_WARLOCK = "HEXENMEISTER"
	CB_CLASS_PRIEST = "PRIESTER"
	CB_CLASS_DRUID = "DRUIDE"
	CB_CLASS_SHAMAN = "SCHAMANE"
	CB_CLASS_PALADIN = "PALADIN"
	CB_CLASS_ROGUE = "SCHURKE"
	CB_CLASS_HUNTER = "JÄGER"
	CB_CLASS_WARRIOR = "KRIEGER"
end

function TurtleChatColors_GetClassColor( class )
	local classcolor = CGUILD
	if (class == CB_CLASS_MAGE) then classcolor = "|cff69ccf0"
	elseif (class == CB_CLASS_WARLOCK) then classcolor = "|cff9482c9"
	elseif (class == CB_CLASS_PRIEST) then classcolor = "|cffffffff"
	elseif (class == CB_CLASS_DRUID) then classcolor = "|cffff7d0a"
	elseif (class == CB_CLASS_SHAMAN) then classcolor = "|cff0070de"
	elseif (class == CB_CLASS_PALADIN) then classcolor = "|cfff58cba"
	elseif (class == CB_CLASS_ROGUE) then classcolor = "|cfffff569"
	elseif (class == CB_CLASS_HUNTER) then classcolor = "|cffabd473"
	elseif (class == CB_CLASS_WARRIOR) then classcolor = "|cffc79c6e"
	end
	return classcolor
end