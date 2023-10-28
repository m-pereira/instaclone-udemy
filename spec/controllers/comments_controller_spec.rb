describe CommentsController do
  let(:user) { create(:user) }
  let(:post) { create(:post, user: user) }

  before { sign_in user }

  describe 'GET #new' do
    subject(:get_new) { get :new, params: { post_id: post.id }, as: :turbo_stream }

    it do
      get_new

      expect(response).to be_successful
    end
  end
end
