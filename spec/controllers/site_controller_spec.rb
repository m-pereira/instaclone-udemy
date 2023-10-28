describe SiteController do
  let(:user) { create(:user) }

  before { sign_in user }

  describe 'GET #index' do
    subject(:get_index) { get :index }

    it do
      get_index

      expect(response).to be_successful
    end
  end
end
