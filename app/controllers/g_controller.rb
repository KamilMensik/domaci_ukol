class GController < ApplicationController
  before_action :authenticate_user!, except:"index"
  def index
  end
  def search
    @pagy, @results = pagy_array(Tag.cur_user(current_user).search(params[:search]) + Task.cur_user(current_user).search(params[:search]) + Project.cur_user(current_user).search(params[:search]),items:15)
  end
end
