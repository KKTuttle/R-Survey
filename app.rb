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
  @questions = Question.all()
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

post('/surveys/:id/questions') do
  description = params.fetch('question')
  survey_id = params.fetch('id')
  @question = Question.new({:description => description, :survey_id => survey_id, :id => nil})
  @survey = Survey.find(params.fetch('id').to_i())
  @surveys = Survey.all()
  if @question.save()
    erb(:questions)
  else
    erb(:question_errors)
  end
end

get('/surveys/:id/edit') do
  @survey = Survey.find(params.fetch('id').to_i())
  erb(:survey_edit)
end

patch('/surveys/:id') do
  @survey = Survey.find(params.fetch('id').to_i())
  title = params.fetch('survey_new_name')
  @survey = @survey.update({:title => title})
  @surveys = Survey.all()
  erb(:index)
end

delete('/surveys/:id') do
  @survey = Survey.find(params.fetch('id').to_i())
  @survey.destroy()
  @surveys = Survey.all()
  erb(:index)
end

get('/questions/:id/edit') do
  @question = Question.find(params.fetch('id').to_i())
  erb(:question_edit)
end

patch('/questions/:id') do
  @question = Question.find(params.fetch('id').to_i())
  description = params.fetch('question_new_name')
  @question = @question.update({:description => description})
  @questions = Question.all()
  @surveys = Survey.all()
  erb(:index)
end

delete('/questions/:id') do
  @question = Question.find(params.fetch('id').to_i())
  @question.destroy()
  @questions = Question.all()
  @surveys = Survey.all()
  erb(:index)
end

post('/questions') do
  description = params.fetch('question')
  survey_id = params.fetch('survey_id')
  @survey = Survey.find(params.fetch('survey_id').to_i())
  @question = Question.new({:description => description, :survey_id => survey_id, :id => nil})
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

get("/clear") do
  Survey.all().each() do |survey|
    survey.destroy()
  end
  Question.all().each() do |question|
    question.destroy()
  end
  redirect("/")
end
