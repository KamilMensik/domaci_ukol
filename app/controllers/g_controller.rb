class GController < ApplicationController
  def index
    @tags = Tag.all
  end
  def test
    @user = Tag.new
  end
end
