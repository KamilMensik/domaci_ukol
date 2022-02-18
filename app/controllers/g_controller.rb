class GController < ApplicationController
  def index
    @tags = Tag.all
  end
  def test
    @user = Tag.new
  end
  def search
    @pagy, @results = pagy_array(Tag.search(params[:search]) + Task.search(params[:search]) + Project.search(params[:search]))
    @results.each do |i|
      puts i.title
    end
  end
end
