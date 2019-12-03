"Wand Quest" by "N."

Use no scoring.

When play begins:
	say "You are a wizard, can you find your wand and go to Hogwarts?".

The time of day is 10:00 am.


The Bedroom is a room. "you are in your room, it is very messy".

clothes are in the Bedroom. "clothes are on the floor.".

clothes are edible.

desk is in the Bedroom."There is a desk with some papers on it".

desk is edible.
owner is in the Office.
At 10:05 AM:
	say "The owner has left the office.";
	Now the owner is in the Living Room.

office is east of the Bedroom."[if owner is in the Office] Here, the owner of the house does very important work, the owner is here and says 'you know you are not allowed to enter this room according to the rules'...[end if] [if owner is in the Living Room]Very white clean room, nothing to see.[end if]".

The Living Room is north of the Office."Just a tv and a chair here".
chair is in the Living Room.
Instead of examining the chair in the Office : say "There is nothing on the chair".



Instead of examining the desk in the Bedroom: say "You check under the papers on the desk, there are only pens, you can't see a wand.".

Instead of examining the clothes in the Bedroom for the first time:
	say "Very smelly clothes, it's probably not there.";
Instead of examining the clothes in the Bedroom for the second time:
	say "you hate yourself for not doing laundry, you keep looking but no luck so far";
Instead of examining the clothes in the Bedroom for the third time:
	end the story saying "FOUND THE WAND! I'M GOING TO HOGWARTS..! Then you realize how great it would be..."





