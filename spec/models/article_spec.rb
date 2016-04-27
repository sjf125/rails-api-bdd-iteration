require 'rails_helper'

RSpec.describe Article do
  # described_class - 'this' or 'self' of RSpec
  # reflect_on_association - returns an object of the associaction

  def association
    described_class.reflect_on_association(:comments)
  end

  it 'has an association with comments' do
    expect(association).to_not be_nil
    expect(association.name).to eq(:comments)
  end

  it 'has a set inverse_of record' do
    expect(association.options[:inverse_of]).to_not be_nil
    expect(association.options[:inverse_of]).to eq(:article)
  end

  it 'deletes comments associated to article when article is deleted' do
    expect(association.options[:dependent]).to eq(:destroy)
  end

  it 'validates the presence of article title and content' do
    expect(
      Article.create(title: 'Test Title', content: 'Dummy content')).to be_valid

    expect(
      Article.create(content: 'Dummy content')).to be_invalid
  end
end
