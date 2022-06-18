class ApplicationController < ActionController::Base
  def search
    @q = Property.ransack(params[:q])
    @results = @q.result
  end
  def after_sign_in_path_for(resource)
    tasks_path # ログイン後に遷移するpathを設定
  end
  def after_sign_out_path_for(resource)
    root_path
  end
  add_flash_types :success, :info, :warning, :danger

end