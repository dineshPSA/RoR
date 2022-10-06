class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :new, :update, :destroy, :create]
  before_action :set_post, only: %i[ update destroy ]
  
  # impressionist :action=>[:show]

  # GET /posts or /posts.json
  def index
    @posts = Post.all 
    @posts = Post.where(is_public: true).or(Post.where(user: current_user))
    @posts = Post.order("created_at desc")
  end

  # GET /posts/1 or /posts/1.json
  def show
    @post = Post.where(slug: params[:id]).first
  end

  # GET /posts/new
  def new
    @post = Post.new
    @user = @post.build_user
  end

  def user_owns_post?
    @post.user == current_user
  end

  # GET /posts/1/edit
  def edit
   @post = Post.find_by(slug: params[:id ])
    #  puts @post.user.name
    #  puts current_user.name
     if @post.user == current_user
      render :edit
     else
      flash[:alert] = 'You are not the user of this post'
      redirect_to posts_url
     end
  end
  
 

  # POST /posts or /posts.json
  def create
     @post = current_user.posts.new(post_params)
     @post.user = current_user
        # @post = .post.create(published_at: Time.now)


    respond_to do |format|
      if @post.save 
        format.html { redirect_to post_url(@post)}
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    # authorize @post
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to post_url(@post), notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    # authorize @post
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :description, :slug, :image, :is_public)
    end
end
