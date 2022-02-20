class TagsController < ApplicationController
    before_action :authenticate_user!
    def index
        @pagy,@tags = pagy(cur_tag.all,items:15)
    end

    def show
        @tag = cur_tag.find(params[:id])
    end

	def new
    	@tag = Tag.new
  	end

  	def create
        @tag = Tag.new(tag_params)

        if @tag.save
            redirect_to tags_path
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @tag = cur_tag.find(params[:id])
    end

    def update
    @tag = cur_tag.find(params[:id])
    if @tag.update(tag_params)
        redirect_to @tag
        else
        render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @tag = cur_tag.find(params[:id])
        @tag.destroy
        redirect_back(fallback_location: root_path)
    end

    private
    def tag_params
        params.require(:tag).permit(:title,:user_id)
    end

    def cur_tag
        Tag.cur_user(current_user)
    end
end
