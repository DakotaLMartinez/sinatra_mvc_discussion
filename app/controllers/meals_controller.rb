class MealsController < ApplicationController

  # GET: /meals
  get "/meals" do
    # Controller (waiter) asks Model (kitchen) for relevant data (meal/food)
    @meals = Meal.all
    erb :"/meals/index.html"
  end

  # GET: /meals/new
  get "/meals/new" do
    erb :"/meals/new.html"
  end

  # POST: /meals
  post "/meals" do
    # binding.pry
    meal = Meal.create(meal_params)
    redirect "/meals/#{meal.id}"
  end

  # GET: /meals/5
  get "/meals/:id" do
    @meal = Meal.find(params[:id])
    erb :"/meals/show.html"
  end

  # GET: /meals/5/edit
  get "/meals/:id/edit" do
    @meal = Meal.find(params[:id])
    erb :"/meals/edit.html"
  end

  # PATCH: /meals/5
  patch "/meals/:id" do
    @meal = Meal.find(params[:id])
    @meal.update(meal_params)
    redirect "/meals/#{@meal.id}"
  end

  # DELETE: /meals/5
  delete "/meals/:id" do
    @meal = Meal.find(params[:id])
    @meal.destroy
    redirect "/meals"
  end

  private 

  def meal_params
    allowed = ["name", "price", "spicyness", "short_description"]
    params.select{|k| allowed.include?(k)}
  end
end
