"000" by Mikrokosmonaut

Part 1 - Setup

Chapter 1 - Engine

[The idea behind this section is to implement 'features' where every thing has a feature and each feature describes the thing. The features are then used to deduce properties of the thing sensibly.]
Section 1 - Things

A feature is a kind of value. The features are circular, glass, hemp, ice, magnetic, mirrored, nickel, oddly-shaped and paper.

A thing has a feature. Understand the feature property as describing a thing. A thing has some text called the mirror-image. The mirror-image of a thing is usually "".

A pedestal is a kind of supporter. A pedestal is circular. The indefinite article of a pedestal is "the".

Before printing the locale description of the field:
	set the locale priority of the field to 0.

Materiality relates a thing (called X) to a feature (called Y) when Y is the feature of X. The verb to be made of means the materiality relation.

An ice-state is a kind of value. The ice-states are frozen, wet, dripping, melting, melted and puddles.

A burning-state is a kind of value. The burning-states are extinguished, flaming and burnt-out.

A tangled-state is a kind of value. The tangled-states are tangled, slightly tangled and untangled.

Definition: a thing is other if it is not the noun.
Definition: a thing is breakable if it is made of glass.
Definition: a thing is flammable if it is made of hemp or it is made of paper.
Definition: a thing is tearable if it is made of paper.
Definition: a thing is meltable if it is made of ice.
Definition: a thing is reflective if it is mirrored.
Definition: a thing is invisible if it is magnetic.
Definition: a thing is reflectable:
	if it is enclosed by the player:
		no;
	if it is invisible:
		no;
	if it is not enclosed by the location:
		no;
	if it is visible:
		yes;
	no.

[The various rules needed to print the names of things appropriately.]
To decide whether (N - a thing) is atypically named:
	if N is the player or N is the large bulb or N is the sphere or N is the torn pieces of shade or N is a pedestal:
		decide yes;
	no.

Before printing the name of the rope:
	say "[if the tangled-state of the rope is less than untangled][tangled-state] [end if]".

Before printing the name of a thing (called target):
	unless the target is atypically named:
		say "[feature] ".
		
For printing the name of the torn pieces of shade:
	say "torn pieces of [feature]".

For printing the name of the large bulb:
	say "[if the large bulb is lit]glowing [end if]large [feature] bulb";
	omit contents in listing.
	
After printing the name of the large bulb while doing something other than examining:
	say " (inside of which is [a chain] hanging at an unnatural angle, pointing towards the central platform)".
	
For printing the name of the sphere:
	say "[if the large is lit]glowing [end if][if the ice-state of the sphere is greater than frozen and the ice-state of the sphere is less than puddles][ice-state] [end if]sphere of [feature]";
	omit contents in listing.
	
For printing a locale paragraph about the field:
	set the locale priority of the field to 0;
	continue the activity.

Instead of searching the sphere:
	try examining the sphere.
	
Instead of searching the large bulb:
	try examining the large bulb.

After printing the name of the sphere while doing something other than examining or searching:
	if the sphere is melted:
		say " (through the hole of which, [we] can make out a [if the large bulb is lit]glowing [end if]large bulb)".

Instead of examining a reflective thing (called mirror):
	let reflection be a random other reflectable thing;
	say "In [the mirror], [we] see a reflection of [the reflection].[run paragraph on]";
	if the mirror-image of the reflection is "":
		say "[paragraph break]";
	otherwise:
		say " [mirror-image of the reflection].".

Section 2 - Rules

Use scoring. The maximum score is 5.

When play begins:
	now the story viewpoint is first person singular;
	now the right hand status line is "Score: [score] / [maximum score]";
	say "[bold type][']000['] - [We]['re] told that it's one of the most unique escape room experiences available in the downtown area. It had better be for the $150 [we] had to palm the guy in briefing with so that he'd let [us] do this by [ourselves].[paragraph break]The idea is simple enough - discover the 3-digit code that unlocks the exit. The attendant locks the door behind [us]. It's time to get down to work![roman type][paragraph break]".
	
Instead of going somewhere when the exit is locked:
	say "[We] have to solve this puzzle before [we] can go anywhere. Worst case scenario: [we][']ll spend an hour looking at [ourselves] in the [tiles].".

Instead of listening when the chain is in the large bulb:
	say "[The chain] is gently rattling against the side of the large bulb.".

Instead of listening when the chain is in the large bulb and the ice-state of the sphere is less than melted:
	say "[We] can make out a barely audible rattling coming from somewhere.".
	
