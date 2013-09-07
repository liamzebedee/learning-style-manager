class DolTestResult < ActiveRecord::Base
  OPTIONS = ["Lacks Awareness", "Understand Meaning", "Developing Strategies", "Becoming a Habit"]
  QUESTIONS = [
    "Persisting.  Do I give up easily?",
    "Managing impulsivity. Do I try and be less impulsive and take my time to think more before doing something?",
    "Listening with understanding and empathy. Do I listen carefully to others and stop my thoughts in order to perceive their point of view and emotions?",
    "Thinking flexibly. Am I able to think of more than one way to solve a problem?",
    "Thinking about your thinking (metacognition). Am I aware of my own thinking: Do I plan, monitor and evaluate my thinking?",
    "Striving for accuracy and precision. Do I check my completed work for accuracy and precision (without being asked)?",
    "Questioning and Problem Solving. Do I ask questions when I don’t understand? Do I know what questions to ask and how to gather the data I need?",
    "Applying the past to new and different situations. Do I use knowledge I already had to help me solve a problem or better understand the work?",
    "Thinking and communicating with clarity and precision. Do I use words carefully to describe feelings, events, etc.? Do I avoid generalisations and inaccuracies?",
    "Gathering data through all the senses. Do I use all of my senses to learn, to experiment and participate?",
    "Creating, imaging and innovating. Do I try to find new ways of doing things?",
    "Responding with wonderment and awe. Do I enjoy figuring things out?  Am I intrigued to understand the world around me?",
    "Taking responsible risks. Am I willing to take risks with my learning? To try new things?",
    "Finding Humour. Do I laugh a lot? Am I able to laugh at myself?",
    "Thinking interdependently. Am I able to work well with others and learn from others?",
    "Remaining open to continuous learning. Do I learn from my experiences? Am I able to admit sometimes that I don’t know?"
  ]

  # Habits ranked according to the OPTIONS with numbers of QUESTIONS
  # e.g. habits_ranked[:lacks_awareness] = [1, 5, 6]
  serialize :habits_ranked, Hash
  serialize :raw_results, Hash
end
