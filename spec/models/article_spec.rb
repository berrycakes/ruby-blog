require 'rails_helper'

# indicate type for rspec rails such as model(unit) controller(intergration) view(ui)
RSpec.describe Article, type: :model do
    context 'validations' do
        let!(:article) {Article.new}
        it 'is not a valid content' do
            
            article.title = 'My title'

            expect(article).to_not be_valid
            expect(article.errors).to be_present
            expect(article.errors.to_hash.keys).to include(:content)
            expect(article.errors[:content]).to include("can't be blank")
        end

        it 'is not a valid title' do
            
            article.content = 'My Content'

            expect(article).to_not be_valid
            expect(article.errors).to be_present
            expect(article.errors.to_hash.keys).to include(:title)
            expect(article.errors[:title]).to include("can't be blank")
        end

    end

    describe 'uniqueness of article titles' do
        valid_article = Article.create(title: 'unique title', content: 'First Content')
        invalid_article = Article.create(title: 'unique title', content: 'Second Content')
        it 'accepts unique title' do   
            expect(valid_article).to be_valid
        end

        it 'rejects non-unique title' do
            expect(invalid_article).to_not be_valid
            expect(invalid_article.errors.to_hash.keys).to include(:title)
            expect(invalid_article.errors[:title]).to include("has already been taken")
        end
    end
    

    # INSTANCE METHOD #method_name, CLASS METHOD .method_name
    describe '#formatted_title' do
        it 'returns an uppercase title' do
            art = Article.create(title: 'lowercase title', content: 'My Content')
            expect(art.formatted_title).to eq('LOWERCASE TITLE')
        end
    end

    # describe '.long_title' do
    #     it 'returns titles with length > 5' do
    #         Article.create(title: 'lowercase title', content: 'My Content')
    #         Article.create(title: 'short', content: 'My Content')
    #         expect(Article.long_title.size).to eq(1)
    #     end
    # end
end