//todo: add gather with label (?)




//inspired by first episode of the Twilight Zone (Where Is Everybody?) + Stanley Parable, of course

VAR part_1_visited = false
VAR part_2_visited = false
VAR panic_button_pressed = false
VAR home_burnt = false
VAR tried_to_think = false
-> intro
== intro ==
~part_1_visited = false
~part_2_visited = false
~panic_button_pressed = false
~home_burnt = false
~tried_to_think = false
This is the story of a man who awakes to find himself in an unknown town, utterly alone. He doesn't know his name. I think I'll name him Phil. He wonders who and where he is. 
He steps out of the house he awoke in and takes a look around for a hint of his identity or some explanation for his loneliness. 
-> begin

== begin == 
Phil decides to go into town, maybe someone would be there who could help him. 
+ Go into town
-> town
+ {not home_burnt} Go back into house, maybe there a hints of Phil's identity in there
-> home

== home == 
~home_burnt = true
As Phil begins walking back through the front door, he notices that the kitchen is on fire. He is confused, because he has just woken up. Has someone been here with him? The whole house burns down.
___________________________________________________________________________________________
-> ending

==disobedient_west==
{not part_1_visited: -> part_1}
{not part_2_visited: -> part_2}
=part_1 //Phil's first directional disobedience
~part_1_visited = true
Aaah, Phil must be getting his left and right confused. It should be pretty simple for him to go the right way, now aware of his previous mistake. 
-> town
=part_2 //Phil's second directional disobedience
~part_2_visited = true
 Phil is clearly defiant and needs to seek professional help for his insurgent behavior. This kind of rebellion has no grounds. I have been nothing but nice to you, but now I am going to have to force you to go East.
-> town

==town==
Phil approaches a street that branches off into two directions. He takes the road that goes East, somehow knowing this is the correct way.
+ East
-> downtown
+ {not part_2_visited} West
-> disobedient_west

= downtown
Downtown, Phil notices the place is absolutely deserted. 
Starting to become anxious, he realizes that everything is political. So if any one did remain, surely they would be in the town hall. Politics never sleep. 
+ {not panic_button_pressed} Go to Town hall
-> town_hall
+ (gluttonous) Oooh! An ice cream store! Grapenut custard sounds delish right now
-> ice_cream

=town_hall
In the town hall, there is a mysterious button on the wall next to a door. Phil naturally wants to open that door.
+ He presses the button once... 
~ panic_button_pressed = true
-> button.panic //Diverting to a label of weave loop


=ice_cream
Phil, you are like a squirrel, so easily distracted from the task at hand. Here you are then, in the ice cream shop.

There is no one here. This is kind of wonderful, being all alone like this, isn't it Phil? No one to demand your money in exchange for the simple joy of indulgence. Phil starts to believe that he might get used this isolation. 

He makes himself a banana split with a grapenut custard base. Perhaps this is all a dream. A very strange and highly detailed one... 

