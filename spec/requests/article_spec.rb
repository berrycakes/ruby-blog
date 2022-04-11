require 'rails_helper'

# for testing routes
RSpec.describe "ArticlesControllers", type: :request do
    describe "GET /articles" do
        it "returns the index page" do
            get articles_path

            expect(response).to have_http_status(200)
        end
    end
end