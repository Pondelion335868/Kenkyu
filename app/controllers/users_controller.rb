# coding: utf-8

class UsersController < ApplicationController
  # before_action [:set_user], only: [:find, :show, :edit, :update, :destroy]
  before_filter :set_user, only: [:update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
    @quotes = Quote.all
    @info = User.find_by_sql("select * from users where name = 'nakajima'")
  #  @info = ActiveRecord::Base.connection.select("select * from users where name = 'nakajima'")
    #↓ここ追加(2014/10/23)
    #@sql = Mysql2::Client.new(:host => "127.0.0.1", :username => "nakajima", :password => "al-lab", :database => "railbook_development")
  end

  # ↓11/6 追加してみた
#  def find
#    @info = User.find_by_sql("select * from users")
#  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

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

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render action: 'show', status: :ok, location: @user }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :grade, :comment)
    end
end