Instead of listening when the chain is in the large bulb and the sphere is melted:
	say "It sounds like it's coming from within the sphere.".

Every turn when the large bulb is lit:
	if the sphere is not puddles and a random chance of 4 in 10 succeeds:
		now the sphere is the ice-state after the ice-state of the sphere;
		if the sphere is melting:
			say "[We] can't help but notice that the sphere is melting at quite a fast rate.";
		otherwise if the sphere is melted:
			say "A large area of the sphere caves in before [our] eyes.";
			now the sphere is open;
		otherwise if sphere is puddles:
			say "The last of the sphere melts, leaving behind it [a puddle]. It seems the area carved out for the sphere of ice was done in the shape of a [']9['].";
			now the sphere is nowhere;
			move the large bulb to the right platform;
			move the puddle to the right platform;
			increment the score.

Section 3 - Custom Actions

[Initialise melting]
Understand "press [something]" as touching.

Instead of pushing:
	try touching the noun.

Carry out touching the sphere:
	if the large bulb is unlit:
		now the large bulb is lit;
	otherwise:
		now the large bulb is unlit.
		
After touching the sphere:
	say "[first time]It's colder to the touch than [we][']d expected. [only]The [sphere] [if the large bulb is unlit]slowly dims to its original, less glorious state[otherwise]lights up magnificently[end if].".

Carry out touching the large bulb:
	if the large bulb is unlit:
		now the large bulb is lit;
	otherwise:
		now the large bulb is unlit.

After touching the bulb:
	say "[first time]Ouch! That's hotter than [we][']d expected. [only]The large glass bulb [if the large bulb is unlit]slowly dims[otherwise]lights up again[end if].".
	
A rule for reaching inside the large bulb:
	say "[We][']ll have to figure some way of breaking the glass first.";
	deny access.

[Tearing]	
Tearing is an action applying to one touchable thing.
Understand "tear [something]" and "rip [something]" as Tearing.

Check tearing:
	if the noun is not tearable:
		say "How on earth could [we] tear [the noun]?";
		stop the action.
		
Carry out tearing the lamp shade:
	now the lamp shade is nowhere;
	move the torn pieces of shade to the left platform;
	increment the score.
	
Report tearing the lamp shade:
	say "[We] tear open [the lamp shade]. Noticing something written on the platform beneath it, [we] tear the whole thing apart revealing a sleek number [']8['] etched into the platform below[if Heating has ended]. It's written in the same style as the other digit [we] discovered[end if].".
	
Report tearing the torn pieces of shade:
	say "You tear them up into[one of] smaller pieces[or] even smaller pieces[or] tiny little pieces[or]... you know what, we're done here, you madman[stopping].".

[Breaking]
The block attacking rule is not listed in the check attacking rulebook.

Instead of attacking the sphere:
	say "Let's not go crazy here. [We]'ll try touching it instead.";
	try touching the sphere.

Check attacking:
	if the noun is not breakable:
		say "How on earth could [we] break [the noun]?";
		stop the action;
		
Check attacking when the the hammer is not carried by the player:
	if the hammer is touchable:
		try taking the hammer;
	if the player is not carrying the hammer:
		say "What am I supposed to break that with? My hands?";
		stop the action.
		
Carry out attacking the large bulb:
	now the large bulb is nowhere;
	move the chain to the field;
	now the mirror-image of the chain is "[The chain] floats silently in the form of a zero";
	move the shards to the right platform;
	increment the score.
	
Report attacking the large bulb:
	say "You smash open the large bulb, releasing [the chain] into the grasp of some kind of magnetic field, apparently localised to the central platform. The chain slowly but surely takes the form of an [']O['] or what's more likely - a zero.".
	
Report attacking the shards:
	say "You hammer them into[one of] smaller pieces[or] even smaller pieces[or] tiny little pieces[or]... you know what, we're done here, you hammer-wielding maniac[stopping].".

[Untangling]	
Untangling is an action applying to one touchable thing.
Understand "untangle [something]" or "unravel [something]" as Untangling.

Check untangling something untangled:
	say "[The noun] is already untangled.";
	stop the action.
	
Instead of untangling something which is not the rope:
	say "How on earth could [we] untangle [the noun]?".
	
