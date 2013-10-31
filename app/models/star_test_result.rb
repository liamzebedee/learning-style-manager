class StarTestResult < ActiveRecord::Base
  QUESTIONS =
  {
    "When operating new equipment for the first time I prefer to..." => [
      "read the instructions",
      "have a go and learn by 'trial and error'",
      "listen to or ask for an explanation",
      "read the manual and the FAQ"
      ],
    "When seeking travel directions I..." => [
      "look at a map",
      "follow my nose or maybe use a compass",
      "ask for spoken directions",
      "use google maps and follow the text instructions"
      ],
    "When cooking a new dish I..." => [
      "follow a recipe on a YouTube video",
      "follow my instinct, tasting as I cook",
      "call a friend for explanation",
      "follow the receipe given by the author"
      ],
    "To teach someone something I..." => [
      "draw a diagram and show pictures",
      "demonstrate and let them have a go",
      "explain verbally",
      "write line by line instructions"
      ],
    "I tend to say..." => [
      "I see what you mean",
      "I know how you feel",
      "I hear what you are saying",
      "let me take some notes on that"
      ],
    "I tend to say..." => [
      "show me",
      "let me try",
      "tell me",
      "write it down for me"
      ],
    "I tend to say..." => [
      "watch how I do it",
      "you have a go",
      "listen to me explain",
      "let me write down some instructional material or FAQ"
      ],
    "When complaining about faulty goods I tend to" => [
      "create a flow chart for what I and the company needs to do",
      "go back to the store, or send the faulty item to the head office",
      "phone",
      "write a letter/email to the company"
      ],
    "I prefer these leisure activities" => [
      "museums or galleries",
      "physical activities or making things",
      "music or conversation",
      "libraries or bookshops"
      ],
    "When shopping generally I tend to..." => [
      "look and decide",
      "try on, handle or test",
      "discuss with shop staff",
      "goes off a written shopping list I prepared earlier"
      ],
    "When choosing a holiday I..." => [
      "read the brochures",
      "imagine the experience",
      "listen to recommendations",
      "read over blog comments and reviews"
      ],
    "When choosing a new car I..." => [
      "look at the advertising and brief descriptions",
      "test-drive what I fancy",
      "discuss with friends",
      "look at detailed reviews by the experts"
      ],
    "When learning a new skill I" => [
      "watch what the teacher is doing",
      "I like to give it a try and work it out as I go along by doing it",
      "I talk through with the teacher exactly what I am supposed to do",
      "take lots of notes and then read them over again later"
      ],
    "When choosing from a restaurant menu..." => [
      "I imagine what the food will look like",
      "I imagine what the food will taste like",
      "I talk through the options in my head",
      "read over blog comments and reviews"
      ],
    "When listening to a band" => [
      "I sing along to the lyrics (in my head or out loud!)",
      "I move in time with the music",
      "I listen to the lyrics and the beats",
      "listen and read the meaning and power behind their lyrics"
      ],
    "When concentrating I..." => [
      "focus on the pictures in front of me",
      "move around a lot, fiddle with pens and pencils and touch unrelated things",
      "discuss the problem and possible solutions in my head",
      "focus on the words and their meanings in front of me"
      ],
    "I remember things best by" => [
      "making diagrams and flow charts",
      "doing and practising the activity, or imagining it being done",
      "saying them aloud or repeating words and key points in my head",
      "writing notes or keeping printed details"
      ],
    "My first memory is of" => [
      "looking at something",
      "doing something",
      "being spoken to",
      "feeling the power in the words I just read"
      ],
    "When anxious, I..." => [
      "visualise the worst-case scenarios",
      "can't sit still, fiddle and move around constantly",
      "talk over in my head what worries me most",
      "write out a detailed plan to improve and correct the situation"
      ],
    "I feel especially connected to others because of" => [
      "how they look",
      "how they make me feel",
      "what they say to me",
      "the little notes of encouragement they give me"
      ],
    "When I revise for an exam, I..." => [
      "make diagrams and flow charts",
      "imagine making the movement or creating the formula",
      "I talk over my notes, to myself or to other people",
      "write lots of revision notes (using lots of colours!)"
      ],
    "When explaining something to someone, I tend to..." => [
      "show them what I mean",
      "encourage them to try and talk them through the idea as they try",
      "explain to them in different ways until they understand",
      "write down what I mean and give them the textbook"
      ],
    "My main interests are" => [
      "photography or watching films or people-watching",
      "physical/sports activities or fine wines, fine foods or dancing",
      "listening to music or listening to the radio or talking to friends",
      "reading an awesome book"
      ],
    "Most of my free time is spent..." => [
      "watching television",
      "doing physical activity or making things",
      "talking to friends",
      "reading an awesome book"
      ],
    "When I first contact a new person..." => [
      "I arrange a face to face meeting",
      "I try to get together to share an activity",
      "I talk to them on the telephone",
      "send a detailed but friendly email"
      ],
    "I first notice how people" => [
      "look and dress",
      "stand and move",
      "sound and speak",
      "handwriting and what they read"
      ],
    "If I am very angry..." => [
      "I keep replaying in my mind what it is that has upset me",
      "I stomp about, slam doors and throw things",
      "I shout lots and tell people how I feel",
      "write in down in a diary or text my friends"
      ],
    "I find it easiest to remember" => [
      "faces",
      "things I have done",
      "names",
      "the spelling or connections of the person's name with a book"
     ],
    "I think I can tell someone is lying because" => [
      "they avoid looking at you",
      "the vibes I get from them",
      "their voice changes",
      "the language they use avoids the question"
      ],
    "When I'm meeting with an old friend..." => [
      "I say \"it's great to see you!\"",
      "I give them a hug or a handshake",
      "I say \"it's great to hear your voice!\"",
      "I send an email or text to say hello"
      ]
  }

  serialize :raw_results, Hash
  # { :spatial => 0.25, :tactile => 0.25, :auditory => 0.25, :reading => 0.25 }
  serialize :star_ranked, Hash
end