There are books on spinning racks near the counter. As he is flipping through one of the books, he realizes that the rack next to him has been spinning this whole time. 
+ He reaches out to stop it from spinning 
-> book
//Start of a weave
+ [Strange, he thinks...] 
- Phil, smiling and staring blankly at the wall, takes another bite of his ice cream.
    ++ [Phil decides to go see what's playing at the theater]
        Are you sure Phil, the screenwriters are pretty angsty these days....
            +++ Phil is sure
                //Advanced: Gathers directly after an option
                ---- (curious) Phil likes angst, maybe it could teach him something about where all his fellow humans have gone
            +++ Phil is not sure
                Phil, do you want to learn where everyone went or no?
                    ++++ Yes, sorry I do. Let's go to the theater.
                        That's what I thought.
                        -> curious // Redirect to labelled gather above
                
    ++ (gluttonous) There's so much more ice cream to dig into 
        Aaah Phil, some might call this self-care -- making a decision for yourself -- but when we so often prioritize instantaneous gratification do impulse and pleasure not strain our agency?
    
        What flavor would you like Phil? 
            +++ (chocolate) Chocolate
                And here I thought you were a simple man! Good for you for branching out, Phil!
              
            +++ (grapenut) More grapenut custard!
                You are an enigma of a man, Phil. I would have to torture some to consume this much grapenut custard
        
            ---Okay, now that you have enjoyed more ice cream can you please go watch a film, Phil. I'm begging.
                +++++ Why yes of course. Anything you say.
                    I appreciate you being so obedient, Phil!
                +++++ [No, I don't really feel like it] 
                    Sometimes we have to do things we don't feel like doing, Phil
    -- Phil decides to go to the theater //Universal gather
    -> theater
//End of weave
        

= book
Phil notices that the books on the rack are all the same. They are titled: "The Last Man on Earth". <i>What could it mean?</i> Phil naively thinks to himself. Perhaps it's the amnesia that makes him so stupid sometimes. 

Maybe our dear, stupid Phil just needs to watch a film. Surely that will improve his literacy. 
+ Go to the theater 
-> theater

= theater
//taking advantage of the advanced weave feature that allows all options to be labeled
{gluttonous: How was your {ice_cream.chocolate: chocolate ice cream| grapenut custard}, Phil?} // no matter what, he has eaten grapenut custard before visitng theater
+ [Good]
- Glad to hear it Phil!


At the movies, a film is playing. It never crosses Phil's mind that this could mean the presence of another human. He watches the whole movie.  
+ Don't move
-> finishes_movie
+ {gluttonous} Leave because this is boring // using label from ice_cream stitch
-> crosswalk

=finishes_movie
During the credits, there is a curious image: a man flying a plane. Like a word teetering on the tip of one's tongue, a vague image forms in the mind of our beloved and dim-witted Phil

- (realization) That's when it hits him! He is a pilot. But what is his name? And what is he doing here? And where is everyone!? 

+ [Disillusioned, Phil escapes the theater]
-> crosswalk

= crosswalk

{realization: Phil finds himself at the crosswalk outside of the theater. {not gluttonous: At this point, Phil is point blank crazy. A loon.} If this man has never had a thought behind his eyes, now is certainly not the moment that he forms one.}

{gluttonous and not realization: Phil I swear to God why must you be so self-serving? I understand that you are alone, and maybe can afford to be, but it's the principle! Anyway, there's nothing  I can do about it now...}
+ There's no escape from this hopeless life... 
-> button
+ {not tried_to_think} Think a productive thought
-> against_his_ways

=against_his_ways
~tried_to_think = true
You clearly do not have an understanding of how the human mind works, but I will entertain your idea of Phil being anything but an imbecile.

Phil, in contemplating his condition, decides that the earth is flat and, knowing how gravity works, comes to the definitive conclusion that everyone (except for him of course) has been dragged to the center of this flat plane. That must be why he is all alone now! Aaah now he can sit back and enjoy the edge of the world in peace. 
___________________________________________________________________________________________
-> intro

= button //No agency -- player must press the button until I say so
Phil races through the streets until he comes upon a "walk" button and starts pushing it over and over, begging for help.
~ panic_button_pressed = true

-   (panic)
    +   [He continues to press the button]
    {'Please, someone... anyone...' Phil mutters to himself, not realizing the button's true nature. -> panic | -> panic_loop} 
 

-   (panic_loop)
    {panic_button_pressed: {&Suddenly, a voice declares that this button is actually a panic button -> panic | the scenery around Phil starts to blur and fade, revealing stark reality -> panic| He is in an isolation booth surrounded by uniformed servicemen observing him -> panic | Despite his frantic pushing, nothing changes -> panic | Phil's desperation grows -> panic | Until finally... -> reveal}}

== reveal==
They tell him that he is going to the moon and this has all been a test to see how well he copes with loneliness. I don't think Phil is quite happy about this. Mankind and all its rejected astronauts should probably also be a little depressed at the thought of Phil up there. I say <i>tsk tsk</i>... It's like sending an innocent puppy to space. 

-> ending

== ending == 
{not home_burnt: <i>"The barrier of loneliness: The palpable, desperate need of the human animal to be with his fellow man. Up there, up there in the vastness of space, in the void that is sky, up there is an enemy known as isolation. It sits there in the stars waiting, waiting with the patience of eons, forever waiting"}
//Source: direct quote from the Where is Everybody, The Twilight Zone

Would you like to play again? // the player's only agency?
+ Yes
-> intro
+ [No]
-> DONE