Carry out untangling the rope:
	let S be the tangled-state after the tangled-state of the rope;
	now the tangled-state of the rope is S;
	if the rope is untangled:
		if the player carries the rope:
			move the hammer to the player;
			say "[We] find [a hammer] inside of the rope. It seems to be drawn to the central platform. [We] wonder if there's some kind of [field] there.";
		otherwise:
			move the hammer to the field;
			say "[A hammer] leaps out of the rope into the air... and doesn't fall back down again. The central platform seems to harbour some kind of [field].";
		increment the score.
	
Report untangling something slightly tangled:
	say "[The rope] still needs a bit of unraveling.".
	
Report untangling something untangled:
	say "[The noun] is now fully untangled.".

[Entering a code]
Entering code is an action applying to one topic.
Understand "enter [text]" as entering code.

Check entering code:
	let T be "[the topic understood]";
	replace the text "-" in T with "";
	if the number of characters in T is not 3:
		say "A code must be exactly 3 digits in length.";
		stop the action;
	unless T matches the regular expression "\d\d\d":
		say "A code must consist of 3 numerical digits.";
		stop the action.	
		
Check entering code when the exit is unlocked:
	if the exit is unlocked:
		say "[The exit] is already unlocked.";
		stop the action.
		
Carry out entering code "608":
	now the exit is unlocked.

Carry out entering code "6-0-8":
	now the exit is unlocked.

After entering code "000":
	say "[We] didn't really think was that going to work, did [we]?".
	
After entering code "0-0-0":
	say "[We] didn't really think that was going to work, did [we]?".
		
After entering code "608":
	say "[The exit] gives off a loud [']thud[']. The sound of success.".
	
After entering code "6-0-8":
	say "[The exit] gives off a loud [']thud[']. The sound of success.".

Report entering code:
	let A be character number 1 in the topic understood;
	let B be character number 2 in the topic understood;
	let C be character number 3 in the topic understood;
	if A is "6" or B is "0" or C is "8":
		say "[The exit] gives off an encouraging [']click[']. That said, [we]['re] pretty sure that the door is still unlocked.";
	otherwise:
		say "The panel resets itself to [fixed letter spacing]0-0-0[variable letter spacing]. Apparently, that didn't work.".

Part 2 - Content

Chapter 1 - Scenes

Heating is a scene. Heating begins when play begins. Heating ends when the sphere is nowhere.

Rampage is a scene. Rampage begins when play begins. Rampage ends when the lamp shade is nowhere.

Magnetism is a scene. Magnetism begins when play begins. Magnetism ends when the chain is in the field.

Escape is a scene. Escape begins when play begins. Escape ends when the exit is unlocked.

[If the player manages to crack the lock without solving the puzzles first, they achieve the maximum score.]
When Escape ends:
	if the score is 0:
		increase the score by 5;	
	if the score is 5:
		end the story finally saying "[bold type][We] managed to crack the lock without even looking at the puzzles. Some puzzle this turned out to be. [We]['re] asking for [our] money back![roman type]";
	otherwise:
		end the story finally saying "[bold type][We]['ve] beaten [']000[']![italic type] *cue Nina Simone's rendition of 'Feelin['] Good'*[roman type]".

Chapter 2 - Rooms

Section 1 - The Chamber

The Chamber is a room. The tiles and the platforms are in the chamber. The description of the chamber is "You are surrounded on all sides by [tiles]. Three [platforms] stand against the back wall opposite [the exit]. Due to the ever-so-slightly variance in height, the various puzzles stand like olympic athletes[if the number of things contained by the field is greater than 0]. [The list of things contained by the field] float[s] in the air roughly a metre or so above the central platform[end if].".

The exit is a locked door. It is south of the Chamber and north of Debriefing. The description of the door is "There's a panel on the exit door reading ['][fixed letter spacing]0-0-0[variable letter spacing]['].[paragraph break][bold type]Note: [roman type]Try typing ['][fixed letter spacing]enter 000[variable letter spacing]['] to enter a code into the door.". Understand "door" or "panel" as the exit.

The tiles are scenery. The tiles are mirrored. The tiles are plural-named. Understand "wall" or "walls" as the tiles.

The platforms are a scenery supporter. The left platform, the central platform and the right platform are pedestals in the Chamber. The description of the platforms is "[platform-state].".
The mirror-image of the platforms is "[mirrored-platform-state]".

The mirror-image of the left platform is "[if Rampage has ended][mirror-image of the torn pieces of shade][end if]".
The mirror-image of the central platform is "[if Magnetism has ended and the chain is in the field][mirror-image of the chain][end if]".
The mirror-image of the right platform is "[if Heating has ended][mirror-image of the puddle][end if]".

