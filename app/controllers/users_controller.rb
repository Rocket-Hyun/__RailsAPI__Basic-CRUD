class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.all
    render json: @users, status: :ok
  end

  # GET /users/1
  def show
    @user = User.find(params[:id])
    render json: @users, status: :ok
  end

  # POST /users
  def create
    @user = User.new
    @user.email = params[:email]
    @user.name = params[:name]
    @user.password = params[:password]
    render json: @user, status: :created
  end

  # PATCH/PUT /users/1
  def update
    @user = User.find(params[:id])
    @user.update({email:params[:email], name:params[:name], password:params[:password]})
    render json: @user, status: :ok
  end

  # DELETE /users/1
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    @message = { msg: "유저 삭제 완료"}
    render json: @message, status: :ok
  end
end
