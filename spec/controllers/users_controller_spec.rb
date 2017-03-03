require 'rails_helper'

describe UsersController do

  describe 'Get #show' do
    before do
      @user = create(:user)
    end

    context '要求されたユーザーが存在する場合' do
      before do
        get 'show', permalink: @user.permalink
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
      it '@userに要求されたユーザーを割り当てること' do
        expect(assigns(:user)).to eq @user
      end
      it ':showテンプレートを表示すること' do
        expect(response).to render_template :show
      end
    end
    context '要求されたユーザーが存在しない場合' do
      it 'リクエストはRecordNotFoundとなること' do
        expect{
          get 'show', permalink: 'hogehoge'
        }.to raise_exception(ActiveRecord::RecordNotFound)
      end
    end
  end

  # describe 'Get #edit' do
  #   before do
  #     @user = create(:user)
  #     get 'edit', permalink: @user.permalink
  #   end
  #   it 'リクエストは200 OKとなること' do
  #     expect(response.status).to eq 200
  #   end
  #   it '@userに要求されたユーザーを割り当てること' do
  #     expect(assigns(:user)).to eq @user
  #   end
  #   it ':editテンプレートを表示すること' do
  #     expect(response).to render_template :edit
  #   end
  # end

  # describe 'Get #edit' do
  #   before do
  #     @user = create(:user)
  #     get 'edit', permalink: @user.permalink
  #   end
  #   it 'リクエストは200 OKとなること' do
  #     expect(response.status).to eq 200
  #   end
  #   it '@userに要求されたユーザーを割り当てること' do
  #     expect(assigns(:user)).to eq @user
  #   end
  #   it ':editテンプレートを表示すること' do
  #     expect(response).to render_template :edit
  #   end
  # end


  describe 'Delete #destroy' do
    before do
      @user = create(:user)
    end

    context '存在するユーザーの場合' do
      it 'リクエストは302 リダイレクトとなること' do
        delete :destroy, permalink: @user.permalink
        expect(response.status).to eq 302
      end
      it 'データベースから要求されたユーザーが削除されること' do
        expect{
          delete :destroy, permalink: @user.permalink
        }.to change(User,:count).by(-1)
      end
      it 'users#indexにリダイレクトされること'do
        delete :destroy, permalink: @user.permalink
        expect(response).to redirect_to users_path
      end
    end
    context '要求されたユーザーが存在しない場合' do
      it 'リクエストはRecordNotFoundとなること' do
        expect{
          delete :destroy, permalink: 'hogehoge'
        }.to raise_exception(ActiveRecord::RecordNotFound)
      end
    end
  end

end