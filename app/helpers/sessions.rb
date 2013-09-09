helpers do

  def current_user
    User.find(session[:user_id]) if signed_in?
  end

  def login(user_id)
    session[:user_id] = user_id 
  end

    def signed_in?
      session[:user_id] 
    end

    def create_user(params)
      User.create(params)
    end

    def authenticate(params)
      @user = User.find_by_email(params[:email])
      (@user && @user.password == params[:password]) ? @user : nil 
    end

    def all_users
      User.all 
    end

    def log_out_user
      session.clear
    end

  end
