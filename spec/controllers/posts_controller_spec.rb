describe PostsController do
  let(:user) { create(:user) }

  before { sign_in user }

  describe 'GET #new' do
    subject(:get_new) { get :new }

    it do
      get_new

      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    subject(:post_create) { post :create, params: { post: post_params } }

    context 'when success' do
      subject(:post_create) { post :create, as: :turbo_stream, params: { post: post_params } }

      let(:post_params) { { body: 'This is a valid comment body' } }

      it { expect { post_create }.to change(Post, :count).by(1) }

      it do
        post_create

        expect(response).to be_successful
      end
    end

    context 'when failure' do
      let(:post_params) { { body: '' } }

      it { expect { post_create }.not_to change(Post, :count) }

      it do
        post_create

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
