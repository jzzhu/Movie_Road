class StaticPagesController < ApplicationController
  def home
  	if signed_in?
      @micropost  = current_user.microposts.build
  	  @comment  = current_user.comments.build
      @feed_items = current_user.feed.paginate(:per_page => 5,page: params[:page])
    end
  end

  def help
  end
  def about
  end
  def contact
  end
end
