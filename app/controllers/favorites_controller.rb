class FavoritesController < ApplicationController
  before_action :set_movie, only: [:create, :destroy]
  before_action :signed_in_user
  
  def create
    if Favorite.create(favorited: @movie, user: current_user)
      redirect_to @movie, notice: 'Movie has been favorited'

    else
      redirect_to @movie, alert: 'Something went wrong'
    end
  end


 def index
    user_id = params[:user]  
    user = User.find_by(id: user_id)
    @favorite_movies = user.favorite
 end

  
  def destroy
    Favorite.where(favorited_id: @movie.id, user_id: current_user.id).first.destroy
    redirect_to @movie, notice: 'Movie is no longer in favorites'
  end
  
  private
  
  def set_movie
    @movie = Movie.find(params[:movie_id] || params[:id])
  end
end