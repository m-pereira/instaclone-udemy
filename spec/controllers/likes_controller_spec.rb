describe LikesController do
  let(:user) { create(:user) }
  let(:post_object) { create(:post) }

  before { sign_in user }

  describe 'POST #create' do
    subject(:post_create) do
      post :create, params: { likeable_id: post_object.id, likeable_type: 'Post' }
    end

    it { expect { post_create }.to change(Like, :count).by(1) }

    it do
      post_create

      expect(response).to be_successful
    end
  end

  describe 'DELETE #destroy' do
    subject(:delete_destroy) do
      delete :destroy, params: { likeable_id: post_object.id, likeable_type: 'Post' }
    end

    before { user.like!(post_object) }

    it { expect { delete_destroy }.to change(Like, :count).by(-1) }

    it do
      delete_destroy

      expect(response).to be_successful
    end
  end
end
