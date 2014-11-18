# coding: utf-8

class FindController < ApplicationController

  # ActionController::InvalidAuthenticityTokenエラーが表示されたので追加(11/7)
  skip_before_filter :verify_authenticity_token ,:only=>[:find, :find2]

  def index
    @users = User.all
    @quotes = Quote.all
    # railbookデータベースのusersテーブルの一覧を表示
    @info = User.find_by_sql("select * from users")
    # quoteデータベースのquotesテーブルの一覧を表示(11/12)
    @info2 = User.find_by_sql("select * from quote_development.quotes")
    @info3 = Bole.find_by_sql("select * from bole_production.articles where id >= 1780 and id <= 1785")
  end

  # 入力されたtextに対するアクション(11/7)
  def find
    @msg = params[:hoge]
    # 入力フォームに入力された値に基づいて絞り込む(11/11)
    @pickup = User.where("name LIKE ?", "%#{params[:hoge]}%")
    render "find/quote"
  end

  def find2
    @msg = params[:foo]
    @pickup = Quote.where("body LIKE ?", "%#{params[:foo]}%")
    render "find/quote2"
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(find_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(find_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render action: 'show', status: :ok, location: @user }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
#    def set_user
#      @user = User.find(params[:id])
#    end

    def find_params
      params.require(:user).permit(:name, :grade, :comment)
    end
end
