require "test_helper"

class UserMailerTest < ActionMailer::TestCase

  test "account_activation" do
    user = users(:michael)
    user.activation_token = User.new_token
    mail = UserMailer.account_activation(user)
    assert_equal "Account activation", mail.subject
    assert_equal [user.email], mail.to
    assert_equal ["rock666gemini69@gmail.com"], mail.from # リスト12.20にて、redになる為12.12に戻ってきたら、こっち変えてなかった。
    # 追記:11.11にて"/sample_app/app/mailers/application_mailer.rb"内のメールアドレスを編集しておく必要があった。
    # assert_equal ["user@realdomain.com"], mail.from
    assert_match user.name,               mail.body.encoded
    assert_match user.activation_token,   mail.body.encoded
    assert_match CGI.escape(user.email),  mail.body.encoded
  end

  test "password_reset" do
    user = users(:michael)
    user.reset_token = User.new_token
    mail = UserMailer.password_reset(user)
    assert_equal "Password reset", mail.subject
    assert_equal [user.email], mail.to
    assert_equal ["rock666gemini69@gmail.com"], mail.from # リスト12.12で["user@realdomain.com"]を["rock666gemini69@gmail.com"]に書き換えた。
    # 追記:11.11にて"/sample_app/app/mailers/application_mailer.rb"内のメールアドレスを編集しておく必要があった。
    # assert_equal ["user@realdomain.com"], mail.from # リスト12.20にて、redになる為上の内容を元に戻した
    assert_match user.reset_token,        mail.body.encoded
    assert_match CGI.escape(user.email),  mail.body.encoded
  end
end