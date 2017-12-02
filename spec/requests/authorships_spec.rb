require 'rails_helper'

RSpec.describe "Authorships", type: :request do
  describe "GET /authorships" do
    it 'returns correct types' do
      get authorships_path
      expect_json_types(
        '?',
        user_id: :integer,
        article_id: :integer
      )
    end
  end
end
