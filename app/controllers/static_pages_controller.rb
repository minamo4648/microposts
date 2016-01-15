class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @user = current_user
      soulpost = current_user.soul
      @soulpost = Micropost.find_by(id: soulpost) # find の場合は数字だけでidをとってくれる
      @micropost = current_user.microposts.build
      @feed_items = current_user.feed_items.includes(:user).order(created_at: :desc)
    end
  end
end