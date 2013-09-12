class AuiTestResult < ActiveRecord::Base
  AUS_IDENTITIES = ['Eagle', 'Kangaroo', 'Dolphin', 'Wombat']
  QUESTIONS =
  {
    "Do you enjoy having lots of friends, or just a few special friends?" => [
      "Lots of friends.",
      "A few special friends.",
      ],
    "Do you prefer to talk about facts or possibilities?" => [
      "Facts",
      "Possibilities",
      ],
    "Do you sometimes consider other peoples' feelings before your own?" => [
      "No, very rarely",
      "Yes, quite often.",
      ],
    "Do you like to make lists of things to do?" => [
      "Yes, quite often.",
      "No, not very often.",
      ],
    "Do you ever speak before you think?" => [
      "Yes, sometimes",
      "No, not usually",
      ],
    "Is it better to work on projects that are well-organised, or new and exciting?" => [
      "Well organised.",
      "New and exciting.",
      ],
    "Is it better to be respected or liked by students in your class?" => [
      "Respected",
      "Liked",
      ],
    "Do you prefer to make up your mind sooner or later?" => [
      "Sooner",
      "Later",
      ],
    "Does it take people a short or a long time to get to know you?" => [
      "Short time",
      "Long time",
      ],
    "Do you see yourself as practical with good common sense, or as insightful with a good imagination?" => [
      "Practical, with a good common sense.",
      "Insightful, with a good imagination",
      ],
    "If you disagree with what someone has said, are you more likely to argue with them, or keep quiet?" => [
      "Argue with them",
      "Keep quiet",
      ],
    "Which one would you usually do first?" => [
      "What you have to do",
      "What you want to do",
      ],
    "Do you enjoy talking a lot, or do you usually only talk when there is something to say?" => [
      "Talk a lot",
      "Talk only when there is something to say",
      ],
    "Would you describe yourself as more careful and thorough, or are you often in a hurry to finish?" => [
      "Careful and thorough",
      "Often in a hurry to finish",
      ],
    "Would you prefer to spend time solving problems, or helping people?" => [
      "Solving problems",
      "Helping people",
      ],
    "Are you better at finishing projects, or are you better at starting them?" => [
      "Finishing projects",
      "Starting them",
      ],
    "Do you find it easy to talk to people, or are you more quiet and reserved?" => [
      "Easy to talk to people",
      "Quiet and reserved",
      ],
    "Do you like to work on projects at a constant and steady pace, or do you work in bursts of energy?" => [
      "Constant steady pace",
      "Bursts of energy",
      ],
    "If you are having difficulty with a project, do you prefer people to leave you alone, or offer to help?" => [
      "Leave me alone",
      "Offer to help",
      ],
    "Are you happier with a plan of what you have to do, or no plan and just make things up as you go?" => [
      "A plan",
      "No plan",
      ],
    "Are you more outgoing and talkative, or quiet and reflective?" => [
      "Outgoing and talkative",
      "Quiet and reflective",
      ],
    "Would you rather do a task that involves your hands, or involves your mind?" => [
      "Using my hands",
      "Using my mind",
      ],
    "Is it more important for your teacher to be fair to students, or be kind to them?" => [
      "To be fair",
      "To be kind",
      ],
    "Do you ever get annoyed if you have to change your plans at the last minute?" => [
      "Yes, usually.",
      "No, not really.",
      ],
    "Do you like big parties where you meet lots of people, or small parties where you know most people?" => [
      "Big parties",
      "Small parties",
      ],
    "Do you like stories where there is lots of action and adventure, or lots of fantasy and heroism?" => [
      "Lots of action",
      "Lots of fantasy",
      ],
    "I tend to avoid arguments and most forms of conflict?" => [
      "False",
      "True",
      ],
    "Are you usually quick to complete tasks, or do you have a habit of putting things off?" => [
      "Quick to complete tasks",
      "Putting things off",
      ],
    "Is it easy for you to speak to most people, even if you have not met them before?" => [
      "Yes, usually",
      "No, not really",
      ],
    "Do you prefer to know exactly how to do a project, or do you prefer to use your imagination?" => [
      "Exactly how to do a project",
      "Use your imagination",
      ],
    "Other people usually find it difficult to know what or how I am feeling?" => [
      "False",
      "True",
      ],
    "Is it important to keep your desk or workspace organised?" => [
      "Yes, most of the time",
      "Not really",
      ],
    "Are you happy to talk to most people, or do you prefer to talk to people with similar interests to you?" => [
      "Most people",
      "Similar interests",
      ],
    "Are you interested in finding the right way to do things, or doing things your own way?" => [
      "Finding out the right way",
      "Doing things my own way",
      ],
    "Which of the following occupation lists is more appealing to you?" => [
      "Manager, Doctor or Pilot",
      "Nurse, Artist or Social Worker",
      ],
    "Which of the following sounds more like you?" => [
      "I like structure, routine and schedules.",
      "I like flexibility, freedom and spontaneity.",
      ],
    "At parties and social gatherings, who usually does most of the talking?" => [
      "Usually you",
      "Usually other people",
      ],
    "Is it more exciting when you build or make something, or design and invent something?" => [
      "Build or make something",
      "Design and invent something",
      ],
    "Do you spend more time dealing with your problems, or dwelling on your problems?" => [
      "Dealing with them",
      "Dwelling on them",
      ],
    "Do you prefer to work out how to do a project before starting it, or just figure things out as you go?" => [
      "Work it out first",
      "Figure it out as I go",
      ],
    "If you had to stay at home because you are unwell, would you prefer visitors, or prefer to be alone?" => [
      "Visitors",
      "Left alone",
      ],
    "Which of the following qualities do you think it is more valuable or important to have?" => [
      "Good common sense",
      "Good imagination",
      ],
    "Would you say that you are more of a firm minded type of person, or more of a soft hearted one?" => [
      "Firm minded",
      "Soft hearted",
      ],
    "Do you prefer to have things decided for you, or do you prefer to have choices?" => [
      "Decided for me",
      "Choices",
      ],
    "Do you usually the company of lots of people or the company of just one or two?" => [
      "Lots of people",
      "Just one or two",
      ],
    "I dislike projects that are very complicated or overly complex. True or false?" => [
      "False",
      "True",
      ],
    "Do you consider yourself to be quite patient and understanding with other people?" => [
      "Not overly",
      "Yes, very",
      ],
    "On school holidays, do you plan what you are going to do, or do you prefer to see what each day brings?" => [
      "Plan what to do",
      "See what each day brings",
      ],
    "Is it important for you to have lots of friends that you regularly catch up with?" => [
      "Yes, quite important",
      "No, not really that important",
      ],
    "Do you notice how things are, or how things could be?" => [
      "How things are",
      "How things could be",
      ],
    "Do you like to receive regular encouragement or praise when working on a project?" => [
      "No, not really",
      "Yes",
      ],
    "Are you happier knowing what you will be doing on the weekend?" => [
      "Knowing",
      "Deciding on the day",
      ],
    "Which set of words describes you best?" => [
      "Talkative, outgoing and gregarious",
      "Quiet, shy and reserved",
      ],
    "Which are the easiest to remember; facts about things you are interested in, or abstract theories and ideas?" => [
      "Facts",
      "Theories",
      ],
    "Do you ask for advice from other people before you make up your mind about most things?" => [
      "No, not usually",
      "Yes, quite often",
      ],
    "Do you like to work with timetables and deadlines?" => [
      "Yes, usually",
      "No, not really",
      ],
    "Would you say you are more of a people person, or a private person?" => [
      "A people person",
      "A private person",
      ],
    "Do you like stories about real people and real places, or about imaginary people and places?" => [
      "Real people and real places",
      "Imaginary people and places",
      ],
    "Would you prefer that other people see you as a clever person, or a caring person?" => [
      "Clever",
      "Caring",
      ],
    "Is it better to have a teacher that is well organised, or one that is a little more spontaneous?" => [
      "Well organised",
      "More spontaneous",
      ],
    }

  serialize :raw_results, Hash
  # letters: string
  # animal: integer

  def animal_name
    AUS_IDENTITIES[self.animal]
  end
end
