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
  survey = Survey.create({:title => title, :id => nil})
  @surveys = Survey.all()
  erb(:index)
end

get('/surveys/:id') do
  @survey = Survey.find(params.fetch('id').to_i())
  @surveys = Survey.all()
  erb(:index)
end
