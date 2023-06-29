# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
before_action :customer_state, only: [:create]




protected
# 退会しているか判断メソッド
def customer_state
  ## 【処理内容1】 入力されたemailからアカウントを1件取得
  @customer = Customer.find_by(email: params[:customer][:email])
  ## アカウントを取得できない場合、このメソッドを終了
  return if !@customer
  ## 【処理内容2】 取得アカウントのパスワードと入力パスワードが一致か判別
  if @customer.valid_password?(params[:customer][:password])
    ## 【処理内容3】
    redirect_to new_customer_registration_path
  end
end

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
