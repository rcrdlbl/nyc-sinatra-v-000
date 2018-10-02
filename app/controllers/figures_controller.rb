class FiguresController < ApplicationController
  # add controller methods
  get '/figures' do
    @figures = Figure.all
    erb ":figures/new"
  end

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'figures/new'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    if !params[:title]["name"].empty?
      @figure.titles << Title.create(name: params[:title]["name"])
    end
    if !params[:landmark]["name"].empty?
      @figure.landmarks << Landmark.create(name: params[:landmark]["name"], year_completed: params[:landmark]["year"])
    end
    redirect "/figures/#{@figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find_by_id(id: params[:id])
    erb :'figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by_id(id: params[:id])
    erb :'figures/edit'
  end
end
