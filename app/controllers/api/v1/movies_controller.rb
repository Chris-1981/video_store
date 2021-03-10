class Api::V1::MoviesController < ApplicationController
  def index
    @movie = Movie.order('id')
    render json: @movie
  end

  def show
    @movie = Movie.find(params[:id])
    render json: {status:'SUCCESS', message:'Loaded successfully.', data:@movie}, status: :ok
  end

  def create
    @movie = Movie.new(user_params)
    if @movie.save
      render json: {status:'SUCCESS', message:'Created user successfully.', data:@movie}, status: :ok
    else
      render json: {status:'ERROR', message:'Failed to create user.', data:@movie.errors}, status: :unprocessable_entity
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    render json: {status:'SUCCESS', message:'Deleted user successfully.', data:@movie}, status: :ok
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update(update_category)
      render json: {status:'SUCCESS', message:'Updated user successfully.', data:@movie}, status: :ok
    else
      render json: {status:'ERROR', message:'Failed to update user.', data:@movie.errors}, status: :unprocessable_entity
    end

  end

  def find(movie_id)
    movie = Movie.find(movi_id)
  end

  private

  def user_params
    params.permit(:title, :category, :points, :price)
  end

  def update_category
    params.permit(:category, :points, :price)
  end
end
