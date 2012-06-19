fs = require 'fs'

jokes = """
Yo mama so fat God told her he had no room in heaven and the devil said there was no room in hell.
Yo Mama so fat her BMI is measured in acres.
Yo Mama so fat when she went to the movies she sat next to everyone.
Yo mama so fat when her beeper goes off, people thought she was backing up.
Yo mama so fat her nickname is "Lardo".
Yo mama so stupid she tried to put her m&ms in alphabetical order.
Yo mama so stupid she put paper on the television and called it paper view.
Yo mama so stupid she went to the orthodontist to get a blue tooth.
Yo mama so stupid she got locked in a mattress store and sleep on the floor.
Yo mama so stupid she thinks taco bell is a mexican phone company.
Yo mama so greasy she used bacon as a band-aid!
Yo mama so greasy she sweats Crisco!
Yo mama so greasy Texaco buys Oil from her.
Yo mama has one leg and a bicycle.
Yo mama has 4 eyes and 2 pair of sunglasses.
Yo mama has so much hair on her upper lip, she braids it.
Yo mama has green hair and thinks she's a tree.
Yo mama has one ear and has to take off her hat to hear what you're saying.
Yo mama has 10 fingers--all on the same hand.
Yo mama has a glass eye with a fish in it.
Yo mama has so many freckles she looks like a hamburger!
Yo mama has three fingers and a banjo.
Yo mama has a wooden leg with a kickstand on it.
Yo mama has a wooden leg with branches.
Yo mama has so many teeth missing, it looks like her tounge is in jail.
Yo mama so skinny her nipples touch.
Yo mama so skinny she hula hoops with a cheerio
Yo mama so skinny she has to hold herself above the toilet for fear of falling in.
Yo mama so skinny she has to wear a belt with spandex.
Yo mama so skinny she turned sideways and dissapeared.
Yo mama so lazy she thinks a two-income family is where yo daddy has two jobs.
Yo mama so lazy she's got a remote control just to operate her remote!
Yo mama so lazy that she came in last place in a recent snail marathon.
Yo mama head so small she use a tea-bag as a pillow.
Yo mama head so small that she got her ear pierced and died.
Yo mama so poor when I went to rob her house i went in the front door and tripped out the back.
Yo mama so poor when I saw her kicking a can down the street, I asked her what she was doing, she said "Moving."
Yo mama so poor she can't afford to pay attention!
Yo mama so poor when I ring the doorbell I hear the toilet flush!
Yo mama so poor when she goes to KFC, she has to lick other people's fingers!
Yo mama so poor when I ring the doorbell she says,"DING!"
Yo mama so poor she went to McDonald's and put a milkshake on layaway.
Yo mama so poor your family ate cereal with a fork to save milk.
Yo mama so poor her face is on the front of a foodstamp.
Yo mama so poor she was in K-Mart with a box of Hefty bags. I said, "What ya doin'?" She said, "Buying luggage."
Yo mama so poor she drives a peanut.
Yo mama so poor she waves around a popsicle stick and calls it air conditioning.
Yo mama so poor she has the ducks throw bread at her!
Yo mama so poor she uses curtains as blankets!
Yo mama so bald, when she braids her hair, it looks like stitches.
Yo mama so bald, when she puts on a turtle neck she looks like a roll on deodorant.
Yo mama so bald, when she goes to bed, her head slips off the pillow.
Yo mama so bald even a wig wouldn't help!
Yo mama so bald you can see whats on her mind
Yo mama so bald that she took a shower and got brain-washed.
Yo mama so hairy the only language she speaks is wookie.
Yo mama so hairy you almost died of rugburn at birth!
Yo mama so hairy she look like she got Buchwheat in a headlock.
Yo mama so hairy Bigfoot is taking her picture!
Yo mama so hairy she wears a Nike tag on her weave so now everybody calls her Hair Jordan.
Yo mama so dark she went to night school and was marked absent!
Yo mama so dark she spits chocolate milk!
Yo mama is so black when she went outside the street lights turned on!
Yo mama so dark that she can leave fingerprints on charcoal.
Yo mama so dark she has to wear white gloves when she eats Tootsie Rolls to keep from eating her fingers.
Yo mama so short she poses for trophies!
Yo mama so short you can see her feet on her drivers lisence!
Yo mama so short she has to use a ladder to pick up a dime.
Yo mama so short she can play handball on the curb.
Yo mama so short she does backflips under the bed.
Yo mama so short she models for trophys.
Yo Mama's so nasty, she only changes her drawers once every 10000 miles.
Yo Mama's so nasty, she went to a hair salon and told the stylist to cut her hair, then she opened up her blouse!!
Yo Mama's so nasty, when I went to yo house said whats for dinner, yo mama put her foot up on the table and said "Corn!"
Yo Mama's so nasty, she has a sign around her neck that says: "Warning: May cause irritation, drowsiness, and a rash or breakouts."
Yo Mama's so nasty, she made Speed Stick slow down.
Yo Mama's so nasty, she made Right Guard turn left.
Yo Mama's so nasty, she went swimming and made the Dead Sea.
Yo Mama's so nasty, I talked to her over the computer and she gave me a virus.
Yo Mama's so nasty, a skunk smelled her butt and passed out. 
Yo mama so nasty I called her to say hello, and she ended up giving me an ear infection.
Yo mama so ugly she looks like she fell off the ugly tree and hit every branch on the way down.
Yo mama so ugly that not even goldfish crackers smile back
Yo mama so ugly Bob the Builder looked at her and said "I CAN'T FIX THAT!"
Yo mama so ugly when she joined an ugly contest, they said "Sorry, no professionals."
Yo mama so ugly she looks out the window and got arrested for mooning.
Yo mama so old, When she farted dust came out!
Yo mama so old I told her to act her own age, and she died.
Yo mama so old her social security number is 1!
Yo mama so old that when she was in school there was no history class.
Yo mama so old she has a picture of Moses in her yearbook.
Yo mama so old her birth certificate says expired on it.
Yo mama so old she knew Burger King while he was still a prince.
Yo mama so old she was a waitress at the Last Supper.
Yo mama so old she ran track with dinosaurs.
Yo mama so old her birth certificate is in Roman numerals.
Yo mama so old she has a picture of Moses in her yearbook.
Yo mama so dirty she has to creep up on bathwater.
Yo mama so dirty she makes mud look clean.
Yo mama so dirty that she was banned from a sewage facility because of sanitation worries!
Yo mama so dirty that you can't tell where the dirt stops and she begins.
Yo mama head so big she has to step into her shirts.
Yo mama head so big it shows up on radar.
Yo mama house so dirty roaches ride around on dune buggies!
Yo mama house so dirty she has to wipe her feet before she goes outside.
Yo mama teeth are so yellow traffic slows down when she smiles!
Yo mama teeth are so yellow she spits butter!
Yo mama's glasses are so thick that when she looks on a map she can see people waving.
Yo mama's glasses are so thick she can see into the future.
Yo mama house so small that when she orders a large pizza she had to go outside to eat it.
Yo mama house so small she has to go outside to eat a large pizza.
Yo mama house so small you have to go outside to change your mind.
Yo mama nose so big she makes Pinochio look like a cat!
Yo mama nose so big that her neck broke from the weight!
Yo mama hair so short when she braided it they looked like stitches.
Yo mama hair so short she curls it with rice.
Yo mama feet are so big her shoes have to have license plates!
Yo mama aint so bad...she would give you the hair off of her back!
Yo mama lips so big, Chap Stick had to invent a spray.
It took yo mama 10 tries to get her drivers license, she couldnt get used to the front seat!
Yo mama hips are so big, people set their drinks on them.
Yo mama hair so nappy she has to take Tylenol just to comb it.
Yo mama so clumsy she got tangled up in a cordless phone.
Yo mama so wrinkled, she has to screw her hat on.
Yo mama twice the man you are.
Yo mama cross-eyed and watches TV in stereo.
Yo mama is missing a finger and can't count past nine.
Yo mama arms are so short, she has to tilt her head to scratch her ear.
Yo mama middle name is Rambo.
Yo mama in a wheelchair and says, "You ain't gonna puch me 'round no more."
Yo mama rouchy, the McDonalds she works in doesn't even serve Happy Meals.
Yo mama so stupid was born on Independence Day and can't remember her birthday.
Yo mama mouth so big, she speaks in surround sound.
Yo mama gums are so black she spits Yoo-hoo.
Yo mama breath smell so bad when she yawns her teeth duck.
I saw your mama kicking a can down the street. I asked her what she was doing, and she said "Moving."
Yo mama teeth are so rotten, when she smiles they look like dice.
she put the Boogie man outta business.
she make Michael Jackson look like Brad Pitt
when she looks in the mirror her reflection committs suicide
when she wobbles down the street in September, folk say, "Damn it, can't believe it's Halloween already..."
when she applied for the ugly contest they told her 'NO Professionals'
she looked out her window and was arrested for indecent exposure!
minutes after she was born her Mother shouted 'What a treasure!" and her Poppa said "Yes, now let's go and bury her..."
they push her face into the dough mixture when making Monster cookies.
when they took her to the Beautician it took 10 hours....and that was just for the quote!
yer Daddy takes her to work each day so he doesny have to kiss her goodbye...
she put Marilyn Manson out of business.
she was a guard at Snake Mountain
they knew what time she was born cuz her face stopped the clock...
even Harry Knowles refused to date her.
they embalmed her face on a box of super-strength laxatives and sold it empty!
she gets 364 extra days just to dress up for Halloween.
Tony Blair moved Halloween to her birthday.
you papa throws the ugly stick and she goes fetches it every time.
she scared the stitching outta Frankenstein.
we had to tie a steak round her neck so the dogs would play with her.
I heard yer Father first met her at the Zoo.
her shadow gave up.
people at the Zoo pay cash so they DON't have to see her...
her mom had to be Pissed drunk just to breast feed her.
when born, the doctors had to fit her incubator with tinted windows.
hotel managers use her picture to keep away the Rats.
instead of round the ankles, they put the Bungee Jumping cord round her neck.
they gave her a middle name...'accident'.
she fell out of the Ugly Tree, hitting every branch on the way down.
when she walked into the Haunted House, she came back out with a Job Application!
even Slicky Willy Clinton refused to sleep with her...
when she was born the Doc smacked her face.
I told her drinks were on the house...so she went and got a ladder...
she make Homer Simpson look like a Nobel Prize winner
she took the Pepsi challenge and chose Cif.
she noticed a sign reading 'Wet Floor'...so she just did!
it takes her two hours to watch 60 Minutes.
when you were born, she looked at your umbilical cord and said, "Wow, it comes with cable too!"
she asked for a refund on a jigsaw puzzle complaining it was broken.
she got locked in the Quickie Mart and nearly starved to death.
she sold her Car for Petrol cash!
she reckoned a Quarterback was a refund...
she once attempted to commit suicide by jumping off a Kerb.
she leaves tell tales signs she's been using my computer - white out (tipp ex) is on the screen.
she took a job cutting grass on an Oil Rig.
I found her peaking over a glass wall to see what was on the other side.
it took her 2 days to make Microwaveable Pot Noodles.
she invented a silent car alarm.
that when you stand beside her you can actually hear the ocean
she really thought the cinema was selling Free Willies...
she watches The Three Stooges and takes notes.
she was born on Halloween and can't remember her birthday.
she thought Morning Dew was a New York radio station.
she lost her shadow.
she went to a Whalers game to see Kiko.
she somehow got fired from a Blow-Job
she thought Hot Meals were stolen food.
she make Laurel and Hardy look like Nobel Prize winners.
when I asked her to purchase me a Colour TV she asked me...'Which colour?'
when she step on the Weight Scales it says...'to be continued'...
she once went on a seafood diet...whenever she saw food she ate it!
folk exercise by jogging around her!
when she bends over, we enter Daylight Saving Time.
she sat on a Nintendo Gamecube and it turned into a gameboy
she make Kiko the Whale look like a Smartie
NASA plan to use her to shore up the hole in the Ozone layer
she was measured at 38-26-36 and that was just the left arm...
small objects orbit her.
she make olympic sumo wrestlers look anerixic.
when I tell her to haul ass, she gotta make two trips.
when she farted she launched herself into orbit.
she lost a game at Hide&Seek only cos I spotted her...behind Mount Everest.
when I had to swerve to avoid hitting her on the road I ran out of Petrol!
she could be the eighth continent.
she nearly put Safeway out of business
the only thing that's attracted to her is gravity.
her Uni graduation photo was an aerial
when she auditioned for a part in Raiders of the Lost Ark she got the part of the big Rolling Ball.
she make Jabba the Hutt look anorexic.
her fave food is seconds.
her belt size is Equator.
she eats Desert out of a Trash Can lid
she wears an 'X' jacket and Copters attempt to land on her
she shows up on radar.
she needs a map to find her butt.
she fell into the Grand Canyon....and got stuck!
she wears an asteroid belt.
her Passport photo says 'Picture is continued overleaf'
she has TB ... 2 bellys.
she's once, twice, three times a lady.
she was in the Daily Record last week on page 5, 6, 7, 8, and 9.
the circus use her as a trampoline
stunt agencies use her as an air mattress
when she opens the Fridge it says - 'I give up...'
she got a new gig at the Cinema...she works as the screen
she once told me 'I could eat a horse'...believe me, she wasn't kidding!
she deep fries her toothpaste.
that your family ate Cornflakes with a fork to save milk.
they put her photo on food stamps.
when I visited her trailer, 2 cockroaches tripped me and a Rat tried to steal me wallet.
she waves an ice lolly around and calls it Air conditioning.
burglars break into her home and leave money.
when I told her about the last supper she thought the food stamps had run out.
the building society repossed her cardboard box.
she watches television on an Etch-A-Sketch.
each night she goes to KFC to lick other folk's fingers
she can't even afford to go to the free clinic.
when I saw her kickin a can down the road I asked her what she was doing....'Moving' she replied.
I caught her trying to use food stamps in the Gobstopper machine.
when I rang her doorbell, SHE said 'Ding-Dong'
I asked her where the 'facilities were' and she replied - "Pick a corner...ANY corner..."
I visited her house, tore down the cob webs and she screamed - "Who's tearing down the drapes!!!!"
I walked into her home, asked if I could use her toilet, and she said "Sure thing, it's 4th tree on your right..."
only time she smelled Hot Food was when a rich bloke farted...
when I saw her wobbling down the street with 1 shoe, I hollered - "Lost a shoe?", and she said - "Nope...just found one..."
she hangs the Toilet paper out to dry.
closest thing to a car she owns is a low-riding Shopping trolley....with a box on it...
she had to take out a second mortgage on her cardboard box.
I went into her 'living room', stepped on a Fag butt and she shouted - "Oi, who turned off the heater!"
I once threw a stone at a garbage can, and out she popped saying - "Who knocked???"
I went through her front door and tripped over the back fence.
she does drive by shootings on the school bus.
when she asked me over to dinner I took a paper plate from the kitchen and she groule - "Don't use the good china"
she left her purse on Noah's Ark.
Jurassic Park brought back the memories...
when she ran the 100 metre dash, they timed her with a sundial.
she still owes Moses a dollar.
when she was at school...there was No history class!
she uses her hot flushes to heat her cup of Tea
she co-wrote the 4th Commandment.
when I asked for her ID she handed me a rock
she even made Yoda jealous.
she recalls when the Grand Canyon was a ditch.
the fire department are on standby when you light her birthday cake
when she gave birth, You came out with Dentures.
she sat in front of Jesus in 1st grade
her first job was as Cain and Abel's baby-sitter.
her birthday expired.
when Moses parted the Red Sea, he found yo momma fishing on the other side!
she got the first copy of the Ten Commandments.
Yo mama's so fat that she expresses her weight in scientific notation.
Yo mama's so fat that scientists track her position by observing anomalies in Pluto's orbit.
Yo mama's so fat that a recursive function computing her weight causes a stack overflow.
Yo mama's so fat that the long double numeric variable type in C++ is insufficient to express her weight.
Yo mama's so fat that THX can't even surround her.
Yo mama's a convenient proof that the universe is still expanding exponentially.
Yo mama’s so big that she has a gravitational pull equal to that of the sun.
Yo mama's so big that doctors use scuba divers as nanobots to clean her arteries.
The mass of yo mama at rest is approximately equal to that of a neutron star traveling at (1-(10^-1000))c.
Yo mama's so slow and dumb that she can be emulated on a 286.
Yo mama conforms to Planck's law - the greater the frequency with which she screws, the more energetic she gets.
Yo mama's like a converging lens - she's wider in the middle than she is on either end.
Yo mama's dumber than an augmented rat.
Yo mama's so fat that she and the great wall of China are used as reference points when astronauts look back at the Earth.
Yo mama's such a ho that even the noble gases are attracted to her.
Yo mama's such a ho that electrons have a positive charge when they're around her.
Yo mama's so stupid that her exchange particle is a "moron".
Yo mama's so fat that China uses her to block the internet.
Yo mama's so fat that NASA shot a rocket into her ass looking for water.
Yo mama's so dumb that she went to the dentist and asked for a bluetooth.
Yo mama's so fat that she doesn't just have a low center of gravity, she has an elliptical orbit.
Yo mama's so fat that IEEE is working on a wifi protocol so people can get the signals to reach users on opposite sides of her. It's called 802.11 Draft Fat Mama
If we were to code your mom in a C++ function she would look like this: double mom (double fat){ mom(fat);return mom;}; //your mom is recursively fat.
Yo mama's so old that she goes on carbon dates.
Yo mama is so fat that she took geometry in high school just cause she heard there was gonna be some pi.
Yo mama is so fat that the ratio of the circumference to her diameter is four.
Yo mama is so fat that her derivative is strictly positive.
Yo mama is like a protractor - she's good at every angle.
Yo mama is so fat that in a love triangle, she'd be the hypotenuse.
Yo mama is so stupid that when I told her "pi-r-squared" and she replied no, they're round.
The limit of yo mama's ass goes to infinity.
Yo mama = x/0 for every x in yo mama.
The infinite series of yo mama from 0 to infinity is strictly diverging.
Yo mama is so mean that she has no standard deviation.
Yo mama is so ugly, that Pythagoras wouldn't touch her with a 3-4-5 triangle.
Yo mama is so square that she's got imaginary numbers on her social security card.
Yo mama is such a ho, that she asked all the math majors to to figure out g(f(your mom)) just so they could "f" her first.
The volume of yo mama is an improper integral.
The integral of yo mama is fat plus a constant, where the constant is equal to more fat.
Yo mama's muscle-to-fat ratio can only be explained in irrational complex numbers.
The only way to get from point A to point B is around yo mama's fat ass.
Yo mama's so fat that when she stepped on the scale, her weight was OVER 9000!!!!
Yo Mama's so fat, she walked in front of the TV and I missed three seasons of Inuyasha!
Yo mama's so fat, Naruto couldnt make enough clones to see all sides of her.
Yo mama's so ugly, she can't even get tentacle raped.
Yo mama's so ugly, even Tamaki wouldn't hit on her.
Yo mama's so fat that the Dragon Ball Z crew uses her to make craters on set.
Yo mama's so ugly, she's the real reason sasuke left the village.
Yo mama's so fat that when she sat down on a park bench, she caused the Naruto timeskip.
Yo mama's so ugly that she's like a Death Note. Get someone to look at her, and they'll die!
Yo mama's so ugly, Jiraiya saw her and turned gay!
Yo mama's so hairy Naruto thought she was a Summon.
Yo mama's so fat, she scared L into giving up all sweets.
Yo mama's so ugly that she made Spike Spiegel choke on his cigarette
Yo mama's so ugly that she makes Sailor Bubba feel dirty.
Yo mama's so fat that she cant even fit in the expanding plug suit.
Yo mama's so ugly that she made Loz cry.
Yo mama's so dumb that when she was handed the death note, she thought they were asking for her autograph.
Yo mama's so fat that she broke the HP limit!
Yo mama's so hairy and ugly that she got used as Ashitare's stunt double.
Yo mama's so stupid she makes Tristan look like Einstein!
Yo mama's so fat, she makes Vash look anorexic!
Yo mama's so hairy that she has to go to Furfest to meet a man.
Yo mama's breath is so nasty that it chases away Miasma.
Yo mama's so round that she makes a Pokéball look flat!
Yo mama's so ugly, Saya thought she was a Chiropteran.
Yo mama's so dumb, she failed out of Cromartie High School.
Yo mama's so old and fat they use her wrinkles as set terrain for Dragon Ball Z.
Yo mama's nosehairs are so long that they make Bobobo jealous!
Yo mama's so fat that she was mistaken for Mt. Fuji at the Sakura festival.
Yo mama's so fat she makes a Snorlax look like a chihuahua!
Yo mama's so ugly that when Nozomu Itoshiki saw her, he didn't even bother with his "ZETSUBOUSHITA!" speech - he skipped straight to hanging himself.
Yo mama's so fat that it took the entire Dragon Ball Z crew 1 week just to lift her off the ground.
Yo mama's cosplay is so bad that she got beat by a Narutard in the masquerade!
Yo mama's so ugly that when Kakashi looked directly at her, he lost an eye.
Yo mama's so fat that she tried to eat someone dressed as a box of Pocky!
Yo mama's so ugly that she makes Orochimaru look beautiful.
Yo mama's so fat, Choji told her to lose weight.
Yo mama's so fat that even the Death Star couldn't blow her up!
Yo mama's so fat that Spock couldn't find a pressure point to perform the Vulcan Death Grip on her.
Yo mama's so ugly that Wuher said 'We don't serve your kind here'.
Yo mama's so fat the odds against not finding her fat are approximately 3,720 to 1.
Yo mama's so fat that she thought the opening line of Kirk's monologue was "Spice, the final Frontier..."
Yo mama's so stupid that when the borg had to choose between assimilating her and a tree, they chose the tree.
Yo mama's so fat that if she were placed beside a changeling during regeneration, no one would know the difference.
Yo mama's so fat that she tried to fly through a temporal anomoly but she didn't fit.
Yo mama's so fat she makes Riker's belly look 3 atoms thick.
Yo mama's so fat that when she tried to captain a galaxy class they had to separate the saucer so she could fit.
Yo mama's so fat that she makes the USS Enterprise look like a micro machines racer.
Yo mama's so flatulent that she forced the Mustafarians to wear masks!
Yo mama's so dumb that she tried to rent a car from The Enterprise.
Yo mama's so fat that Dexster Jettster mistook her for his wife.
Yo mama's so ugly that the term 'bantha poodoo' wasn't used metaphorically with reference to her.
Yo mama's so fat that only half her body was able to come out frozen from the carbon freezing chamber in Cloud City.
Yo mama's so ugly that Dr. Evazan looks like a male supermodel next to her.
Yo mama's so fat that when she beams to a ship, the ship beams inside of her.
Yo mama's so such a ho that she slept with me... therefore, I AM YOUR FATHER!
Yo mama's so dumb that when she found a vulcan, she tried to call Santa to take him back to the north pole.
Yo mama's so fat that the passengers of the Millenium Falcon mistook her for a small moon.
Yo mama's so fat that Gardulla the Hutt had a boost in self-esteem after seeing her.
Yo mama's so ugly that she made doctor McCoy say "Damnit Jim, I'm a doctor, not a Zoologist!"
Yo mama's so fat that she fell to the dark side and couldn't get back up.
Yo mama's so fat that if she was thrown into the second Death Star's reactor core, she could have blown up the entire Imperial fleet.
Yo mama's so fat that the Kaminoans couldn't use her as a host for clones since they couldn't pierce her skin deep enough to draw blood.
Yo mama's so weak-minded that I got her to lead me to Jabba without using a jedi mind trick!
Yo mama's so fat that she caused Kamino to flood when her water broke.
Yo mama's so ugly that she's probably a Shi'ido Clawdite that stays in her regular form all the time.
Yo mama's so fat that her lack of balance caused her to stumble into an Utapau sinkhole.
Yo mama's so fat that she crushed Boga as soon as she mounted her.
Yo Mama's so fat, that in an attempt to beam her up, the ship ended up being pulled down to the surface.
Yo Mama's so ugly even Data would need special eye googles to look at her.
Yo mama's so ugly her Kazon hairdo is an improvement!
Yo Mama's so ugly even a Ferengi would dress her in clothes.
Yo mama's so old even Guinan refers to her as "old bag".
Yo Mama's so fat that when she walks into a room the replicators stop working.
Yo Mama's so fat, Data feels strong emotions of disgust and self-terminates.
Yo Mama's so stupid the Borg wouldn't assimilate her!
Yo Mama's so fat she wears her own inertia dampener.
Yo Mama's so ugly she did the truly impossible: she made James T Kirk's penis go limp.
Yo Mama's so fat, she managed to contain a warp core breach.
Yo Mama's so fat, she got stuck trying to enter the Nexus.
Yo Mama's so fat, when she fell over, she punched a hole in the fabric of space/time.
Yo mama is like a hockey player, she only showers after three periods.
Yo mama is like a chicken coop, cocks fly in and out all day.
Yo mama has so many teeth missing, that it looks like her tongue is in jail.
Yo mama's mouth is so big that she speaks in surround sound.
Yo mama is so grouchy that the McDonalds she works in doesn't even serve Happy Meals.
You suck... yo mama does too, but she charges.
Yo mama is like a paper towel, she picks up all kinds of slimy wet stuff.
Yo mama is like Bazooka Joe, 5 cents a blow.
Yo mama is like a telephone, even a 3 year old can pick her up.
Yo mama is like a Christmas tree, everybody hangs balls on her.
Yo mama is like the sun, look at her too long and you'll go blind.
Yo mama is like a library, she's open to the public.
Yo mama is like a fine restaurant, she only takes deliveries in the rear.
Yo mama is like an ATM, open 24 hours.
Yo mama is like a bowling ball... round, heavy, and you can fit three fingers in.
Yo mama is like a basketball hoop, everybody gets a shot.
Yo mama is like a Discover card, she gives cash back.
Yo mama is like a championship ring, everybody puts a finger in her.
Yo mama is like Dominoes Pizza, one call does it all.
Yo mama is like a microwave, press one button and she's hot.
Yo mama is like a mail box, open day and night.
Yo mama is like a bowling ball, she always winds up in the gutter.
Yo mama is like a bus, guys climb on and off her all day long.
Yo mama is like a door knob, everybody gets a turn.
Yo mama is like a light switch, even a little kid can turn her on.
Yo mama's such a ho that "who's your daddy?" is a multiple-choice question.
You'll never be the man Yo mama was.
Yo mama... 'nuff said.
Yo mama is so lazy that she thinks a two-income family is where yo daddy has two jobs.
Yo mama is so lazy that she's got a remote control just to operate her remote!
Yo mama's arms are so short that she has to tilt her head to scratch her ear.
Yo mama's lips are so big that Chapstick had to invent a spray.
Yo mama is so lazy that she came in last place in a recent snail marathon.
Yo mama is missing a finger and can't count past nine.
Yo mama is so flat that she makes the walls jealous!
Yo mama's gums are so black that she spits Yoo-hoo.
It took yo mama 10 tries to get her drivers license - she couldn't get used to the front seat!
Yo mama's so fat that when she asked me "what's up?" I said "your weight!"
Yo mama is twice the man you are.
Yo mama's head is so small that she got her ear pierced and died.
Yo mama is cross-eyed and watches TV in stereo.
Yo mama is so stupid that she was born on Independence Day and can't remember her birthday.
Yo mama's head is so small that she uses a tea-bag as a pillow.
Yo mama's face is so wrinkled, that she has to screw her hat on.
Yo mama's hips are so big that people set their drinks on them.
Yo mama's hair is so nappy that she has to take Tylenol just to comb it.
Yo mama's feet are so big that her shoes need to have license plates on them!
Yo mama is so bald that even a wig wouldn't help!
Yo mama is so bald that you can see what's on her mind.
Yo mama is so bald that she took a shower and got brain-washed!
Yo mama's teeth are so yellow that when she smiles everyone sings "We're Walking on Sunshine."
Yo mama is like a slaughter house - everybody's hanging their meat up in her.
Yo mama is like the new AOL 4.0: Fun, Fast, Easy and Free!
Yo mama is like a carpenter's dream - flat as a board and easy to nail.
Yo mama is like Humpty Dumpty - First she gets humped, then she gets dumped.
Yo mama is like a bag of potato chips, "Free-To-Lay."
Yo mama is like a turtle - once she's on her back she's fucked.
Yo mama is like a fan - she's always blowing someone.
Yo mama is like Pizza Hut - if she isn't there in 30 minutes... it's Free!
Yo mama is like a goalie - she only changes her pads after three periods.
Yo mama is like a gas station - you gotta pay before you pump!
Yo mama is like Sprint - 10 cents a minute anywhere in the country.
Yo mama is like a Chinese restaurant - All you can eat for only $9.95!
Yo mama's breath smells so bad that when she yawns her teeth duck out of the way.
What's the difference between yo mama and a Lay-Z-Boy? One's soft, squishy, and always has someone in it. The other is a chair.
What's the difference between yo mama and a 747? About 20 pounds.
Yo mama's like a shotgun, one cock and she blows.
Yo mama's like the Bermuda Triangle, they both swallow a lot of seamen.
Yo mama's like cake mix, 15 servings per package!
Yo mama's like a 5 foot tall basketball hoop, it ain't that hard to score.
Yo mama's like a vacuum cleaner... she sucks, blows, and then gets laid in the closet.
Yo mama's like the Pillsbury dough boy - everybody pokes her.
Yo mama's like a brick, dirty, flat on both sides, and always getting laid by Mexicans.
Yo mama's like a nickel, she ain't worth a dime.
Yo mama's like a streetlamp, you can find her turned on at night on any street corner.
Yo mama's like a telephone booth, open to the public, costs a quarter, and guys go in and out all day.
Yo mama's like a Reese's Peanut Butter Cup, there's no wrong way to eat her.
Yo mama's like a postage stamp, you lick her, stick her, then send her away.
Yo mama's like a screen door, after a couple of bangs she loosens up.
Yo mama's like a dollar bill, she gets handled all across the country.
Yo mama's like school at 3 o'clock... children keep coming out and nobody can remember all the fathers.
Yo mama's like a bowling ball, she gets picked up, fingered, thrown down the gutter, and she still comes back for more.
Yo mama's like a set of speakers - loud, ugly, lives in a box, and you can turn her up, down, on, and off.
Yo mama's like a birthday cake, everybody gets a piece.
Yo mama's like 7-Eleven - open all night, hot to go, and for 89 cents you can get a slurpy.
Yo mama's like a vacuum cleaner - a real good suck.
Yo mama's like a Snickers bar, packed with nuts.
Yo mama's like a race car driver - she burns a lot of rubbers.
Yo mama's like a parking garage, three bucks and you're in.
Yo mama's like a pool table, she likes balls in her pocket.
Yo mama's got 1 toe & 1 knee and they call her Tony.
Yo mama's got a "wait" problem, she can't wait to eat.
Yo mama's got a 4 dollar weave and don't know when to leave.
Yo mama's teeth are so yellow, when she smiles it looks like a Kraft Singles pack.
Yo mama's got Play-Doh teeth.
Yo mama's like the Panama Canal, vessels full of seamen pass through her everyday.
Yo mama likes to applaud, 'cause she's got clap
Yo mama's got 1 leg longer than the other so they call her call her hip hop.
Yo mama's got an eating disorder, she be eating dis order, dat order, she be eating all the damn orders!
Yo mama's got more chins than a Chinese phone book.
Yo mama's like a bungee cord... 100 dollars for 30 seconds and if that rubber breaks, your ass is dead!
Yo mama's like a squirrel, she's always got some nuts in her mouth.
Yo mama's like a refrigerator, everyone puts their meat in her.
Yo mama's like a tricycle, she's easy to ride.
yo mamas like a hardware store. 25 cents a screw.
Yo mama's like mustard, she spreads easy.
Yo mama's like peanut butter: brown, creamy, and easy to spread.
Yo mama's like McDonalds... Billions and Billions served.
Yo mama's like an elevator, guys go up and down on her all day.
Yo mama's like a railroad track, she gets laid all over the country.
Yo mama's like lettuce, 25 cents a head.
Yo mama's got an eagle's nest wig.
Yo mama's twice the man you are.
Yo mama's got more crust than a bucket of Kentucky Fried Chicken.
Yo mama's got more weave than a dog in traffic.
Yo mama's only got one finger and runs around stealing key rings.
Yo mama's got a peanut butter wig with jelly sideburns.
Yo mama's got a leather wig with suede sideburns.
Yo mama got hit upside the head with an ugly stick.
Yo mama's got so much weave, when a fly goes by her hair swats at it.
Yo mama's got no ears and was trying on sunglasses.
Yo mama's got so much weave, AT&T uses her extensions as backup lines.
Yo mama's got so much dandruff, she needs to defrost it before she combs her hair.
Yo mama's so bald that I can tell fortunes on her head.
Yo mama's so bald that you could draw a line down the middle of her head and it would look like my ass.
Yo mama's so bald that when she goes to bed, her head slips off the pillow.
Yo mama's so bald that when she braids her hair, it looks like stitches.
yo mama's breath is so stanky, she eats odour eaters.
Yo mama's got one leg and people call her Ilene.
Yo mama's been on welfare so long that her picture is on food stamps.
Yo mama's so hunchbacked, she has to look up to tie her shoes.
Yo mama's nostrils are so huge she makes Patrick Ewing jealous.
Yo mama's so hunchbacked, she has to wear goggles to wash dishes.
Yo mama's so hunchbacked, she can stand on her feet and her head at the same time.
Yo mama's so hunchbacked, she hits her head on speed bumps.
Yo mamma so fat, China uses her to block the internet.
Yo mama so fat pkzip can’t compress her.
Yo momma so fat, it takes 5 warlocks to summon her.
Yo momma so fat you gotta address her in 128 bit.
Yo momma so fat they mapped her for Google street view.
Yo momma so old she goes on carbon dates.
Yo momma so stupid, she’s currently on a quest for the Head of Vecna.
Your momma is so mean she stole the walrus’ bukkit and ate kitteh’s cheezburger.
Yo momma so mean she has no standard deviation.
Yo momma so fat THX can’t even surround her.
Yo momma so dumb, she went to the dentist and asked for a bluetooth.
Yo momma so stupid, she thinks the Large Hadron Collider is a gay porn film.
Yo momma’s so big and ugly she lies dreaming in R’lyeh.
Yo momma so fat she doesn’t just have a low center of gravity, she has an elliptical orbit.
Yo momma so old, she’s an arguing point between Creationists and Evolutionists.
Yo Momma so fat, even Ralph Lauren’s Photoshop team can’t help her ass.
Yo momma so dense she got her own event horizon.
Your momma is so fat NASA shot a rocket into her ass looking for water.
Yo momma so weak physicists have unified her with electromagnetism.
Yo momma so fat, she took geometry in high school just cause she heard there was gonna be some pi.
Yo momma so fat, she bends light.
Yo momma so big, Google ran out of pixels tryin to Street View her butt.
Yo mama so fat, Stephen Hawking found three extra dimensions in her panties!
Yo mama so dumb, she thinks the Lorenz-Fitzgerald contraction is what happened right before she had twins.
Yo mama so FAT32, NTFS won’t even give her permission.
Yer momma so dumb the Higgs Boson comes back in time to shut her mouth.
Yo mama so dumb, she thinks steampunk is a buffet item.
Yo mama so fat that her presence itself distort the space-time tapestry.
Yo momma so fat, her Schwarzschild radius is that of the universe.
Yo mama so fat, she emits Bekenstein-Hawking radiation (at least until she shrinks and dissipates…)
Your mama’s so fat, when black holes see her, they shake their heads and travel in the opposite direction.
Yo mama so fat her diet is Hawking Radiation.
Yo mama so fat she changes the universal constant of gravitation.
Yo mamma is so massive she has regular interactions with neutrinos.
Yo momma so fat when she sits around the house she sits around all 10*10*16 multiversal instantiations of the house.
Yo momma so fat, Han Solo sliced her open with a lasersaber and popped luke inside for warmth.
Your momma is so fat NASA shot a rocket into her ass looking for water.
Yo momma so fat, she engirdles the world, and has engendered Ragnorök.
Yo momma so big and nasty, Al Gore’s afraid when she farts it’s gonna blow a new hole in the ozone layer.
Yo momma so big, the Fail Whale sued her in Internet court for unlawful impersonation.
Yo momma so fat, she took geometry in high school just cause she heard there was gonna be some pi.
Yo momma so fat she doesn’t just have a low center of gravity, she has an elliptical orbit.
Yo momma so Pi, she can’t be expressed accurately as a fraction.
Yo momma’s so white she thinks Malcolm X is Malcolm the 10th.
Yo momma’s so fat her laptop has a grease trap.
Your momma’s so large, CERN plans to use her to track down the Higgs boson.
Yo momma’s so big Falcon Heene tried to fly away in her.
Yo momma so weak physicists have unified her with electromagnetism.
Yo momma so dumb she think encryption is what happens when they bury you.
Yo momma’s so big and ugly she lies dreaming in R’lyeh.
Yo momma so sleazy, even Valleywag won’t link to her.
Yo momma got such a big head, Ralph Lauren don’t even need to photoshop her.
Yo momma so old, she’s an arguing point between Creationists and Evolutionist.
Yo momma so round there’s a formula for calculating her volume.
Yo momma so oily, America’s gonna invade her and set up a pipeline contract with Halliburton.
Yo momma so ugly she made tubgirl run screamin and take a bath.
Yo momma so dumb she thinks pluto is a planet.
Yo momma so dumb, she thinks inbound links means eatin up hotdogs.
Yo momma so dumb, she thinks the Singularity is what happens when you get divorced.
Yo momma so skanky, not even /b/ would fap to her.
Yo mama so big, she needs a multi-petabyte RAID array just to store her fat ass.
Yo momma so dumb, she thought Google was her phone number. And you wonder why she don’t call.
Yo mama so dumb, when you told her your laptop was from Apple, she bit right into it and thought the keys was seeds.
Yo momma so stupid, when Google Wave, she waved right back.
Yo momma’s so fat, when her iPhone beeps for an incoming txt, people think she’s a truck backin’ up.
Yo momma so nasty Keyboard Cat furiously tried to play her off until its paws bled.
Your mama’s so fat, when black holes see her, they shake their heads and travel in the opposite direction.
Yo mama so stupid she waited for the Universal Serial Bus.
Your mama is so fat, she expresses her dress size in scientific notation.
Your mama is so old, she still has gills in her prom photo.
Yo momma so fat, the ratio of her circumference to her diameter is four.
Your momma's so fat that the probability that she is in an arbitrary point in a room is 1.
Your momma's so fat that Schrodinger found her to be both inside and outside of the box.
Your momma's so fat, she has severe heart disease, she won't live long :(
Yo mamma's so fat, she sat on a binary tree and flattened it to a linked list in constant time.
In a double blind study to estimate yo' momma's mass, they used VY Canis Majoris as a control.
Your mom circulates like a public key.
Your mom serves more requests than HTTP.
She keeps all her ports open like Windows ME
Your momma so fat I called her and got a stack overflow.
Your mom is so promiscuous, your family tree is recursive.
Your momma is so FAT I have to defragment her weekly
""".split(/[\n\r]+/)

yoMama = (theme, respond) -> 
    if theme?
        jk = jokes.filter((j) -> j.indexOf(theme) >= 0)
        respond brain.anyOf (if jk.length > 1 then jk else jokes)
    else
        respond brain.anyOf jokes

# yomama [theme]
brain.addPattern 'yoMama',
    match: /^y[ou]+r?\s?(?:mam+a|mom)\s?(\w+)?/i
    fn: (user, m, cb) -> yoMama m[1], cb
