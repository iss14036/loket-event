class UsersController < ApplicationController
  before_action :authorize_request, except: :create

  def index
    @users = $redis.get("users")
    if(@users.nil?)
      @users = User.all
      $redis.set("users", @users.to_json)
      $redis.expire("users",5)
    end
    render json: @users, status: :ok
  end

  # GET /users/{username}
  def show
    @user = User.find_by('username': params[:_username])
    render json: @user, status: :ok
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :accepted
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

  def user_params
    params.permit(
      :username, :password
    )
  end
end