[Some activities to print the current collective state of the platforms for both examining and looking in the mirror]	
To say platform-state:
	let R be whether or not Rampage has ended;
	Let M be whether or not Magnetism has ended;
	Let H be whether or not Heating has ended;
	if R is true and M is true and H is true:
		say "Taken together, the platforms seem to collectively read [']8-0-9[']";
	otherwise if R is true or M is true or H is true:
		say "The platforms each seem to conceal a single digit. They seem to read ['][if R is true]8[otherwise]something[end if]-[if M is true]0[otherwise]something[end if]-[if R is true]9[otherwise]something[end if][']";
	otherwise:
		say "Due to the ever-so-slightly variance in height, the various puzzles stand like olympic athletes".

To say mirrored-platform-state:
	Let H be whether or not Heating has ended;
	Let M be whether or not Magnetism has ended;
	let R be whether or not Rampage has ended;
	if H is true and M is true and R is true:
		say "The platforms seem to collectively read [']6-0-8[']";
	otherwise if H is true or M is true or R is true:
		say "The platforms each seem to conceal a single digit. When looked at in this way, they read ['][if H is true]6[otherwise]something[end if]-[if M is true]0[otherwise]something[end if]-[if R is true]8[otherwise]something[end if][']";
	otherwise:
		say "From above, the platforms read like [']0-0-0[']. Maybe that's where the name comes from".

The lamp shade is a fixed in place thing on the left platform. The lamp shade is paper. The description of the lamp shade is "A spherical lamp shade, around the same size as the sphere of ice[if the sphere is not enclosed by the location] was[end if]. It's made of what looks to be paper. I bet I could tear right through that.".

The torn pieces of shade are a fixed in place scenery. The torn pieces of shade are plural-named. The torn pieces of shade are paper. The description of the torn pieces of shade is "A dull light shining through [the torn pieces of shade] casts a figure [']8[']". The mirror-image of the torn pieces of shade is "[description of the torn pieces of shade]".

The field is an fixed in place unopenable open container on the central platform. The field is magnetic. The field is scenery.

The sphere is a fixed in place opaque unopenable closed container on the right platform. The sphere is ice. The sphere has an ice-state. The description of the sphere is "A perfectly sculpted sphere made entirely out of ice[if the ice-state of the sphere is greater than dripping]. At least it was until you started playing with it[end if]. I bet it's cold to the touch.".

The puddle is a fixed in place scenery. It is oddly-shaped. Understand "puddles" as the puddle. The description of it is "The water outlines the shape of a [']9['].". The mirror-image of the puddle is "The water outlines the shape of a [']6[']".

The rope is a thing on the central platform. The rope is hemp. The rope has a tangled-state. The description of it is "It looks more like something you might find at a primary school than something Indiana Jones might carry.[if the rope is tangled] It's all tangled. [We] wonder if [we] could untangle it.". The indefinite article of the rope is "some".

The large bulb is a closed unopenable transparent fixed in place container. The large bulb is glass. The large bulb can be lit or unlit. It is unlit. The large bulb is in the sphere.

The chain is in the large bulb. The chain is nickel. The description of the chain is "[if the chain is in the large bulb]It's hard to get a good look at it while it's inside the glass. There must be some way of getting it out. Maybe I could smash the glass[otherwise if the chain is in the field]The hand-crafted [chain] floats in the shape of a zero in [the field][otherwise]A beautifully hand-crafted chain made of nickel. It reminds you of the type of thing your aunt Selma would choose to wear[end if].".

The shards are fixed in place scenery. The shards are glass. The shards are plural-named. The description of the shards is "[We] wonder who gets paid to clean this up afterwards.".

The hammer is a thing. The hammer is nickel. The description of the hammer is "It's incredibly light, but feels strong enough to do some damage.".

Chapter 3 - Testing

Section 1 - Test Me

test me with "x tiles / x door / x sphere / touch sphere / x ice / x rope / x lamp shade / untangle rope / x rope / untangle rope / x sphere / tear lamp shade / tear pieces / tear pieces / tear pieces / tear pieces / press bulb / smash bulb / smash shards / smash shards / smash shards / x platforms / x tiles / x tiles / x tiles / x tiles / x tiles / enter 9999 / enter abc / enter 8-0-6 / enter 6-0-8"