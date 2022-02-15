class TagsController < ApplicationController
	def new
    	@tag = Tag.new
  	end

  	def create
        @tag = Tag.new(tag_params)

        if @post.save
            redirect_to g_user_path
        else
            render :new, status: :unprocessable_entity
        end
    end
    
    private
    def tag_params
        params.require(:post).permit(:title,:user_id)
    end
end
