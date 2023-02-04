# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at
  # http://localhost:3000/rails/mailers/user_mailer/account_activation
  def account_activation
    user = User.first
    user.activation_token = User.new_token
    UserMailer.account_activation(user)
  end

  # Preview this email at
  # http://localhost:3000/rails/mailers/user_mailer/password_reset
  def password_reset
    user = User.first
    user.reset_token = User.new_token
    UserMailer.password_reset(user)
  end
end

# 12.10でログイン用のドメイン付きコードを全てコメント化した。
# # 0b61cba2d513465d81574afd5f91c6cc.vfs.cloud9.ap-northeast-1.amazonaws.com/rails/mailers/user_mailer

# # Preview all emails at http://localhost:3000/rails/mailers/user_mailer
# # 0b61cba2d513465d81574afd5f91c6cc.vfs.cloud9.ap-northeast-1.amazonaws.com/rails/mailers/user_mailer
# class UserMailerPreview < ActionMailer::Preview

#   # Preview this email at
#   # http://localhost:3000/rails/mailers/user_mailer/account_activation ↓が使われている
#   # 0b61cba2d513465d81574afd5f91c6cc.vfs.cloud9.ap-northeast-1.amazonaws.com/rails/mailers/user_mailer/account_activation
#   def account_activation
#     user = User.first
#     user.activation_token = User.new_token
#     UserMailer.account_activation(user)
#   end

#   # Preview this email at
#   # http://localhost:3000/rails/mailers/user_mailer/password_reset ↓が使われている
#   # 0b61cba2d513465d81574afd5f91c6cc.vfs.cloud9.ap-northeast-1.amazonaws.com/rails/mailers/user_mailer/password_reset
#   def password_reset
#     UserMailer.password_reset
#   end
# end