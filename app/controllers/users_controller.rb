class UsersController < ApplicationController
  before_action :authorize_request, except: %i[create check_user]
  before_action :find_user, except: %i[create index check_user]

  # GET /users
  def index
    @users = User.all
    render json: @users, status: :ok
  end

  # GET /users/{username}
  def show
    render json: @user, status: :ok
  end

  def check_user
    id = params[:id]
    user = User.where('username LIKE ? OR email LIKE ?',"#{id}", "#{id}" ).pluck(:username, :email).first
    render json: user, status: :ok
  end

  def recommended_videos
    recommended_videos = @user.recommend_videos
    render json: recommended_videos, status: :ok
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: { errors: @user.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  # PUT /users/{username}
  def update
    unless @user.update(user_params)
      render json: { errors: @user.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  # DELETE /users/{username}
  def destroy
    @user.destroy
  end

  private

  def find_user
    @user = User.find_by_username!(params[:_username])
    rescue ActiveRecord::RecordNotFound
      render json: { errors: 'User not found' }, status: :not_found
  end

  def user_params
    params.permit(
      :avatar, :name, :username, :email, :password, :password_confirmation
    )
  end
end