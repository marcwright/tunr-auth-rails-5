class UsersController < ApplicationController
  skip_before_action :authenticate

  def sign_up
  end

  def sign_up!
    user = User.new(
      username: params[:username],
      password_digest: BCrypt::Password.create(params[:password])
    )
    if params[:password_confirmation] != params[:password]
      message = "Your passwords don't match!"
    elsif user.save
      message = "Your account has been created!"
    else
      message = "Your account couldn't be created. Did you enter a unique username and password?"
    end
    flash[:notice] = message
    redirect_to action: :sign_up
  end

  def sign_in
  end

  def sign_in!
    @user = User.find_by(username: params[:username])
    if !@user
      message = "This user doesn't exist!"
      redirect_to action: :sign_up
    elsif !BCrypt::Password.new(@user.password_digest).is_password?(params[:password])
      message = "Your password's wrong!"
      redirect_to action: :sign_in
    else
      message = "You're signed in, #{@user.username}! "
      cookies[:username] = {
        value: @user.username,
        expires: 100.years.from_now
      }
      flash[:notice] = message
      session[:user] = @user
      redirect_to artists_path
    end
    flash[:notice] = message

  end

  def sign_out
    reset_session
    flash[:notice] = "You're signed out!"
    redirect_to root_url
  end

end
