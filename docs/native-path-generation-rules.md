
## Round41 theme prefab lookup

`analysis/native-generation/theme-prefabs.json` decodes plank/cliff direct dispatch from GetPrefabNameForType. Cliff single holes/narrows/towers resolve empty, long-hole12/13 resolve cliff A/B caps. AddObstacle separately attaches jump/trip/slide trees to straight1/2; nonTemple slide selects cliff tree. Runtime cliff coverage bag and12m placement are web assumptions, not recovered probabilities. Native cap polygons produce14m hole in this adapter. See gameplay-completeness round41 for actual generated/isolated verification.

## Round42 per-element coin counters

`analysis/native-coin-arrays/source.json` supersedes the prior5coins-per-group adapter. Native AddCoins creates5objects per eligible element with2.5m straight spacing; CoinRunCount limits consecutive elements (default5), not individual coins. UpdatePathDescription preserves spacing during an unfinished run, resets it on reaching max, and resets count/increments spacing on an empty element. Runtime now streams this state on web12m cells. Native full eligibility,corner/obstacle geometry and side-row choices remain incomplete; web safety filtering is explicit.

## Round43 tree coin heights

Native AddCoins skips height lift for obstacle2/5, lifts jump/trip3/4. Tree high centre row is3.6/4/4/4/3.6m relative ground across all three themes; slide is0.6m. Runtime now permits exact tree cells when coin counters allow. This restores these height arrays, not random row selection or complete native eligibility. Flame6 high/low random branch, side rows and corner geometry remain pending.

## Round44 flame coin branch

AddCoins obstacle6 draws Range(0,2).0 keeps low roots;1 lifts only if sAllowJumpCoins. Runtime reproduces this branch with an independent web seeded stream after eligibility. Web enables jump coins; original remote enable value remains unknown (static ctor starts false). Five natural9000m runs cover both paths and retained the initial missing-high coverage record;actual trusted Up/Down pass and no-input death/settlement/restart verified.

## Round45 parallel side coin rows

Native tables6b7ca8..7d18 provide seven X patterns. Runtime integrates parallel subset0/1/2 with authored0/-1.4/+1.4m,cliff .8 multiplier. Pickup rendering and collision now share optional explicit side. Web enables centre/side,selects the parallel subset and retains it through a run;full native predecessor filtering,slants and remote enable values remain incomplete. Seven9000m runs/58 checks and trusted arrows collecting both sides verified.

## Round46 all seven straight coin rows

Exact static float tables and start/end arrays are stored in nativeCoinRows.json and audited against the binary. Runtime includes four slants plus three parallels;ordinary adjacent emitting cells use matching endpoint candidates,empty cells clear the web predecessor. This replaces fixed-row-per-run adaptation. Web explicitly enables all row modes;special predecessor/narrow predicates,remote enables,Unity PRNG and corner geometry remain incomplete. Actual natural samples count remaining entities before16m cleanup;all four slants have unprotected complete5 pickups.

## Round47 corner coin nodes

Native type3..6 dispatch gives five L points with along-path offsets-5,-2.5,0,2.5,5m. IsTurn rejects non-centre predecessor CoinRowEnd. Runtime merges corner events into ordered straight-cell counter processing,using the existing native run gates. Web grid replacement skips straight nodes within11m (5m half-array+6m prior junction margin);T coins remain unported. Seven9000m runs cover full5 pickup on wood/temple/cliff corners and trusted left/right turns.

## Round48 T coin exclusion correction

The prior “T coin geometry pending” entry is superseded: AddCoins explicitly rejects types9/10/7/8 before creating coins. The original16-byte metadata initializer was resolved and its SHA256 matches the private field name. `native-coin-type-exclusions.json` contains the complete pointer/metadata chain and instruction checks. Runtime now names this native exclusion;T-node absence is intentional,not a missing feature. Adjacent-arm coins and other eligibility are separate. Twelve targeted trusted-input/no-input/settlement checks pass;no claim of newly repeated long-run suite.
