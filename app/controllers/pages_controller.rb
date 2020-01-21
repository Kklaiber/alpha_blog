class PagesController < ApplicationController
  def home

  end

  def about
    @bio_name = params[:bio_name]
    @user_id = params[:user_id]
  end

  def features
    @eye_color = params[:features]
  end

end
