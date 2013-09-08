class GmiTestResult < ActiveRecord::Base
  LINGUISTIC = 0
  MATHEMATICAL = 1
  MUSICAL = 2
  KINESTHETIC = 3
  SPATIAL = 4
  INTERPERSONAL = 5
  INTRAPERSONAL = 6

  OPTIONS = ["Mostly Disagree", "Slightly Disagree", "Slightly Agree", "Mostly Agree"]
  QUESTIONS = {
    "I can play a musical instrument" => MUSICAL,
    "I often have a song or piece of music in my head" => MUSICAL,
    "I find it easy to make up stories" => LINGUISTIC,
    "I have always been physically well co-ordinated (run, jump, balance, etc)" => KINESTHETIC,
    "Music is very important to me" => MUSICAL,
    "I am a good liar (if I want to be)" => LINGUISTIC,
    "I play a sport or dance" => KINESTHETIC,
    "I am a very social person and like being with other people" => INTERPERSONAL,
    "I find graphs, charts and diagrams easy to understand" => SPATIAL,
    "I find it easy to remember quotes or phrases or poems or song lyrics" => LINGUISTIC,
    "I can always recognise places that I have been before, even when I was very young" => SPATIAL,
    "When I am concentrating I tend to doodle" => SPATIAL,
    "I find mental arithmetic easy (sums in my head)" => MATHEMATICAL,
    "At school one of my favourite subjects is / was English" => LINGUISTIC,
    "I like to think through a problem carefully, considering all the consequences" => MATHEMATICAL,
    "I love adrenaline sports and scary rides" => KINESTHETIC,
    "I enjoy individual sports best" => INTRAPERSONAL,
    "I find it easy to remember telephone numbers" => MATHEMATICAL,
    "I set myself goals and plans for the future" => INTRAPERSONAL,
    "I can tell easily whether someone likes me or dislikes me" => INTERPERSONAL,
    "To learn something new, I need to just get on and try it" => KINESTHETIC,
    "I often see clear images when I close my eyes" => SPATIAL,
    "I don’t use my fingers when I count" => MATHEMATICAL,
    "At school I love / loved music lessons" => MUSICAL,
    "I find ball games easy and enjoyable" => KINESTHETIC,
    "My favourite subject at school is / was maths" => MATHEMATICAL,
    "I always know how I am feeling" => INTRAPERSONAL,
    "I keep a diary" => INTRAPERSONAL,
    "My favourite subject at school is / was art" => SPATIAL,
    "I really enjoy reading" => LINGUISTIC,
    "It upsets me to see someone cry and not be able to help" => INTERPERSONAL,
    "I prefer team sports" => INTERPERSONAL,
    "Singing makes me feel happy" => MUSICAL,
    "I am happy spending time alone" => INTRAPERSONAL,
    "My friends always come to me for emotional support and advice" => INTERPERSONAL
  }

  serialize :intelligences_ranked, Array
  serialize :raw_results, Hash
end
