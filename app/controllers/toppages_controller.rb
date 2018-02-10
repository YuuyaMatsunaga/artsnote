class ToppagesController < ApplicationController
  def index
    if logged_in?
      @user = current_user
      @artbook = current_user.artbooks.build  # form_for 用
      @artbooks = current_user.artbooks.order('created_at DESC').page(params[:page])
    end
  end
end
