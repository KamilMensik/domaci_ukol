class GController < ApplicationController
  def index
    @user = Tag.new
  end
  def test
    @user = Tag.new
  end
end
