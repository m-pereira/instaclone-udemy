describe CommentsController do
  let(:user) { create(:user) }
  let(:post_object) { create(:post, user:) }

  before { sign_in user }

  describe 'GET #new' do
    subject(:get_new) { get :new, format: :turbo_stream, params: { post_id: post_object.id } }

    it do
      get_new

      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    subject(:post_create) do
      post :create, format: :turbo_stream,
                    params: { post_id: post_object.id, comment: comment_params }
    end

    context 'when success' do
      let(:comment_params) { { body: 'This is a valid comment body' } }

      it { expect { post_create }.to change(Comment, :count).by(1) }

      it do
        post_create

        expect(response).to be_successful
      end
    end

    context 'when failure' do
      let(:comment_params) { { body: '' } }

      it { expect { post_create }.not_to change(Comment, :count) }

      it do
        post_create

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
