class ApplicationController < ActionController::Base
  # devise利用の機能（ユーザー登録等）を行われそうになったら、その前に:configure_permitted_parametersを行ってください。
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def configure_permitted_parameters
    # devise_parameter_sanitizer => deviseのUserモデルに関わる「ログイン」「新規登録」などのリクエストからパラメーターを取得できるようになるメソッド.
    # 新しく追加したカラムをdeviseに定義されているstrong parameterに含めたいときにpermitを使う。
    # 今回はユーザー登録時にnameカラムも受け取りたい。（初期設定はメールアドレスとパスワード
    devise_parameter_sanitizer.permit(:sign_up, keys: [name])
  end
  
end
