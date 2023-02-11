class PrototypesController < ApplicationController
  before_action :authenticate_user!, only:[ :new, :edit, :destroy]
  # before_action :move_to_index, only: [:edit]

 def index
 @prototypes = Prototype.all
 end

  def new 
    @prototype = Prototype.new
  end

  def create
    Prototype.create(prototype_params)
    @prototype = Prototype.new
    if @prototype.save
      redirect_to root_path
    else
      @prototype = Prototype.new(prototype_params)
      render :new
    end
    
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  def edit
    @prototype = Prototype.find(params[:id])
    unless @prototype.user_id == current_user.id
      redirect_to acation: :index
    end
  end

  def update
    prototype = Prototype.find(params[:id])
    prototype.update(prototype_params)
    @prototype = Prototype.update(prototype_params)

    if prototype.update(prototype_params)
      redirect_to  prototype_path(prototype)
    else
      render :edit
    end

  

  def destroy
    prototype = Prototype.find(params[:id])
    prototype.destroy
    redirect_to root_path
  end

end

private

def prototype_params
  params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id) 
end

end



