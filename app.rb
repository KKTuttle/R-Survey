require('pg')
require "pry"
require("sinatra")
require("sinatra/reloader")
require("sinatra/activerecord")
require("./lib/survey")
require("./lib/question")
also_reload("lib/**/*.rb")

get('/') do
  @surveys = Survey.all()
  erb(:index)
end

post('/surveys') do
  title = params.fetch('title')
  @survey = Survey.new({:title => title, :id => nil})
  @surveys = Survey.all()
  if @survey.save()
    erb(:index)
  else
    erb(:survey_errors)
  end
end

get('/surveys/:id') do
  @survey = Survey.find(params.fetch('id').to_i())
  @surveys = Survey.all()
  @questions = Question.all()
  erb(:questions)
end

post('/questions') do
  @surveys = Survey.all()
  description = params.fetch('question')
  @question = Question.new({:description => description, :id => nil})
  @questions = Question.all()
  if @question.save()
    erb(:questions)
  else
    erb(:question_errors)
  end
end

get('/questions/:id') do
  @question = Question.find(params.fetch('id').to_i())
  @questions = Question.all()


  erb(:questions)
end
