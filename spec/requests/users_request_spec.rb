require 'rails_helper'

RSpec.describe "Users", type: :request do
  let(:user) { create(:user) }
  let(:other_user) { create(:user)}

  describe 'GET show' do
    context 'ログインしている場合' do
      before do
        sign_in user
        get user_path(user)
      end

      it 'リクエストが成功する' do
        expect(response.status).to eq 200
      end
    end

    context 'ログインしていない場合' do
      before do
        get user_path(user)
      end

      it 'リクエストが失敗する' do
        expect(response.status).to eq 302
      end
      it 'ログインページにリダイレクトする' do
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe 'GET edit' do
    context 'ログインユーザの場合' do
      before do
        sign_in user
        get edit_user_path(user)
      end

      it 'リクエストが成功する' do
        expect(response.status).to eq 200
      end
    end

    context '他のユーザの場合' do
      before do
        sign_in user
        get edit_user_path(other_user)
      end

      it 'リクエストが失敗する' do
        expect(response.status).to eq 302
      end
      it 'トップページにリダイレクトする' do
        expect(response).to redirect_to root_path
      end
    end

    context 'ログインしていない場合' do
      before do
        get edit_user_path(user)
      end

      it 'リクエストが失敗する' do
        expect(response.status).to eq 302
      end
      it 'ログインページにリダイレクトする' do
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe 'PATCH update' do
    context '正常なパラメータの場合' do
      let(:user_params) { { name: "new_user_name" } }
      before do
        sign_in user
      end

      it 'リクエストが成功(リダイレクト)する' do
        patch user_path(user), params: { user: user_params }
        expect(response.status).to eq 302
      end
      it 'ユーザネームが更新される' do
        patch user_path(user), params: { user: user_params }
        expect(user.reload.name).to eq "new_user_name"
      end
      it 'マイページへリダイレクトする' do
        patch user_path(user), params: { user: user_params }
        expect(response).to redirect_to user_path(user)
      end
    end

    context "不正なパラメータの場合" do
      let(:user_params) { { name: nil } }
      before do
        sign_in user
      end

      it "リクエストが成功する(リダイレクトはしない)" do
        patch user_path(user), params: { user: user_params }
        expect(response.status).to eq 200
      end
      it "ユーザーネームが更新されない" do
        patch user_path(user), params: { user: user_params }
        expect(user.reload.name).to eq "test_user"
      end
    end
  end

  describe 'GET quit' do
    context 'ログインユーザの場合' do
      before do
        sign_in user
        get quit_user_path(user)
      end

      it 'リクエストが成功する' do
        expect(response.status).to eq 200
      end
    end

    context '他のユーザの場合' do
      before do
        sign_in user
        get quit_user_path(other_user)
      end

      it 'リクエストが失敗する' do
        expect(response.status).to eq 302
      end
      it 'トップページにリダイレクトする' do
        expect(response).to redirect_to root_path
      end
    end

    context 'ログインしていない場合' do
      before do
        get quit_user_path(user)
      end

      it 'リクエストが失敗する' do
        expect(response.status).to eq 302
      end
      it 'ログインページにリダイレクトする' do
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe 'PATCH cancel' do
    let(:user_params) { { status: false } }
    before do
      sign_in user
    end

    it 'リクエストが成功(リダイレクト)する' do
      patch cancel_user_path(user), params: { user: user_params }
      expect(response.status).to eq 302
    end
    it 'ステータスが更新される' do
      patch cancel_user_path(user), params: { user: user_params }
      expect(user.reload.status).to eq false
    end
    it 'トップページへリダイレクトする' do
      patch cancel_user_path(user), params: { user: user_params }
      expect(response).to redirect_to root_path
    end
  end

  describe 'GET following' do
    context 'ログインユーザの場合' do
      before do
        sign_in user
        get following_user_path(user)
      end

      it 'リクエストが成功する' do
        expect(response.status).to eq 200
      end
    end

    context '他のユーザの場合' do
      before do
        sign_in user
        get following_user_path(other_user)
      end

      it 'リクエストが成功する' do
        expect(response.status).to eq 200
      end
    end

    context 'ログインしていない場合' do
      before do
        get following_user_path(user)
      end

      it 'リクエストが失敗する' do
        expect(response.status).to eq 302
      end
      it 'ログインページにリダイレクトする' do
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe 'GET follwers' do
    context 'ログインユーザの場合' do
      before do
        sign_in user
        get followers_user_path(user)
      end

      it 'リクエストが成功する' do
        expect(response.status).to eq 200
      end
    end

    context '他のユーザの場合' do
      before do
        sign_in user
        get followers_user_path(other_user)
      end

      it 'リクエストが成功する' do
        expect(response.status).to eq 200
      end
    end

    context 'ログインしていない場合' do
      before do
        get followers_user_path(user)
      end

      it 'リクエストが失敗する' do
        expect(response.status).to eq 302
      end
      it 'ログインページにリダイレクトする' do
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe 'GET learnings' do
    context 'ログインユーザの場合' do
      before do
        sign_in user
        get learnings_user_path(user)
      end

      it 'リクエストが成功する' do
        expect(response.status).to eq 200
      end
    end

    context '他のユーザの場合' do
      before do
        sign_in user
        get learnings_user_path(other_user)
      end

      it 'リクエストが失敗する' do
        expect(response.status).to eq 302
      end
      it 'トップページにリダイレクトする' do
        expect(response).to redirect_to root_path
      end
    end

    context 'ログインしていない場合' do
      before do
        get learnings_user_path(user)
      end

      it 'リクエストが失敗する' do
        expect(response.status).to eq 302
      end
      it 'ログインページにリダイレクトする' do
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe 'GET stocks' do
    context 'ログインユーザの場合' do
      before do
        sign_in user
        get stocks_user_path(user)
      end

      it 'リクエストが成功する' do
        expect(response.status).to eq 200
      end
    end

    context '他のユーザの場合' do
      before do
        sign_in user
        get stocks_user_path(other_user)
      end

      it 'リクエストが失敗する' do
        expect(response.status).to eq 302
      end
      it 'トップページにリダイレクトする' do
        expect(response).to redirect_to root_path
      end
    end

    context 'ログインしていない場合' do
      before do
        get stocks_user_path(user)
      end

      it 'リクエストが失敗する' do
        expect(response.status).to eq 302
      end
      it 'ログインページにリダイレクトする' do
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
