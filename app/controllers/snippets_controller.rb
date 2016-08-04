class SnippetsController < ApplicationController
  before_action :find_snippet, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user, except: [:index, :show]
  before_action :authorize_user, only: [:edit, :update, :destroy]

  def index
    @snippets = Snippet.public_snippet.order("created_at DESC")
  end

  def secret_snippets
    @snippets = current_user.snippets.private_snippet.order("created_at DESC")
  end

  def new
    @snippet = Snippet.new
  end

  def create
    @snippet = Snippet.new(snippet_params)
    @snippet.user = current_user
      if @snippet.save
        redirect_to snippets_path(@snippet), flash: { success: "Snipped!"}
      else
        flash[:danger] = "Snippet Failure ..."
        render :new
      end
  end

  def show
  end

  def edit
  end

  def update
    if @snippet.update(snippet_params)
      redirect_to(snippet_path(@snippet), flash: { success:  "Snippet has been updated!"})
    else
      flash[:warning] = "Couldn't update snippet!"
      render :edit
    end
  end

  def destroy
    snippet = current_user.snippets.find(params[:id])
    snippet.destroy
    redirect_to((root_path), flash: { danger: "Snippet deleted!" })
  end

  private

    def snippet_params
      params.require(:snippet).permit([:kind, :title, :code, :private])
    end

    def find_snippet
      @snippet = Snippet.find(params[:id])
    end

    def authorize_user
      unless can? :manage, @snippet
      redirect_to root_path , flash: { info: "Access Denied" }
      end
    end

end
