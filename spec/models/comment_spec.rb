require 'rails_helper'

RSpec.describe Comment do
  def association
    described_class.reflect_on_association(:article)
  end

  it 'associates articles to comments' do
    expect(association).to_not be_nil
    expect(association.name).to eq(:article)
  end

  it 'sets inverse_of record' do
    expect(association.options[:inverse_of]).to_not be_nil
    expect(association.options[:inverse_of]).to eq(:comments)
  end

  it 'validates presence of comment content' do
    expect(Comment.create(content: 'Dummy content')).to be_valid
    expect(Comment.create).to be_invalid
  end
end
