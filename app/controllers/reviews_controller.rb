class ReviewsController < ApplicationController
  def index
    @user = current_user
    @reviews = Review.all.order(created_at: :desc)
  end

  def new
    @law_office = LawOffice.find(params[:law_office_id])
    if user_signed_in?
      @user = current_user
    else
      redirect_to law_office_show_path(@law_office.id), alert: '口コミを投稿するにはログインまたは新規登録が必要です'
    end
    @review = Review.new
  end

  def create
    @review = Review.new(params.require(:review).permit(:user_id, :law_office_id, :review, :star))
    if @review.save
      redirect_to law_office_show_path(@review.law_office_id)
    else
      @user = User.new
      @law_office = LawOffice.new
      @user.id = @review.user_id
      @law_office.id = @review.law_office_id
      render "new"
    end
  end

  def edit
    @user = current_user
    @review = Review.find_by(id: params[:id])
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(params.require(:review).permit(:user_id, :law_office_id, :review, :star))
      redirect_to account_path(@review.user_id)
    else
      render "new"
    end
  end

  def destroy
    @user = current_user
    @review = Review.find_by(id: params[:id])
    @review.destroy
    if params[:redirect_path]
      redirect_to params[:redirect_path]
    else
      redirect_back(fallback_location: reviews_index_path)
    end
  end
end
