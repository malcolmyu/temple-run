
## Round41 theme prefab lookup

`analysis/native-generation/theme-prefabs.json` decodes plank/cliff direct dispatch from GetPrefabNameForType. Cliff single holes/narrows/towers resolve empty, long-hole12/13 resolve cliff A/B caps. AddObstacle separately attaches jump/trip/slide trees to straight1/2; nonTemple slide selects cliff tree. Runtime cliff coverage bag and12m placement are web assumptions, not recovered probabilities. Native cap polygons produce14m hole in this adapter. See gameplay-completeness round41 for actual generated/isolated verification.

## Round42 per-element coin counters

`analysis/native-coin-arrays/source.json` supersedes the prior5coins-per-group adapter. Native AddCoins creates5objects per eligible element with2.5m straight spacing; CoinRunCount limits consecutive elements (default5), not individual coins. UpdatePathDescription preserves spacing during an unfinished run, resets it on reaching max, and resets count/increments spacing on an empty element. Runtime now streams this state on web12m cells. Native full eligibility,corner/obstacle geometry and side-row choices remain incomplete; web safety filtering is explicit.

## Round43 tree coin heights

Native AddCoins skips height lift for obstacle2/5, lifts jump/trip3/4. Tree high centre row is3.6/4/4/4/3.6m relative ground across all three themes; slide is0.6m. Runtime now permits exact tree cells when coin counters allow. This restores these height arrays, not random row selection or complete native eligibility. Flame6 high/low random branch, side rows and corner geometry remain pending.

## Round44 flame coin branch

AddCoins obstacle6 draws Range(0,2).0 keeps low roots;1 lifts only if sAllowJumpCoins. Runtime reproduces this branch with an independent web seeded stream after eligibility. Web enables jump coins; original remote enable value remains unknown (static ctor starts false). Five natural9000m runs cover both paths and retained the initial missing-high coverage record;actual trusted Up/Down pass and no-input death/settlement/restart verified.
