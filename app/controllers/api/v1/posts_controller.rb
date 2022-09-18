class Api::V1::PostsController < Api::V1:: ApplicationController
 def index
   @posts=Post.all
   render json: @posts
 end  

 def new
    @post = Post.new
  end

  def create
    employee=current_employee
    @post = employee.posts.new(post_params)
    if @post.save
       render json: { post: @post }, status: :ok
    else 
       render json:{error:"Something went wrong"}   
    end  
  end

  private

  def post_params
    params.require(:post).permit(:title,:content)
  end

  def  current_employee
    @current_employee = Employee.find_by(params[:id])  
  end  
end	