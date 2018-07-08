class InsertGuestUser < ActiveRecord::Migration[5.1]
  def change
    #ゲストユーザの作成
    user = User.new()
    user[:login_id] = "guest"
    user[:user_name] = "GUEST"
    user[:password_digest] = "dummydummy"
    user.save
  end
end
