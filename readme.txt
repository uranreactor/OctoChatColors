# OctoChatColors

A chat enhancement addon for **Vanilla WoW (1.12.1)**, specifically tailored and optimized for **Octo WoW**. 

*(Originally created as "TurtleChatColors" by DaMaGepy for Turtle WoW, now updated, cleaned up, and optimized by uranreactor).*

![Lua 5.0](https://img.shields.io/badge/Lua-5.0-blue)
![WoW Version](https://img.shields.io/badge/WoW-1.12.1-yellowgreen)
![Version](https://img.shields.io/badge/Version-1.0-brightgreen)

---

## 📦 Installation

1. Download or clone this repository.
2. **IMPORTANT:** Rename the extracted folder to exactly `OctoChatColors`.
3. Place the folder into your WoW directory: `Interface/AddOns/`
4. The final path should look like this: `Interface/AddOns/OctoChatColors/OctoChatColors.toc`
5. Launch the game. The addon loads automatically.

---

## ✨ Key Features

### 🎨 System & Hardcore Messages
- **Compact & Informative:** Death and Level-Up messages are compacted into clean, readable rows.
- **Class Colors:** Player names are colored by their class (if they are in your guild or have been seen). Unknown players default to silver/green in system messages.
- **Level Significance:** The higher the player's level, the more asterisks (`*`) are shown next to the message to indicate the significance of the event (one `*` for every 10 levels).
- **OctoWoW Compatibility:** Specifically tuned to correctly parse Octo WoW's unique Hardcore death, PvP, and Immortal challenge system messages.

### 💬 Channel Chat Formatting
- **Clean Prefixes:** Channel messages are displayed in a clean format: `[5] [Player]: Message` (instead of the default cluttered `[5. World] [Player]: Message`).
- **Smart Detection:** Case-insensitive channel detection ensures highlighting works perfectly whether the server reports the channel as `World`, `world`, `Trade`, etc.
- **Supported Channels:** World, Trade, General, Looking For Group, Recruitment, and Local Defense.

### 🔍 Keyword Highlighting
Automatically highlights and formats common keywords to make busy chats easy to scan:
- **Trading:** `WTS`, `WTB`, `WTT`, `selling`, `buying`
- **Grouping:** `LFM`, `LFG`, `LF2M`, `need MT`, `queue`
- **Locations & Dungeons:** `Stockades`, `Dire Maul`, `Deadmines`, `UBRS`, `Gilneas City`, `Stratholme`, etc.
- **Roles & Professions:** `Healer`, `2dps`, `tank`, `enchanter`, `alch`, etc.

### 🛠 Guild Tools
- **Smart Guild Search:** Type `/gs <text>` or `/gsearch <text>` to search for guild members by name **or** officer/public notes. 
  - *Example:* `/gs alch` will list all guildies who have "alch" or "alchemist" in their notes.

---

## ⌨️ Useful Macro Commands

The addon exposes two helpful functions that you can put into your own macros:

**1. Check Rested Bonus Percentage**  
Shows your current rested XP percentage (from 0% to 100%).
```lua
/run showrested()
```

**2. Bulk Delete "Dim Torch"**  
Instantly deletes all "Dim Torch" items from your bags with one click (highly useful for Stranglethorn Vale Survival leveling).
```lua
/run deletetorches()
```

---

## 🚀 What's New in this Octo WoW Fork?

If you are familiar with the original TurtleChatColors, here is what has been improved:
1. **Massive Performance Optimization:** Replaced slow, frame-dropping `O(n)` list iterations with lightning-fast `O(1)` hash-table lookups for keyword highlighting. Chat performance in busy channels is now significantly smoother.
2. **Cleaner Chat UI:** Removed the channel name from the chat prefix, leaving only the channel number and player name for a minimalist look.
3. **OctoWoW Parsing:** Updated string matching to correctly handle Octo WoW's specific system message formats for Hardcore deaths and level-ups.
4. **Code Cleanup:** Removed hardcoded personal data, alt-account tracking, and redundant guild announcement logic from the original codebase. The addon is now lighter, faster, and strictly focused on chat formatting for *everyone*.

---

## 📜 A Note from the Original Author (DaMaGepy)

> *"I've added some other useful functions which people can use in macros. Later I may add my bag-swap macro, spammable auto-buff macros, one-button attack rotations for various classes, and smart healing/wanding macros. I wrote this private addon for myself in 2005 and have been refining it since. I joined Turtle HC in mid-January 2023 and thought some others might like my spec macros as well. Let me know if you do, so I may make them available!"*  
> — **DaMaGepy** *(damagepyhun@gmail.com / Discord: DaMaGepyHUN#2928)*

---

## 🙏 Credits

- **Original Concept & Code:** [DaMaGepy](https://github.com/DaMaGepyHUN/TurtleChatColors)
- **Octo WoW Adaptation, Optimization & Cleanup:** uranreactor

*If you don't like the appearance or colors, you can easily tweak the `CSV` lists and color codes at the top of the `OctoChatColors.lua` file. Otherwise, enjoy a cleaner, faster chat!*
